/* ================================================================== *\
 * 																	  *
 * Extracts the SVG generated with D3 from a webpage to stdout 		  *
 * Script from Lord Loh:											  *
 * http://stackoverflow.com/a/21804843/3049530 						  *
 * 																	  *
\* ================================================================== */

var page = require('webpage').create(),
    fs = require('fs')
    url = 'file://' + fs.absolute('../map.html');

page.open(url, function (status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    } else {
        var svgData = page.evaluate(function(s){
                var serializer = new XMLSerializer();
                var element = document.getElementsByTagName("svg")[0];
                return serializer.serializeToString(element);
        });
        console.log(
			'<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
			+ svgData
		);
    }
    phantom.exit();
});
