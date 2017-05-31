const fs = require('fs');
const args = process.argv;
const buf = fs.readFileSync(`${args[2]}/${args[2]}.wasm`);

var array = new Uint8Array(buf); 

var imports = {js: {
    print_int: (x) => console.log(x)
}};

WebAssembly.instantiate(array, imports).then(wasm =>
    
    // Run the main function.
    wasm.instance.exports.main()

).catch(e =>
    console.log(e)
);