This simple app demonstrates an issue with CasperJS regarding AJAX requests
during an onReady callback. A test with 2 assertions has been written. Run it
with the following command.

`npm test`

Then take a look at `public/ajax.html` and uncomment the `setTimeout` lines.
Rerun the tests to discover they now pass!
