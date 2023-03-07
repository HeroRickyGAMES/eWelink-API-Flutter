const express = require('express');

const router = express.Router();

router.get('/employee', function(req, res){
    res.send({
        type: 'GET',
    });
});

router.post('employee', function(){
     req.send({
        type: 'POST'
     })
     console.log('e capaz de aqui se encaixar outros codigos diferentes para automacoes EM POST');
});

module.exports = router;