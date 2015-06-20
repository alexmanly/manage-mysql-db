name 'manage-mysql-db'
maintainer 'am'
maintainer_email 'am@chef.io'
license 'Apache License, Version 2.0'
description 'Installs and configures mysql db using flywaydb, a database migration tool'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'

depends 'mysql2_chef_gem'
depends 'database'
depends 'flyway'
depends 'mysql'
