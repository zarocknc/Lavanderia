CREATE TABLE `Clientes` (
                            `id` integer PRIMARY KEY,
                            `nombre` varchar(255),
                            `direccion` varchar(255),
                            `telefono` varchar(255),
                            `email` varchar(255),
                            `contrasena` varchar(255),
                            `created_at` timestamp
);

CREATE TABLE `Servicios` (
                             `id` integer PRIMARY KEY,
                             `nombre` varchar(255),
                             `descripcion` text,
                             `precio` decimal,
                             `created_at` timestamp
);

CREATE TABLE `Pedidos` (
                           `id` integer PRIMARY KEY,
                           `cliente_id` integer,
                           `servicio_id` integer,
                           `fecha_pedido` timestamp,
                           `estado` varchar(255),
                           `created_at` timestamp
);

ALTER TABLE `Pedidos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`id`);

ALTER TABLE `Pedidos` ADD FOREIGN KEY (`servicio_id`) REFERENCES `Servicios` (`id`);


-- INSERTAR DATOS EJEMPLO

-- Insertar dos filas en la tabla Clientes
INSERT INTO Clientes (id, nombre, direccion, telefono, email, contrasena, created_at)
VALUES
    (1, 'Juan Perez', 'Calle 123, Ciudad', '1234567890', 'juan.perez@example.com', 'contrasena123', CURRENT_TIMESTAMP),
    (2, 'Maria Rodriguez', 'Avenida 456, Pueblo', '0987654321', 'maria.rodriguez@example.com', 'password456', CURRENT_TIMESTAMP);

-- Insertar dos filas en la tabla Servicios
INSERT INTO Servicios (id, nombre, descripcion, precio, created_at)
VALUES
    (1, 'Lavado de ropa', 'Servicio de lavado de ropa a precios accesibles', 15.00, CURRENT_TIMESTAMP),
    (2, 'Planchado de ropa', 'Servicio de planchado de ropa de calidad', 20.00, CURRENT_TIMESTAMP);

-- Insertar dos filas en la tabla Pedidos
INSERT INTO Pedidos (id, cliente_id, servicio_id, fecha_pedido, estado, created_at)
VALUES
    (1, 1, 1, CURRENT_TIMESTAMP, 'Pendiente', CURRENT_TIMESTAMP),
    (2, 2, 2, CURRENT_TIMESTAMP, 'En proceso', CURRENT_TIMESTAMP);