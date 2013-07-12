#motion-touchdb

A simple example of TouchDB working with RubyMotion. Shows TouchDB views written in objective-c interacting with a rubymotion project.

Setup
-----

* I downloaded CouchCocoa & TouchDB Frameworks & put the appropriate files into vendor/ as described in the Rakefile.
* I created an XCode project XCodeProjects/CouchBaseviews.xcodeproj that defines my CouchDB views. Open the project, set the active Scheme to 'FrameWork > iOS Device' and build.  This will create vendor/CouchBaseViews.framework
* Run rake, and watch for some output on the console. 



