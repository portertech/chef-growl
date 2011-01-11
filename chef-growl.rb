#!/usr/bin/ruby -w

require 'rubygems'
require 'em-dir-watcher'
require 'ruby-growl'

# Growl host to send notifications to, make sure to allow the following in Growl preferences:
# Listen for incoming connections, allow remote application registeration
host = "127.0.0.1"
# Dir to watch chef cookbooks, could be your chef cookbooks under development
dir = ENV['CHEF_PATH']

EM.run do
  dw = EMDirWatcher.watch File.expand_path(dir + '/cookbooks') do |paths|
    paths.each do |path|
      cookbook = path.split('/').first
      file = path.split('/').last
      # Ignore tmp & hidden files
      unless file.match(/^#/) || file.match(/^\./)
        result = %x[cd #{dir} && rake test_cookbook[#{cookbook}]].chomp
        g = Growl.new host, "ruby-growl", ["ruby-growl Notification"]
        if result.match(/FATAL/)
          g.notify "ruby-growl Notification", "Chef", "Cookbook Error, #{path}: #{result}"
        else
          g.notify "ruby-growl Notification", "Chef", "Cookbook #{cookbook}: OK"
        end
      end
    end
  end
end
