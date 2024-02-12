document.addEventListener('DOMContentLoaded', function () {
    // wrap definition list elements in quick-link hash href
    document.querySelectorAll('dl.simple dt').forEach(function(elem, i) {
        elem.innerHTML = '<a id="dt-' + i +'" href="#dt-' + i +'">' + elem.innerHTML + '</a>';
    });
}, false);
