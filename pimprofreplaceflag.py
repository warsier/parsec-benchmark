import fileinput
import os
from glob import glob

def replace(filename):
    old1 = "LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS)"
    new1 = "LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(LDCFLAGS)"
    old2 = "$(CXXFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@"
    new2 = "$(LDCXXFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@"
    with open(filename, 'r') as file:
        filedata = file.read()

    # Replace the target string
    filedata = filedata.replace(old1, new1)
    filedata = filedata.replace(old2, new2)

    # Write the file out again
    with open(filename, 'w') as file:
      file.write(filedata)

result = [y for x in os.walk("./") for y in glob(os.path.join(x[0], "Makefile.in"))]
for filename in result:
    print(filename)
    replace(filename)