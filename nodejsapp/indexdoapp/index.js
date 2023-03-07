const express = require('express');

const router = express.Router();

const ewelink = require('ewelink-api');


router.get('/tst', function(req, res){
  const obj = {
    foo() {
      return (async () => {
        res.send({
          type: 'GET',
        });
  
        const connection = new ewelink({
          email: 'seuEmail',
          password: 'suaSenha',
          region: 'us',
        });
      
        /* get all devices */
        const devices = await connection.getDevices();
        console.log(devices);
      
        //Pegue o id do dispositovo pelo app do eWelink
        const device = await connection.getDevice('seuDeviceID');
        console.log(device);
      
        //Pegue o id do dispositovo pelo app do eWelink
        await connection.toggleDevice('seuDeviceID');
      
          const region = await connection.getRegion();
          console.log(region);   
      
      })();
    }
  };
  console.log(obj.foo());
});




module.exports = router;