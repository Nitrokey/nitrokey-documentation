from collections import OrderedDict

from docutils import nodes
from docutils.parsers.rst import directives

from sphinx.util.docutils import SphinxDirective
from sphinx.util.typing import ExtensionMetadata
from sphinx.application import Sphinx


class NitrokeyProductTable(SphinxDirective):
    """
    Directive for the Nitrokey Variants Header Table
    """

    KEYS = OrderedDict(
        **{
            "nitrokey3": "3A/C/Mini",
            "passkey": "Passkey",
            "fido2": "FIDO2",
            "u2f": "U2F",
            "hsm": "HSM 2",
            "pro": "Pro 2",
            "storage": "Storage 2",
            "start": "Start",
        }
    )

    ALIASES = {"nk3": "nitrokey3", "nkpk": "passkey", "pk": "passkey"}

    has_content = False
    required_arguments = 1
    optional_arguments = len(KEYS) - 1
    final_argument_whitespace = True
    option_spec = {
        "class": directives.class_option,
    }

    def run(self) -> list[nodes.Node]:
        table = nodes.table()

        # set table class
        if "class" in self.options:
            table["classes"] += self.options["class"]
        table["classes"] += ["products-table"]

        tgroup = nodes.tgroup(cols=len(self.KEYS))
        table += tgroup

        # col specs
        for _ in enumerate(self.KEYS):
            colspec = nodes.colspec(colwidth=100)
            tgroup += colspec

        thead = nodes.thead()
        row0 = nodes.row()
        # title header
        entry = nodes.entry(morecols=len(self.KEYS) - 1)
        entry += nodes.paragraph(text="Supported Nitrokeys")
        entry["classes"] += ["products-table-head"]

        row0 += entry
        thead += row0

        row1 = nodes.row()

        # headers (product names / links)
        for key, name in self.KEYS.items():
            entry = nodes.entry()

            # TODO: use relative !!
            url = f"https://docs.nitrokey.com/nitrokeys/{key}"
            # url = f"/nitrokeys/{key}"
            entry += nodes.paragraph(
                "",
                "",
                nodes.reference("", name, refuri=url),
            )

            row1 += entry

        thead += row1
        tgroup += thead

        # get used_products from arguments
        used_products = list(self.arguments)
        # apply aliases
        used_products = [self.ALIASES.get(x, x) for x in used_products]
        # accepted keys (include "all")
        ok_keys = list(self.KEYS.keys()) + ["all"]
        # check if all keys exist
        check = all(x in ok_keys for x in used_products)
        if not check:
            print()
            print("ERROR in product-table (_ext/nk_product_table.py)")
            print("ERROR found invalid product-table arguments")
            print()
            assert check

        # checkmark row creation
        row2 = nodes.row()
        yes = "✓"
        no = "⨯"
        for key, name in self.KEYS.items():
            if "all" in used_products:
                val = yes
            else:
                val = yes if key in used_products else no
            entry = nodes.entry()
            entry += nodes.paragraph(text=val)
            entry["classes"] += ["active" if val == yes else "inactive"]
            row2 += entry

        tbody = nodes.tbody()
        tbody += row2
        tgroup += tbody

        return [table]


def setup(app: Sphinx) -> ExtensionMetadata:
    app.add_directive("product-table", NitrokeyProductTable)

    return {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
