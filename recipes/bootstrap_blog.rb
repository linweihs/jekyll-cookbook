#
# setup environment first
# ruby
# store Gemfile in your jekyll git
# Install gem using bundle installl
# All you need is bundler here
#
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby node['jekyll']['rbenv']['version']

rbenv_gem 'bundler' do
  ruby_version node['jekyll']['rbenv']['version']
end

#
# Setup correct owner:group for the jekyll path
#

directory node['jekyll']['deploy_directory'] do
  owner node['jekyll']['user']
  group node['jekyll']['group']
  mode node['jekyll']['access_rights']
  recursive true
end
