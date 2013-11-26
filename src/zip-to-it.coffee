# zip to it
#   a partial zip code locator
#   use me to build a responsive absolute map search for the u.s.

class Zip
  constructor: ->
    t = @
    d3.csv 'zipcodes.csv', (zipcodes) ->
      t.zipcodes = d3.nest().key((d) -> d.zip).map(zipcodes)

  to: (partial) ->
    @zipcodes[partial]

  from: (lat, lon) ->
    throw 'up'

window.Zip = new Zip()
