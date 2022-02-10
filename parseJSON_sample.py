import json
from unicodedata import name

def cleanStr4SQL(s):
    return s.replace("'","`").replace("\n"," ")

def parseBusinessData():
    #read the JSON file
    # We assume that the Yelp data files are available in the current directory. If not, you should specify the path when you "open" the function. 
    with open('yelp_CptS451_2022/yelp_business.JSON','r') as f:  
        outfile =  open('.//business.txt', 'w')
        line = f.readline()
        count_line = 0
        #read each JSON abject and extract data
        while line:
            data = json.loads(line)
            outfile.write("{} - business info : '{}' ; '{}' ; '{}' ; '{}' ; '{}' ; '{}' ; {} ; {} ; {} ; {}\n".format(
                              str(count_line), # the line count
                              cleanStr4SQL(data['business_id']),
                              cleanStr4SQL(data["name"]),
                              cleanStr4SQL(data["address"]),
                              cleanStr4SQL(data["state"]),
                              cleanStr4SQL(data["city"]),
                              cleanStr4SQL(data["postal_code"]),
                              str(data["latitude"]),
                              str(data["longitude"]),
                              str(data["stars"]),
                              str(data["is_open"])) )

            #process business categories
            categories = data["categories"].split(', ')
            outfile.write("      categories: {}\n".format(str(categories)))
            outfile.write("      attributes:\n")

            
            # TO-DO : write your own code to process attributes
            # make sure to **recursively** parse all attributes at all nesting levels. You should not assume a particular nesting level.
            attrs = data['attributes']
            def parseAttributes(attrObj):
                for k, v in attrObj.items():
                    if isinstance(v, dict):
                        outfile.write("      {}: see lowercase attributes below:\n".format(str(k)))
                        parseAttributes(v)
                    else:
                        outfile.write("        {}; {}\n".format(str(k), str(v)))                        
            parseAttributes(attrs)

            # TO-DO : write your own code to process hours data
            hours = data['hours']
            outfile.write("      Business Hours:\n")
            for k,v in hours.items():
                outfile.write("        {}; {}\n".format(str(k), str(v)))

            outfile.write('\n')

            line = f.readline()
            count_line +=1
    print(count_line)
    outfile.close()
    f.close()

def parseUserData():
    # TO-DO : write code to parse yelp_user.JSON
    with open('yelp_CptS451_2022/yelp_user.JSON','r') as f:
        outfile = open('.//user.txt', 'w')
        line = f.readline()
        count_line = 0
        while line:
            data = json.loads(line)
            outfile.write("{} -- {} {};  {} {};  {}: {};  {}: {};  {} {};  {} {};  {} {};  {}: {};  {}: {}; \n      {}: {}\n ".format(
                str(count_line), # the line count
                "user_id",
                str(data["user_id"]),
                "average stars:",
                str(data['average_stars']),
                "cool",
                str(data['cool']),
                "fans",
                str(data['fans']),
                "funny:",
                str(data['funny']),
                "name:",
                str(data["name"]),
                "tipcount:",
                str(data["tipcount"]),
                "useful",
                str(data["useful"]),
                "yelping_since",
                str(data["yelping_since"]),
                "friends",
                str(data['friends'])
            ))
            outfile.write("\n")
            line = f.readline()
            count_line +=1
    print(count_line)
    outfile.close()
    f.close()

def parseCheckinData():
    # TO-DO : write code to parse yelp_checkin.JSON
    pass


def parseTipData():
    # TO-DO : write code to parse yelp_tip.JSON
    pass

if __name__ == "__main__":
    parseBusinessData()
    parseUserData()
    parseCheckinData()
    parseTipData()