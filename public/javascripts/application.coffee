class LuckyDip
  constructor: (items) ->
    items.hide()
    @items = items.toArray()
    if @items.length < 2
      throw "Instantiate LuckyDip with a set of 2 or more elements"
    @current = null

  nextItem: =>
    index = Math.floor(Math.random() * @items.length)
    if @current and index == $(@items).index(@current.get(0))
      @nextItem()
    else
      $(@items[index])

  change: =>
    show_next = =>
      @current = @nextItem().fadeIn 'slow', => setTimeout @change, 8000
    if @current
      @current.fadeOut 'slow', -> show_next()
    else
      show_next()

  multi_change: (ld1,ld2) =>
    ld1.change()
    ld2.change()

$ ->
  lucky_dip = new LuckyDip($('section.lucky2 li'))
  lucky_dip2 = new LuckyDip($('section.lucky1 p'))
  lucky_dip.multi_change(lucky_dip,lucky_dip2)