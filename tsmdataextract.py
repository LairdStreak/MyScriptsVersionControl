"""
Docstring
"""
# import the required libraries
import urllib.request
import os
import datetime


CONSTFILENAME = 'dataset.csv'


def main():
    """docstring"""
    mustFetch = mustfetchapidata()
    print(mustFetch)
    if mustFetch:
        fetchapidata()
    # fetchapidata()
    # print(mustfetchapidata())


def fetchapidata():
    """method docstring"""
    url = 'http://api.tradeskillmaster.com/v1/item/US/khazgoroth?format=csv&apiKey=odfIR8Qtfy1q7R2Ee27a9rNO_WN_M97w'

    with urllib.request.urlopen(url) as testfile, open(CONSTFILENAME, 'w') as file:
        file.write(testfile.read().decode())

def mustfetchapidata():
    """if there is a file check date if older than 1 hr fetch it again"""
    try:
        mtime = datetime.datetime.fromtimestamp(os.path.getmtime(CONSTFILENAME))
        time_difference = mtime - datetime.datetime.now()
        time_difference_in_minutes = time_difference / datetime.timedelta(minutes=1)
        return time_difference_in_minutes > 30
    except OSError:
        return False      

if __name__ == "__main__":
    main()
