# stream
## improve the streamlink CLI

get the link from the stream and start it with player instead of processing the streaming 

handle the error for streamlink ,the module will retry if error occured and try to open stream for multiple time 

For CN user , the module could avold the firewall because the firewall can't block the direct link 



stream
# USAGE 

subscribe-playlist -url [param] -title [param] 

pass  the url and name param for subcribing an stream 

![image](https://github.com/CN-CODEGOD/stream/assets/166476136/edaa1ea7-751b-4a68-ae60-55151f467966)

unsubscribe-playlist -name [param]

remove the playlist 

![image](https://github.com/CN-CODEGOD/stream/assets/166476136/b1dc3b31-41e5-426b-8eed-ddbf5d299660)

play-stream -name [param]

play the stream of the title

![image](https://github.com/CN-CODEGOD/stream/assets/166476136/c2fdc63e-147e-4024-9b9d-5e059e571d43)


list-subscribe  

check the available subscribe stream 

 
 ![image](https://github.com/CN-CODEGOD/stream/assets/166476136/ea09ff53-8781-49bb-a241-be4cf458f0e1)





## About avoid firewall 

 
 play-stream 获取的TWITCH链接需要VPN 获取过后的直链播放不需要VPN 



## bilibili for BilibiliPotPlayer

bilibili was using BilibiliPotPlayer instead of streamlink for better stream play 

you need to install the BilibiliPotPlayer manually  before playing the bilibili stream 



## install plugin 
expand the zip bilibili

move the path  Media\playparse MediaPlayParse -Bilibili.as.~\MediaPlayParse-Bilibili.ico and ~\Bilibili_Config.json

to (potplayer)\extension\Media\playparse 

move the path Media\MediaUrlList -Bilibili.as and MediaUrlList -Bilibili.ico to (potplayer)\Extension\Media\UrlList

## login 

open the Bilibili_Config.json

config the cookie 

![image](https://github.com/CN-CODEGOD/stream/assets/166476136/4dd6f5c0-8da6-4129-a015-0eff396e1f20)

enter the path inside

Test 

![image](https://github.com/CN-CODEGOD/stream/assets/166476136/5c401b00-e562-4e75-8110-d1fbcec52357)

## get cookies

[gei cookies](https://github.com/chen310/BilibiliPotPlayer/issues/62#issuecomment-1841909583)


## usage 

enter the link into potplayer to play 

![image](https://github.com/CN-CODEGOD/stream/assets/166476136/25e37c82-8127-4890-86df-19eefb6d3567)




