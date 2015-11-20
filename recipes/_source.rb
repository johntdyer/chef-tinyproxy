%w(bzip2 automake asciidoc libxslt-devel docbook-style-xsl).each do |p|
  package p
end

node.set['build_essential']['compile_time'] = true
include_recipe "build-essential"


ark "tinyproxy" do
  url "https://github.com/banu/tinyproxy/archive/1.8.3.tar.gz"
  version '1.8.3'
  checksum '24270804a1ab57a66f7d0d99d42d322e3b594162b42af077874f9ed35ffa88c8'
  action [ :configure, :install_with_make ]
end
