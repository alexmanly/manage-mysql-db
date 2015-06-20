mysql2_chef_gem 'default' do
  client_version node['mysql']['version'] if node['mysql'] && node['mysql']['version']
  action :install
end

mysql_service 'default' do
  version node['mysql']['version'] if node['mysql'] && node['mysql']['version']
  bind_address node['manage-mysql-db']['mysql']['bind_address']
  port node['manage-mysql-db']['mysql']['port']
  initial_root_password node['manage-mysql-db']['mysql']['password']
  action [:create, :start]
end