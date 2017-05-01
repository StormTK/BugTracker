USE BUGTRACKER
--------------------------------------------------------------------------------------
/*Consultas*/
SELECT * FROM ROL;
SELECT * FROM USUARIO;

SELECT COUNT(*)FROM USUARIO WHERE Email = 'ADMIN@KBYTESGT.COM' AND PWDCOMPARE('1234', Contraseña ) = 1

DROP TABLE USUARIO
SELECT USUARIO.idUsuario + ' ' + USUARIO.Apellido + ' ' + ROL.Nombre  , USUARIO.Nombre AS EXPR1
FROM            ROL INNER JOIN
                         USUARIO ON ROL.idRol = USUARIO.Rol
