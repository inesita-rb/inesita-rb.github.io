require 'open-uri'

desc "Update Awesome Inesita"
task :update_awesome do
  js_lib_url = 'https://raw.githubusercontent.com/inesita-rb/awesome-inesita/master/README.md'
  js_lib_dest = File.join(File.dirname(__FILE__), './source/includes/_awesome.md')
  open(js_lib_url) do |f|
    File.write(js_lib_dest, f.readlines.join)
  end
end

desc "Build"
task :build do
  sh "bundle exec middleman build"
end

task :default => [:update_awesome, :build]
