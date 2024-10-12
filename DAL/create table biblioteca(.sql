create table biblioteca(
    ID_Biblioteca int not null auto_increment,
    Nombre_biblioteca varchar(255) not null,
    Direccion_biblioteca varchar(255),
    Telefono_biblioteca varchar(15)
);

create table Tipo_usuario(
    ID_tipo_usuario int not null auto_increment,
    Tipo_usuario varchar(50),
    Descripción_tipo_usuario varchar(255)
);
create table Pais(
    Codigo_Pais int not null,
    Codigo_ISO3 char(3),
    Nombre_Pais varchar(50),
    gentillicio_Pais varchar(50)
    primary key (codigo_pais)


);
create table Usuario(
    Id_usuario int not null auto_increment,
    Nombre_usuario varchar(255) not null,
    Correo_usuario varchar(255) not null unique,
    telefono_usuario varchar(15),
    Rut_usuario varchar (10) not null unique,
    Codigo_Pais int,
    habilitado int not null,
    ID_tipo_usuario int not null,
    fecha_creación datetime not null,
    primary key(id_usuario),
    constraint fk_Pais_Usuario foreign key(codigo_pais) references pais(codigo_pais),
    constraint fk_Tipo_usuario_Usuario foreign key(ID_tipo_usuario) references Tipo_usuario(ID_tipo_usuario)
    );
create table Autor(
    Id_autor int not null auto_increment,
    Nombre_Autor varchar (255) not null,
    suedonimo_autor varchar (50),
    codigo_pais int,
    Fecha_nacimiento date,
    Fecha_defunción date,
    biografia_autor Text,
    foto_autor blob,
    primary key(Id_autor)
    constraint fk_Pais_Autor foreign key (codigo_pais) references pais(codigo_pais),
    
);
create table libro(
    ISBN varchar(13) not null,
    titulo varchar(255) not null,
    Id_autor int,
    primary key (ISBN),
    constraint fk_autor_libro foreign key (Id_autor) references Autor(id_usuario),

);
create table Tipo_categoria(
    ID_tipo_categoria int not null auto_increment,
    Tipo_categoria varchar(50)
    primary key (id_tipo_categoria)
);
create table Categoria_libro(
    Id_categoria_libro int not null auto_increment,
    id_tipo_categoria int not null,
    Categoria_libro varchar(50) not null,
    descripcion_categoria varchar (255),
    primary key(Id_categoria_libro),
    constraint fk_Tipo_categoria_categoria_libro foreign key (id_tipo_categoria) references Tipo_categoria(id_tipo_categoria)
);
create table Editorial(
    id_editorial int not null auto_increment,
    nombre_editorial varchar(255),
    fecha_fundación date not null,
    codigo_pais int,
    telefono_contacto varchar (15),
    correo_contacto varchar (255) not null unique,
    primary key (id_editorial),
    constraint fk_Pais_Editorial foreign key (codigo_pais) references pais(codigo_pais)
);
create table Detalle_libro(
    id_detalle_libro int not null auto_increment,
    ISBN varchar(13) not null,
    fecha_edición date,
    id_editorial int not null,
    cantidad_ejemplares smallint not null,
    ejemplares_disponibles smallint not null,
    primary key (id_detalle_libro),
    constraint fk_libro_detalle_libro foreign key (ISBN) references libro(ISBN),
    constraint fk_editorial_detalle_libro foreign key(id_editorial) references editorial(id_editoria)
);
create table prestamos (
    id_prestamo int not null auto_increment
    id_detalle_libro INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_prestamo DATETIME NOT NULL,
    fecha_devolucion DATETIME NOT NULL,
    fecha_devuelto DATETIME,
    cantidad_solicitada TINYINT,
    PRIMARY KEY (id_prestamo),
    constraint fk_detalle_libro_prestamo foreign key(id_detalle_libro) references Detalle_libro(id_detalle_libro),
    constraint fk_usuario_prestamo foreign key (id_usuario) references usuario(id_usuario)
);

