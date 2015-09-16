#
# Cookbook Name:: tinyproxy
# Recipe:: default
#
# Copyright (C) 2013 La Presse
#
# All rights reserved - Do Not Redistribute

#package 'tinyproxy'
include_recipe "tinyproxy::_source"

user "tinyproxy" do
  system true
end

%w(/var/run/tinyproxy/ /usr/local/var/log/tinyproxy /var/log/tinyproxy /etc/tinyproxy).each do |dir|
  directory dir do
    recursive true
    owner "tinyproxy"
    group "tinyproxy"
    mode "0755"
    action :create
  end
end

template '/etc/init.d/tinyproxy' do
  mode 0744
  notifies :restart, 'service[tinyproxy]'
end

template '/etc/tinyproxy/tinyproxy.conf' do
  mode 0644
  notifies :restart, 'service[tinyproxy]'
end

template '/etc/tinyproxy/filters' do
  mode 0644
  notifies :restart, 'service[tinyproxy]'
end

service 'tinyproxy' do
  action [:enable,:start]
end
