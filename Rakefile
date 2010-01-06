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

desc "Build all gems"
task :build do
  PACKAGES.each do |dir|
    Dir.chdir(dir) { rake 'build' }
  end
end
