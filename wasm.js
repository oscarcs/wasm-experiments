const fs = require('fs');
const args = process.argv;
const buf = fs.readFileSync(`${args[2]}/${args[2]}.wasm`);

var array = new Uint8Array(buf); 
var memory = new WebAssembly.Memory({ initial : 1 });

var imports = {js: {
    mem: memory,
    
    print_int: (x) => process.stdout.write(x.toString()),

    print_string: function(offset, length) {
        // Retrieve bytes from the linear memory
        var bytes = new Uint8Array(memory.buffer, offset, length);
        
        // Convert to 'UCS-2'
        var string = String.fromCharCode.apply(null, new Uint16Array(bytes));
        
        process.stdout.write(string);
    }
}};

WebAssembly.instantiate(array, imports).then(wasm =>
    
    // Run the main function.
    wasm.instance.exports.main()

).catch(e =>
    console.log(e)
);