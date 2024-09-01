
import argparse
import streamlink

parser = argparse.ArgumentParser()
parser.add_argument ('--url',type=str)
args = parser.parse_args()
while True: 

            

    try:
        streams=streamlink.streams(args.url)

    except IOError as e:
                        print(f"error")
                        break

    except Exception as e:

                          print(f"error")
                          break   
   
    else:
        try:
            print(streams["best"].url)
            pass
            break
        except IOError as e:
                            print("no play able stream")
                            break

        except Exception as e:
                              print("no play able stream")
                              break    
        else:
             print(streams["best"].url)                    