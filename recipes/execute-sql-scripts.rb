include_recipe 'flyway'

cache_script_path = node['manage-mysql-db']['mysql']['cache_script_path']

directory cache_script_path

node['manage-mysql-db']['mysql']['scripts'].each { |script| 
  script_name = "#{script}"
  cookbook_file script_name do
    path cache_script_path + '/' + script_name
    source node['manage-mysql-db']['mysql']['script_dir_name'] + '/' + script_name
  end
}

bash 'flyway migrate' do
  code './flyway migrate'
  cwd "#{node['flyway']['install_dir']}/flyway"
  action :run
end
