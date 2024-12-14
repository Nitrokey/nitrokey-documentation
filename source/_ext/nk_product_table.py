from docutils import nodes

from docutils.parsers.rst import directives
from sphinx.util.docutils import SphinxDirective
from sphinx.util.typing import ExtensionMetadata
from sphinx.application import Sphinx


class NitrokeyProductTable(SphinxDirective):
    """
    Directive for the Nitrokey Variants Header Table
    """

    KEYS = {
        "nitrokey3": "Nitrokey 3",
        "passkey": "Nitrokey Passkey",
        "fido2": "Nitrokey FIDO2",
        "u2f": "Nitrokey U2F",
        "hsm": "Nitrokey HSM 2",
        "pro": "Nitrokey Pro 2",
        "storage": "Nitrokey Storage 2",
        "start": "Nitrokey Start",
    }

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

        if "class" in self.options:
            table["classes"] += self.options["class"]

        table["classes"] += ["products-table"]

        tgroup = nodes.tgroup(cols=4)
        table += tgroup

        for _ in enumerate(self.KEYS):
            colspec = nodes.colspec(colwidth=1)
            tgroup += colspec

        thead = nodes.thead()
        row1 = nodes.row()

        for key, name in sorted(self.KEYS.items()):
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

        used_products = list(self.arguments)
        used_products = [self.ALIASES.get(x, x) for x in used_products]

        ok_keys = list(self.KEYS.keys()) + ["all"]

        check = all(x in ok_keys for x in used_products)
        if not check:
            print()
            print("ERROR in product-table (_ext/nk_product_table.py)")
            print("ERROR found invalid product-table arguments")
            print()
            assert check

        row2 = nodes.row()
        for key, name in sorted(self.KEYS.items()):
            if "all" in used_products:
                val = "✓"
            else:
                val = "✓" if key in used_products else "⨯"
            entry = nodes.entry()
            entry += nodes.paragraph(text=val)
            row2 += entry

        tbody = nodes.tbody()

        # tbody += row1
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
