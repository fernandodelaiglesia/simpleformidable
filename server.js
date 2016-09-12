var formidable = require('formidable'),
    http = require('http'),
    util = require('util'),
    fs = require('fs');
 
http.createServer(function(req, res) {
  /* Process the form uploads */
  if (req.url == '/upload' && req.method.toLowerCase() == 'post') {
    var form = new formidable.IncomingForm();
    form.parse(req, function(err, fields, files) {
      res.writeHead(200, {'content-type': 'text/plain'});
      res.write('received upload:\n\n');
      res.end(util.inspect({fields: fields, files: files}));
    });
  
    return;
  }

  //switch(req.url) {
  //	case '/logo.jpg':
  if (req.url == '/logo.jpg') { 
      var img = fs.readFileSync('./logo.jpg');
        res.writeHead(200, {'Content-Type': 'image/jpeg'});
        res.end(img,'binary');
  //	break;
  return;
  
  }
   


 
  /* Display the file upload form. */
  res.writeHead(200, {'content-type': 'text/html'});
  res.end(
    '<html><head><title>Hello Noder!</title></head><body background="/logo.jpg">'+
    '<h1>Welcome Noder, who are you?</h1>'+
    '<form action="/upload" enctype="multipart/form-data" method="post">'+
    '<input type="text" name="title"><br>'+
    '<input type="file" name="upload" multiple="multiple"><br>'+
    '<input type="submit" value="Upload">'+
    '</form>'+
    '</body></html>'
  );
 
}).listen(8000);
