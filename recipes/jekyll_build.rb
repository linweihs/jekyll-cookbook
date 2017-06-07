# Flow:
# git clone jekyll
# bundle install (Gemfile)
# jekyll build and deploy
#

git node['jekyll']['deploy_directory'] do
  repository node['jekyll']['repository']
  reference node['jekyll']['reference']
  user node['jekyll']['user']
  group node['jekyll']['group']
  action :sync
end

# Build command with options if defined for blog generation
unless node['jekyll']['options'].empty?
  options = node['jekyll']['options'].each { |opt| opt.prepend('--')}
  options = options.join(' ')
  jekyll_command = "bundle exec jekyll build #{options}"
else
  jekyll_command = "bundle exec jekyll build"
end

rbenv_execute 'Deploy Jekyll blog' do
  ruby_version node['jekyll']['rbenv']['version']
  cwd node['jekyll']['deploy_directory']
  command %{ bundle install && #{jekyll_command} }
end
