#!/usr/bin/env ruby

require 'json'
require 'json-schema'
require 'yaml'


def json_to_yaml(json)
  JSON.parse(json).to_yaml
end

def yaml_to_json(yaml)
   YAML.load_file(yaml).to_json
end

schema_path = File.expand_path('schema-06.yml', __dir__)
schema = yaml_to_json(schema_path)

sample_path = File.expand_path('../device_sample/sample.yml', __dir__)
sample = yaml_to_json(sample_path)

begin
  JSON::Validator.validate!(schema, sample, :validate_schema => true)
rescue JSON::Schema::ValidationError => e
  puts sample_path + ': ' + e.message
  at_exit { exit false }
end

device_dir = File.expand_path('../_data/devices/', __dir__) + '/'
Dir.entries(device_dir).each do |filename|
  device_path = device_dir + filename
  if File.file?(device_path)
    device = yaml_to_json(device_path)

    begin
      JSON::Validator.validate!(schema, device, :validate_schema => true)
    rescue JSON::Schema::ValidationError => e
      puts device_path + ': ' + e.message
      at_exit { exit false }
    end
  end
end
