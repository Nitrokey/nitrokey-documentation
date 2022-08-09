document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.toctree-wrapper a.internal').forEach(function(elem) {
        elem.setAttribute('href', elem.href.replace('index.html', ''));
    });
}, false);