CREATE TABLESPACE LABORATORIOS DATAFILE 'G:\tabspace\laboratorios.DBF' SIZE 700M;
CREATE USER ERWIN IDENTIFIED BY "1234" DEFAULT TABLESPACE LABORATORIOS;
GRANT dba, connect, resource TO ERWIN;
GRANT CREATE ANY VIEW TO ERWIN WITH ADMIN OPTION;

-- CREAR USUARIO PARA VISTA
CREATE USER VISTA_WILO IDENTIFIED BY "1234";
-- CREAR PRIVILEGIOS SOLO PARA VISTA--
GRANT CREATE SESSION TO VISTA_WILO;
GRANT CREATE VIEW TO VISTA_WILO;

-- CREAR PRIVILEGIOS ADMINISTRACION 
GRANT CONNECT TO VISTA_WILO;
GRANT CREATE SEQUENCE TO VISTA_WILO;
GRANT CREATE TRIGGER TO VISTA_WILO;
GRANT CREATE TABLE TO VISTA_WILO;

-- ROL DE AUDITORIA "SELECT"
CREATE ROLE AUDITOR;


-- ASIGNACION DE ROL "SELECT" DE TODAS LAS TABLAS
GRANT SELECT ON RONNY.PERSONAS TO AUDITOR;
GRANT SELECT ON RONNY.TIPO_EXAMEN TO AUDITOR;
GRANT SELECT ON RONNY.ENCABEZADO_EXAMEN TO AUDITOR;
GRANT SELECT ON RONNY.EXAMENESREALIZADOS TO AUDITOR;
GRANT SELECT ON RONNY.DETALLE_EXAMEN_REALIZA TO AUDITOR;
GRANT SELECT ON RONNY.DETALLE_HISTORIAL TO AUDITOR;
GRANT SELECT ON RONNY.DETALLE_TIPOEXA TO AUDITOR;
GRANT SELECT ON RONNY.CABECERA_HISTORIAL TO AUDITOR;
GRANT AUDITOR TO VISTA_WILO;

-- ROL DE ADMINISTRACION
CREATE ROLE ADMINS;
GRANT CREATE VIEW TO ADMINS;
GRANT CREATE SESSION TO ADMINS;
GRANT CREATE SEQUENCE TO ADMINS;
GRANT CREATE TRIGGER TO ADMINS;
GRANT CREATE VIEW TO ADMINS;
GRANT CREATE TABLE TO ADMINS;
GRANT CREATE PROCEDURE TO ADMINS;

-- ASIGNACION DE ROL ADMINISTRACION TODAS LAS TABLAS
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.PERSONAS TO ADMIS;
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.TIPO_EXAMEN TO AUDITOR;
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.ENCABEZADO_EXAMEN TO AUDITOR;
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.EXAMENESREALIZADOS TO AUDITOR;
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.DETALLE_EXAMEN_REALIZA TO AUDITOR;
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.DETALLE_HISTORIAL TO AUDITOR;
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.DETALLE_TIPOEXA TO AUDITOR;
GRANT SELECT,INSERT,UPDATE,DELETE ON RONNY.CABECERA_HISTORIAL TO AUDITOR;
GRANT ADMINS TO VISTA_WILO;

-- SABER QUE USUARIO ESTA CONECTADO
SHOW USER;

/*

*/

-- COMPROBACION DE LOS ROLES
SELECT * FROM RONNY.PERSONAS;
SELECT * FROM RONNY.TIPO_EXAMEN;
SELECT * FROM RONNY.ENCABEZADO_EXAMEN;
SELECT * FROM RONNY.EXAMENESREALIZADOS;
SELECT * FROM RONNY.DETALLE_EXAMEN_REALIZA;
SELECT * FROM RONNY.DETALLE_HISTORIAL;
SELECT * FROM RONNY.DETALLE_TIPOEXA;
SELECT * FROM RONNY.CABECERA_HISTORIAL;

INSERT INTO PERSONAS (DUI, NOMBRE, FECHA_NACIMIENTO, GENERO, E_MAIL, TELEFONO_CELULAR, TIPO_PERSONA, ESTADO, ROL_USUARIO) VALUES
('01056166-2', 'RONNY', '08-07-1994', 'M', 'ronny@gmail.com', '6157-6647', 'PACIENTE', 'ACTIVO', 'PC-02');

-- QUITAR ROLES..
REVOKE CREATE VIEW FROM VISTA_WILO;
REVOKE AUDITOR FROM VISTA_WILO;
REVOKE CREATE PROCEDURE FROM VISTA_WILO;
REVOKE SELECT ON RONNY.PERSONAS FROM VISTA_WILO;

REVOKE CREATE VIEW TO ADMINS;
REVOKE CREATE SESSION TO ADMINS;
REVOKE CREATE SEQUENCE TO ADMINS;
REVOKE CREATE TRIGGER TO ADMINS;
REVOKE CREATE VIEW TO ADMINS;
REVOKE CREATE TABLE TO ADMINS;
REVOKE SELECT,INSERT,UPDATE,DELETE ON RONNY.PERSONAS FROM VISTA_WILO;
REVOKE ADMINS FROM VISTA_WILO;
REVOKE SELECT,INSERT ON RONNY.PERSONAS FROM VISTA_WILO;