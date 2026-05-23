-- ============================================================
-- Base de Datos: Rendimiento Académico por Carrera
-- Proyecto: Análisis de Salud Mental Estudiantil con IA
-- Autor: [Tu Nombre]
-- Fecha: 2025
-- ============================================================

-- Tabla de carreras universitarias
CREATE TABLE IF NOT EXISTS carreras (
    carrera_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre       TEXT    NOT NULL,
    facultad     TEXT    NOT NULL,
    duracion_anos INTEGER NOT NULL
);

-- Tabla de estadísticas por carrera y año
CREATE TABLE IF NOT EXISTS estadisticas_carrera (
    stat_id             INTEGER PRIMARY KEY AUTOINCREMENT,
    carrera_id          INTEGER NOT NULL,
    anio_estudio        INTEGER NOT NULL,   -- 1, 2, 3 o 4
    promedio_cgpa       REAL    NOT NULL,
    tasa_depresion      REAL    NOT NULL,   -- porcentaje 0-100
    tasa_ansiedad       REAL    NOT NULL,
    tasa_busca_ayuda    REAL    NOT NULL,
    promedio_suenio     REAL    NOT NULL,
    promedio_estudio    REAL    NOT NULL,
    num_estudiantes     INTEGER NOT NULL,
    FOREIGN KEY (carrera_id) REFERENCES carreras(carrera_id)
);

-- Tabla de recursos de bienestar disponibles
CREATE TABLE IF NOT EXISTS recursos_bienestar (
    recurso_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    carrera_id   INTEGER NOT NULL,
    tipo_recurso TEXT    NOT NULL,  -- 'Psicológico', 'Académico', 'Social', 'Físico'
    nombre       TEXT    NOT NULL,
    disponible   INTEGER NOT NULL DEFAULT 1,  -- 1=Sí, 0=No
    FOREIGN KEY (carrera_id) REFERENCES carreras(carrera_id)
);

-- ============================================================
-- INSERCIÓN DE DATOS
-- ============================================================

-- Carreras
INSERT INTO carreras (nombre, facultad, duracion_anos) VALUES
    ('Ingeniería en Sistemas',     'Ingeniería',   5),
    ('Medicina',                   'Ciencias de la Salud', 6),
    ('Derecho',                    'Ciencias Sociales',    5),
    ('Psicología',                 'Ciencias Humanas',     4),
    ('Administración de Empresas', 'Ciencias Económicas',  4),
    ('Arquitectura',               'Arte y Diseño',        5);

-- Estadísticas por carrera y año
INSERT INTO estadisticas_carrera
    (carrera_id, anio_estudio, promedio_cgpa, tasa_depresion, tasa_ansiedad, tasa_busca_ayuda, promedio_suenio, promedio_estudio, num_estudiantes)
VALUES
    -- Ingeniería en Sistemas
    (1, 1, 3.20, 28.5, 35.0, 15.0, 6.8, 4.2, 120),
    (1, 2, 3.10, 32.0, 38.0, 18.0, 6.5, 4.5, 110),
    (1, 3, 2.95, 38.0, 42.0, 22.0, 6.2, 4.8, 100),
    (1, 4, 3.30, 30.0, 35.0, 20.0, 6.9, 5.0, 95),
    -- Medicina
    (2, 1, 3.50, 22.0, 28.0, 20.0, 7.2, 5.5, 80),
    (2, 2, 3.40, 30.0, 35.0, 25.0, 6.8, 5.8, 78),
    (2, 3, 3.35, 40.0, 45.0, 35.0, 6.0, 6.5, 75),
    (2, 4, 3.25, 45.0, 50.0, 40.0, 5.8, 7.0, 72),
    -- Derecho
    (3, 1, 3.10, 25.0, 30.0, 12.0, 7.0, 3.8, 150),
    (3, 2, 3.05, 30.0, 33.0, 14.0, 6.8, 4.0, 140),
    (3, 3, 2.90, 35.0, 38.0, 18.0, 6.5, 4.2, 130),
    (3, 4, 3.15, 28.0, 30.0, 15.0, 7.0, 4.0, 125),
    -- Psicología
    (4, 1, 3.40, 20.0, 25.0, 30.0, 7.5, 4.0, 90),
    (4, 2, 3.35, 22.0, 28.0, 32.0, 7.2, 4.2, 88),
    (4, 3, 3.45, 18.0, 22.0, 35.0, 7.8, 4.5, 85),
    (4, 4, 3.50, 15.0, 20.0, 38.0, 8.0, 4.8, 82),
    -- Administración
    (5, 1, 3.15, 20.0, 25.0, 10.0, 7.2, 3.5, 200),
    (5, 2, 3.20, 22.0, 27.0, 12.0, 7.0, 3.8, 190),
    (5, 3, 3.10, 25.0, 30.0, 14.0, 6.8, 4.0, 180),
    (5, 4, 3.30, 20.0, 25.0, 12.0, 7.2, 4.2, 170),
    -- Arquitectura
    (6, 1, 3.25, 30.0, 35.0, 18.0, 6.5, 5.0, 70),
    (6, 2, 3.20, 35.0, 40.0, 20.0, 6.2, 5.5, 68),
    (6, 3, 3.10, 40.0, 45.0, 25.0, 5.8, 6.0, 65),
    (6, 4, 3.35, 32.0, 38.0, 22.0, 6.5, 5.8, 62);

-- Recursos de bienestar
INSERT INTO recursos_bienestar (carrera_id, tipo_recurso, nombre, disponible) VALUES
    (1, 'Psicológico', 'Consejería estudiantil', 1),
    (1, 'Académico',   'Tutorías de pares',      1),
    (1, 'Social',      'Club de programación',   1),
    (1, 'Físico',      'Gimnasio universitario', 1),
    (2, 'Psicológico', 'Psiquiatra universitario',1),
    (2, 'Académico',   'Grupos de estudio',      1),
    (2, 'Social',      'Asociación médica',       1),
    (2, 'Físico',      'Deporte institucional',  1),
    (3, 'Psicológico', 'Consejería estudiantil', 1),
    (3, 'Académico',   'Clínica jurídica',       1),
    (3, 'Social',      'Debate universitario',   1),
    (3, 'Físico',      'Canchas deportivas',     1),
    (4, 'Psicológico', 'Supervisión clínica',    1),
    (4, 'Académico',   'Laboratorio de conducta',1),
    (4, 'Social',      'Grupos de apoyo',        1),
    (4, 'Físico',      'Meditación y yoga',      1),
    (5, 'Psicológico', 'Consejería estudiantil', 1),
    (5, 'Académico',   'Centro de emprendimiento',1),
    (5, 'Social',      'Red de egresados',       1),
    (5, 'Físico',      'Gimnasio universitario', 1),
    (6, 'Psicológico', 'Consejería estudiantil', 1),
    (6, 'Académico',   'Taller de diseño',       1),
    (6, 'Social',      'Exposiciones de arte',   1),
    (6, 'Físico',      'Actividades recreativas',0);
