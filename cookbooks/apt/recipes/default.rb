#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'Apt Repository Update' do
  command 'apt-get update'
end




