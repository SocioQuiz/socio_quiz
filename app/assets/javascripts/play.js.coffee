class @Play
  @showScore: (userid) ->
    $.ajax "/users/#{userid}.json",
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      $('.sq-totalscore').html "0"
    success: (data, textStatus, jqXHR) ->
      $('.sq-totalscore').html "#{data.totalScore}"
