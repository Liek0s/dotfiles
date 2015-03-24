#! /usr/bin/python2 -tt
# ______________________________________________________________________________
#
#  CLEAN
# ______________________________________________________________________________
# By Jules Baratoux on Wed Aug 28 2013
# Just a simple project to learn python
#
# NAME
#        clean - remove dirt from directories
#
# SYNOPSIS
#        clean [options] [directories]
#
# DESCRIPTION
#        Remove  dirt files from directories. Multiples directories can be
#        set. By default clean the current directory.
#
# OPTIONS
#       -d, --maxdepth levels
#               Descend at most  levels (a non-negative integer) levels
#               of  directories  below   the  command  line  arguments.
#
#       -f, --force
#               ignore nonexistent files, never prompt
#
#       -i      Prompt before every removal
#
#       -I      prompt once  before removing more than  three files, or
#               when  removing recursively.   Less  intrusive than  -i,
#               while still giving protection against most mistakes
#
#       -L, --follow
#               Follow symbolic
#
#       -H, --no-follow
#               Do not  follow symbolic links,  except while processing
#               the  command  line  arguments.  This  is  the   default
#               behaviour.
#
#       -R, --recursive
#               Clean directories and their subdirectories recursively
#
#       -h, --help
#               Display this help and exit
#
#       -v, --verbose
#               Explain what is being done
# ______________________________________________________________________________

import getopt, sys, os, re

class Param(object):
    def __init__(self, follow=False, recursive=False, verbose=False, maxdepth=3):
        self.follow = follow
        self.recursive = recursive
        self.verbose = verbose
        self.maxdepth = maxdepth
        self.rm_options = ""
# ______________________________________________________________________________

param = Param()

def main():
    try:
        options, argv = getopt.gnu_getopt(sys.argv[1:], "d:fiILHRhv", ["maxdepth=", "force", "follow",
                                                                       "no-follow", "help", "recursive", "verbose"])
    except getopt.GetoptError as err:
        print str(err)
        usage()
        sys.exit(2)

    for option, arg in options:
        if option in ("-h", "--help"):
            usage()
            sys.exit()
        elif option in ("-d", "--maxdepth"):
            param.maxdepth = arg
        elif option in ("-f", "--force"):
            param.rm_options += "--force "
        elif option in ("-I"):
            param.rm_options += "-I "
        elif option in ("-i"):
            param.rm_options += "-i "
        elif option in ("-R", "--recursive"):
            param.recursive = True
        elif option in ("-v", "--verbose"):
            param.verbose = True
            param.rm_options += "--verbose "
        elif option in ("-L", "--follow"):
            param.follow = True
        elif option in ("-H", "--no-follow"):
            param.follow = False
        else:
            print option
            assert False, "unhandled option"

    if len(argv) > 0:
        for arg in argv:
            clean(arg)
    else:
        clean('.')
# ______________________________________________________________________________

def resolve_link(pathname):
    from os import readlink;
    pathname = readlink(pathname)
    return "." if pathname is None else pathname


def isdir(pathname):
    try:
        return os.path.isdir(pathname) or (os.path.islink(pathname) and os.path.isdir(resolve_link(pathname)))
    except OSError as e:
        print str(e)
        return False


def isfile(pathname):
    try:
        return os.path.isfile(pathname) or (os.path.islink(pathname) and os.path.isfile(resolve_link(pathname)))
    except OSError as e:
        print str(e)
        return False


def islink(pathname):
    return os.path.islink(pathname)
# ______________________________________________________________________________

def file_handler(path):
    if re.match( "([^~]+~$)"             + '|' +
                 "(#[^#]+#$)"            + '|' +
                r"(\.#[^#]+$)"           + '|' +
                r"(.+\.stackdump$)", os.path.basename(path)):
        remove(path)


def dir_handler(pathname, depth):
    depth += 1;
    for name in os.listdir(pathname):
        name = pathname + "/" + name
        if (depth <= param.maxdepth) and (isdir(name) and param.recursive) and (not islink(name) or param.follow):
            try:
                dir_handler(name, depth)
            except OSError as e:
                print str(e)
        elif isfile(name) or isdir(name):
            file_handler(name)


def clean(pathname, depth = 0):
    if isdir(pathname):
        dir_handler(pathname, depth)
    if isfile(pathname):
        file_handler(pathname)
# ______________________________________________________________________________

def remove(filename):
    os.system("rm " + param.rm_options + filename)



def usage():
    synopsis = "usage: "

    text = []
    f = open(sys.argv[0], 'r')
    if f:
        flag = False
        for line in f:
            if flag:
                synopsis += line[9:-1]
                break
            elif line == "# SYNOPSIS\n":
                flag = True;

        flag = False
        for line in f:
            if flag:
                if line[0:4] == "# ____..."[0:4]:
                    break
                text.append(line[1:-1])
            elif line == "# OPTIONS\n":
                flag = True

    f.close()
    print synopsis, "\n"
    for line in text:
        print line
# ______________________________________________________________________________

if __name__ == "__main__":
    main()
