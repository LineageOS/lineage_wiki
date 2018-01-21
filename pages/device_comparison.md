---
sidebar: home_sidebar
title: Device Comparison
permalink: device_comparison
---
{% assign devices = site.data.devices | normalize_device_list %}
{% assign sorted = devices | sort: 'name' | sort: 'vendor' %}

<script type="text/javascript" src="{{ "js/mergesort.js" | relative_url }}"></script>
<script>
var tableJson = {{ sorted | jsonify }};
var keys      = ["codename", "vendor", "name"];
var sortOrder = [];

function drawTable(dataTable) {
    $("#deviceComparisonTable thead").remove();
    $("#deviceComparisonTable tbody").remove();

    var thead = $("<thead />");
    var row = $("<tr />");
    thead.append(row);

    norm_keys = Object.keys(dataTable[0].norm);

    ["Codename", "Vendor", "Model Name"].forEach(function(x) {
        $("<th />", { html: x }).appendTo(row);
    });
    norm_keys.forEach(function(key) {
        var order = getSortOrder(key);
        var htmlStr = key;
        if (order) {
            var asc = order[1] === 1;
            var priority = sortOrder.length - sortOrder.indexOf(order);
            htmlStr += "<br>(" + (asc ? "&uarr;" : "&darr;") + " " + priority + ")";
        }
        $("<th />", { id: key, html: htmlStr })
            .bind("click", getThClickEvent(key))
            .appendTo(row);
    });

    var tbody = $("<tbody />");
    $("#deviceComparisonTable").append(thead).append(tbody);

    dataTable.forEach(function (o) {
        row = $("<tr />");
        tbody.append(row);
        keys.forEach(function(key) {
            var htmlStr = o[key];
            if (key === "codename") {
                htmlStr = "<a href=\"/devices/" + o[key] + "\">" + o[key] + "</a>";
            }
            $("<td />", { html: htmlStr }).appendTo(row);
        });
        norm_keys.forEach(function(key) {
            $("<td />", { html: o.norm[key] }).appendTo(row);
        });
    });
}

function getThClickEvent(key) {
    return function() {
        existing = getSortOrder(key);
        if (existing) {
            existing[1] *= -1;
        } else {
            sortOrder.unshift([key, 1]);
        }
        drawTable(sortTable(tableJson));
    };
}

function getSortOrder(key) {
    return sortOrder.find(function(x) { return x[0] === key; });
}

function resetSortOrder() {
    sortOrder = [];
    drawTable(tableJson);
}

function sortTable(table) {
    return sortOrder.reduce(function(acc, tup) {
        var key = tup[0];
        var asc = tup[1] === 1;
        var comp = function(a, b) {
            var l = b.norm[key];
            var r = a.norm[key];

            if      (l  <  r) { return -1; }
            else if (l === r) { return  0; }
            else              { return  1;}
        };

        if (asc) {
            mcomp = function(a, b) { return -comp(a, b); };
        } else {
            mcomp = comp;
        }

        return acc.mergeSort(mcomp);
    }, table.slice(0));
}

$(document).ready(function(){
    drawTable(tableJson);
});
</script>

<div class="post-content">
    <p>
        This page can help you selecting a new phone that matches your personal requirements.
        The table lists all devices that are supported by LineageOS and can be sorted by personal taste.
    </p>
    <h2>Sort Order</h2>
    <p>
      <ul>
        <li>You can sort the table by clicking one or more table columns headers.</li>
        <li>Clicking a specific table column header twice toggles its sort order between ascending and descending.</li>
        <li><i>Multiple sort priorities</i>: Click the table column header which is most important to you first. Then, click the less important ones.</li>
      </ul>
    </p>
    <h2>Device Table</h2>
    <p><a href="#" onclick="resetSortOrder()">Reset sort order</a></p>
    <table border="1" id="deviceComparisonTable"></table>
</div>


