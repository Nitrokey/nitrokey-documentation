document.addEventListener('DOMContentLoaded', function () {
    // fix incorrect links in toc and language banners
    document.querySelectorAll('a.internal, .related-pages a, #language-banner a').forEach(function(elem) {
        elem.setAttribute('href', elem.href.replace('index.html', ''));
        elem.setAttribute('href', elem.href.replace('.html', ''));
    });

    // fix incorrect headline anchor links
    document.querySelectorAll('a.toc-backref').forEach(function(elem) {
        for (let sibling of elem.parentNode.children) {
            elem.setAttribute('href', sibling.href);
        }
    });

    // build custom breadcrumbs based on nav tree
    document.querySelectorAll('.sidebar-tree li').forEach(function(item) {
        if (item.classList.contains('current')) {
            const clone = item.querySelector('a').cloneNode(true);
            document.querySelector('#breadcrumbs').append(clone);
        }
    });

    document.querySelector('#breadcrumbs a.current').remove();
}, false);
