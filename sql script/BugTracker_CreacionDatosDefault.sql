USE BUGTRACKER
--------------------------------------------------------------------------------------
/*Datos por Defecto */
INSERT INTO ROL(Nombre) VALUES('SUPERUSUARIO');
INSERT INTO ROL(Nombre) VALUES('ADMINISTRADOR');
INSERT INTO ROL(Nombre) VALUES('ARQUITECTO DE SOFTWARE');
INSERT INTO ROL(Nombre) VALUES('DEVELOPER');
INSERT INTO ROL(Nombre) VALUES('TESTER');

INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña) VALUES('JUAN','VILLA',1,'ADMIN@KBYTESGT.COM',PWDENCRYPT('123456'))