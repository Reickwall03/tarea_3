CREAR  ESQUEMA ` tarea3` ;

CREAR  TABLA ` tarea3` . ` clientes` ( _
  ` idClientes `  INT  NOT NULL AUTO_INCREMENT,
  ` nombres `  VARCHAR ( 60 ) NOT NULL ,
  ` apellidos `  VARCHAR ( 60 ) NOT NULL ,
  ` nit `  VARCHAR ( 12 ) NO NULO ,
  ` genero `  BIT  NO NULO ,
  ` telefono `  VARCHAR ( 25 ) NO NULO ,
  ` correo_electronico `  VARCHAR ( 45 ) NO NULO ,
  ` fechaingreso ` DATETIME NOT NULL ,
  CLAVE PRINCIPAL ( ` idClientes ` ));

  CREAR  TABLA ` tarea3` . ` puestos` ( _
  ` idPuesto `  SMALLINT  NOT NULL AUTO_INCREMENT,
  ` puesto `  VARCHAR ( 50 ) NO NULO ,
  CLAVE PRIMARIA ( ` idPuesto` ) );


  CREAR  TABLA ` tarea3` . ` Empleados ` (
  ` idEmpleado `  INT  NOT NULL AUTO_INCREMENT,
  ` nombres `  VARCHAR ( 60 ) NOT NULL ,
  ` apellidos `  VARCHAR ( 60 ) NOT NULL ,
  ` direcci�n `  VARCHAR ( 80 ) NOT NULL ,
  ` telefono `  VARCHAR ( 25 ) NO NULO ,
  ` DPI `  VARCHAR ( 15 ) NO NULO ,
  ` genero `  BIT  NO NULO ,
  ` fecha_nacimiento `  FECHA  NO NULA ,
  ` idPuesto `  SMALLINT  NOT NULL ,
  ` fecha_inicio_labores `  FECHA  NO NULA ,
  ` fechaingreso ` DATETIME NOT NULL ,
  CLAVE PRIMARIA ( ` idEmpleado ` ));

CREAR  TABLA ` tarea3` . ` Ventas` ( _
  ` idVenta `  INT  NOT NULL AUTO_INCREMENT,
  ` nofactura `  INT  NOT NULL ,
  ` serie `  CHAR ( 1 ) NO NULO ,
  ` fechafactura `  FECHA  NO NULA ,
  ` idClientes `  INT  NO NULO ,
  ` idEmpleado `  INT  NO NULO ,
  ` fechaingreso ` DATETIME NOT NULL ,
  CLAVE PRIMARIA ( ` idVenta ` ));

  CREAR  TABLA ` tarea3` . ` Proveedores ` (
  ` idProveedor `  INT  NOT NULL AUTO_INCREMENT,
  ` Proveedor `  VARCHAR ( 60 ) NO NULO ,
  ` nit `  VARCHAR ( 12 ) NO NULO ,
  ` direcci�n `  VARCHAR ( 80 ) NOT NULL ,
  ` telefono `  VARCHAR ( 25 ) NO NULO ,
  CLAVE PRINCIPAL ( ` idProveedor ` ));

  CREAR  TABLA ` tarea3` . ` Compras` ( _
  ` idCompra `  INT  NOT NULL AUTO_INCREMENT,
  ` no_orden_compra `  INT  NO NULO ,
  ` idProveedor `  INT  NOT NULL ,
  ` fecha_orden ` FECHA  NO NULA ,
  ` fechaingreso ` DATETIME NOT NULL ,
  CLAVE PRIMARIA ( ` idCompra ` ));

  CREAR  TABLA ` tarea3` . ` Marcas` ( _
  ` idMarca `  SMALLINT  NOT NULL AUTO_INCREMENT,
  ` Marca `  VARCHAR ( 50 ) NO NULO ,
  CLAVE PRIMARIA ( ` idMarca ` ));

  CREAR  TABLA ` tarea3` . ` Productos` ( _
  ` idProducto `  INT  NOT NULL AUTO_INCREMENT,
  ` Producto `  VARCHAR ( 50 ) NO NULO ,
  ` idMarca `  SMALLINT  NO NULO ,
  ` Descripcion `  VARCHAR ( 100 ) NOT NULL ,
  ` Imagen `  VARCHAR ( 30 ) NO NULO ,
  ` precio_costo `  DECIMAL ( 8 , 2 ) NO NULO ,
  ` precio_venta `  DECIMAL ( 8 , 2 ) NO NULO ,
  ` existencia `  INT  NO NULO ,
  ` fechaingreso ` DATETIME NOT NULL ,
  CLAVE PRIMARIA ( ` idProducto ` ));

  CREAR  TABLA ` tarea3` . ` Compras_detalle ` (
  ` idCompra_detalle `  BIGINT  NOT NULL AUTO_INCREMENT,
  ` idCompra `  INT  NO NULO ,
  ` idProducto `  INT  NO NULO ,
  ` cantidad ` INT  NO NULO ,
  ` precio_costo_unitario `  DECIMAL ( 8 , 2 ) NO NULO ,
  CLAVE PRIMARIA ( ` idCompra_detalle ` ));

  CREAR  TABLA ` tarea3` . ` Venta_detalle ` (
  ` idVenta_detalle `  BIGINT  NOT NULL AUTO_INCREMENT,
  ` idVenta`  INT  NO NULO ,
  ` idProducto `  INT  NO NULO ,
  ` cantidad `  VARCHAR ( 45 ),
  ` precio_unitario `  DECIMAL ( 8 , 2 ) NO NULO ,
  CLAVE PRIMARIA ( ` idVenta_detalle ` ));

  /* llaves foraneas */
  /* tabla empleados */
