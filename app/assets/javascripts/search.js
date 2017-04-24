$().ready(function() {
  var searchFieldTimeoutId;
  var $songsContainer = $('#songs-container');

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
    $songsContainer.empty();
    results.forEach(function(result) {
      renderResult(result);
    });
  };

  function renderResult(result) {
    var resultItem = "<li>" + result.song.title + "</li>";
    $songsContainer.append(resultItem);
  };
});