express = require 'express'
http    = require 'http'

app = express()

app.set('port', 3000)
app.use(express.logger('dev'))
app.use(express.static('./public'))

app.get '/poll', (req, res) ->
  setTimeout (->
    res.send("successful")
  ), 2000

http.createServer(app).listen 3000, ->
  console.log "Express server listening on port #{app.get('port')}"
