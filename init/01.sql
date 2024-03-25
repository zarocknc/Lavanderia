CREATE TABLE `Clientes` (
                            `id` integer PRIMARY KEY AUTO_INCREMENT NOT NULL,
                            `nombre` varchar(255),
                            `direccion` varchar(255),
                            `telefono` varchar(255),
                            `email` varchar(255),
                            `contrasena` varchar(255),
                            `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Servicios` (
                             `id` integer PRIMARY KEY AUTO_INCREMENT NOT NULL,
                             `nombre` varchar(255),
                             `descripcion` text,
                             `precio` decimal,
                             `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Pedidos` (
                           `id` integer PRIMARY KEY AUTO_INCREMENT NOT NULL,
                           `cliente_id` integer NOT NULL,
                           `servicio_id` integer,
                           `fecha_pedido` timestamp,
                           `estado` varchar(255),
                           `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `Pedidos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`id`);

ALTER TABLE `Pedidos` ADD FOREIGN KEY (`servicio_id`) REFERENCES `Servicios` (`id`);

-- INSERTAR DATOS DE EJEMPLO

-- Insert example data into Clientes table
INSERT INTO `Clientes` (`nombre`, `direccion`, `telefono`, `email`, `contrasena`)
VALUES ('John Doe', '123 Main St', '123-456-7890', 'johndoe@example.com', 'password123'),
       ('Jane Smith', '456 Oak Ave', '987-654-3210', 'janesmith@example.com', 'password456');

-- Insert example data into Servicios table
INSERT INTO `Servicios` (`nombre`, `descripcion`, `precio`)
VALUES ('Service 1', 'Description for service 1', 99.99),
       ('Service 2', 'Description for service 2', 199.99);

-- Insert example data into Pedidos table
INSERT INTO `Pedidos` (`cliente_id`, `servicio_id`, `fecha_pedido`, `estado`)
VALUES (1, 1, '2022-01-01 10:00:00', 'Pending'),
       (2, 2, '2022-01-02 11:00:00', 'Completed');