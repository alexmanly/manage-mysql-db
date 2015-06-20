db_name = node['manage-mysql-db']['mysql']['db']
mysql_database db_name do
  connection(
    host: node['manage-mysql-db']['mysql']['hostname'],
    username: node['manage-mysql-db']['mysql']['user'],
    password: node['manage-mysql-db']['mysql']['password']
  )
  action :create
end
