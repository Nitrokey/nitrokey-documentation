from docutils import nodes
from docutils.parsers.rst import Directive, directives


class NitrokeyProductTable(Directive):
    """
    Directive for the Nitrokey Variants Header Table
    """

    KEYS = {
        "nk3": "Nitrokey 3",
        "passkey": "Nitrokey Passkey",
        "fido2": "Nitrokey FIDO2",
        "u2f": "Nitrokey U2F",
        "hsm": "Nitrokey HSM 2",
        "pro": "Nitrokey Pro 2",
        "storage": "Nitrokey Storage 2",
        "start": "Nitrokey Start",
    }

    has_content = False
    required_arguments = 1
    optional_arguments = len(KEYS) - 1
    final_argument_whitespace = True
    option_spec = {
        "class": directives.class_option,
    }

    def run(self):
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
            url = f"docs.nitrokey.com/nitrokeys/{key}"

            entry += nodes.paragraph(
                "",
                "",
                nodes.reference("", name, refuri=url),
            )

            row1 += entry

        thead += row1
        tgroup += thead

        used_products = list(self.arguments)

        ok_keys = list(self.KEYS.keys()) + ["all"]
        assert all(x in ok_keys for x in used_products)

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


def setup(app):
    app.add_directive("product-table", NitrokeyProductTable)

    return {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
