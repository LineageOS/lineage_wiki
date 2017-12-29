import jsonschema
import os
import yaml
import json

with open("schemas/device.json", "r") as s:
    schema = json.loads(s.read())
for i in sorted(os.listdir("_data/devices/")):
    with open("_data/devices/{}".format(i), "r") as f:
        device = yaml.load(f.read())
        try:
            jsonschema.validate(device, schema)
        except jsonschema.exceptions.ValidationError as e:
            print("Error validating {}".format(i))
            print(e)
