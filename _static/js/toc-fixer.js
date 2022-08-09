document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('a.internal, .related-pages a, #language-banner a').forEach(function(elem) {
        elem.setAttribute('href', elem.href.replace('index.html', ''));
        elem.setAttribute('href', elem.href.replace('.html', ''));
    });
}, false);