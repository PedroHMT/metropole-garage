# Metropole Garage
Teste de Desenvolvimento para Metropole.GG

# 💻 Tecnologias Utilizadas
-  ReactJS + Vite
-  Tailwind
-  PostCSS
-  LUA
-  oxmysql
-  MySQL

# 💿 Instalação
- Clone ou faça o download do repositório diretamente do github.
  - Dentro do repositório temos uma pasta chamada **MySQL** lá se encontra o script de criação da *database* e *tables* e também inserção dos dados nas devidas tables.
- Apague/recorte a pasta MySQL para outro local e copie a pasta raiz 'metropole-garage' para a pasta resources do seu servidor local.

# 📠 Configuração do Banco de Dados
Para utilização do banco de dados no script é necessário o *resource* do oxmysql, no qual pode ser baixado diretamente no site oficial do projeto.
A configuração do Banco de Dados é dado pelas configurações dentro do *server.cfg*, alterando as informações de usuário, senha, host e porta da configuração abaixo e logo em seguida adicionando no topo do seu *server.cfg*
```
start oxmysql
set mysql_connection_string "mysql://user:password@host:port/metrogarage"
```

# 📌 Como Utilizar
A utilização é baseada no comando **/garagem** a partir do console (F8) ou no próprio chat.
Usuários com a permissão correta podem spawnar o veículo a partir do comando **/carro [PLACA]**, podendo spawnar diretamente um veículo com uma placa devidamente cadastrada no banco de dados.

A permissão para utilização do comando é dado por meio do permissionamento feito diretamente no *server.cfg*
```
add_ace group.metroroles metro-garage.perm allow
add_principal identifier.steam:HexSteam group.metroroles
```

# 📹 Vídeo de Demonstração
[Assista Aqui](https://www.youtube.com/watch?v=_5DZa04wFz8)
