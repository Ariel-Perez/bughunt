$(document).ready(function() {
    $('#filter-bar .label.clickable').click(function() {
        $(this).toggleClass('clicked');
        enqueueFilter();
    });

    $('#filter-bar input').keypress(function() {
        enqueueFilter();
    });

    window.filterTimeout = null;

    $('#new-bug').click(function() {
        console.log('Create a new bug!');
    });

    let compareFunction = {'desc': function(x, y) { return y - x; }, 'asc': function(x, y) { return x - y; }};
    let parseFunction = {'date': Date.parse, 'score': parseInt};
    $('#sort-reward').click(function() {
        let order = handleSortButton($(this));
        sort(compareFunction[order], parseInt, 'score');
    });

    $('#sort-date').click(function() {
        $('#sort-reward').removeClass('clicked');
        let order = handleSortButton($(this));
        sort(compareFunction[order], Date.parse, 'date');
    });

    let bugs = $('.bug.grid-item');
    bugs.each(function(i, e) {
        let labels = $(e).find('.label');
        labels.each(function(j, l) {
            let tagId = $(l).attr('data-tag-id');
            $(e).attr('data-tag-' + tagId, "");
        });
    });
});

function enqueueFilter()
{
    if (filterTimeout) {
        clearTimeout(filterTimeout);
    }

    filterTimeout = setTimeout(filter, 500);
}

function handleSortButton(btn) {
    let orderSwitch = {'desc': 'asc', 'asc': 'desc'};
    let previouslySelected = btn.hasClass('clicked');
    let previousOrder = btn.attr('data-sort');
    let order = previousOrder;

    $('#sort-date').removeClass('clicked');
    $('#sort-score').removeClass('clicked');

    if (previouslySelected) {
        btn.find('i.fa').removeClass('fa-sort-amount-' + previousOrder);
        let newOrder = orderSwitch[previousOrder];
        btn.find('i.fa').addClass('fa-sort-amount-' + newOrder);
        btn.attr('data-sort', newOrder);
        order = newOrder;
    }

    btn.addClass('clicked');
    return order;
}

function sort(compareFunction, parseFunction, sortAttribute) {
    let bugs = $('.bug.grid-item');
    let values = bugs.map(
        function(i, x) {
            return parseFunction(
                $(x).attr('data-' + sortAttribute)
            );
        }
    );

    values = values.toArray().sort(compareFunction);
    bugs.each(function(i, e) {
        let score = parseFunction($(e).attr('data-' + sortAttribute));
        let index = values.indexOf(score)
        $(e).css('order', index);
    });
}

function filter() {
    let bugs = $('.bug.grid-item');
    let clickedLabels = $('#filter-bar .clicked.label');
    bugs.removeClass('hidden');

    clickedLabels.each(function(i, e) {
        let tagId = $(e).attr('data-tag-id');
        $('.bug.grid-item:not(.hidden):not([data-tag-' + tagId + '])').addClass('hidden');
    });

    console.log('filter');
}
