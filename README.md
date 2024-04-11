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

list the subscribe stream 
![image](https://github.com/CN-CODEGOD/stream/assets/166476136/e489c96b-a12d-43f8-9e2e-3982d7d787c4)


## About avoid firewall 
 play-stream 获取的链接需要VPN 获取过后的直链播放不需要VPN 
 可以把获取的直链保存到播放器的链接列表里，以后就不用再次获取
