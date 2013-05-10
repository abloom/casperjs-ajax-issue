cp    = require 'child_process'
util  = require 'util'
async = require 'async'

fakeServer = undefined

setupPipes = (obj) ->
  obj.stdout.pipe process.stdout
  obj.stderr.pipe process.stderr

startServer = (cb) ->
  console.log "Starting server"
  fakeServer = cp.spawn './node_modules/.bin/coffee', ['./app.coffee']
  setupPipes(fakeServer)
  cb()

startCasper = (cb) ->
  console.log "Starting CasperJS"
  casper = cp.spawn 'casperjs', ['test/casper_test.coffee']
  setupPipes(casper)

  casper.on 'error', (err) ->
    console.error "Encountered error while spawning casperjs: #{util.inspect err}"
    throw err

  casper.on 'exit', ->
    cb()

stopServer = (cb) ->
  console.log "Stoping server"
  fakeServer.kill()
  cb()

async.waterfall [startServer, startCasper, stopServer]
