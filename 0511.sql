use master;
go
drop database Pedido_de_Compra


create database Pedido_de_Compra;
go
use Pedido_de_Compra;
go

create table cliente 
	(id_clie	integer			primary key,
	 nm_clie	varchar(60)		not null,
	 doc_clie	varchar(15)		not null,
	 dtnas_clie	date			not null);
go

create table pagamento
	(id_pgto	integer			primary key,
	dsc_pgto	varchar(30)		not null);
go

create table pedido
	(id_ped						integer			primary key,
	 pagamento_id_pgto			integer			not null,
	 cliente_id_clie			integer			not null,
	 dt_ped						date			not null,
	 tot_ped					numeric(10,2)	not null
	 
	 constraint pag_id_fk foreign key	(pagamento_id_pgto) references pagamento  (id_pgto),
	 constraint clie_id_fk foreign key	(cliente_id_clie) references cliente  (id_clie));
 go

create table produto
	(id_prod	integer			primary key,
	 dsc_prod	varchar (40)	not null,
	 vl_prod	numeric (9,2)	not null);
go

create table item_pedido
	(pedido_id_ped				integer				not null, 
	 produto_id_prod			integer				not null,
	 qtd_item_ped		numeric(7,2)	not null,
	 vl_item_ped		numeric(9,2)    not null
	 
	 constraint pedido_id_fk  foreign key	(pedido_id_ped)  references pedido (id_ped),
	 constraint produto__id_fk foreign key  (produto_id_prod) references produto (id_prod));
go

INSERT INTO cliente (id_clie, nm_clie, doc_clie, dtnas_clie )
VALUES (33,'Rony','asdadad','2003-01-03'),
	   (12,'Claudio','gfd','2001-02-05'),
	   (02,'Felipe','gfhdh','1999-07-15'),
	   (06,'Thais','ghffh','2003-08-15'),
	   (05,'Rafaela','fghfgh','2002-06-21');

INSERT INTO pagamento(id_pgto, dsc_pgto)
VALUES	(1,'Batata podre'),
		(2,'Feijão verde'),
		(3,'Arroz azulado');


INSERT INTO produto (id_prod, dsc_prod, vl_prod)
VALUES	(1,'Lava louça top de linha',15.99),
		(2,'Toalha smart fit',59.99),
		(3,'Secador Turbo Optico',75.80),
		(4,'Oculos de Sol',13.00),
		(5,'',),
		(6,'',),
		(7,'',),
		(8,'',),
		(9,'',),
		(10,'',);

INSERT INTO pedido

		/* Seleção de Dados Cliente */
select id_clie 'ID Cliente', nm_clie 'Nome', doc_clie 'Documento', 
       dtnas_clie 'Data de nascimento'
	from cliente
		/* Seleção de Dados pagamento */
select id_pgto 'ID Pagamento', dsc_pgto 'Descrição Pagamento'
	from pagamento