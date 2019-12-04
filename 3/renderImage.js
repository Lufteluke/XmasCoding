const readline = require('readline');
const fs = require('fs');
let total = 0;

const readInterface = readline.createInterface({
    input: fs.createReadStream('image.txt')
});

readInterface.on('line', function(line) {
    let counter = 0;
    let enclosed = false;

    line = line.split('1').join("█").split('0').join(" ");
    let min = 300;
    let x = 1287;
    let output = "";

    //for (x; x<array.length && x>min; x++) {
        let y = line.length/x;
        if (y % 1 == 0) {
            for (let yy = 0; yy<y; yy++) {
                let row = line.slice(0,x)
                output += (row + "\n");
                line = line.slice(x);
            }

            fs.writeFile("output_"+x+"x"+y+".txt", output, (err) => {
                if (err) throw err;
                console.log("Done %d x %d", x,y);
            });
        }
    //}    
});