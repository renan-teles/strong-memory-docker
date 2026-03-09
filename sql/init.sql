USE strong_memory_db;

-- =========================
-- TABELAS
-- =========================

CREATE TABLE IF NOT EXISTS difficults(
	id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	difficulty VARCHAR(15) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS user_roles(
    id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(25) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS users (
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	role_id TINYINT NOT NULL,
	username VARCHAR(180) NOT NULL UNIQUE,
	email VARCHAR(120) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	FOREIGN KEY (role_id) REFERENCES user_roles(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS user_score_records(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id BIGINT NOT NULL,
	difficulty_id TINYINT NOT NULL,
	score INT DEFAULT 0,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	FOREIGN KEY (difficulty_id) REFERENCES difficults(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS words (
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	difficulty_id TINYINT NOT NULL,
	word VARCHAR(255) NOT NULL UNIQUE,
	INDEX(difficulty_id),
	FOREIGN KEY (difficulty_id) REFERENCES difficults(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS word_suggestions(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    suggested_word VARCHAR(255) NOT NULL,
    suggested_difficulty VARCHAR(15) NOT NULL,
	suggested_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX(suggested_at),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =========================
-- INSERTS
-- =========================

INSERT IGNORE INTO difficults (difficulty) VALUES
('easy'), 
('normal'), 
('hard');

INSERT IGNORE INTO user_roles(role) VALUES 
('ROLE_PLAYER'),
('ROLE_ADMINISTRATOR');

-- =========================
-- PALAVRAS
-- =========================

INSERT IGNORE INTO words (difficulty_id, word) VALUES
(1,'sol'),(1,'lua'),(1,'mar'),(1,'pai'),(1,'mãe'),(1,'rio'),(1,'céu'),(1,'ira'),
(1,'fé'),(1,'chá'),(1,'ovo'),(1,'pão'),(1,'mel'),(1,'sal'),(1,'bem'),(1,'mal'),
(1,'sim'),(1,'não'),(1,'dia'),(1,'mês'),(1,'ano'),(1,'lar'),(1,'rei'),(1,'lei'),
(1,'voz'),(1,'dor'),(1,'cor'),(1,'luz'),(1,'tia'),(1,'tio'),(1,'avó'),(1,'paz'),
(1,'bar'),(1,'rua'),(1,'pé'),(1,'ver'),(1,'ser'),(1,'ter'),(1,'ir'),(1,'vir'),
(1,'dar'),(1,'ler'),(1,'por'),(1,'fim'),(1,'ato'),(1,'asa'),(1,'emo'),(1,'elo'),
(1,'eco'),(1,'pá');

-- NORMAL
INSERT IGNORE INTO words (difficulty_id, word) VALUES
(2,'casa'),(2,'carro'),(2,'porta'),(2,'janela'),(2,'livro'),(2,'caderno'),
(2,'escola'),(2,'cidade'),(2,'amigo'),(2,'amiga'),(2,'família'),(2,'trabalho'),
(2,'dinheiro'),(2,'comida'),(2,'bebida'),(2,'mercado'),(2,'shopping'),
(2,'hospital'),(2,'igreja'),(2,'praia'),(2,'campo'),(2,'estrada'),
(2,'viagem'),(2,'feriado'),(2,'domingo'),(2,'segunda'),(2,'sábado'),
(2,'futebol'),(2,'cinema'),(2,'música'),(2,'notícia'),(2,'jornal'),
(2,'revista'),(2,'programa'),(2,'internet'),(2,'celular'),
(2,'computador'),(2,'teclado'),(2,'monitor'),(2,'mouse'),
(2,'energia'),(2,'natureza'),(2,'cultura'),(2,'história'),
(2,'educaçao'),(2,'governo'),(2,'empresa'),(2,'produto'),
(2,'cliente'),(2,'serviço');

-- DIFÍCIL
INSERT IGNORE INTO words (difficulty_id, word) VALUES
(3,'inconstitucionalidade'),
(3,'anticonstitucional'),
(3,'extraordinariamente'),
(3,'interdisciplinaridade'),
(3,'multidisciplinaridade'),
(3,'hiperresponsabilidade'),
(3,'contrarrevolucionário'),
(3,'incompatibilidade'),
(3,'imprevisibilidade'),
(3,'inquestionabilidade'),
(3,'irreversibilidade'),
(3,'incomensurabilidade'),
(3,'interoperabilidade'),
(3,'intransponibilidade'),
(3,'desproporcionalidade'),
(3,'contraditoriedade'),
(3,'incongruência'),
(3,'inexorabilidade'),
(3,'imponderabilidade'),
(3,'impenetrabilidade'),
(3,'imperceptibilidade'),
(3,'intangibilidade'),
(3,'indeterminabilidade'),
(3,'inexpugnabilidade'),
(3,'indissociabilidade'),
(3,'imputabilidade'),
(3,'incompreensibilidade'),
(3,'incognoscibilidade'),
(3,'irrepreensibilidade'),
(3,'interdependência'),
(3,'contradistinção'),
(3,'irreconciliável'),
(3,'insubordinação'),
(3,'intransigência'),
(3,'contraproducente'),
(3,'descaracterização'),
(3,'despropositadamente'),
(3,'superdimensionamento'),
(3,'subdesenvolvimento'),
(3,'sobrecarregamento'),
(3,'desestabilização'),
(3,'descontinuidade'),
(3,'heterogeneidade'),
(3,'homogeneização'),
(3,'inadequabilidade'),
(3,'irretratabilidade'),
(3,'irrefutabilidade'),
(3,'incomunicabilidade'),
(3,'impossibilidade'),
(3,'desproporcional');