create database universitario;
use universitario;
-- drop database universitario;
create table departamento(
id int primary key,
nombre varchar(60)
);

create table profesor(
id int primary key,
nif varchar(10),
nombre varchar(25),
apellido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direccion varchar(50),
telefono varchar(10),
fecha_nacimiento date,
sexo enum('H', 'M'),
id_departamento int,
foreign key(id_departamento)references departamento(id)
);

create table grado(
id int primary key,
nombre varchar(100)
);

create table asignatura(
id int primary key,
nombre varchar(100),
creditos float,
tipo enum('basica','obligatoria','optativa'),
curso tinyint(3),
cuatrimestre tinyint(3),
id_profesor int,
foreign key(id_profesor) references profesor(id),
id_grado int,
foreign key(id_grado) references grado(id)

);

create table alumno(
id int primary key,
nif varchar(10),
nombre varchar(25),
apellido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direccion varchar(50),
telefono varchar(10),
fecha_nacimiento date,
sexo enum('H', 'M')

);

create table curso_escolar(
id int primary key,
anyo_inicio year(4),
anyo_fin year(4)
);

create table alumno_se_matricula_asignatura(

id_alumno int(10) ,
foreign key(id_alumno)references alumno(id),
id_asignatura int(10),
foreign key(id_asignatura) references asignatura(id),
id_curso_escolar int(10),
foreign key(id_curso_escolar)references curso_escolar(id)
);


