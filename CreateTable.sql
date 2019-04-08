CREATE DATABASE MDASDYOBBDD_ARTYENC
GO

USE MDASDYOBBDD_ARTYENC
GO

IF OBJECT_ID('dbo.Cliente', 'U') IS NOT NULL  
  DROP TABLE dbo.Cliente  
GO
IF OBJECT_ID('dbo.Articulo', 'U') IS NOT NULL  
  DROP TABLE dbo.Articulo  
GO
IF OBJECT_ID('dbo.Pedido', 'U') IS NOT NULL  
  DROP TABLE dbo.Pedido  
GO
IF OBJECT_ID('dbo.Fabrica', 'U') IS NOT NULL  
  DROP TABLE dbo.Fabrica  
GO
IF OBJECT_ID('dbo.Ciudad', 'U') IS NOT NULL  
  DROP TABLE dbo.Ciudad  
GO
IF OBJECT_ID('dbo.DireccionEnvio', 'U') IS NOT NULL  
  DROP TABLE dbo.DireccionEnvio  
GO

CREATE TABLE [dbo].[Cliente](
    [IDCliente] [int] NOT NULL,
    [Saldo] [int] NOT NULL DEFAULT 0,
    [LimiteCredito] [int] NOT NULL DEFAULT 0,
    [Descuento] [int] NOT NULL DEFAULT 0,
	CONSTRAINT PK_Cliente PRIMARY KEY (IDCliente)  
)
GO

CREATE TABLE [dbo].[Articulo](
    [IDArticulo] [int] NOT NULL,
    [Descripcion] VARCHAR(50) NULL,
	CONSTRAINT PK_Articulo PRIMARY KEY (IDArticulo)  
)
GO

CREATE TABLE [dbo].[Pedido](
    [IDPedido] [int] NOT NULL,
    [Fecha] DATETIME NOT NULL DEFAULT GETDATE(),
	[IDArticulo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL DEFAULT 0,
	[IDCliente] [int] NOT NULL,
	CONSTRAINT PK_Pedido PRIMARY KEY (IDPedido),
	CONSTRAINT FK_ArticuloPedido FOREIGN KEY (IDArticulo)  REFERENCES Articulo(IDArticulo),
	CONSTRAINT FK_ClientePedido FOREIGN KEY (IDCliente)  REFERENCES Cliente(IDCliente)
)
GO

CREATE TABLE [dbo].[Fabrica](
    [IDFabrica] [int] NOT NULL,
    [Telefono] [int] NOT NULL,
    [CantArtsProvistos] [int] NOT NULL DEFAULT 0,
	[IDArticulo] [int] NOT NULL,
	CONSTRAINT PK_FabricaFabrica PRIMARY KEY (IDFabrica), 
	CONSTRAINT FK_ArticuloFabrica FOREIGN KEY (IDArticulo)  REFERENCES Articulo(IDArticulo)	
)
GO


CREATE TABLE [dbo].[Ciudad](
    [IDCiudad] [int] NOT NULL,
    [Nombre] VARCHAR(50) NULL,
	CONSTRAINT PK_Ciudad PRIMARY KEY (IDCiudad)  
)
GO



CREATE TABLE [dbo].[DireccionEnvio](
    [IDDireccion] [int] NOT NULL,
    [Numero] [int] NOT NULL,
    [Calle] [int] NOT NULL,
    [Comuna] VARCHAR(30) NULL,
	[Ciudad] VARCHAR(30) NULL,
	[IDCliente] [int] NOT NULL,
    [IDPedido] [int] NOT NULL,
	[IDCiudad] [int] NOT NULL,
	CONSTRAINT PK_DireccionEnvio PRIMARY KEY (IDDireccion),
	CONSTRAINT FK_ClienteDireccion FOREIGN KEY (IDCliente)  REFERENCES Cliente(IDCliente),
	CONSTRAINT FK_PedidoDireccion	FOREIGN KEY (IDPedido)  REFERENCES Pedido(IDPedido),
	CONSTRAINT FK_CiudadDireccion FOREIGN KEY (IDCiudad)  REFERENCES Ciudad(IDCiudad)
)
GO