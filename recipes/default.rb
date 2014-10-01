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

directory "/etc/tinyproxy" do
  owner "tinyproy"
  group "tinyproy"
  mode "0755"
  action :create
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
  action [:start, :enable]
end
