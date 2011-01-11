# Chef-growl

## **Automatic Chef cookbook testing, instant notifications to your desktop using Growl**

* **Chef-growl** is a ruby script that watches for OpsCode Chef cookbook changes.  
* It aims to facilitate the development of cookbook code by sending instant notifications to your OS X desktop.

### Installation (OS X)

1. ``` sudo gem install eventmachine ruby-growl em-dir-watcher ```
2. Set an environment variable "CHEF_PATH" with the full path to the root of your Chef repository (export CHEF_PATH=/home/user/chef)
3. Make sure to allow the following in Growl preferences: Listen for incoming connections, allow remote application registration.
4. Run the script: ```ruby chef-growl.rb```

### Error Fixes
osx/foundation --> https://gist.github.com/289868

### TODO
* Supporting libnotify under Linux.
