var firebase = require('firebase-admin');

//Got it from https://console.firebase.google.com/project/pearl-wallet-project/settings/serviceaccounts/adminsdk
//Clic on Generate new private key
//Download File
//And copy to certs directory in project
//------------------------------------
var serviceAccount = require('../certs/pearl-wallet-project-firebase-adminsdk-a0sjf-f0d8eb3d3a.json');

firebase.initializeApp({
  credential: firebase.credential.cert(serviceAccount)
});
//------------------------------------

module.exports = firebase;