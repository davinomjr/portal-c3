echo 'Criando e populando base de dados'
rake db:create
rake db:migrate
rake db:seed
