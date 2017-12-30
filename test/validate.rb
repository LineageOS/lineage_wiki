#!/usr/bin/env ruby

require "deepsort"
require 'json'
require "json-schema"
require 'yaml'


def validate_json_sort(json, path)
  unless sorted_json?(json)
    raise path + " is not sorted"
  end
end

def sorted_json?(json)
  return json.eql?(sort(json))
end

def sort(json)
  return JSON.parse(json).deep_sort.to_json
end


schema_path = File.expand_path('schema-06.yml', __dir__)
schema = YAML.load_file(schema_path).to_json
validate_json_sort(schema, schema_path)

sample_path = File.expand_path('../device_sample/sample.yml', __dir__)
sample = YAML.load_file(sample_path).to_json
validate_json_sort(sample, sample_path)

begin
  JSON::Validator.validate!(schema, sample, :validate_schema => true)
rescue JSON::Schema::ValidationError => e
  puts sample + ': ' + e.message
end

device_dir = File.expand_path('../_data/devices/', __dir__) + '/'
Dir.entries(device_dir).each do |filename|
  device_path = device_dir + filename
  if File.file?(device_path)
    device = YAML.load_file(device_path).to_json

    validate_json_sort(device, device_path)

    begin
      JSON::Validator.validate!(schema, device, :validate_schema => true)
    rescue JSON::Schema::ValidationError => e
      puts device_path + ': ' + e.message
    end
  end
end
