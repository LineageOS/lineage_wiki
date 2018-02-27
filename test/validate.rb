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

def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r")
  f.each_line do |line|
    data += line
  end
  return data
end

def to_relative_path(path)
  wiki_dir = File.expand_path('../', __dir__) + '/'
  return path.sub(wiki_dir, '')
end

def validate_json(schema, device_path)
  begin
    device = yaml_to_json(device_path)
    JSON::Validator.validate!(schema, device, :validate_schema => true)
  rescue JSON::Schema::ValidationError, Psych::SyntaxError => e
    puts to_relative_path(device_path) + ': ' + e.message
    at_exit { exit false }
  end
end

def validate_file(template_file, path, codename)
  template_dir = File.expand_path('../scripts/templates', __dir__) + '/'
  if File.file?(path)
    template = get_file_as_string(template_dir + template_file)
    template_content = template.gsub('{codename}', codename)
    file_content = get_file_as_string(path)
    if not template_content == file_content
      puts to_relative_path(path) + ': Not generated from template'
      at_exit { exit false }
    end
  else
    puts 'Missing file for ' + codename + ' at ' + path
    at_exit { exit false }
  end
end

trap "SIGINT" do
  puts "Aborted by user"
  exit 130
end

schema_path = File.expand_path('schema-06.yml', __dir__)
schema = yaml_to_json(schema_path)

sample_path = File.expand_path('../device_sample/sample.yml', __dir__)
validate_json(schema, sample_path)

wiki_dir = File.expand_path('../', __dir__) + '/'
device_dir = wiki_dir + '_data/devices/'
pages = wiki_dir + 'pages/'
info_dir = pages + 'info/'
build_dir = pages + 'build/'
install_dir = pages + 'install/'

Dir.entries(device_dir).each do |filename|
  device_path = device_dir + filename
  if File.file?(device_path)
    begin
      validate_json(schema, device_path)

      codename = filename.sub('.yml', '')
      test_file = codename + '.md'

      validate_file('info.md', info_dir + test_file, codename)
      validate_file('build.md', build_dir + test_file, codename)
      validate_file('install.md', install_dir + test_file, codename)
    end
  end
end
