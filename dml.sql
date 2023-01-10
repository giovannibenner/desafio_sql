DELETE FROM producao.Inspecao;
DBCC CHECKIDENT ('producao.Inspecao', RESEED, 1);

DELETE FROM producao.Produto;
DBCC CHECKIDENT ('producao.Produto', RESEED, 1);

DELETE FROM producao.Ficha;
DBCC CHECKIDENT ('producao.Ficha', RESEED, 1);

DELETE FROM producao.Inspetor;
DBCC CHECKIDENT ('producao.Inspetor', RESEED, 1);

DELETE FROM producao.Avaliacao;

DELETE FROM producao.Tipo_Produto;
DBCC CHECKIDENT ('producao.Tipo_Produto', RESEED, 1);

begin transaction;
	INSERT INTO producao.Tipo_Produto(nm_tipo_produto) VALUES
		('Geladeira'), ('Maquina de Lavar'), ('Fogao'), ('Freezer'), ('Frigobar');
commit;

begin transaction;
	INSERT INTO producao.Avaliacao(cd_avaliacao, nm_avaliacao) VALUES 
		('OK', 'Liberado'), ('EL', 'Problema Eletrico'), ('PT', 'Problema de Pintura'),
		('PE', 'Problema na Estrutura'), ('TR', 'Todo Rejeitado'); 
commit;

begin transaction;
	INSERT INTO producao.Inspetor(nm_inspetor) VALUES 
    	('Mateus Balao'), ('Lucas Cantoni'), ('Carol Sato'), ('Trancoso Da Silva'), ('Maria Garcia');   
commit;

begin transaction;
	INSERT INTO producao.Ficha(dt_inspecao, cd_matricula) VALUES
		('20221201', 1), ('20221211', 1), ('20221221', 1),
		('20221202', 2), ('20221212', 2), ('20221222', 2),
		('20221203', 3), ('20221209', 3), ('20221213', 3),
		('20221204', 4), ('20221207', 4), ('20221216', 4),
		('20221205', 5), ('20221213', 5), ('20221219', 5);
commit;

begin transaction;
	INSERT INTO producao.Produto(cd_linha_producao, aa_producao, cd_tipo_produto) VALUES
		( 1, 22, 1), ( 1, 22, 1), ( 1, 22, 2), ( 1, 22, 2), ( 1, 22, 3), ( 1, 22, 3), ( 1, 22, 4), ( 1, 22, 4), ( 1, 22, 5), ( 1, 22, 5), 
		( 2, 22, 1), ( 2, 22, 1), ( 2, 22, 2), ( 2, 22, 2), ( 2, 22, 3), ( 2, 22, 3), ( 2, 22, 4), ( 2, 22, 4), ( 2, 22, 5), ( 2, 22, 5), 
		( 3, 22, 1), ( 3, 22, 1), ( 3, 22, 2), ( 3, 22, 2), ( 3, 22, 3), ( 3, 22, 3), ( 3, 22, 4), ( 3, 22, 4), ( 3, 22, 5), ( 3, 22, 5), 
		( 4, 22, 1), ( 4, 22, 1), ( 4, 22, 2), ( 4, 22, 2), ( 4, 22, 3), ( 4, 22, 3), ( 4, 22, 4), ( 4, 22, 4), ( 4, 22, 5), ( 4, 22, 5); 
commit;

begin transaction;
	INSERT INTO producao.Inspecao(cd_ficha, cd_produto, linha_produto, aa_produto, cd_avaliacao, hr_inspecao) VALUES 
		( 1, 1, 1, 22, 'OK', '09:03'),   ( 1, 3, 1, 22, 'OK', '09:36'),   ( 1, 5, 1, 22, 'EL', '10:05'),   ( 1, 7, 1, 22, 'PT', '10:40'), 
		( 4, 9, 1, 22, 'TR', '09:15'),   ( 4, 2, 1, 22, 'OK', '09:43'),   ( 4, 4, 1, 22, 'OK', '10:12'),   ( 4, 6, 1, 22, 'PE', '10:51'), 
		( 7, 8, 1, 22, 'OK', '09:07'),   ( 7, 10, 1, 22, 'PE', '09:24'),  ( 7, 11, 2, 22, 'OK', '09:49'),  ( 7, 13, 2, 22, 'EL', '10:14'), 
		( 10, 15, 2, 22, 'OK', '09:10'), ( 10, 17, 2, 22, 'OK', '09:36'), ( 10, 19, 2, 22, 'OK', '09:58'), ( 10, 12, 2, 22, 'PT', '10:25'), 
		( 13, 14, 2, 22, 'PE', '09:05'), ( 13, 16, 2, 22, 'OK', '09:22'), ( 13, 18, 2, 22, 'EL', '09:57'), ( 13, 20, 2, 22, 'OK', '10:19'), 
		( 11, 21, 3, 22, 'OK', '09:12'), ( 11, 23, 3, 22, 'TR', '09:32'), ( 11, 25, 3, 22, 'PT', '10:00'), ( 11, 27, 3, 22, 'OK', '10:31'), 
		( 8, 29, 3, 22, 'EL', '09:04'),  ( 8, 22, 3, 22, 'OK', '09:27'),  ( 8, 24, 3, 22, 'PT', '09:53'),  ( 8, 26, 3, 22, 'OK', '10:25'), 
		( 2, 28, 3, 22, 'PT', '09:12'),  ( 2, 30, 3, 22, 'PE', '09:33'),  ( 2, 31, 4, 22, 'OK', '10:01'),  ( 2, 33, 4, 22, 'PE', '10:33'), 
		( 5, 35, 4, 22, 'OK', '09:09'),  ( 5, 37, 4, 22, 'OK', '09:30'),  ( 5, 39, 4, 22, 'EL', '10:02'),  ( 5, 32, 4, 22, 'TR', '10:27'), 
		( 9, 34, 4, 22, 'EL', '09:11'),  ( 9, 36, 4, 22, 'OK', '09:37'),  ( 9, 38, 4, 22, 'PT', '09:59'),  ( 9, 40, 4, 22, 'OK', '10:19'), 
		( 14, 5, 1, 22, 'OK', '09:05'),  ( 14, 7, 1, 22, 'OK', '09:21'),  ( 14, 9, 1, 22, 'EL', '09:56'),  ( 14, 6, 1, 22, 'PT', '10:21'), 
		( 12, 10, 1, 22, 'OK', '09:07'), ( 12, 13, 2, 22, 'OK', '09:24'), ( 12, 12, 2, 22, 'OK', '09:32'), ( 12, 14, 2, 22, 'OK', '09:55'), 
		( 15, 18, 2, 22, 'PE', '09:11'), ( 15, 23, 3, 22, 'EL', '09:37'), ( 15, 25, 3, 22, 'OK', '10:00'), ( 15, 29, 3, 22, 'OK', '10:13'), 
		( 3, 24, 3, 22, 'OK', '09:04'),  ( 3, 28, 3, 22, 'OK', '09:19'),  ( 3, 30, 3, 22, 'EL', '09:47'),  ( 3, 33, 4, 22, 'OK', '10:03'), 
		( 6, 39, 4, 22, 'OK', '09:06'),  ( 6, 32, 4, 22, 'EL', '09:22'),  ( 6, 34, 4, 22, 'OK', '09:39'),  ( 6, 38, 4, 22, 'OK', '09:59');
commit;