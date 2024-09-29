USE sprint2;

CREATE TABLE pessoa (
idpessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
categoria CHAR (3)
);
INSERT INTO pessoa VALUES

(DEFAULT,'Patrick','A'),
(DEFAULT,'Vivian','B'),
(DEFAULT,'Isa','A'),
(DEFAULT,'Apollo','A'),
(DEFAULT,'Sandra','B'),
(DEFAULT,'Ana Carolina','A'),
(DEFAULT,'Seu Jorge','B'),
(DEFAULT,'Etham','A'),
(DEFAULT,'Bezerra da Silva','ACC');


CREATE TABLE cnh (
idCnh INT PRIMARY KEY AUTO_INCREMENT,
nome_motorista VARCHAR (45),
fkpessoa INT UNIQUE
) AUTO_INCREMENT = 100;

ALTER TABLE cnh ADD CONSTRAINT fkCNHpessoa
FOREIGN KEY (fkpessoa) REFERENCES pessoa(idPessoa);

INSERT INTO cnh values 
(DEFAULT,'Bezerra da Silva',9),
(DEFAULT,'Etham',8),
(DEFAULT,'Seu Jorge',7),
(DEFAULT,'Ana Carolina',6),
(DEFAULT,'Sandra',5),
(DEFAULT,'Apollo',4),
(DEFAULT,'Isa',3),
(DEFAULT,'Vivian',2),
(DEFAULT,'Patrick',1);



SELECT t1.nome as pessoa_aprovada, 
t2.nome_motorista as Nome_motorista
FROM pessoa as t1
JOIN cnh as t2
ON t1.idpessoa = t2.fkpessoa;
	
SELECT t1.nome as nome_pessoa,
t2.nome_motorista as pessoa_vinculada,
CASE WHEN t1.nome = 'Vivian' THEN 'Simplesmente usuária ROOT'
	WHEN t1.nome = 'Seu Jorge' THEN 'É isso aí'
    WHEN t1.nome = 'Ana Carolina' THEN 'Voz maravilhosa'
    ELSE 'A caminho de ser os melhores'
    END as apelidos_carinhosos
    FROM pessoa as t1
    JOIN cnh as t2
    ON t1.idpessoa = t2.fkpessoa;
    
UPDATE pessoa SET nome = null
WHERE idpessoa = 1;

SELECT t1.nome as pessoa_aprovada,
t2.nome_motorista as pessoa_vinculada,
CASE WHEN t1.nome = 'Vivian' THEN 'Join é bunda'
WHEN t1.nome = 'Isa' THEN 'Esconder o rosto nas piadas da Vivian'
WHEN t1.nome = 'Etham' THEN 'Cantor não famoso'
ELSE 'Uma galera do bem'
END as CNH_exercício1,
ifnull(t1.nome, 'Alguma coisa de errado não está certo') as 'Coletar_nome'
FROM pessoa as t1
JOIN cnh as t2
ON t1.idpessoa = t2.fkpessoa;