# Compile the AST to bytecode:
wasm -d $1/$1.wast -o $1/$1.wasm &&
# Run the WebAssembly code:
node --expose-wasm wasm.js $1