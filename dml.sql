
-- Sede
INSERT INTO Sede (sede_id, nombre, direccion, ciudad, telefono, email, estado)
VALUES
(1, 'Complejo Deportivo Central', 'Av. Los Álamos 450', 'Bogotá', '3105551234', 'central@clubfutbol.com', 'activo'),
(2, 'Polideportivo Norte', 'Calle 85 #12-45', 'Bogotá', '3205555678', 'norte@clubfutbol.com', 'activo');

-- Cancha
INSERT INTO Cancha (cancha_id, sede_id, nombre, tipo, capacidad, estado)
VALUES
(1, 1, 'Cancha A', 'césped natural', 200, 'disponible'),
(2, 1, 'Cancha B', 'sintética', 150, 'mantenimiento'),
(3, 2, 'Campo Norte', 'césped sintético', 250, 'disponible');

-- Categoría
INSERT INTO Categoria (categoria_id, nombre, descripcion)
VALUES
(1, 'Sub-15', 'Jugadores menores de 15 años'),
(2, 'Sub-18', 'Jugadores entre 15 y 18 años'),
(3, 'Mayores', 'Jugadores adultos');

-- Jugador
INSERT INTO Jugador (jugador_id, nombre, apellido, fecha_nacimiento, dni, email, telefono, categoria_id, fecha_alta, activo)
VALUES
(1, 'Carlos', 'Pérez', '2009-04-15', '12345678', 'carlos.perez@mail.com', '3101234567', 1, '2024-01-10', TRUE),
(2, 'Andrés', 'López', '2007-09-30', '87654321', 'andres.lopez@mail.com', '3119876543', 2, '2023-06-05', TRUE),
(3, 'Juan', 'García', '1998-02-12', '11223344', 'juan.garcia@mail.com', '3125558899', 3, '2022-03-20', FALSE);

-- Programa de Entrenamiento
INSERT INTO ProgramaEntrenamiento (programa_id, nombre, descripcion, categoria_id, objetivos, fecha_inicio, fecha_fin, estado)
VALUES
(1, 'Preparación Física Sub-15', 'Entrenamiento físico general para jóvenes', 1, 'Mejorar resistencia y fuerza', '2024-01-15', '2024-03-30', 'activo'),
(2, 'Tácticas Avanzadas Sub-18', 'Trabajo de estrategias de equipo', 2, 'Fortalecer coordinación táctica', '2024-02-10', '2024-04-20', 'activo');

-- Sesión
INSERT INTO Sesion (sesion_id, programa_id, fecha, hora_inicio, hora_fin, cancha_id, objetivo_sesion)
VALUES
(1, 1, '2024-01-20', '08:00', '10:00', 1, 'Entrenamiento de resistencia'),
(2, 1, '2024-01-25', '08:00', '10:00', 1, 'Fuerza y velocidad'),
(3, 2, '2024-02-15', '09:00', '11:00', 3, 'Tácticas de presión alta');

-- Jugador_Programa
INSERT INTO Jugador_Programa (jugador_programa_id, jugador_id, programa_id, fecha_inscripcion, estado)
VALUES
(1, 1, 1, '2024-01-12', 'activo'),
(2, 2, 2, '2024-02-01', 'activo');

-- AsistenciaSesion
INSERT INTO AsistenciaSesion (asistencia_id, sesion_id, jugador_id, presente, minutos_presente, observaciones)
VALUES
(1, 1, 1, TRUE, 120, 'Excelente rendimiento'),
(2, 2, 1, TRUE, 115, 'Buena actitud'),
(3, 3, 2, FALSE, 0, 'Ausente por lesión');

-- MétricaJugador
INSERT INTO MetricaJugador (metrica_id, jugador_id, sesion_id, fecha_registro, peso, velocidad, resistencia, nota)
VALUES
(1, 1, 1, '2024-01-20', 55.2, 8.5, 7.9, 'Buena resistencia'),
(2, 1, 2, '2024-01-25', 55.4, 8.7, 8.1, 'Mejoró velocidad'),
(3, 2, 3, '2024-02-15', 60.1, 8.2, 7.5, 'Promedio general');

