DROP DATABASE desafio; -- excluir a base para recriar

CREATE DATABASE desafio;
USE desafio;

CREATE SCHEMA producao;

CREATE TABLE producao.Tipo_Produto(
	cd_tipo_produto INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nm_tipo_produto VARCHAR(50) NOT NULL
);

CREATE TABLE producao.Avaliacao(
	cd_avaliacao VARCHAR(2) NOT NULL PRIMARY KEY,
	nm_avaliacao VARCHAR(50) NOT NULL
);

CREATE TABLE producao.Inspetor(
	cd_matricula INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nm_inspetor VARCHAR(50) NOT NULL
);

CREATE TABLE producao.Ficha(
	cd_ficha INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	dt_inspecao DATE NOT NULL,
	cd_matricula INT NOT NULL,
	FOREIGN KEY (cd_matricula) REFERENCES
                    producao.Inspetor(cd_matricula)
		ON DELETE CASCADE
);

CREATE TABLE producao.Produto(
	cd_produto INT NOT NULL IDENTITY(1,1),
	cd_linha_producao INT NOT NULL,
	aa_producao INT NOT NULL,
	cd_tipo_produto INT NOT NULL,
	FOREIGN KEY (cd_tipo_produto) REFERENCES
                    producao.Tipo_Produto(cd_tipo_produto)
		ON DELETE CASCADE,
	PRIMARY KEY(cd_produto, cd_linha_producao, aa_producao)
);

CREATE TABLE producao.Inspecao(
	cd_inspecao INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	cd_ficha INT NOT NULL,
	cd_produto INT NOT NULL,
	linha_produto INT NOT NULL,
	aa_produto INT NOT NULL,
	cd_avaliacao VARCHAR(2) NOT NULL,
	hr_inspecao TIME,
	FOREIGN KEY (cd_ficha) REFERENCES
                    producao.Ficha(cd_ficha) 
		ON DELETE CASCADE,
	FOREIGN KEY (cd_produto, linha_produto, aa_produto) REFERENCES
                    producao.Produto(cd_produto, cd_linha_producao, aa_producao)
		ON DELETE CASCADE,
	FOREIGN KEY (cd_avaliacao) REFERENCES
                    producao.Avaliacao(cd_avaliacao)
		ON DELETE CASCADE
);