#!/usr/bin/env xonsh

import sys

def itemIconParser(path, item):
    import os
    if os.path.isdir(os.path.join(path, item)):
        return ""
    else:
        fileMap = {
            ".gitignore": "",
            "package.json": "",
            ".gitlab-ci.yml": "",
            "Dockerfile": "",
            "pom.xml": ""
        }
        iconMap = {
            "xml": "",
            "java": "",
            "py": "",
            "pyw": "",
            "py2": "",
            "pyw2": "",
            "py3": "",
            "pyw3": "",
            "sh": "",
            "xsh": "",
            "js": "",
            "json": "",
            "md": "",
            "txt": "",
            "log": "",
            "html": "",
            "vue": "",
            "ts": "",
            "h": "",
            "c": "",
            "cpp": "",
            "so": "",
            "jar": "",
            "coffee": "",
            "exe": "",
            "msi": "",
            "pdf": "",
            "png": "",
            "jpg": "",
            "gif": "",
            "jpeg": "",
            "svg": "",
            "ico": "",
            "mp3": "",
            "wav": "",
            "bak": "",
            "old": "",
            "kdbx": "",
            "key": "",
            "h2": "",
            "db": "",
            "iso": "",
            "img": "",
            "vhd": "",
            "vdi": "",
            "vmdk": "",
            "zip": "",
            "tar": "",
            "gz": "",
            "xz": "",
            "7z": "",
            "lz": "",
            "pkg": "",
            "deb": "",
            "eml": "",
            "desktop": ""
        }
        if item in fileMap:
            return fileMap[item]
        else:
            return iconMap.get(os.path.splitext(item)[1][1:].lower(), "")
 
def iconls(args, stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr):
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("-a", dest="all", action="store_const", const=True)
    parser.add_argument("path", nargs="?", default=".")
    parser_args = parser.parse_args(args)
    ls_args = []
    if parser_args.all:
        ls_args.append("-a")
    dirs = $(/usr/bin/ls --color=never @(ls_args) @(parser_args.path))
    
    output_lines = []

    lines = dirs.split("\n")
    for line in lines:
        if (line.strip() != ""):
            output_lines.append(itemIconParser(parser_args.path, line) + " " + line)

    print("\n".join(output_lines))

if __name__ == "__main__":
    iconls(sys.argv[1:])