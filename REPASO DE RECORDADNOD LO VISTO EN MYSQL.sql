create database PruebitaTPM;
use PruebitaTPM;

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255)  NULL,
    precio DECIMAL(10, 2)  NULL,
    cantidad INT  NULL,
    fecha DATETIME  NULL
);
select*from ventas;
select*from productos;
drop table productos;
select count(*) from productos;
insert into productos (id,nombre,fecha) values ("1","Jhonny","2024-03-7");
insert into productos (id,nombre,fecha) values ("2","Maria" , "2000-01-01"); 
insert into productos (id,nombre,fecha) values ("3","Mario" , "1999-10-02"); 
insert into productos (id,nombre,fecha) values ("4","Mariana" , "2018-4-5"); 
insert into productos (id,nombre,fecha) values ("5","Mary" , "2001-11-03"); 



alter table productos
add Edad varchar(50);
alter table productos 
add Salario varchar (150);

update productos 
set edad = '40'
where id = '3' ;

update productos
set Edad = Edad * 1000;

 update productos
 set edad = edad * -1
where ABS(edad) > 35;

SELECT min(edad) FROM productos;
SELECT max(edad) FROM productos;
SELECT AVG(edad) FROM productos;

create table tb_comentarios(
id_comentario  INT AUTO_INCREMENT PRIMARY KEY,
id_Compra int,
comentario varchar (250),
fecha_registro DATETIME NULL
);

update tb_comentarios
set fecha_registro = "2028-04-17"
where id_comentario= '2' ;

insert into  tb_comentarios (id_comentario,id_Compra,comentario,fecha_registro) values ("1","98","La carne esta asquerosa ","2024-2-19");
insert into  tb_comentarios (id_comentario,id_Compra,comentario,fecha_registro) values ("2","100","La papa esta un poco desabridas","2024-2-19");
insert into  tb_comentarios (id_comentario,id_Compra,comentario,fecha_registro) values ("3","101","La coca cola esta melo 10 de 10","2024-2-19");
#Este comando es para desactivar el modo seguro de SQL "___________"
set sql_safe_updates= 0;

truncate proveedores;

select stock from productos;

select*from Compras;
CREATE TABLE Compras (
  id_Compra INT AUTO_INCREMENT PRIMARY KEY,
  id INT,  -- Removed AUTO_INCREMENT
  Descripcion VARCHAR(150) NULL,
  Cantidad VARCHAR(150) NULL,
  Valor_Unitario INT NULL,
  Fecha_Compra DATETIME NULL
);
drop tables Compras;
insert into Compras (id_Compra,id,Descripcion,Cantidad,Valor_Unitario,Fecha_Compra) values ("100","2","papa K","10","100","2023-12-15");
insert into Compras (id_Compra,id,Descripcion,Cantidad,Valor_Unitario,Fecha_Compra) values ("101","2","Coca colaLitro","4","50","2023-12-15");
insert into Compras (id_Compra,id,Descripcion,Cantidad,Valor_Unitario,Fecha_Compra) values ("98","3","Carne Kilo","8","14000","2023-12-14");

#CONECIÓN ENTRE 2 TABLAS 
select * from productos t1, Compras t2
where t1.id = t2.id;

#CONECIÓN ENTRE 3 TABLAS 
SELECT * FROM productos t1, Compras t2, tb_comentarios t3
WHERE t1.id = t2.id AND t2.id_Compra = t3.id_Compra;

alter table Compras
add Impuesto_Ventas int null;


select t2.cantidad * t2.Valor_Unitario 
from productos t1, Compras t2
where t1.id = t2.id_producto
and t1.id ;

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO EL AÑO 
select Year('2003-05-12-10:30:00')
select Year(Fecha_Compra) FROM Compras;

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO EL Dia 
select Day('2003-05-12-10:30:00')

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO EL Mes 
select Year('2003-05-12-10:30:00')

#Esta muestra la fecha que le estoy pidiendo habajo EN ESPECIFICO la el tiempo la hora
select Time('2003-05-12-10:30:00')

select * from productos
where month(fecha) = (select Max(month(fecha))from Productos); 

#PARA LA CONEXIÓN DE TYABLAS EN EL GRAFICO DE LAS LLAVES PRIMARIA Y FORANEA
alter table Compras
add constraint FK_productos_Compras
foreign key (id) references productos(id);

#PARA LA CONEXIÓN DE TYABLAS EN EL GRAFICO DE LAS LLAVES PRIMARIA Y FORANEA
alter table tb_comentarios
add constraint FK_Compras_tb_comentarios
foreign key (id_Compra) references Compras(id_Compra);

#PARA ALTERAR LA LLAVE PRIMARIA DE TAL TABLA
ALTER TABLE productos 
ADD INDEX idx_id  (id);

# Eliminar índice existente
ALTER TABLE productos DROP INDEX idx_id;

# Crear índice con el nombre correcto
ALTER TABLE productos ADD INDEX idx_id (id);

#MUESTRA LA LONGITUD DE LOS COMENTARIOS
select length('Puto el que lea jajaja"____" Dog Dager');

select Descripcion from Compras;

#SQL Nivel super Sayan 2 ESTE SQL SIRVE PARA VER CUANTO O SE PUEDE USAR PARA SABER CUANTO A COMPRADO TAL USUARIO PUES SE UTLIZA UNA SUB CONSULTA 
select *,(select Descripcion from Compras t2 where t2.id_Compra = t1.id_Compra) As producto
from  tb_comentarios t1
where month(fecha_registro) = (select max(month(fecha_registro))
from tb_comentarios);

#SUB CONSULTA PARA TRAER LOS USUARIOS Y LA CATIDAD Y EL VALOR TOTAL QUE PAGARON POR SUS PRODUCTOS
select t2.id, t2.nombre,(select count(*)from Compras t1 where t2.id = t1.id) as Cantidad_Producto,
(select sum(Valor_Unitario * Cantidad) from Compras t1 where t1.id = t2.id ) as Valor_Total
from productos t2;


select t2
