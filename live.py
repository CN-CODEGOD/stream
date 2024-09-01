import argparse
import streamlink

parser = argparse.ArgumentParser()
parser.add_argument ('--url',type=str)
args = parser.parse_args()
a=1 
while True:



    try:
        streams=streamlink.streams(args.url)

    except IOError as e:
                        
                        a=a+1
                        if a==5:
                                print("disconnected")
                                break

    except Exception as e:

                        
                          a=a+1
                          if a==5:
                                  print("disconnected")
                                  break
                         

    else:
    
        try:
            streams["best"].url
            print("live")
            break
        except IOError as e:
                            print("off line")
                            break
                    
                            
                            

        except Exception as e:
                              print("off line")
                              break