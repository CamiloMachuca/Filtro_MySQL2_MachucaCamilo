use universitario;

-- Funciones SQL 

-- 1. TotalCreditosAlumno(AlumnoID, Anio): Calcula el total de 
-- créditos cursados por un alumno en un año específico.

delimiter // 
create function total_creditos_alumnos(alumnoID int, anio date)
returns int deterministic
begin
declare total int;
select sum(asig.creditos) into total from alumno a inner join alumno_se_matricula_asignatura alsm on a.id=alsm.id_alumno 
inner join asignatura asig on asig.id=id_asignatura inner join curso_escolar cse on alsm.id_curso_escolar=cse.id where a.id=alumnoID and year(anio)= cse.anyo_inicio or cse.anyo_fin ;
return total;
end //
delimiter ;

select total_creditos_alumnos(1,'2014-02-11');




-- 2. EsProfesorVIP(ProfesorID): Verifica si un profesor es "VIP" 
-- basándose en el número de asignaturas impartidas y evaluaciones de desempeño.
delimiter // 
create function EsProfesorVIP(ProfesorID int)
returns int deterministic
begin
declare total int;
select count(a.id) into total from profesor p 
inner join asignatura a on p.id=a.id_profesor where p.id=ProfesorID;

return total;
end //
delimiter ;

select EsProfesorVIP(1);