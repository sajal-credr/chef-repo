#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

package 'ntp' do
  action :install
end

service 'ntp' do
  action :stop
end

execute 'delete localtime' do
  command 'rm -f /etc/localtime'
end

template '/etc/timezone' do
  source 'timezone.erb'
  mode '0644'
end  

link '/etc/localtime' do
  to '/usr/share/zoneinfo/Asia/Kolkata'
  link_type :hard
end

execute 'ntpdate' do
  command '/usr/sbin/ntpdate nagios.credr.com'
end

service 'ntp' do
  action [:restart, :enable]
end

template '/opt/ntpupdate.sh' do
  source 'ntpupdate.erb'
  mode '0644'
end  

cron 'ntpupdate' do
  action :create
  minute '0'
  hour '*'
  day '*'
  month '*'
  weekday '*'
  user 'ubuntu'
  command 'sudo bash /opt/ntpupdate.sh'
end

service 'cron' do
  action :reload
end
