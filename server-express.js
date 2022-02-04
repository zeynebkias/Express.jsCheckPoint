// insall express 



const express = require('express'); // reauire = import
const app = express();
const path = require('path');

//npm install dotenv
// require ('dotenv').config()


// app.get('/', (req, res) => { // method "get" : ( 2 paramatre : chemin route , callback function)
// res.send('Hello World'); // res.write

// })
// app.get('/Home', (req, res) => { 
//     res.send('Hello Home'); 
    
//     })

// app.listen(
//     process.env.PORT || 3000,
//     () => console.log(`Example app listening on ${process.env.PORT || 3000}`) );

// app.get('/', (req, res) => {
//     res.sendFile(path.join(__dirname, `public` , `index.html`));
//     //res.send('<h1> hello world </h1>')
// })


const members = {
    id : 1,
    name : 'zeyneb',
    email : 'z@k.com'
} 
 app.get('/', (req, res)=>{
     res.json(members);

 });



app.listen(3001);

