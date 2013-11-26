# basic server

fs = require 'fs'
express = require 'express'
app = express()

app.use express.static 'example'
app.use express.static 'lib'

zip = fs.readFileSync('./zip-to-it.js').toString()
codes = fs.readFileSync('./data/zipcode.csv').toString()

app.get '/zip-to-it.js', (req, res) ->
    res.send zip

app.get '/zipcode.csv', (req, res) ->
    res.send codes

app.listen 3000
console.log 'Listening on localhost:3000'
