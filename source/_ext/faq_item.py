import urllib.parse
import re

from docutils import nodes

from docutils.parsers.rst import directives
from sphinx.util.docutils import SphinxDirective
from sphinx.util.typing import ExtensionMetadata
from sphinx.application import Sphinx


class FAQItem(SphinxDirective):
    """
    Directive for a FAQ item
    """

    has_content = True
    required_arguments = 1
    optional_arguments = 30
    final_argument_whitespace = True
    option_spec = {
        "class": directives.class_option,
    }

    def _make_slug(self, s: str) -> str:
        """Sluggify some string for inclusion into URL"""

        s = s.lower().strip()
        s = re.sub(r"[^\w\s-]", "", s)
        s = re.sub(r"[\s_-]+", "-", s)
        s = re.sub(r"^-+|-+$", "", s)
        return urllib.parse.quote_plus(s)

    def run(self) -> list[nodes.Node]:

        # answer (block content)
        content = nodes.container()
        # ... parse
        self.state.nested_parse(self.content, self.content_offset, content)
        answer = nodes.definition("", *content.children)
        # ... assemble
        a_item = nodes.definition_list_item("", answer)

        # question:
        question = " ".join(self.arguments)
        # ... get slug
        slug = self._make_slug(question)
        # ... get formatted text
        prefix = nodes.strong(text="Q: ")
        q_node = nodes.Text(question)
        # ... link with anchor name (slug)
        attrs = {"refuri": f"#{slug}", "ids": [slug]}
        anchor_link = nodes.reference("", "", prefix, q_node, **attrs)
        # ... assemble `term`
        term = nodes.term("", "", anchor_link)
        q_item = nodes.definition_list_item("", term)

        # add both to output (def-list)
        li = nodes.definition_list("", q_item, a_item)

        return [li]


def setup(app: Sphinx) -> ExtensionMetadata:
    app.add_directive("faq", FAQItem)

    return {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
