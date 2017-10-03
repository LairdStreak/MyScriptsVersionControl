"""
Docstring
"""
# import the required libraries
import urllib.request
import os
import datetime
import pandas as pd
import matplotlib.pyplot as plt
import chardet


CONSTFILENAME = 'dataset.csv'


def main():
    """docstring"""
    plotHerbs()
    #mustFetch = mustfetchapidata()
    #print(mustFetch)
    #if mustFetch:
    #fetchapidata()
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
        time_difference = datetime.datetime.now() - mtime
        time_difference_in_minutes = time_difference / datetime.timedelta(minutes=1)
        return time_difference_in_minutes > 59
    except OSError:
        return False      

def plotHerbs():
    """docstr"""
    data = pd.read_csv(CONSTFILENAME, encoding='ISO-8859-1')
    dfHerbs = data.loc[(data["Class"] == "Tradeskill") & (data["SubClass"] == "Herb")]

    #for index, row in dfHerbs.iterrows():
    #    lineData = "First argument: {0}, second one: {1}".format(row["Name"],row["Level"]) 
    #    print(lineData)
    #print(dfHerbs.head())
    data2 = data[["Id", "Name", "MinBuyout"]]
    data2.set_index("Id", inplace=True)
    #print(data2.head())
    # data.set_index("Id", inplace= True)
    data2.plot.bar()
    # plt.plot(data2["RegionSaleRate"])
    #plt.bar(data2)
    plt.show()
    # print(data.head())


if __name__ == "__main__":
    main()
