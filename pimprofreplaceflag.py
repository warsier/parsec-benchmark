import fileinput
import os
from glob import glob

def replacestr(string):
    string = string.replace("$(CXXFLAGS)", "$(LDCXXFLAGS)")
    string = string.replace("$(CFLAGS)", "$(LDCFLAGS)")
    return string

def replace(filename):
    newfiledata = ""
    with open(filename, 'r') as file:
        oldfiledata = file.read()
        filedata = oldfiledata.split('\n')
        i = 0
        while i < len(filedata):
            if filedata[i].find("--mode=link") != -1:
                while i < len(filedata):
                    newfiledata += replacestr(filedata[i])
                    if i != len(filedata) - 1:
                        newfiledata += "\n"
                    if filedata[i].strip()[-1] != '\\':
                        break
                    i += 1
            else:
                newfiledata += filedata[i]
                if i != len(filedata) - 1:
                    newfiledata += "\n"
            i += 1
    if newfiledata != oldfiledata:
        print(filename)

    with open(filename, 'w') as file:
        file.write(newfiledata)

allfiles = [y for x in os.walk("./") for y in glob(os.path.join(x[0], "Makefile.in"))]
for filename in allfiles:
    replace(filename)
