$ ->
  flashCallback = ->
    $(".alert").fadeOut(1500)
  $(".alert").bind 'click', (ev) =>
    $(".alert").fadeOut()
  setTimeout flashCallback, 1000