casper = require('casper').create()

casper.start 'http://localhost:3000/ajax.html', ->
  # public/ajax.html has "pending" in the file
  @test.assertSelectorHasText '#results', 'pending'

casper.waitFor ->
  # /poll is on a 2s timeout
  results = casper.fetchText('#results')
  results == 'successful'

casper.run ->
  @test.renderResults true
  @test.done()
