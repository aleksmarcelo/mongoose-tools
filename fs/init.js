load("api_config.js");
load('api_gpio.js');
load('api_timer.js');
load('constants.js');
  
let led = Cfg.get('device.hw.pins.led');
GPIO.set_mode(led, GPIO.MODE_OUTPUT);
GPIO.set_pull(led, GPIO.PULL_UP);
GPIO.setup_output(led, 0);


let state =0;
Timer.set(1000, true /* repeat */ , function (counter) { 
   
  GPIO.write(led, state);
  clog(CYAN, "state: " + JSON.stringify(state) );
  state = !state;

}, null); 



