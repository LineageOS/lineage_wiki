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

def to_relative_path(path)
  wiki_dir = File.expand_path('../', __dir__) + '/'
  return path.sub(wiki_dir, '')
end

def validate_json(schema, device_path)
  device = yaml_to_json(device_path)
  JSON::Validator.validate!(schema, device, :validate_schema => true)
rescue JSON::Schema::ValidationError, Psych::SyntaxError => e
  puts to_relative_path(device_path) + ': ' + e.message
  at_exit { exit false }
end

def load_template(template_file)
  template_dir = File.expand_path('../scripts/templates', __dir__) + '/'
  return File.open(template_dir + template_file, 'r') { |file| file.read }
end

def validate_template(template, path, codename)
  if File.file?(path)
    template_content = template.gsub('{codename}', codename)
    file_content = File.open(path, 'r') { |file| file.read }
    # remove redirects from the file, because we want to allow them if necessary
    file_content.sub!(/^redirect_from:.+?( +- *[a-zA-Z0-9.\/]+$.)+/m, '')
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
build_dir = pages + 'build/'
info_dir = pages + 'info/'
install_dir = pages + 'install/'
update_dir = pages + 'update/'
upgrade_dir = pages + 'upgrade/'

# load once, these are equal across all devices
build_template = load_template('build.md')
info_template = load_template('info.md')
install_template = load_template('install.md')
update_template = load_template('update.md')
upgrade_template = load_template('upgrade.md')

Dir.entries(device_dir).sort.each do |filename|
  device_path = device_dir + filename
  if File.file?(device_path)
    validate_json(schema, device_path)

    codename = filename.sub('.yml', '')
    test_file = codename + '.md'

    validate_template(build_template, build_dir + test_file, codename)
    validate_template(info_template, info_dir + test_file, codename)
    validate_template(install_template, install_dir + test_file, codename)
    validate_template(update_template, update_dir + test_file, codename)
    validate_template(upgrade_template, upgrade_dir + test_file, codename)
  end
end
