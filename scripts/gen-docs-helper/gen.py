#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import yaml
import os
import sys
from pprint import pprint
import pathlib
import shutil

settings = []
script_path = os.path.dirname(__file__)
snippets_path = script_path + "/gen-snippets/"

with open("config.yml", "r") as ymlfile:
    settings = yaml.load(ymlfile, Loader=yaml.FullLoader)

# this is static and will never change
root = str(pathlib.Path().resolve().parent.parent)
target_folder_path = settings["ace_snippet_dir"]
docs_interface_snippts_dir = root + settings["real_docs_interface_snippts_dir"]


def divider():
    print("==============================")


def read_adoc(adoc_path):
    lines = []
    f = open(adoc_path, 'r')
    while True:
        # Get next line from file
        line = f.readline()

        # if line is empty
        # end of file is reached
        if not line:
            break

        lines.append(line)

    if len(lines) <= 3:
        return ""

    # cut not needed lines from file
    lines = lines[2:]
    lines = lines[: -1]

    return '\n'.join(lines)


def curl_adoc(adoc_path):
    content = read_adoc(adoc_path)

    # cut $ dollar whitespace at the beginning
    if content != "" and len(content) > 1 and content[:2] == "$ ":
        content = content[2:]

    # replace access token because its too long
    replace = "<access_token>"
    find_start_from = "Bearer"

    try:
        start = content.index(find_start_from)
        end = content.index("'", start)
        content = content[:start+len(find_start_from)] + \
            " " + replace + content[end:]
    except Exception as e:
        print(str(e))
        sys.exit(1)

    return content


def write_file(file_path, content):
    with open(file_path, 'w', encoding="utf-8") as writer:
        writer.seek(0)
        lines = content.split("\n")
        for line in lines:
            if line != "\n" and line != "":
                writer.write(line + "\n")

    # i dont know but it works thx: https://stackoverflow.com/a/10289740
    #this removes the last empty line in a file
    with open(file_path, "r+", encoding="utf-8") as file:
        file.seek(0, os.SEEK_END)
        pos = file.tell() - 1
        while pos > 0 and file.read(1) != "\n":
            pos -= 1
            file.seek(pos, os.SEEK_SET)

        if pos > 0:
            file.seek(pos, os.SEEK_SET)
            file.truncate()


def clear_snippets_dir():
    # delete all including .gitkeep
    shutil.rmtree(snippets_path)

    os.makedirs(snippets_path)

    # recreate .gitkeep :)
    with open(snippets_path + ".gitkeep", "w"):
        pass


def pre_check_folder(folders):
    for entry in settings["interface"]:
        target_folder_name = settings["java_prefix"] + entry["java"]
        if target_folder_name not in folders:
            divider()
            print(target_folder_name)
            print("not in " + target_folder_path)
            divider()
            sys.exit(1)


def simple_compare():
    divider()
    print("comparing may old ...")
    
    # read all folders in there paths
    snippet_folders = [name for name in os.listdir(
        snippets_path) if os.path.isdir(os.path.join(snippets_path, name))]

    interface_folders = [name for name in os.listdir(
        docs_interface_snippts_dir) if os.path.isdir(os.path.join(docs_interface_snippts_dir, name))]

    count = 0
    # check if something is old
    for i in interface_folders:
        if i not in snippet_folders:
            count = count + 1
            print(i)

    if count > 0:
        print("some folders are outdated please check!")
    else:
        print("no artifacts found")
    divider()
    print("comparing may new ...")
    
    count = 0
    for j in snippet_folders:
        if j not in interface_folders:
            count = count + 1
            print(j)

    if count > 0:
        print("some interfaces are new check them!")
    else:
        print("nothing new")

    divider()


# check folder exists
if os.path.exists(target_folder_path) is False or os.path.isdir(target_folder_path) == False:
    divider()
    print(target_folder_path +
          " folder does not exists yet. Please run the tests to let junit create these folder(s).")
    divider()
    sys.exit(1)

if os.path.exists(docs_interface_snippts_dir) is False or os.path.isdir(docs_interface_snippts_dir) == False:
    divider()
    print(docs_interface_snippts_dir +
          " folder does not exists yet. Please create the folder!")
    divider()
    sys.exit(1)

folders = [name for name in os.listdir(
    target_folder_path) if os.path.isdir(os.path.join(target_folder_path, name))]

# check defined subfolder exists
pre_check_folder(folders)
divider()
print("clearing ...")
clear_snippets_dir()
divider()
print("creating ...")
for entry in settings["interface"]:
    adoc_path = target_folder_path + settings["java_prefix"] + entry["java"]
    curl_content = curl_adoc(adoc_path + "/curl-request.adoc")
    request_content = read_adoc(adoc_path + "/request-body.adoc")
    response_content = read_adoc(adoc_path + "/response-body.adoc")

    snippet_path = snippets_path + entry["docs"]
    is_dir = os.path.exists(snippet_path)

    if not is_dir:
        os.makedirs(snippet_path)

    write_file(snippet_path+"/curl-request.sh", curl_content)

    # filter empty request or response body

    if request_content != "\n":
        write_file(snippet_path+"/request-body.json", request_content)

    if response_content != "\n":
        write_file(snippet_path+"/response-body.json", response_content)

simple_compare()
