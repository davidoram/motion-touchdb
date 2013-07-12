# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-touchdb'


  # Add the CouchCocoa framework
  # Downloaded from http://files.couchbase.com/developer-previews/mobile/ios/couchcocoa/CouchCocoa.zip
  # and copied into vendor
  app.vendor_project('vendor/CouchCocoa.framework', 
      :static,
      :products => ['CouchCocoa'],
      :headers_dir => 'Headers')

  # Add the TouchDB-iOS framework
  # Downloaded from https://github.com/couchbaselabs/TouchDB-iOS/downloads
  # and copied into vendor
  app.vendor_project('vendor/TouchDB.framework', 
      :static,
      :products => ['TouchDB'],
      :headers_dir => 'Headers')

  # Add the CouchBaseViews framework
  # See ./XcodeProjects/CouchBaseViews
  app.vendor_project('vendor/CouchBaseViews.framework', 
      :static,
      :products => ['CouchBaseViews'],
      :headers_dir => 'Headers')

  app.frameworks += ['CFNetwork','Security','SystemConfiguration'] # TouchDB dependency
  app.libs << '/usr/lib/libsqlite3.dylib' # TouchDB dependency
  app.libs << '/usr/lib/libz.dylib'       # TouchDB dependency

end
