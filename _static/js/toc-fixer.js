document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('a.internal, .related-pages a, #language-banner a').forEach(function(elem) {
        elem.setAttribute('href', elem.href.replace('index.html', ''));
        elem.setAttribute('href', elem.href.replace('.html', ''));
    });
    document.querySelectorAll('a.toc-backref').forEach(function(elem) {
        for (let sibling of elem.parentNode.children) {
            elem.setAttribute('href', sibling.href);
        }
    });
}, false);
