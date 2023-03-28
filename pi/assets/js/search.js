var currentSection;
var matchPos = 0;

$(function () {
	$('#pi-content #nav a').click(function (event) {
		//since this requires jumping sections, force the entire document to show, then let the bubbled event continue as normal
		revealAll();
	});

	$('#searchButton').on('click', function () {
		runSearch();
	});

	$('#searchBox').on('keypress', function (e) {
		if (e.which == 13) {
			runSearch();
		}
	});

	$("#next").click(function() {
	matchPos +=0;
	var highlightCount = $('span.highlight').length;

	if(highlightCount < (matchPos +2)) {
	setTimeout(function(){alert('No more results');},200);
	}
	 var hash = window.location.hash = "#highlight"+ (1 + matchPos++);
	 $('#pi-content .object').show();
	   $("#pi-content").stop();
	   $('#pi-content').scrollTo(hash);
	   
	});
	//check to see if any more spans occur higher up, if not un-decrement the position variable
	$('#prev').on('touchstart', function () {
		if ($('.highlight:eq(' + --matchPos + ')').text() != '') {
			$('#pi-content div').scrollTo('#highlight' + matchPos);
		} else {
			++matchPos;
		}
	})
});

function revealAll() {
	//show all sections on the page
	$('.btn-subsection').removeClass('btnActiveSubSection');
	$('.btn-section').removeClass('BTNactiveSection');
	currentSection = '#pi-content';

	var active = $('#active');

	if (active) {
		active
			.removeAttr('id')
			.removeAttr('style')
			.addClass('closed');

	}
	$('.section').fadeIn();
}

function runSearch() {
	//grab the search value
	var val = $('#searchBox').val();
	matchPos = 0;
	$("span.highlight").contents().unwrap();
	//only allow search terms over 2 characters long
	if (val.length < 3) {
		setTimeout(function(){alert("A minimum of 3 characters is required for searching");},200);
		return false;
	}

	var newval = val.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
	
	//search case insensitive and globally to the entire search term as entered
	var reg = new RegExp('(' + newval + ')+', 'gi');
	var matched;
	var left, found;

	//grab the page content
	var searchedText = document.getElementById('pi-content').innerHTML;
	var doc = '';
	if (searchedText == 'undefined' || val == 'undefined' || val.length < 3) return false;
	found = false;
	$("span.highlight").contents().unwrap();
	//move through all the matches replacing the search term with a span tag and the highlighting class
	//take everything to the left of the term, add the span tag with the term, then continue with what is left
	while (matched = reg.exec(searchedText)) {
		left = searchedText.substring(0, (matched.index));
		if (left.lastIndexOf('>') > left.lastIndexOf('<')) {
			found = true;
			doc += left + '<span class="highlight" id="highlight' + matchPos++ + '">' + matched[0] + '</span>';

		} else {
			doc += left + matched[0]
		}
		searchedText = searchedText.substring(matched.index + val.length);
		reg.lastIndex = 0;
	}

	if (!found) {
		setTimeout(function(){alert("The term - '" + val + "' - is not found in this PI");},200);
		return false;
		$("span.highlight").contents().unwrap();
	}
	if (searchedText.length > 0) doc += searchedText;

	//reset the content of the document with the new spans
	$('#pi-content').html(doc);

	//show everything
	revealAll();

	//scroll to the first found term
	matchPos = 0;
	$('#pi-content div').scrollTo('#highlight' + matchPos);
	return true;
}

function sFocus() {
	$('#next').fadeIn(500);
	$('#searchBox').prop('value', '');
}
