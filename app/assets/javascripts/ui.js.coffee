$(document).on 'ready page:load', ->
  $('body').on 'click', '.actions', (event) ->
    $(this).addClass('open')
    event.stopPropagation()
    return false

  $('body').on 'click', (event) ->
    $('.actions').removeClass('open')
