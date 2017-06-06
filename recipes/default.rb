#
# Cookbook Name:: jekyll-cookbook
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jekyll-cookbook::bootstrap_blog'
include_recipe 'jekyll-cookbook::jekyll_build'
include_recipe 'jekyll-cookbook::setup_webserver'
