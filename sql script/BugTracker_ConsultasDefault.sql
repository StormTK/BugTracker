USE BUGTRACKER
--------------------------------------------------------------------------------------
/*Consultas*/
SELECT * FROM ROL;
SELECT * FROM USUARIO;
SELECT * FROM PROYECTO;

SELECT COUNT(*)FROM USUARIO WHERE Email = 'ADMIN@KBYTESGT.COM' AND PWDCOMPARE('123456', Contraseña ) = 1

DROP TABLE USUARIO
SELECT  USUARIO.idUsuario, USUARIO.Nombre + ' ' + USUARIO.Apellido + ' - ' + ROL.Nombre AS Participante FROM ROL INNER JOIN USUARIO ON ROL.idRol = USUARIO.Rol WHERE USUARIO.Rol > 2
