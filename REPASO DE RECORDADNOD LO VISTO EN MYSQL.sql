create database PruebitaTPM;
use PruebitaTPM;

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255)  NULL,
    precio DECIMAL(10, 2)  NULL,
    cantidad INT  NULL,
    fecha VARCHAR(255)  NULL
);
select*from ventas;
select*from productos;
drop table productos;
select count(*) from productos;
insert into productos (id,nombre,fecha) values ("1","Jhonny","7/03/2024");
insert into productos (id,nombre,fecha) values ("2","Maria" , "01/01/2000"); 
insert into productos (id,nombre,fecha) values ("3","Mario" , "10/02/1999"); 
insert into productos (id,nombre,fecha) values ("4","Mariana" , "24/12/2018"); 
insert into productos (id,nombre,fecha) values ("5","Mary" , "14/03/2001"); 

alter table productos
add Edad varchar(50);
alter table productos 
add Salario varchar (150);

update productos 
set edad = '31'
where id = '5' ;

update productos
set Edad = Edad * 1000;

 update productos
 set edad = edad * -1
where ABS(edad) > 35;

SELECT min(edad) FROM productos;
SELECT max(edad) FROM productos;
SELECT AVG(edad) FROM productos;

#Este comando es para desactivar el modo seguro de SQL "___________"
set sql_safe_updates= 0;
truncate proveedores;
select stock from productos;

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);
CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL UNIQUE,
   correo VARCHAR(255) NOT NULL UNIQUE,
   contraseña VARCHAR(255) NOT NULL ); 


select*from Compras;
CREATE TABLE Compras(
id_Compra INT AUTO_INCREMENT PRIMARY KEY,
id_producto INT  NULL,
Descripcion varchar (150) null,
Cantidad varchar(150) null,
Valor_Unitario int null,
Fecha_Compra   DATETIME null,
FOREIGN KEY (id_producto) REFERENCES productos(id)

);
drop tables proveedores;
insert into Compras (id_Compra,id_producto,Descripcion,Cantidad,Valor_Unitario,Fecha_Compra) values ("100","2","papa K","10","100","2023-12-15");
insert into Compras (id_Compra,id_producto,Descripcion,Cantidad,Valor_Unitario,Fecha_Compra) values ("101","2","Coca colaLitro","4","50","2023-12-15");
insert into Compras (id_Compra,id_producto,Descripcion,Cantidad,Valor_Unitario,Fecha_Compra) values ("98","3","Carne Kilo","8","14000","2023-12-14");

select * from productos t1, Compras t2
where t1.id = t2.id_producto;

alter table Compras
add Impuesto_Ventas int null;

select t2.cantidad * t2.Valor_Unitario 
from productos t1, Compras t2
where t1.id = t2.id_producto
and t1.id ;

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO EL AÑO 
select Year('2003-05-12-10:30:00')
SELECT Year(Fecha_Compra) FROM Compras;

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO EL Dia 
select Day('2003-05-12-10:30:00')

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO EL Mes 
select Year('2003-05-12-10:30:00')

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO la el tiempo la hora
select Time('2003-05-12-10:30:00')

select * from productos
where month(fecha) = (select Max(month(fecha))from Productos); 