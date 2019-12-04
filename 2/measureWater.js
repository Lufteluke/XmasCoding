const readline = require('readline');
const fs = require('fs');
var total = 0;

const readInterface = readline.createInterface({
    input: fs.createReadStream('world.txt')
});

readInterface.on('line', function(line) {
    var counter = 0;
    var enclosed = false;
    var array = line.split('');

    array.forEach(letter => {
        switch (letter) {

            case "#":
            if(enclosed && counter != 0) {
                total += counter;
                counter = 0;
            }    

            else enclosed = true;
            break;

            case " ":
                if (enclosed) counter ++;
            break;
        }
    });
    console.log(total);
});