echo 'Instalando e configurando o postgresql'
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.5 libpq-dev
sudo service postgresql start
sudo -u postgres psql -c "ALTER USER postgres PASSWORD '123456';"
