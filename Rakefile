require 'rubygems'
require 'bundler'
require 'bundler/setup'

require 'rake/clean'
require 'flashsdk'
require 'flexunit'

USE_FCSH = true
VERSION = '0.0.1'

##############################
# Test

library :flexunit, :flexunit_as3
library :flexunit, :flexunit_uilistener

# Compile the test swf
mxmlc "bin/HelLogRunner.swf" do |t|
  t.input = "test/HelLogRunner.as"
  t.library_path << "lib/flexunit/"
  t.source_path << 'test'
  t.source_path << 'src'
  t.default_size = "100,100"
  t.debug = true
end

desc "Compile and run the test swf"
flashplayer :test => "bin/HelLogRunner.swf"

##############################
# SWC

compc "bin/hel-log-#{VERSION}.swc" do |t|
  t.include_sources << 'src'
  t.include_sources << 'src/org/helvector/logging'
  t.include_sources << 'src/org/helvector/logging/messages'
  t.include_sources << 'src/org/helvector/logging/targets'
  t.include_sources << 'src/org/helvector/logging/tools'
  t.include_sources << 'src/org/helvector/logging/util'
end

desc "Compile the SWC file"
task :swc => "bin/hel-log-#{VERSION}.swc"

##############################
# DOC

desc "Generate documentation at doc/"
asdoc 'doc' do |t|
  t.doc_sources << "src"
end

##############################
# DEFAULT
task :default => :test
