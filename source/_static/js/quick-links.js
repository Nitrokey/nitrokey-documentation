document.addEventListener('DOMContentLoaded', function () {
    // wrap definition list elements in quick-link hash href
    document.querySelectorAll('dl.simple dt').forEach(function(elem, i) {
        const slug = elem.textContent
            .replace('Q: ', '')
            .toLowerCase().replace(/ /g, '-')
            .replace(/[^\w-]+/g, '');
        
        elem.innerHTML = '<a id="' + slug +'" href="#' + slug +'">' + elem.innerHTML + '</a>';
    });
}, false);
