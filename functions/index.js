const functions = require('firebase-functions');
const msgpack = require("msgpack-lite");

exports.messagePackEncode = functions.https.onRequest((request, response) => {

    console.log("request method = " + request.method);
    console.log("content-type = " + request.get('content-type'));
    const data = request.body;

    // encode from JS Object to MessagePack (Buffer)
    var buffer = msgpack.encode(data);

    const filename = "test.mpack";
    const mimetype = "application/vnd.msgpack"; // not registered, see https://github.com/msgpack/msgpack/issues/194

    response.writeHead(200, {
        'Content-Type': mimetype,
        'Content-disposition': 'attachment;filename=' + filename,
        'Content-Length': buffer.length
    });

    response.end(buffer);
});
