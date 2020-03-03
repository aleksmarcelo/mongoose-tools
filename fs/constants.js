

let RED = chr(27) + "[0;49;91m";
let YELLOW = chr(27) + "[1;40;33m";
let CYAN = chr(27) + "[0;49;96m";
let BLUE = chr(27) + "[0;49;94m";

  
//Color log
let clog = ffi('void cLog(char *, char *)');
let log = ffi('void  nLog(char *)');
let doubleToInt = ffi("int doubleToInt(double)");
  
function logi(txt) { clog(cyan, txt); }         
// function str(val) {
//   JSON.stringify(val);
// }