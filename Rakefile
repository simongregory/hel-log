require 'rubygems'
require 'bundler'
require 'bundler/setup'

require 'rake/clean'
require 'flashsdk'
require 'flexunit'

USE_FCSH = 'true'
VERSION = '0.0.4'

##############################
# Test

library :flexunit, :flexunit_as3
library :flexunit, :flexunit_uilistener

# Compile the test swf
amxmlc "bin/HelLogRunner.swf" do |t|
  t.input = "test/HelLogRunner.as"
  t.library_path << "lib/flexunit"
  t.library_path << "lib/hamcrest"
  t.source_path << 'test'
  t.source_path << 'src'
  t.default_size = "100,100"
  t.debug = true
end

desc "Compile and run the test swf"
flashplayer :test => "bin/HelLogRunner.swf"

##############################
# SWC

acompc "bin/hel-log-#{VERSION}.swc" do |t|
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
# ASDoc

desc "Generate documentation at doc/"
asdoc 'doc' do |t|
  t.doc_sources << "src"
end

##############################
# Copyright Headers

desc "Updates all source and test file copyright headers"
task :headers do
  header = <<EOS
//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

EOS
  Dir[ '{src,test}/**/*.as' ].each do |uri|
    src = IO.read( uri )
    File.open( uri, 'w+' ) do |f|
      f << src.sub( /.+?(?=package)/m, header )
    end
  end
end

##############################
# Packaging tasks

task :release do
  puts ""
  print "Are you sure you want to relase hel-log #{VERSION}? [y/N] "
  exit unless STDIN.gets.index(/y/i) == 0
  
  unless `git branch` =~ /^\* master$/
    puts "You must be on the master branch to release!"
    exit!
  end
  
  # Build gem and upload
  # sh "gem build hellog.gemspec"
  # sh "gem push hellog-#{HelLog::VERSION}.gem"
  # sh "rm hellog-#{HelLog::VERSION}.gem"
  
  # Commit
  sh "git commit --allow-empty -a -m 'v#{VERSION}'"
  sh "git tag v#{VERSION}"
  sh "git push origin master"
  sh "git push origin v#{VERSION}"
end


##############################
# Default

task :default => :test
