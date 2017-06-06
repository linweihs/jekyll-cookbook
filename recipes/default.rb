#
# Cookbook Name:: jekyll-cookbook
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'boostrap_blog.rb'
include_recipe 'jekyll_build.rb'
include_recipe 'setup_webserver.rb'
