

let fs = require('fs');
let readFile = fs.createReadStream('README.md');
let writeFile = fs.createWriteStream('README_copy.md');
readFile.pipe(writeFile);