# mongoose os commands

[TOC]

## Install jq (indent json response)
```bash
sudo apt install jq
```


## Sys.GetInfo
```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/Sys.GetInfo |jq
```

## Get Rpc commands list
```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/rpc.list |jq 

```

## RPC.describe
```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/rpc.describe -d  '{"name": "Config.Set"}' | jq 

```



## Config.Set 
```bash
curl -H "Content-Type: application/json"  -X GET  http://192.168.43.37/rpc/Config.Set -d \
'{"config": { "wifi.ap.ssid": "pump" }  }'

curl -H "Content-Type: application/json"  -X GET http://192.168.43.37/rpc/Config.Get -d \
'{"key": "wifi.ap"}' | jq --color-output 
```
> Obs: funciona na forma compacta 'wifi.ap.enable'


## Config.get
```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/Config.Get  | jq --color-output .wifi.ap
```

## Describe a command
```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/rpc.describe -d '{"name": "Config.Save"}'
```

```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/config.save -d '{"wifi.ap"}'
```

## Reboot
```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/Sys.reboot 
```

########################################

# Lista de arquivos
```bash
curl -H "Content-Type: application/json"  -X get http://192.168.43.37/rpc/FS.ListExt |jq
```
