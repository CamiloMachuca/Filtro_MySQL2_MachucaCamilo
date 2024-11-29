use universitario;

-- creacion consultas
-- 1. Encuentra el profesor que ha impartido más asignaturas en el último año académico.
select * from profesor p inner join asignatura a on p.id=a.id_profesor 
inner join alumno_se_matricula_asignatura asm on a.id=asm.id_asignatura inner join curso_escolar cs on asm.id_curso_escolar=cs.id;

-- select * from profesor;
-- select * from asignatura;
-- select * from alumno_se_matricula_asignatura;
-- select * from curso_escolar;

-- 2. Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.
select * from departamento d inner join profesor p on d.id=p.id_departamento inner join asignatura a on p.id=a.id_profesor limit 5;

-- 3. Obtén el total de alumnos y docentes por departamento.
select d.id,d.nombre, count(p.id) from departamento d 
inner join profesor p on d.id=p.id_departamento 
inner join asignatura a on p.id=a.id_profesor 
 group by 1,2;

-- 4. Calcula el número total de alumnos matriculados en asignaturas de un 
-- género específico en un semestre determinado.
select a.nombre as nombre_asignatura, al.sexo as genero_alumno, a.cuatrimestre, count(al.id) as cantidad_alumno from alumno al inner join alumno_se_matricula_asignatura alsm on al.id=alsm.id_alumno
inner join asignatura a on a.id=alsm.id_asignatura where al.sexo='H' 
and cuatrimestre= 1 group by 1, 2, 3;

select * from grado;
-- 5. Encuentra los alumnos que han cursado todas las asignaturas de un grado específico.
select al.nombre, al.apellido1, al.apellido2, g.nombre from alumno al inner join alumno_se_matricula_asignatura alsm 
on al.id=alsm.id_alumno
inner join asignatura a on a.id=alsm.id_asignatura 
inner join grado g on a.id_grado=g.id where g.nombre='Grado en Ingenieria Informatica (Plan 2015)';

-- 6. Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.
select g.nombre as nombre_grado,a.cuatrimestre, count(a.id) as 'cantidad_asignaturas' 
from grado g inner join asignatura a on g.id=a.id_grado group by 1,2 
order by cantidad_asignaturas  desc limit 3;

-- 7. Muestra los cinco profesores con menos asignaturas impartidas 
-- en el último año académico.

select p.nombre, p.apellido1, p.apellido2, count(a.id) as cantidad_asignatura from profesor p inner join asignatura a on p.id=a.id_profesor group by 1,2,3;

-- 8. Calcula el promedio de edad de los alumnos al momento de su primera matrícula.
select a.id,a.nombre, a.apellido1, a.apellido2, a.fecha_nacimiento from alumno a inner join alumno_se_matricula_asignatura asmt on a.id=asmt.id_alumno 
inner join asignatura asig on asig.id=asmt.id_asignatura where asig.cuatrimestre=1 group by 1,2,3,4;

-- 9. Encuentra los cinco profesores que han impartido más clases de un mismo grado.
select * from grado;
select p.nombre, p.apellido1, p.apellido2, g.nombre from profesor p 
inner join asignatura a on p.id=a.id_profesor 
inner join grado g on g.id=a.id_grado 
inner join alumno_se_matricula_asignatura alsm on a.id=alsm.id_asignatura
where g.nombre='Grado en Ingenieria Informatica (Plan 2015)';

-- 10.Genera un informe con los alumnos que han cursado más de 10 
-- asignaturas en el último año.
select al.nombre, al.apellido1, al.apellido2, count(a.id) from alumno al inner join alumno_se_matricula_asignatura alsm 
on al.id=alsm.id_alumno
inner join asignatura a on a.id=alsm.id_asignatura group by 1,2,3 having count(a.id)>10;


-- 11. Calcula el promedio de créditos de las asignaturas por grado.
select g.nombre, avg(a.creditos) as total_creditos from asignatura a right join grado g on g.id=a.id_grado group by 1;



-- 12. Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre.


-- 13. Muestra los alumnos que han cursado más asignaturas de un género específico.

select al.nombre, al.apellido1, al.apellido2, count(a.id) as Cantidad_asignaturas from alumno al inner join alumno_se_matricula_asignatura alsm 
on al.id=alsm.id_alumno
inner join asignatura a on a.id=alsm.id_asignatura 
where al.sexo = 'H' group by 1,2,3;


-- 14.Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre.

-- 15.Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.
select * from asignatura;
-- 16.Calcula el total de asignaturas impartidas por cada profesor en el último semestre.
select p.nombre, p.apellido1, p.apellido2,count(a.id) as cantidad_asignaturas  from profesor p 
inner join asignatura a on p.id=a.id_profesor where cuatrimestre= 2 group by 1,2,3;

-- 17.Encuentra al alumno con la matrícula más reciente.
select * from alumno a inner join alumno_se_matricula_asignatura alsm 
on a.id=alsm.id_alumno inner join asignatura asig on asig.id=alsm.id_asignatura 
where year(a.fecha_nacimiento)= '2000' and asig.cuatrimestre=2 limit 1;

-- 18.Lista los cinco grados con mayor número de alumnos matriculados 
-- durante los últimos tres meses.
select g.nombre, count(asig.id) as 'cantidad_asignatura' from alumno a inner join alumno_se_matricula_asignatura alsm 
on a.id=alsm.id_alumno inner join asignatura asig on asig.id=alsm.id_asignatura 
right join grado g on g.id=asig.id_grado group by 1 order by cantidad_asignatura desc limit 5;

-- 19.Obtén la cantidad de asignaturas cursadas por cada alumno en el último semestre.
select a.nombre,a.apellido1,a.apellido2,asig.nombre, count(asig.id) as 'cantidad_asignatura' 
from alumno a left join alumno_se_matricula_asignatura alsm 
on a.id=alsm.id_alumno inner join asignatura asig on asig.id=alsm.id_asignatura 
where asig.cuatrimestre=2 group by 1,2,3,4 order by cantidad_asignatura desc limit 5;


select * from curso_escolar;
-- 20. Lista los profesores que no han impartido clases en el último año académico.
select * from profesor pr inner join asignatura a on pr.id=a.id_profesor
inner join alumno_se_matricula_asignatura alsm on alsm.id_asignatura 
inner join curso_escolar cs on  cs.id=alsm.id_curso_escolar where cs.anyo_fin='2018';


