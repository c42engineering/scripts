#!/usr/bin/env ruby -wKU
# Use this to open a Ruby gem in TextMate

gemname = ARGV[0]
version = ARGV[1]
exit unless gemname
possible = `gem list #{gemname} | tail`.strip
versions = possible.gsub(/.*\(/, '').gsub(/\)$/, '').split(', ')
if versions.empty?
  puts "#{gemname} not found"
  exit 
end
realname = possible.gsub(/\(.*\)$/, '').strip
selected_version = versions.include?(version) ? version : versions.first
specifically = "#{realname}-#{selected_version}"
current_path = `gem which #{realname}`.strip

path = File.expand_path(File.join(current_path, '..', '..', '..', specifically))
puts "Launching mate at #{path}"
`mate #{path}` if File.exist?(path)
