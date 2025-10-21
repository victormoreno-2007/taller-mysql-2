
CREATE DATABASE IF NOT EXISTS evento_deportivo;
USE evento_deportivo;


CREATE TABLE sede (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    estado ENUM('activo','inactivo') DEFAULT 'activo'
);

CREATE TABLE cancha (
    id_cancha INT AUTO_INCREMENT PRIMARY KEY,
    id_sede INT NOT NULL,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    capacidad INT,
    estado VARCHAR(20),
    FOREIGN KEY (id_sede) REFERENCES sede(id_sede)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE jugador (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nuip VARCHAR(20) UNIQUE,
    email VARCHAR(100),
    telefono VARCHAR(20),
    id_categoria INT,
    fecha_entrada DATE,
    activo TINYINT(1) DEFAULT 1,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE programa_entrenetimiento (
    id_programa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    id_categoria INT NOT NULL,
    objetivo TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE sesion (
    id_sesion INT AUTO_INCREMENT PRIMARY KEY,
    id_programa INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME,
    hora_fin TIME,
    id_cancha INT,
    objetivo_sesion VARCHAR(255),
    FOREIGN KEY (id_programa) REFERENCES programa_entrenetimiento(id_programa),
    FOREIGN KEY (id_cancha) REFERENCES cancha(id_cancha)
);

CREATE TABLE jugador_programa (
    id_jugador_programa INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_programa INT NOT NULL,
    fecha_inscripcion DATE,
    estado VARCHAR(20),
    UNIQUE(id_jugador, id_programa),
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_programa) REFERENCES programa_entrenetimiento(id_programa)
);

CREATE TABLE asistencia_sesion (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_sesion INT NOT NULL,
    id_jugador INT NOT NULL,
    presente TINYINT(1) DEFAULT 0,
    minutos_presentes INT,
    observaciones TEXT,
    UNIQUE(id_sesion, id_jugador),
    FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion),
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador)
);

CREATE TABLE metrica_jugador (
    id_metrica INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_sesion INT,
    fecha_registro DATE NOT NULL,
    peso DECIMAL(10,2),
    velocidad DECIMAL(10,2),
    resistencia DECIMAL(10,2),
    nota TEXT,
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion)
);

CREATE TABLE evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    tipo_evento VARCHAR(50),
    nombre VARCHAR(150),
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    id_sede INT,
    estado VARCHAR(30),
    descripcion TEXT,
    FOREIGN KEY (id_sede) REFERENCES sede(id_sede)
);

CREATE TABLE equipo (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    club VARCHAR(150),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE evento_equipo (
    id_evento_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    id_equipo INT NOT NULL,
    local TINYINT(1),
    UNIQUE(id_evento, id_equipo),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
);

CREATE TABLE persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    rol VARCHAR(50),
    nuip VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(100),
    activo TINYINT(1) DEFAULT 1
);

CREATE TABLE evento_personal (
    id_evento_personal INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    id_persona INT NOT NULL,
    rol_evento VARCHAR(50),
    UNIQUE(id_evento, id_persona, rol_evento),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona)
);

CREATE TABLE patrocinador (
    id_patrocinador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    tipo VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE evento_patrocinador (
    id_evento_patrocinador INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    id_patrocinador INT NOT NULL,
    monto DECIMAL(10,2),
    detalle TEXT,
    UNIQUE(id_evento, id_patrocinador),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (id_patrocinador) REFERENCES patrocinador(id_patrocinador)
);

CREATE TABLE recursos (
    id_recursos INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    descripcion TEXT,
    cantidad INT,
    ubicacion VARCHAR(150)
);

CREATE TABLE evento_recurso (
    id_evento_recurso INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    id_recurso INT NOT NULL,
    cantidad_asignada INT,
    UNIQUE(id_evento, id_recurso),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (id_recurso) REFERENCES recursos(id_recursos)
);

CREATE TABLE insidencia (
    id_incidencia INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    fecha_hora DATETIME,
    descripcion TEXT,
    accion_tomada TEXT,
    reportado_por INT,
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (reportado_por) REFERENCES persona(id_persona)
);
