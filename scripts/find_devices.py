#!/usr/bin/env python3
# sudo apt install python3-yaml python3-dateutil
from datetime import datetime
from dateutil.relativedelta import relativedelta
import glob
import sys
import yaml

# Setup
filters = ["small", "large"]

if len (sys.argv) > 1:
    filter = sys.argv[1]
else:
    print (f"Use one of the search filters {filters}")
    sys.exit (1)

release      = 'Release'
los          = 'LOS'
height       = 'Height'
width        = 'Width'
depth        = 'Depth'
vendor       = 'Vendor'
name         = 'Name'
maintainers  = 'Maintainers'
cut_off_date = (datetime.today() - relativedelta(years = 5)).strftime('%Y-%m')
print(f"{cut_off_date=}")
print (f'{release:<12} {los:<4} {height:<6} {width:<6} {depth:<6} {vendor:<12} {name:<34} {maintainers}')

# Read yml and discard devices when information is incomplete
result_lines = []
for device_file in glob.glob ('../_data/devices/*.yml'):
    with open (device_file) as fin: device_yml = yaml.safe_load (fin.read())
    if 'phone'      not in device_yml['type']       : continue
    if 'dimensions' not in device_yml               : continue
    if  None            is device_yml['dimensions'] : continue
    if 'None'           == device_yml['dimensions'] : continue
    if 'height'     not in device_yml['dimensions'] : continue

    release     = str (device_yml['release'])
    los         =      device_yml['versions'][-1]
    height      =      device_yml['dimensions']['height']
    width       =      device_yml['dimensions']['width']
    depth       =      device_yml['dimensions']['depth']
    vendor      =      device_yml['vendor']
    name        =      device_yml['name']
    maintainers = len (device_yml['maintainers'])

    if filter == "small":
        if release     < cut_off_date : continue
        if width       >   70.8       : continue
        if maintainers ==   0         : continue
    elif filter == "large":
        if release     < cut_off_date : continue
        if width       <   75         : continue
        if height      <  166         : continue
        if maintainers ==   0         : continue
    else:
        print (f"Use one of the search filters {filters}")
        break

    result_lines.append (f'{release:<12} {los:<4} {height:<6} {width:<6} {depth:<6} {vendor:<12} {name:<34} {maintainers}')

for line in sorted (result_lines):     # sorted by release date as the first field
    print (line)


