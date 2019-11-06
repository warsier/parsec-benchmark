import fileinput
import os
from glob import glob

# def replace(filename):
#     arr = [
#         ("LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS)",
#         "LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(LDCFLAGS)"),
#         ("$(CXXFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@",
#         "$(LDCXXFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@"),
#         ("$(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS)",
#         "$(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(LDCFLAGS)"),
#         ("$(AM_CFLAGS) $(CFLAGS) $(libgobject_2_0_la_LDFLAGS) $(LDFLAGS)",
#         "$(AM_CFLAGS) $(LDCFLAGS) $(libgobject_2_0_la_LDFLAGS) $(LDFLAGS)"),
#         ("$(AM_CFLAGS) $(CFLAGS) $(libgthread_2_0_la_LDFLAGS) $(LDFLAGS)",
#         "$(AM_CFLAGS) $(LDCFLAGS) $(libgthread_2_0_la_LDFLAGS) $(LDFLAGS"),
#         ("$(AM_CFLAGS) $(CFLAGS) $(libmoduletestplugin_a_la_LDFLAGS)",
#         "$(AM_CFLAGS) $(LDCFLAGS) $(libmoduletestplugin_a_la_LDFLAGS)"),
#         ("$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@",
#         "$(LDCFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@"),
#     ]
#     with open(filename, 'r') as file:
#         filedata = file.read()

#     newfiledata = ""
#     # Replace the target string
#     for elem in arr:
#         old = elem[0]
#         new = elem[1]
#         newfiledata = filedata.replace(old, new)
#         if newfiledata != filedata:
#             print(filename)

#     # Write the file out again
#     with open(filename, 'w') as file:
#         file.write(newfiledata)

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