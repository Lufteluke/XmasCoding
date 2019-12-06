const iterations = 100;
var time = process.hrtime();

for (let i = 0; i < iterations; i++) {
    let decode = "tMlsioaplnKlflgiruKanliaebeLlkslikkpnerikTasatamkDpsdakeraBeIdaegptnuaKtmteorpuTaTtbtsesOHXxonibmksekaaoaKtrssegnveinRedlkkkroeekVtkekymmlooLnanoKtlstoepHrpeutdynfSneloietbol".split('');
    //let decode = "oepHlpslainttnotePmseormoTtlst".split('');

    //3 first replaced with 3 last, etc
    let a = [];
    let b = [];
    while (decode.length >= 6) {
        a.push((decode.pop() + decode.pop() + decode.pop()).split('').reverse().join(''));
        b.unshift(decode.shift() + decode.shift() + decode.shift());
    }
    decode = (a.join('') + decode.join('') + b.join('')).split('');

    //swap every other letter
    a = [];
    while (decode.length > 0) {
        a.push((decode.shift() + decode.shift()).split('').reverse().join(''));
    }
    decode = a.join('');

    //swap two halves
    decode = decode.slice(decode.length / 2, decode.length) + decode.slice(0, decode.length / 2)
    if (i == iterations-1) console.log(decode);
}

time = process.hrtime(time);
console.log("Finished in %dms on average over %d iterations", (time[0] * 1000 + time[1] / 1000000)/iterations, iterations)
