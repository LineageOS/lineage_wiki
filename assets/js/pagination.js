let pages = [];
let currentPage = 0;
let lastPage = 0;
let totalPages = 0;

$(window).on("load", function() {
    $("#paginated-content > h2, h3, h4, h5, h6").each(function() {
        pages.push($(this));
    });
    totalPages = pages.length;

    getCurrentPage();
});

$(window).on("hashchange", function(e) {
    getCurrentPage();
});

$(window).keydown(function(e) {
  switch (e.which) {
    //Arrow left
    case 37:
        previousPage();
        break;
    //Arrow right
    case 39:
        nextPage();
        break;
  }
});

function getCurrentPage() {
    let found = false;
    if (window.location.hash.length !== 0) {
        for (let i = 0; i < totalPages; i++) {
            if (`#${pages[i][0].id}` == window.location.hash) {
                currentPage = i;
                found = true;
                break;
            }
        }
    } else {
        found = true;
        currentPage = 0;
    }
    // We want to be able to navigate to non-sectioned parts of the page, so if none of our
    // paginated headers matches, do not show the current page but just proceed with the hash
    // change
    if (found) {
        displayCurrentPage();
    }
}

function displayCurrentPage() {
    // Show the content of the current page and hide the rest
    for (let i = 0; i < totalPages; i++) {
        pages[i].nextUntil("h2, h3, h4, h5, h6").each(function() {
            if (i == currentPage) {
                pages[i].show();
                $(this).show();
            } else {
                pages[i].hide();
                $(this).hide();
            }
        });
    }

    if (currentPage != 0) {
        // Change the location hash so the section can be directly linked and navigated to
        window.location.hash = pages[currentPage][0].id;
    } else {
        // We want to change the hash for the first page to "none", but also do not
        // want to trigger constant page reloads here, so only change the hash if we aren't already
        // on the first page
        if (lastPage != currentPage) {
            window.location.hash = "";
        }
        $(window).scrollTop(0);
    }

    // Show pagination
    $("#pagination").show();

    // Show or hide the "Previous" and "Next" buttons
    $("#previous-page").show();
    $("#next-page").show();
    if (currentPage == 0) {
        $("#previous-page").hide();
    }
    if (currentPage == totalPages - 1) {
        $("#next-page").hide();
    }

    $("#previous-page").html("Previous step");
    if (currentPage + 2 == totalPages) {
        text = "Last step";
    } else {
        text = `Next step (${currentPage + 2}/${totalPages})`
    }
    $("#next-page").html(text);

    lastPage = currentPage;
}

function nextPage() {
    if (currentPage == totalPages - 1) return;

    currentPage++;
    displayCurrentPage();
}

function previousPage() {
    if (currentPage == 0) return;

    currentPage--;
    displayCurrentPage();
}
