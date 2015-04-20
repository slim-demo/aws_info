#!/bin/python
#
# Generates html file that is generated from the json produced by aws_info.sh
#
#
# Requires json2html library
import os
import json
from json2html import *

# Executes shell script
bash_script = os.popen('./aws_info.sh')

# Parses json from the shell script 
parse_json = json.loads(bash_script.read())

# Generates table html from json
html_body = json2html.convert(json = parse_json, table_attributes="class=\"table table-bordered table-hover\"")

# Add html header with boodstrap and html footer
html_head ="<html lang=\"en\"><head><link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css\"></head><body>"
html_foot ="</body></html>"

# combines all parts into one html
html = html_head + html_body + html_foot

# writes file into index.html that can be viewed with browser or placed on a web server
html_file= open('index.html', 'w')
html_file.write(html)
html_file.close()
