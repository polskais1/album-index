$().ready(function() {
  var searchFieldTimeoutId;
  var $resultsContainer = $('#results-container');

  $("#search-field").keyup(function(event) {
    clearTimeout(searchFieldTimeoutId);

    searchFieldTimeoutId = setTimeout(function() {
      $.ajax({
        url: '/search',
        data:  {query: event.target.value},
        success: function(res) {
          renderResults(res);
        },
        dataType: 'json'
      });
    }, 1000);
  });

  function renderResults(results) {
    $resultsContainer.empty();
    results.forEach(function(result) {
      renderResult(result);
    });
  };

  function renderResult(result) {
    var resultItem = '<li class="result">Track: ' +
        result.song.title + '<br/>Artist: ' +
        result.artist.name + '<br/>Album: ' +
        result.album.title +
        '</li>';
    $resultsContainer.append(resultItem);
  };
});