-- Evento
INSERT INTO Evento (evento_id, tipo_evento, nombre, fecha_inicio, fecha_fin, sede_id, estado, descripcion)
VALUES
(1, 'amistoso', 'Partido Amistoso Sub-18', '2024-03-01 15:00:00', '2024-03-01 17:00:00', 2, 'programado', 'Partido de preparación contra equipo invitado'),
(2, 'torneo', 'Torneo Regional Mayores', '2024-05-10 09:00:00', '2024-05-20 18:00:00', 1, 'planificado', 'Competencia regional entre clubes locales');

-- Equipo
INSERT INTO Equipo (equipo_id, nombre, club, categoria_id)
VALUES
(1, 'Club Futbol A', 'Interno', 2),
(2, 'Deportivo Norte', 'Externo', 2),
(3, 'Veteranos FC', 'Externo', 3);

-- Evento_Equipo
INSERT INTO Evento_Equipo (evento_equipo_id, evento_id, equipo_id, es_local)
VALUES
(1, 1, 1, TRUE),
(2, 1, 2, FALSE),
(3, 2, 3, FALSE);

-- Persona (árbitros, comisarios, entrenadores, voluntarios)
INSERT INTO Persona (persona_id, nombre, apellido, rol, dni, telefono, email, activo)
VALUES
(1, 'Luis', 'Martínez', 'árbitro', '99001122', '3109988776', 'luis.martinez@mail.com', TRUE),
(2, 'Marta', 'Rojas', 'entrenador', '88001133', '3106677889', 'marta.rojas@mail.com', TRUE),
(3, 'Pedro', 'Cano', 'voluntario', '77002244', '3114455667', 'pedro.cano@mail.com', TRUE);

-- Evento_Personal
INSERT INTO Evento_Personal (evento_personal_id, evento_id, persona_id, rol_evento)
VALUES
(1, 1, 1, 'árbitro principal'),
(2, 1, 2, 'entrenador local'),
(3, 2, 3, 'asistente logístico');

-- Patrocinador
INSERT INTO Patrocinador (patrocinador_id, nombre, contacto, tipo, email, telefono)
VALUES
(1, 'Deportes Rueda', 'Carlos Rueda', 'empresa', 'contacto@deportesrueda.com', '3207778899'),
(2, 'Gaseosas Andina', 'María Torres', 'empresa', 'maria@andina.com', '3205551122');

-- Evento_Patrocinador
INSERT INTO Evento_Patrocinador (evento_patrocinador_id, evento_id, patrocinador_id, monto, detalle)
VALUES
(1, 1, 1, 1000000.00, 'Apoyo logístico y uniformes'),
(2, 2, 2, 2500000.00, 'Patrocinio oficial del torneo');

-- Recurso
INSERT INTO Recurso (recurso_id, nombre, tipo, descripcion, cantidad, ubicacion)
VALUES
(1, 'Balones', 'equipamiento', 'Balones oficiales FIFA', 20, 'Depósito Central'),
(2, 'Conos de entrenamiento', 'equipamiento', 'Conos plásticos de señalización', 50, 'Sede Central');

-- Evento_Recurso
INSERT INTO Evento_Recurso (evento_recurso_id, evento_id, recurso_id, cantidad_asignada)
VALUES
(1, 1, 1, 5),
(2, 1, 2, 10);

-- Incidencia
INSERT INTO Incidencia (incidencia_id, evento_id, fecha_hora, descripcion, accion_tomada, reportado_por)
VALUES
(1, 1, '2024-03-01 16:10:00', 'Lesión leve en jugador visitante', 'Atención médica inmediata', 1),
(2, 2, '2024-05-12 10:45:00', 'Retraso por lluvia', 'Reprogramar horario', 3);

