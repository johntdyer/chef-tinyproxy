%w(bzip2 automake asciidoc libxslt-devel docbook-style-xsl).each do |p|
  package p
end

node.set['build_essential']['compile_time'] = true
include_recipe "build-essential"


ark "tinyproxy" do
  url "https://github.com/banu/tinyproxy/archive/1.8.3.tar.gz"
  # https://files.banu.com/tinyproxy/1.8/tinyproxy-1.8.3.tar.bz2"
  version '1.8.3'
  checksum '24270804a1ab57a66f7d0d99d42d322e3b594162b42af077874f9ed35ffa88c8'
  #be559b54eb4772a703ad35239d1cb59d32f7cf8a739966742622d57df88b896e'
  action [ :configure, :install_with_make ]
end
