const express = require('express');


const app = express();



app.use(express.json());

app.get('/api', (req, res) => res.send('API ESTÁ FUNCIONANDO!!'));

app.use('/api', require('./routes/api'));
app.use('/api', require('./indexdoapp/index.js'));

app.use(function(err, req, response, next){
    response.status(422).send({error: err.menssage});

});

app.listen(process.env.port || 4000, function(){
    console.log('Agora estou escutando os requests!');
})