drop database if exists metrogarage;
create database metrogarage;

use metrogarage;

create table models(
	id int primary key auto_increment,
	model_name varchar(100) not null,
	model_spawn varchar(100) not null
);

create table players(
	id int primary key auto_increment,
	steamHex varchar(100) not null
);

create table vehicles(
	id int primary key auto_increment,
	model_id int not null,
	cor JSON default '{"r": 0, "g": 0, "b": 0}',
	tuning JSON default '{"motor": 0, "freio": 0, "suspensao": 0, "aro": 0}',
	onGarage varchar(10) default "True",
	placa varchar(10) not null unique,
	player_id int not null,
	foreign key (model_id) references models(id),
	foreign key (player_id) references players(id)	
);

describe vehicles;

insert into models (model_name, model_spawn) values 
('Issi Classic', 'issi3'),
('Panto', 'panto'),
('Astron', 'astron'),
('Baller', 'baller'),
('XLS', 'xls'),
('Futo', 'futo'),
('Infernus', 'infernus');

insert into players(steamHex) values ('steam:steamHex');

insert into vehicles (model_id, cor, tuning, onGarage, placa, player_id) values 
(1, '{"r": 224, "g": 214, "b": 22}', '{"motor": 4, "freio": 0, "suspensao": 0, "aro": 5}', "True", 'ABC1111', 1),
(2, '{"r": 96, "g": 181, "b": 47}', '{"motor": 4, "freio": 4, "suspensao": 4, "aro": 10}', "False", 'ABC2222', 1);

insert into vehicles (model_id, cor, tuning, onGarage, placa, player_id) values 
(3, '{"r": 19, "g": 164, "b": 232}', '{"motor": 4, "freio": 0, "suspensao": 0, "aro": 15}', "True", 'ABC3333', 1),
(4, '{"r": 81, "g": 120, "b": 237}', '{"motor": 4, "freio": 4, "suspensao": 4, "aro": 20}', "False", 'ABC4444', 1),
(5, '{"r": 207, "g": 4, "b": 45}', '{"motor": 4, "freio": 4, "suspensao": 4, "aro": 25}', "True", 'ABC5555', 1),
(6, '{"r": 255, "g": 140, "b": 0}', '{"motor": 4, "freio": 4, "suspensao": 4, "aro": 30}', "False", 'ABC6666', 1),
(7, '{"r": 240, "g": 234, "b": 165}', '{"motor": 4, "freio": 4, "suspensao": 4, "aro": 35}', "False", 'ABC7777', 1);


