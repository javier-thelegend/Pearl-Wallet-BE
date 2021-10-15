//To check authentication token
const firebase = require('../services/firebase');

const firebaseGuard = async (req, res, next) => {
    //Bearer Token comes in Authorization header from the FE
    if(!req.headers.authorization || !req.headers.authorization.startsWith('Bearer ')){
        return res.status(403).json({valid: false, message: 'Unauthorized Access!'});
    }

    // console.log(req.headers);
    let idToken = req.headers.authorization.split('Bearer ')[1];
    // console.log(idToken);
    try {
        const decodedToken = await firebase.auth().verifyIdToken(idToken);
        req.user = decodedToken;
        // console.log(req.user);
        next();        
    } catch(e) {
        return res.status(403).json({valid: false, message: 'Unauthorized: ' + e});
    }
}

module.exports = firebaseGuard;