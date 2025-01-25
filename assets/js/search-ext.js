let searchInput = $("#search-input");
let searchResult = $("#results-container");

var liSelected;

searchInput.on('input', function(e) {
    liSelected = undefined;

    // we need to suppress these from the search script, otherwise it will reload the results
    switch (e.key) {
        case 'ArrowDown':
        case 'ArrowUp':
            e.stopImmediatePropagation();
            e.preventDefault();
            break;
    }
});

function supressUpDownPropagation(e) {
    switch (e.key) {
        case 'ArrowDown':
        case 'ArrowUp':
            e.stopImmediatePropagation();
            e.preventDefault();
            break;
    }
}

$(window).keydown(function(e) {
    // Skip looking at the keys when the search input isn't focused or we have no results to navigate
    if (!searchInput.is(":focus")) return;
    if (!searchResult.children()) return;

    // Navigate up and down in the list of results with they arrow keys and hit enter to go there
    switch (e.key) {
        case 'ArrowDown':
            if (liSelected) {
                liSelected.removeClass('selected');
                next = liSelected.next();
                if (next.length > 0){
                    liSelected = next.addClass('selected');
                } else {
                    liSelected = searchResult.children().first().addClass('selected');
                }
            } else {
                liSelected = searchResult.children().first().addClass('selected');
            }
            break;

        case 'ArrowUp':
            if (liSelected) {
                liSelected.removeClass('selected');
                next = liSelected.prev();
                if (next.length > 0){
                    liSelected = next.addClass('selected');
                } else {
                    liSelected = searchResult.children().last().addClass('selected');
                }
            } else {
                liSelected = searchResult.children().first().addClass('selected');
            }
            break;

        // We supress the enter key to propagate to the form and handle navigation ourselves
        case 'Enter':
            if (liSelected) {
                var link = liSelected.children()[0].href;
                window.location.href = link;
            }
            e.preventDefault();
            return false;
            break;
    }
});

// Callback function to execute when mutations are observed
const callback = (mutationList, observer) => {
    for (const mutation of mutationList) {
        if (mutation.type === "childList") {
            // We preselect the first item so one can always hit "enter" and be brought there
            liSelected = searchResult.children().first().addClass('selected');
        }
    }
};


const config = { childList: true };
const observer = new MutationObserver(callback);
observer.observe(document.getElementById("results-container"), config);
