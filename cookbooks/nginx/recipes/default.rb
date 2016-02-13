#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

apt_package 'nginx' do
  action :install
end

template '/usr/share/nginx/html/index.html' do
  source 'index.erb'
  mode '0644'
end

service 'nginx' do
  action [:restart, :enable]
end
