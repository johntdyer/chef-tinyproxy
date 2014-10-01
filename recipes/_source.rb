%w(bzip2 asciidoc).each do |p|
  package p
end

node.set['build_essential']['compile_time'] = true
include_recipe "build-essential"

ark "tinyproxy" do
  url "https://files.banu.com/tinyproxy/1.8/tinyproxy-1.8.3.tar.bz2"
  version '1.8.3'
  checksum 'be559b54eb4772a703ad35239d1cb59d32f7cf8a739966742622d57df88b896e'
  action [ :configure, :install_with_make ]
end
