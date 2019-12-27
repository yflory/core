var x2t = require('./x2t.js');
var fs = require('fs');

console.log(x2t);
x2t.run()

function convert(from, to) {
 var params = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
      + "<TaskQueueDataConvert xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">"
      + "<m_sFileFrom>/working/" + from + "</m_sFileFrom>"
      + "<m_sFileTo>/working/" + to + "</m_sFileTo>"
      + "<m_bIsNoBase64>false</m_bIsNoBase64>"
      + "</TaskQueueDataConvert>"
    fs.writeFileSync('params.xml', params);
    x2t.ccall("runX2T", ["number"], ["string"], ["/working/params.xml"]);
}

x2t.onRuntimeInitialized = function() {
 console.log("Ready to roll");
 convert("cryptpad.bin", "cryptpad.bin.xlsx");
}
