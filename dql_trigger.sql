use universitario;
-- Realizacion trigger
-- 1. RestringirAsignacionExcesiva: Evita que un profesor 
-- tenga más de 10 asignaturas asignadas en un semestre.

delimiter // 
create trigger RestringirAsignacionExcesiva
before update on profesor
for each row
begin
declare total_asignatura int;
 if 10< (select count(a.id)  from profesor p inner join asignatura a on p.id=a.id_profesor 
inner join alumno_se_matricula_asignatura asm on a.id=asm.id_asignatura 
inner join curso_escolar cs on asm.id_curso_escolar=cs.id) then
signal sqlstate '45000' set message_text= 'el profesor excede la cantidad de asignaturas ';
end if;
end //
delimiter ;