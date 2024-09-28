USE sprint2;

CREATE TABLE aluno
(
idaluno INT PRIMARY KEY AUTO_INCREMENT,
fkmonitor INT UNIQUE,
nome VARCHAR (45)
);

ALTER TABLE aluno ADD CONSTRAINT fkalunomonitor
FOREIGN KEY (fkmonitor) REFERENCES aluno(idaluno);

INSERT INTO aluno VALUES

(DEFAULT,1,'Isa'),
(DEFAULT,2,'David'),
(DEFAULT,3,'Victor'),
(DEFAULT,4,'Julia'),
(DEFAULT,5,'Fernando');

SELECT t1.nome as Nome_aluno,
CASE WHEN t1.nome = 'Julia' THEN 'Monitora de CSS'
	 WHEN t1.nome = 'Fernando' THEN 'monitor de CSS'
     WHEN t1.nome = 'Victor' THEN 'Monitor'
     ELSE 'A caminho de ser um monitor'
     END as Monitores,
	ifnull(t1.nome, 'Em busca de líderes pedagócicos') as 'Oportunidade preenchida por quem?'
    FROM aluno as t1
    JOIN aluno as m1
    ON t1.idaluno = m1.fkmonitor;