ALTER  TABLE  ` tarea3 ` . ` empleados` _
AGREGAR �NDICE ` idPuesto_Puesto_Empleados_idx ` ( ` idPuesto `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` empleados` _
AGREGAR RESTRICCI�N ` idPuesto_Puesto_Empleados  `
  CLAVE EXTRANJERA ( ` idPuesto` )
  REFERENCIAS  ` tarea3` . _ ` puestos ` ( ` idPuesto ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

/* Tabla Ventas */
ALTER  TABLE  ` tarea3 ` . ` ventas` _
AGREGAR �NDICE ` idClientes_Clientes_Ventas_idx ` ( ` idClientes `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` ventas` _
AGREGAR RESTRICCI�N  ` idClientes_Clientes_Ventas `
  CLAVE EXTRANJERA ( ` idClientes` )
  REFERENCIAS  ` tarea3` . _ ` clientes ` ( ` idClientes ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

ALTER  TABLE  ` tarea3 ` . ` ventas` _
AGREGAR �NDICE ` idEmpleado_Empleados_Ventas_idx ` ( ` idEmpleado `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` ventas` _
AGREGAR RESTRICCI�N ` idEmpleado_Empleados_Ventas  `
  CLAVE EXTRANJERA ( ` idEmpleado ` )
  REFERENCIAS  ` tarea3` . _ ` empleados ` ( ` idEmpleado ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

/* Tabla Compras */
ALTER  TABLE  ` tarea3 ` . ` compras` _
AGREGAR �NDICE ` idProveedor_proveedores_compras_idx ` ( ` idProveedor `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` compras` _
ADD CONSTRAINT  ` idProveedor_proveedores_compras `
  CLAVE EXTRANJERA ( ` idProveedor` )
  REFERENCIAS  ` tarea3` . _ ` proveedores ` ( ` idProveedor ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

/* Tabla Productos */
ALTER  TABLE  ` tarea3 ` . ` productos `
AGREGAR �NDICE ` idMarca_marcas_productos_idx ` ( ` idMarca `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` productos `
AGREGAR RESTRICCI�N ` idMarca_marcas_productos  `
  CLAVE EXTRANJERA ( ` idMarca ` )
  REFERENCIAS  ` tarea3` . _ ` marcas ` ( ` idMarca ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

/* Tabla compras_detalle */
ALTER  TABLE  ` tarea3 ` . ` compras_detalle `
AGREGAR �NDICE ` idCompra_compras_compras_detalle_idx ` ( ` idCompra `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` compras_detalle `
AGREGAR RESTRICCI�N ` idCompra_compras_compras_detalle  `
  CLAVE EXTRANJERA ( ` idCompra ` )
  REFERENCIAS  ` tarea3` . _ ` compras ` ( ` idCompra ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

ALTER  TABLE  ` tarea3 ` . ` compras_detalle `
AGREGAR �NDICE ` idCompra_compras_productos_idx ` ( ` idProducto `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` compras_detalle `
AGREGAR RESTRICCI�N ` idCompra_compras_productos  `
  CLAVE EXTRANJERA ( ` idProducto ` )
  REFERENCIAS  ` tarea3` . _ ` productos ` ( ` idProducto ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

/* Tabla Ventas_detalle */
ALTER  TABLE  ` tarea3 ` . ` venta_detalle `
AGREGAR �NDICE ` idVenta_ventas_Venta_detalle_idx ` ( ` idVenta `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` venta_detalle `
A�ADIR RESTRICCI�N ` idVenta_venta_Ventas_detalle  `
  CLAVE EXTRANJERA ( ` idVenta` )
  REFERENCIAS  ` tarea3` . _ ` ventas ` ( ` idVenta ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

ALTER  TABLE  ` tarea3 ` . ` venta_detalle `
AGREGAR �NDICE ` idProducto_productos_veta_detalle_idx ` ( ` idProducto `  ASC ) VISIBLE;
;
ALTER  TABLE  ` tarea3 ` . ` venta_detalle `
AGREGAR RESTRICCI�N ` idProducto_productos_veta_detalle  `
  CLAVE EXTRANJERA ( ` idProducto ` )
  REFERENCIAS  ` tarea3` . _ ` productos ` ( ` idProducto ` )
  EN ELIMINAR SIN ACCI�N
  EN CASCADA DE  ACTUALIZACI�N ;

INSERTAR EN  tarea3 . puestos (puesto) valores ( ' contador ' );
INSERTAR EN  tarea3 . puestos (puesto) valores ( ' programador ' );
INSERTAR EN  tarea3 . puestos (puesto) valores ( ' vendedor 1 ' );
INSERTAR EN  tarea3 . puestos (puesto) valores ( ' vendedor 2 ' );
INSERTAR EN  tarea3 . puestos (puesto) valores ( ' gerente ' );

INSERTAR EN  tarea3 . clientes (nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) valores ( ' Erick Estuardo ' , ' Paredes Barahona ' , ' 10699622-3 ' , 1 , ' 1232455 ' , ' erick@gmail.com ' , ' 2022 -04-03 11:55:06 ' );
INSERTAR EN  tarea3 . clientes (nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) valores ( ' Roberto Rolando ' , ' Chiche Caal ' , ' 10708721-9 ' , 0 , ' 54631842 ' , ' robert@gmail.com ' , ' 2022 -05-01 11:55:06 ' );
INSERTAR EN  tarea3 . clientes (nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) valores ( ' Josue Jose ' , ' Chuy Fuentes ' , ' 2243471-2 ' , 1 , ' 46348239 ' , ' josue.quiroaa@gmail.com ' , ' 2022-03-02 13:55:06 ' );
INSERTAR EN  tarea3 . clientes (nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) valores ( ' Guillermo Joaquin ' , ' Quiroa Fernandez ' , ' 3138431-1 ' , 0 , ' 42689385 ' , ' guillermoq@gmail.com ' , ' 2022 -02-0 16:56:16 ' );
INSERTAR EN  tarea3 . clientes (nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) valores ( ' Carlos Daniel ' , ' Rivera Cipriano ' , ' 1063122-3 ' , 1 , ' 54179595 ' , ' carlos@gmail.com ' , ' 2021 -12-31 17:58:59 ' );

INSERTAR EN  tarea3 . empleados (nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso) valores ( ' Jhoshua Emanuel ' , ' Perez Vasquez ' , '25-52 zona 6 ' , ' 258593725 ' , ' 128395255 ' , 0 , ' 1999-12-25 ' , 2 , ' 2022-04-03 ' , ' 2022-04-03 11:55:06 ' );
INSERTAR EN  tarea3 . empleados (nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso) valores ( ' Angel David ' , ' Chamale Ruiz ' , ' 24-25 zona 3 ' , ' 258253725 ' , ' 121355255 ' , 0 , ' 1997-10-15 ' , 5 , ' 2021-05-23 ' , ' 2021-10-23 10:28:06 ' );
INSERTAR EN  tarea3 . empleados (nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso) valores ( ' Carlos David ' , ' Benitez Guerra ' , ' 37-54 zona 24 ' , ' 258591255 ' , ' 126395255 ' , 0 , ' 1999-11-26 ' , 4 , ' 2015-01-04 ' , ' 2015-01-04 11:55:06 ' );
INSERTAR EN  tarea3 . empleados (nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso) valores ( ' Maria Irene ' , ' Hoffens Bola�os ' , ' 37-54 zona 10 ' , ' 2583211255 ' , ' 1263313255 ' , 1 , ' 1996-12-31 ' , 3 , ' 2015-01-04 ' , ' 2015-01-04 16:54:06 ' );
INSERTAR EN  tarea3 . empleados (nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso) valores ( ' Yackeline Yasmin ' , ' Rivera Castillo ' , ' 71-51 zona 10 ' , ' 258312255 ' , ' 132145255 ' , 1 , ' 2000-11-25 ' , 5 , ' 2016-12-28 ' , ' 2016-12-18 11:50:06 ' );

INSERTAR EN  tarea3 . proveedores (proveedor,nit,direccion,telefono) valores ( ' COMECA ' , ' 35172-5 ' , ' Guatemala ' , ' 22003500 ' );
INSERTAR EN  tarea3 . proveedores (proveedor,nit,direccion,telefono) valores ( ' PAIZ ' , ' 737810-6 ' , ' Guatemala ' , ' 32185282 ' );
INSERTAR EN  tarea3 . proveedores (proveedor,nit,direccion,telefono) valores ( ' WALMART ' , ' 2582319-5 ' , ' Guatemala ' , ' 32182939 ' );
INSERTAR EN  tarea3 . proveedores (proveedor,nit,direccion,telefono) valores ( ' MACHETAZO ' , ' 228831-5 ' , ' Guatemala ' , ' 32138.2 ' );
INSERTAR EN  tarea3 . proveedores (proveedor,nit,direccion,telefono) valores ( ' PRISMA COLOR ' , ' 318282-5 ' , ' Guatemala ' , ' 13218221 ' );

INSERTAR EN  tarea3 . compras ( no_orden_compra ,idProveedor,fecha_orden,fechaingreso) valores ( 1425 , 3 , ' 2021-12-23 ' , ' 2022-01-24 11:54:25 ' );
INSERTAR EN  tarea3 . compras ( no_orden_compra ,idProveedor,fecha_orden,fechaingreso) valores ( 1624 , 2 , ' 2021-12-23 ' , ' 2022-01-24 11:54:25 ' );
INSERTAR EN  tarea3 . compras ( no_orden_compra ,idProveedor,fecha_orden,fechaingreso) valores ( 1855 , 1 , ' 2021-12-23 ' , ' 2022-01-24 11:54:25 ' );
INSERTAR EN  tarea3 . compras ( no_orden_compra ,idProveedor,fecha_orden,fechaingreso) valores ( 1624 , 4 , ' 2021-12-23 ' , ' 2022-01-24 11:54:25 ' );
INSERTAR EN  tarea3 . compras ( no_orden_compra ,idProveedor,fecha_orden,fechaingreso) valores ( 1352 , 5 , ' 2021-12-23 ' , ' 2022-01-24 11:54:25 ' );

INSERTAR EN  tarea3 . marcas (marca) valores ( ' ADIDAS ' );
INSERTAR EN  tarea3 . marcas (marca) valores ( ' FOREVER 21 ' );
INSERTAR EN  tarea3 . marcas (marca) valores ( ' VERSHCA ' );
INSERTAR EN  tarea3 . marcas (marca) valores ( ' PUMA ' );
INSERTAR EN  tarea3 . marcas (marca) valores ( ' STRADIVARIUS ' );

INSERTAR EN  tarea3 . productos (Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso) valores ( ' BLUSAS ' , 1 , ' TALLA S ' , ' BLANCA ' , ' 100 ' , ' 125 ' , 5 , ' 2022-04- 06 14:55:06 ' );
INSERTAR EN  tarea3 . productos (Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso) valores ( ' TENIS ' , 2 , ' TALLA 36 ' , ' NEGRO ' , ' 200 ' , ' 250 ' , 25 , ' 2022-03- 25 16:15:16 ' );
INSERTAR EN  tarea3 . productos (Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso) valores ( ' PANTALONES ' , 3 , ' TALLA S ' , ' AZULES ' , ' 300 ' , ' 325 ' , 56 , ' 2022-03- 15 11:06:15 ' );
INSERTAR EN  tarea3 . productos (Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso) valores ( ' BOTAS ' , 4 , ' TALLA 36 ' , ' CAFE ' , ' 250 ' , ' 300 ' , 10 , ' 2022-04- 06 16:55:06 ' );
INSERTAR EN  tarea3 . productos (Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso) valores ( ' BLUSAS ' , 5 , ' TALLA S ' , ' CREMA ' , ' 100 ' , ' 125 ' , 15 , ' 2022-06- 06 14:55:06 ' );

INSERTAR EN  tarea3 . compras_detalle (idCompra,idProducto,cantidad,precio_costo_unitario) valores ( 1 , 2 , 25 , ' 100.25 ' );
INSERTAR EN  tarea3 . compras_detalle (idCompra,idProducto,cantidad,precio_costo_unitario) valores ( 2 , 1 , 15 , ' 120.25 ' );
INSERTAR EN  tarea3 . compras_detalle (idCompra,idProducto,cantidad,precio_costo_unitario) valores ( 3 , 5 , 5 , ' 320.25 ' );
INSERTAR EN  tarea3 . compras_detalle (idCompra,idProducto,cantidad,precio_costo_unitario) valores ( 4 , 3 , 21 , ' 250.36 ' );
INSERTAR EN  tarea3 . compras_detalle (idCompra,idProducto,cantidad,precio_costo_unitario) valores ( 5 , 4 , 13 , ' 360.25 ' );

INSERTAR EN  tarea3 . ventas (nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso) valores ( 2536 , ' A ' , ' 2022-05-03 ' , 1 , 5 , ' 2022-05-03 16:25:06 ' );
INSERTAR EN  tarea3 . ventas (nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso) valores ( 2537 , ' A ' , ' 2022-04-03 ' , 2 , 4 , ' 2022-04-03 11:25:15 ' );
INSERTAR EN  tarea3 . ventas (nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso) valores ( 2538 , ' A ' , ' 2022-04-06 ' , 3 , 5 , ' 2022-04-06 16:25:06 ' );
INSERTAR EN  tarea3 . ventas (nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso) valores ( 2539 , ' A ' , ' 2022-04-11 ' , 4 , 5 , ' 2022-04-11 11:35:25 ' );
INSERTAR EN  tarea3 . ventas (nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso) valores ( 2540 , ' A ' , ' 2022-04-16 ' , 5 , 4 , ' 2022-04-16 08:25:17 ' );

INSERTAR EN  tarea3 . venta_detalle (idVenta,idProducto,cantidad,precio_unitario) valores ( 1 , 2 , ' 25 ' , ' 305.15 ' );
INSERTAR EN  tarea3 . venta_detalle (idVenta,idProducto,cantidad,precio_unitario) valores ( 2 , 1 , ' 28 ' , ' 400.00 ' );
INSERTAR EN  tarea3 . venta_detalle (idVenta,idProducto,cantidad,precio_unitario) valores ( 3 , 5 , ' 15 ' , ' 150.48 ' );
INSERTAR EN  tarea3 . venta_detalle (idVenta,idProducto,cantidad,precio_unitario) valores ( 4 , 3 , ' 10 ' , ' 205.54 ' );
INSERTAR EN  tarea3 . venta_detalle (idVenta,idProducto,cantidad,precio_unitario) valores ( 5 , 4 , ' 20 ' , ' 180.48 ' );


selecciona * de  tarea3 . venta_DETALLE ;
