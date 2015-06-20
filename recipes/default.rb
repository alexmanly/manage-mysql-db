include_recipe 'manage-mysql-db::install-mysql'
include_recipe 'manage-mysql-db::create-mysql-db'
include_recipe 'manage-mysql-db::execute-sql-scripts'