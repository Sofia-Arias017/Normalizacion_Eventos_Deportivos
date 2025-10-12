CREATE DATABASE `clubfutbol`;
USE `clubfutbol`;

-- Tabla de jugadores registrados en el club
CREATE TABLE `Jugador` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `fecha_nacimiento` DATE NOT NULL,
    `categoria` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de metricas para evaluar el rendimiento de los jugadores
CREATE TABLE `MetricaRendimiento` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `descripcion` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de programas de entrenamiento
CREATE TABLE `ProgramaEntrenamiento` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `objetivo` VARCHAR(255) NOT NULL,
    `tipo` VARCHAR(50) NOT NULL,
    `categoria` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de sesiones especificas dentro de un programa de entrenamiento
CREATE TABLE `SesionEntrenamiento` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fecha` DATE NOT NULL,
    `hora` TIME NOT NULL,
    `lugar` VARCHAR(100) NOT NULL,
    `id_programa_entrenamiento_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_sesion_programa`
        FOREIGN KEY (`id_programa_entrenamiento_fk`) REFERENCES `ProgramaEntrenamiento`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla que registra los valores de seguimiento del rendimiento por jugador y sesion
CREATE TABLE `SeguimientoJugador` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `valor` DECIMAL(5,2) NOT NULL,
    `id_jugador_fk` BIGINT NOT NULL,
    `id_sesion_entrenamiento_fk` BIGINT NOT NULL,
    `id_metrica_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_seguimiento_jugador`
        FOREIGN KEY (`id_jugador_fk`) REFERENCES `Jugador`(`id`),
    CONSTRAINT `fk_seguimiento_sesion`
        FOREIGN KEY (`id_sesion_entrenamiento_fk`) REFERENCES `SesionEntrenamiento`(`id`),
    CONSTRAINT `fk_seguimiento_metrica`
        FOREIGN KEY (`id_metrica_fk`) REFERENCES `MetricaRendimiento`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de eventos deportivos organizados por el club
CREATE TABLE `EventoDeportivo` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tipo` VARCHAR(100) NOT NULL,
    `fecha` DATE NOT NULL,
    `lugar` VARCHAR(100) NOT NULL,
    `estado` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de participacion de jugadores en los eventos deportivos
CREATE TABLE `Participacion` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `rol` VARCHAR(50) NOT NULL,
    `observaciones` VARCHAR(255),
    `id_jugador_fk` BIGINT NOT NULL,
    `id_evento_deportivo_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_participacion_jugador`
        FOREIGN KEY (`id_jugador_fk`) REFERENCES `Jugador`(`id`),
    CONSTRAINT `fk_participacion_evento`
        FOREIGN KEY (`id_evento_deportivo_fk`) REFERENCES `EventoDeportivo`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de recursos utilizados en los eventos (equipos, materiales, etc.)
CREATE TABLE `Recurso` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `tipo` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla intermedia para registrar el uso de recursos en cada evento
CREATE TABLE `UsoRecursoEvento` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad` INT NOT NULL,
    `unidad` VARCHAR(20) NOT NULL,
    `observaciones` VARCHAR(255),
    `id_evento_deportivo_fk` BIGINT NOT NULL,
    `id_recurso_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_uso_evento`
        FOREIGN KEY (`id_evento_deportivo_fk`) REFERENCES `EventoDeportivo`(`id`),
    CONSTRAINT `fk_uso_recurso`
        FOREIGN KEY (`id_recurso_fk`) REFERENCES `Recurso`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de arbitros registrados
CREATE TABLE `Arbitro` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla que registra la designacion de arbitros a eventos deportivos
CREATE TABLE `DesignacionArbitro` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `rol_arbitral` VARCHAR(50) NOT NULL,
    `observaciones` VARCHAR(255),
    `id_evento_deportivo_fk` BIGINT NOT NULL,
    `id_arbitro_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_designacion_evento`
        FOREIGN KEY (`id_evento_deportivo_fk`) REFERENCES `EventoDeportivo`(`id`),
    CONSTRAINT `fk_designacion_arbitro`
        FOREIGN KEY (`id_arbitro_fk`) REFERENCES `Arbitro`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de comisarios encargados de supervisar los eventos
CREATE TABLE `Comisario` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla que relaciona comisarios con los eventos y su zona de responsabilidad
CREATE TABLE `DesignacionComisario` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `zona_responsable` VARCHAR(50) NOT NULL,
    `observaciones` VARCHAR(255),
    `id_comisario_fk` BIGINT NOT NULL,
    `id_evento_deportivo_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_comisario`
        FOREIGN KEY (`id_comisario_fk`) REFERENCES `Comisario`(`id`),
    CONSTRAINT `fk_comisario_evento`
        FOREIGN KEY (`id_evento_deportivo_fk`) REFERENCES `EventoDeportivo`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de patrocinadores del club o eventos
CREATE TABLE `Patrocinador` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla intermedia que relaciona patrocinadores con eventos deportivos
CREATE TABLE `PatrocinioEvento` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `monto` DECIMAL(10,2) NOT NULL,
    `tipo` VARCHAR(50) NOT NULL,
    `observaciones` VARCHAR(255),
    `id_evento_deportivo_fk` BIGINT NOT NULL,
    `id_patrocinador_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_patrocinio_evento`
        FOREIGN KEY (`id_evento_deportivo_fk`) REFERENCES `EventoDeportivo`(`id`),
    CONSTRAINT `fk_patrocinio_patrocinador`
        FOREIGN KEY (`id_patrocinador_fk`) REFERENCES `Patrocinador`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de voluntarios que apoyan los eventos
CREATE TABLE `Voluntario` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `contacto` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla intermedia para asignar voluntarios a eventos deportivos
CREATE TABLE `AsignacionVoluntarioEvento` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `funcion` VARCHAR(100) NOT NULL,
    `observaciones` VARCHAR(255),
    `id_voluntario_fk` BIGINT NOT NULL,
    `id_evento_deportivo_fk` BIGINT NOT NULL,
    CONSTRAINT `fk_voluntario_evento`
        FOREIGN KEY (`id_evento_deportivo_fk`) REFERENCES `EventoDeportivo`(`id`),
    CONSTRAINT `fk_voluntario`
        FOREIGN KEY (`id_voluntario_fk`) REFERENCES `Voluntario`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
