#
# Cookbook Name:: nagiosclient
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Nagios User & Group

# Nagios Packages

packages=[
  'nagios-nrpe-server',
  'nagios-plugins',
  'sysstat',
  'ksh'
]

packages.each do |pack|
  apt_package pack do
    action :install
  end
end


# Ownership Change

directory '/usr/lib/nagios/plugins/' do
  owner 'nagios'
  group 'nagios'
  mode '0755'
  recursive true
end


# Plugins Transfer

cookbook_file '/usr/lib/nagios/plugins/check_cpu_stats.sh' do
  source 'check_cpu_stats.sh'
  owner 'nagios'
  group 'nagios'
  mode '0755' 
  action :create
end

cookbook_file '/usr/lib/nagios/plugins/check_mem' do
  source 'check_mem'
  owner 'nagios'
  group 'nagios'
  mode '0755' 
  action :create
end

cookbook_file '/usr/lib/nagios/plugins/check_port.pl' do
  source 'check_port.pl'
  owner 'nagios'
  group 'nagios'
  mode '0755' 
  action :create
end


# NRPE Checks

template '/etc/nagios/nrpe.cfg' do
  source 'nrpe.erb'
  owner 'nagios'
  group 'nagios'
  mode '0644'
end

# Xinetd Service

service 'nagios-nrpe-server' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :sxtart ]
end
