create table categoria(
id_categoria int identity(1,1) primary key,
id_subcategoria int,
nombre_categoria varchar(100)
)

create table subcategoria(
id_subcategoria int identity(1,1) primary key,
nombre_subcategoria varchar(100),
)

create table Productos(
id_producto int identity(1,1) primary key,
id_categoria int,
nombre_producto varchar(100),
precio numeric(10,2),
descuento numeric(10,2),
)

create table cliente(
id_cliente int identity(1,1) primary key,
nombres_cliente varchar(100),
tipo_cliente varchar(100),
cedula_cliente varchar(10),
correo_cliente text,
num_telefono int
)


create table empleado(
id_empleado int identity(1,1) primary key,
nombres_empleado varchar(100),
cedula_empleado varchar(10),
correo_empleado text,
sueldo numeric(10,2)
)

create table sucursal(
id_sucursal int identity(1,1) primary key,
nombre_sucursal varchar(100),
direccion_sucursal varchar(100)
)

drop table ventas;
create table ventas(
id_venta int identity(1,1) primary key,
id_tiempo int,
id_sucursal int,
id_cliente int,
id_producto int,
unidad integer,
id_empleado int,
precio numeric,
)

create table tiempo(
id_tiempo int identity(1,1) primary key,
fecha date,
anio integer,
mes integer,
semana integer,
diaSemana varchar(10),
);





alter TABLE categoria 
ADD PRIMARY KEY (id_categoria);


alter TABLE subcategoria 
ADD PRIMARY KEY (id_subcategoria);

ALTER TABLE Productos 
ADD PRIMARY KEY (id_producto);

alter TABLE cliente 
ADD PRIMARY KEY (id_cliente);

ALTER TABLE empleado 
ADD PRIMARY KEY (id_empleado);

ALTER TABLE sucursal 
ADD PRIMARY KEY (id_sucursal);

ALTER TABLE ventas 
ADD PRIMARY KEY (id_venta);

ALTER TABLE tiempo
ADD PRIMARY KEY (id_tiempo);





alter table ventas add constraint FK_venta_tiempo foreign key (id_tiempo) references tiempo (id_tiempo);
alter table ventas add constraint FK_venta_sucursal foreign key (id_sucursal) references sucursal (id_sucursal);
alter table ventas add constraint FK_venta_empleado foreign key (id_empleado) references empleado (id_empleado);
alter table ventas add constraint FK_venta_cliente foreign key (id_cliente) references cliente (id_cliente);
alter table ventas add constraint FK_venta_producto foreign key (id_producto) references productos (id_producto);
alter table productos add constraint FK_productos_categoria foreign key (id_categoria) references categoria (id_categoria);
alter table categoria add constraint FK_categoria_subcategoria foreign key (id_subcategoria) references subcategoria (id_subcategoria);
