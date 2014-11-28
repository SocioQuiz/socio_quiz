# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @Quiz
  @switchQuizType: ->
    $('input[type=radio][name="quiz[type]"]').change ->
        if this.value == '1'
            $(".answer").show()
        else if this.value == '2'
            $(".answer").hide()
