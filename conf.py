# Configuration file for the Sphinx documentation builder.
#
# Full list of options can be found in the Sphinx documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import os
from typing import Any, Dict


# -- Project information -----------------------------------------------------
#

project = "PSME"
copyright = "marten w."
author = "marten w."

# -- General configuration ---------------------------------------------------
#
# master_doc = "README.md"

extensions = [
    # Sphinx's own extensions
    "sphinx.ext.autodoc",
    "sphinx.ext.extlinks",
    "sphinx.ext.mathjax",
    "sphinx.ext.todo",
    "sphinx.ext.viewcode",
    "sphinx.ext.githubpages",
    # Our custom extension, only meant for Furo's own documentation.
    "furo.sphinxext",
    # External stuff
    "myst_parser",
    "sphinx_copybutton",
    "sphinx_design",
    "sphinx_inline_tabs",
    "sphinxcontrib.mermaid",
    "sphinx_external_toc",
    'sphinx_sitemap',
    "sphinx_reredirects",
    # 'notfound.extension',
]

# -- Options for extlinks ----------------------------------------------------
#

extlinks = {
    "pypi": ("https://pypi.org/project/%s/", "%s"),
}


# -- Options for TODOs -------------------------------------------------------
#

todo_include_todos = True

# -- Options for Markdown files ----------------------------------------------
#

myst_enable_extensions = [
    "colon_fence",
    "deflist",
    "dollarmath",
]
myst_heading_anchors = 5
myst_fence_as_directive = ["mermaid"]

suppress_warnings = ["myst.header", "myst.xref_missing"]

# -- Options for HTML output -------------------------------------------------
#

html_theme = "furo"
html_title = "PSME"
html_baseurl = 'https://psme.martenw.com/'
html_extra_path = ["robots.txt"]
# html_static_path = ["_static"]
language = "de"


html_theme_options: Dict[str, Any] = {
    "light_css_variables": {
        "color-brand-primary": "#993358",
        "color-brand-content": "#993358",
        "font-stack": "Garamond, Georgia, serif",
        "font-stack--monospace": "Courier, monospace",
        "font-stack--headings": "Georgia, serif",
    },
}
# -- Options for TOC output -------------------------------------------------
# with the external TOC extension

external_toc_path = "_toc.yml"  # optional, default: _toc.yml

# -- Options for Redirects -------------------------------------------------
# with the redirects extension NOTWORKING



