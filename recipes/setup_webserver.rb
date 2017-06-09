#
# nodejs environment
#

include_recipe "nodejs"
package 'npm'
#
# app.js
#
cookbook_file "#{node['jekyll']['deploy_directory']}/app.js" do
  source 'apps/nodejs/app.js'
  owner node['jekyll']['user']
  group node['jekyll']['group']
  mode node['jekyll']['access_rights']
  action :create
end

#
# package.json
#
cookbook_file "#{node['jekyll']['deploy_directory']}/package.json" do
  source 'apps/nodejs/package.json'
  owner node['jekyll']['user']
  group node['jekyll']['group']
  mode node['jekyll']['access_rights']
  action :create
end

#
# npm install
#
nodejs_npm "package.json" do
  path node['jekyll']['deploy_directory']
  json true
  user node['jekyll']['user']
end

#
# nginx.conf
#
package 'nginx' do
  action :install
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action :enable
end

#
# supervisor.conf
# once supervisor start, it start nodejs
package 'supervisor' do
  action :install
end

template '/etc/supervisor/conf.d/supervisor.conf' do
  source 'supervisor.conf.erb'
  owner node['jekyll']['user']
  group node['jekyll']['group']
  mode node['jekyll']['access_rights']
  action :create
end

service 'supervisor' do
  action :reload
end
