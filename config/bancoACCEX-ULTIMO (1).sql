ALTER USER 'root'@'localhost'
identified
with
mysql_native_password
BY '@ITB123456';

CREATE DATABASE  accex;

use accex;

CREATE TABLE  usuario(
	`idusuario` int NOT NULL AUTO_INCREMENT,
 	`nome_completo` varchar(90) NOT NULL,
 	`nickname` varchar(30) NOT NULL,
	`telefone` varchar(45) NULL,
 	`senha` varchar(100) NOT NULL,
 	`email` varchar(90) NOT NULL,
    `tipo_usuario` int NOT NULL DEFAULT '1',
    `status_usuario` int DEFAULT '1',
    PRIMARY KEY (`idusuario`)
   
);
select * from usuario;
use accex;

create table local(
	`nome` varchar(50) not null ,
	`rua` varchar(45) not null,
	`bairro` varchar(45) not null,
	`cep` varchar(20) not null,
	`num_residen` varchar(9) not null,
	`cidade` varchar(30) not null,
	`estado` varchar(30),
    `idlocal` int not null Auto_increment, 
    `id_descricao_D_Local` int not null,
    `idtipoDlocal` int not null,
    `idusuario` int NOT NULL,
    primary key (`idlocal`)
   
);


create table avaliacao(
	`texto` longtext null,
	`foto` longblob null,
	`video` longblob null,
	`idavaliacao` int not null auto_increment,
    primary key (`idavaliacao`),
    `idlocal` int not null , 
	`idusuario` int NOT NULL
	
);



create table tipoDeLocal(
	`idtipoDlocal` int not null auto_increment,
	`tipo` varchar(45) not null,
	primary key (`idtipoDlocal`)
);



create table descricaoDlocal(
	`id_descricao_D_Local` int not null auto_increment,
	`descricao_1` varchar(35) not null,
	`descricao_2` varchar(35) not null,
	`descricao_3` varchar(35) not null,
	`descricao_4` varchar(35) not null,
	`descricao_5` varchar(35) not null,
	`descricao_6` varchar(35) not null,
	primary key (`id_descricao_D_Local`)
);

/*CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(25) DEFAULT NULL,
  `descricao_usuario` varchar(155) DEFAULT NULL,
  `status_tipo_usuario` int DEFAULT '1',
  PRIMARY KEY (`id_tipo_usuario`)
);*/


ALTER TABLE local
ADD CONSTRAINT fk_descricaoDlocal
FOREIGN KEY (`id_descricao_D_Local`) REFERENCES descricaoDlocal(`id_descricao_D_Local`),
ADD CONSTRAINT fk_tipoDeLocal
FOREIGN KEY (`idtipoDlocal`) REFERENCES tipoDeLocal(`idtipoDlocal`),
ADD CONSTRAINT fk_usuario
FOREIGN KEY (`idusuario`) REFERENCES usuario(`idusuario`);

ALTER TABLE avaliacao
ADD CONSTRAINT local
FOREIGN KEY (`idlocal`) REFERENCES local(`idlocal`),
ADD CONSTRAINT usuario
FOREIGN KEY (`idusuario`) REFERENCES usuario(`idusuario`);
 
/* ALTER TABLE usuario
ADD CONSTRAINT tipo_usuario
FOREIGN KEY (`id_tipo_usuario`) REFERENCES tipo_usuario(`id_tipo_usuario`); */