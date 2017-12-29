import jsonschema
import os
import yaml
import json

from jsonschema import Draft4Validator

with open("schemas/device.json", "r") as s:
    schema = json.loads(s.read())
for i in sorted(os.listdir("_data/devices/")):
    with open("_data/devices/{}".format(i), "r") as f:
        device = yaml.load(f.read())
        v = Draft4Validator(schema)
        errors = sorted(v.iter_errors(device), key=lambda e: e.path)
        if len(errors) > 0:
            print("Error validating {}".format(i))
            for error in errors:
                print("{}: {}".format(list(error.path), error.message))
            print("")
