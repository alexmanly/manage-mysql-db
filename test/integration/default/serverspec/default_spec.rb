require 'serverspec'

set :backend, :exec

describe user('flyway') do
  it { should exist }
  it { should belong_to_group 'flyway' }
  it { should have_login_shell '/sbin/nologin' }
end

describe service('mysql') do
  it { should be_running }
end

describe port(3306) do
  it { should be_listening }
end

mysql_schema_command='echo "show tables" | mysql -h 127.0.0.1 -u root -pmysql my_app_db;'
describe command(mysql_schema_command) do
  its(:stdout) { should contain /Tables_in_my_app_db\nPlayers\nschema_version\n/ }
end

mysql_data_command='echo "select * from Players" | mysql -h 127.0.0.1 -u root -pmysql my_app_db;'
describe command(mysql_data_command) do
  its(:stdout) { should contain /PlayerID\tLastName\tFirstName\tTeam\tPosition\n1\tHazard\tEden\tChelsea\tCenter Midfield\n/ }
end
