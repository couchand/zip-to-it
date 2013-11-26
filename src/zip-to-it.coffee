# zip to it
#   a partial zip code locator
#   use me to build a responsive absolute map search for the u.s.

computeCentroid = (zips) ->
  zips[0]

class Zip
  constructor: ->
    t = @
    @nest = d3.nest()
      .key((d) -> d.zip[0...1])
      .key((d) -> d.zip[0...2])
      .key((d) -> d.zip[0...3])
      .key((d) -> d.zip[0...4])
      .key((d) -> d.zip[0...5])
    d3.csv 'zipcodes.csv', (zipcodes) ->
      partials = {}
      zipcodes = zipcodes.filter (d) -> d.zip.trim()
      nested = t.nest.entries zipcodes
      nested.forEach (first) ->
        partials[first.key] = []
        first.values.forEach (second) ->
          partials[second.key] = []
          second.values.forEach (third) ->
            partials[third.key] = []
            third.values.forEach (fourth) ->
              partials[fourth.key] = []
              fourth.values.forEach (fifth) ->
                z = fifth.values[0]
                partials[fifth.key] = [z]
                partials[fourth.key].push z
                partials[third.key].push z
                partials[second.key].push z
                partials[first.key].push z
      t.partials = {}
      for partial, values of partials
        t.partials[partial] = computeCentroid values

  to: (partial) ->
    @partials[partial]

  from: (lat, lon) ->
    throw 'up'

window.Zip = new Zip()
