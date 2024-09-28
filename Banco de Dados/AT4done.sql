USE sprint2;

CREATE TABLE rgpessoa
(
idrgpessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
fkpai INT,
fkmae INT 
);

ALTER TABLE rgpessoa ADD CONSTRAINT fkpessoapai
FOREIGN KEY (fkpai) REFERENCES rgpessoa(idrgpessoa);

ALTER TABLE rgpessoa ADD CONSTRAINT fkpessoamae
FOREIGN KEY (fkmae) REFERENCES rgpessoa(idrgpessoa);


INSERT INTO rgpessoa  VALUES

(DEFAULT,'Patrick',1,1),
(DEFAULT,'Pedro',2,2),
(DEFAULT,'Gnar',3,3),
(DEFAULT,'Sandra',4,4),
(DEFAULT,'Donello',5,5);

SELECT * FROM rgpessoa;

SELECT filho.nome as filho,
CASE WHEN filho.nome = 'Patrick' THEN 'Diabetico'
WHEN filho.nome = 'Pedro' THEN 'Pai'
WHEN filho.nome = 'Sandra' THEN 'Mãe'
ELSE 'Filho'
END as Arvore_Genealógica,
CASE WHEN filho.fkpai = 1 THEN 'Pedro'
End as Pai,
CASE WHEN filho.fkmae = 1 THEN 'Sandra'
END as Mãe,
ifnull(filho.fkmae,'Nasceu como?') as 'Se vazio, deletar a pessoa'
FROM rgpessoa as filho
JOIN rgpessoa as pai
ON filho.idrgpessoa = pai.fkpai
JOIN rgpessoa as mae
ON filho.idrgpessoa = mae.fkmae;

