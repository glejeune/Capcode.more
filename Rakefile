PACKAGES = Dir.glob( "*" ).delete_if{ |f| 
  File.directory?(f) == false
}.map{ |f| File.basename(f) }

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
