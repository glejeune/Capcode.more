PACKAGES = %w{
  capcode-base-activerecord
  capcode-base-couch_foo
  capcode-base-couchrest
  capcode-base-datamapper
  capcode-base-mongoid
  capcode-base-sequel
  capcode-render-binary
  capcode-render-coffee-script
  capcode-render-email
  capcode-render-erb
  capcode-render-haml
  capcode-render-json
  capcode-render-less
  capcode-render-markaby
  capcode-render-mustache
  capcode-render-none
  capcode-render-redirect
  capcode-render-sass
  capcode-render-static
  capcode-render-webdav
  capcode-render-xml
}

def rake(cmd)
  sh "#{RUBY} -S rake #{cmd}", :verbose => true
end

def srake(cmd)
  sh "sudo #{RUBY} -S rake #{cmd}", :verbose => true
end

desc "Build all gems"
task :build do
  PACKAGES.each do |dir|
    Dir.chdir(dir) { rake 'build' }
  end
end

desc "Release all gems to gemcutter"
task :release do 
  PACKAGES.each do |dir|
    Dir.chdir(dir) { rake 'gemcutter:release' }
  end
end

desc "Install all gems"
task :install do 
  PACKAGES.each do |dir|
    Dir.chdir(dir) { rake 'install' }
  end
end
