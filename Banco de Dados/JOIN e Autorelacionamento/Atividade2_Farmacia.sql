USE Sprint2;

CREATE TABLE farmacia
(
idfarmacia INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
fkendereco INT UNIQUE,
fkfarmaceutico INT UNIQUE
);

CREATE TABLE endereco
(
idendereco INT PRIMARY KEY AUTO_INCREMENT,
endereco VARCHAR (90)
);

CREATE TABLE farmaceutico
(
idfarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45)
);

ALTER TABLE farmacia ADD CONSTRAINT fkfarend
FOREIGN KEY (fkendereco) REFERENCES endereco(idendereco);

ALTER TABLE farmacia ADD CONSTRAINT fkfarfarm
FOREIGN KEY (fkfarmaceutico) REFERENCES farmaceutico(idfarmaceutico);

INSERT INTO endereco VALUES

(DEFAULT,'Rua das Naçoes Unidas, 1229'),
(DEFAULT,'Avenida Brasil, 1500'),
(DEFAULT,'Rua Babonos Coshetes, 562'),
(DEFAULT,'Avenida Paulista, 105'),
(DEFAULT,'Angra dos Reis, 133');

INSERT INTO farmaceutico VALUES

(DEFAULT,'Fernando'),
(DEFAULT,'Marina'),
(DEFAULT,'Geralt'),
(DEFAULT,'Illidan'),
(DEFAULT,'Tyrande Malfurion');

INSERT INTO farmacia VALUES

(DEFAULT,'Drogasil',1,1),
(DEFAULT,'Drogaraia',2,2),
(DEFAULT,'Drogaria SP',3,3),
(DEFAULT,'Extrafarma',4,4),
(DEFAULT,'Drogas',5,5);

SELECT t1.nome as Nome_farmacia,
t2.endereco as Endereço,
t3.nome as Farmaceutico,
CASE WHEN t1.nome = 'Drogasil' THEN 'Farmácia cara'
WHEN t1.nome = 'Drogaria' THEN 'Farmácia pouco cara'
WHEN t2.endereco = 'Avenida Paulista, 105' THEN 'Na Paulista, é caro'
WHEN t3.nome = 'Geralt' THEN 'O Bruxo'
ELSE 'Sem referência'
END as Referências_farmaceuticas
FROM farmacia as t1 
JOIN endereco as t2 
ON t2.idendereco = t1.fkendereco
JOIN farmaceutico as t3
ON t3.idfarmaceutico = t1.fkfarmaceutico;

 UPDATE farmaceutico SET nome = null
 WHERE idfarmaceutico = 4;
 
 SELECT t1.nome as Nome_farmacia,
t2.endereco as Endereço,
t3.nome as Farmaceutico,
CASE WHEN t1.nome = 'Drogasil' THEN 'Farmácia cara'
WHEN t1.nome = 'Drogaria' THEN 'Farmácia pouco cara'
WHEN t2.endereco = 'Avenida Paulista, 105' THEN 'Na Paulista, é caro'
WHEN t3.nome = 'Geralt' THEN 'O Bruxo'
ELSE 'Sem referência'
END as Referências_farmaceuticas,
ifnull(t3.nome, 'Demitido') as 'Há um farmacêutico no comando?'
FROM farmacia as t1 
JOIN endereco as t2 
ON t2.idendereco = t1.fkendereco
JOIN farmaceutico as t3
ON t3.idfarmaceutico = t1.fkfarmaceutico;


