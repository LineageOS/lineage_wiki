#!/usr/bin/env ruby

require 'json'
require 'json-schema'
require 'yaml'
require 'yalphabetize'


def json_to_yaml(json)
  JSON.parse(json).to_yaml
end

def yaml_to_json(yaml)
  YAML.safe_load_file(yaml, permitted_classes: [Date]).to_json
end

def to_relative_path(path)
  wiki_dir = File.expand_path('../', __dir__) + '/'
  return path.sub(wiki_dir, '')
end

def validate_json(schema, device_json, device_path)
  JSON::Validator.validate!(schema, device_json, :validate_schema => true)
rescue JSON::Schema::ValidationError, Psych::SyntaxError => e
  puts to_relative_path(device_path) + ': ' + e.message
  at_exit { exit false }
end

def validate_image(path, device_path)
  unless File.file?(path)
    puts "Missing image #{to_relative_path(path)} specified in #{to_relative_path(device_path)}"
    at_exit { exit false }
  end
end

def load_template(template_file)
  template_dir = File.expand_path('../scripts/templates', __dir__) + '/'
  return File.open(template_dir + template_file, 'r') { |file| file.read }
end

def validate_template(template, path, codename)
  if File.file?(path)
    temp_codename = codename.sub(/_variant[0-9]+/, '')
    template_content = template.gsub('{codename}', temp_codename)
    file_content = File.open(path, 'r') { |file| file.read }
    # remove redirects from the file, because we want to allow them if necessary
    file_content.sub!(/^redirect_from:.+?( +- *[a-zA-Z0-9.\/]+$.)+/m, '')

    # We need to handle variant[0-9] in title and codename
    file_content.sub!(/_variant[0-9]+/, '')
    # ... and in the permalink
    file_content.sub!(/\/variant[0-9]+/, '')

    if not template_content == file_content
      puts to_relative_path(path) + ': Not generated from template'
      at_exit { exit false }
    end
  else
    puts 'Missing file for ' + codename + ' at ' + path
    at_exit { exit false }
  end
end

def validate_yaml_lint(path)
  reader_class = Yalphabetize::Reader.new(path).to_ast
  order_checker_class = Yalphabetize::OrderCheckers::CapitalizedFirstThenAlphabetical
  return !Yalphabetize::OffenceDetector.new(reader_class, order_checker_class: order_checker_class).offences?
end

trap "SIGINT" do
  puts "Aborted by user"
  exit 130
end

schema_path = File.expand_path('schema-06.yml', __dir__)
schema = yaml_to_json(schema_path)

sample_path = File.expand_path('../device_sample/sample.yml', __dir__)
sample_yaml = yaml_to_json(sample_path)
validate_json(schema, sample_yaml, sample_path)

wiki_dir = File.expand_path('../', __dir__) + '/'
device_dir = wiki_dir + '_data/devices/'
device_image_dir = wiki_dir + 'images/devices/'
device_image_small_dir = device_image_dir + 'small/'
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

Dir.glob(wiki_dir + '**/*.yml').each do |filename|
  next if filename == wiki_dir + "_config.yml"
  next if filename.start_with?(wiki_dir + "vendor/bundle/")

  if !validate_yaml_lint(filename)
    puts to_relative_path(filename) + ': YAML document is not linted properly, use yalphabetize -a'
    at_exit { exit false }
  end
end

Dir.entries(device_dir).sort.each do |filename|
  device_path = device_dir + filename
  if File.file?(device_path)
    device_json = JSON.parse(yaml_to_json(device_path))
    validate_json(schema, device_json, device_path)

    if !device_json["maintainers"].empty? and device_json["uses_twrp"]
      puts to_relative_path(device_path) + ': uses_twrp cannot be used for a supported device'
      at_exit { exit false }
    end

    codename = filename.sub('.yml', '')
    test_file = codename + '.md'

    validate_template(build_template, build_dir + test_file, codename)
    validate_template(info_template, info_dir + test_file, codename)
    validate_template(install_template, install_dir + test_file, codename)
    validate_template(update_template, update_dir + test_file, codename)
    validate_template(upgrade_template, upgrade_dir + test_file, codename)

    image = device_json["image"]
    validate_image(device_image_dir + image, device_path)
    validate_image(device_image_small_dir + image, device_path)
  end
end
