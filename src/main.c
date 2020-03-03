#include <stdio.h>

//! NÃO USAR esp_bt.h
// #include "esp_bt.h"
#include "common/platform.h"
#include "common/cs_file.h"
#include "mgos.h"
// #include "fw/src/mgos_app.h"
// #include "mgos_gpio.h"
// #include "mgos_sys_config.h"
// #include "mgos_timers.h"
// #include "mgos_hal.h"
// #include "mgos_dlsym.h"
#include "mgos_i2c.h"
// #include "esp32_adc.h"




int doubleToInt(double val) {
  return (int)val;
}



/**
 * @brief  
 * @note   
 * @param  text: 
 * @retval None
 */
void cLog(char *color, char *text)
{
    printf(color);
    printf(text);
    printf("\e[0m\n");
}
void nLog(char *text)
{
    printf(text);
}

enum mgos_app_init_result mgos_app_init()
{

    return MGOS_APP_INIT_SUCCESS;
}
