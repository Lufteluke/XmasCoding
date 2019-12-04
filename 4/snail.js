var fs = require('fs');
var world;
 
fs.readFile('coords.csv', 'utf8', function(err, contents) {
    //console.log(contents);
    world = Array.from(contents);
});


console.log(JSON.stringify(world));