-- Questão 01
SELECT nome_departamento, avg(salario)
FROM funcionario AS f, departamento
GROUP BY nome_departamento
HAVING avg(salario);

-- Questão 02
SELECT sexo, AVG(salario) AS media_salarial
FROM funcionario
WHERE sexo = "M"
UNION
SELECT sexo, AVG(salario)
FROM funcionario
END
WHERE sexo = "F";

-- Questão 03
SELECT  nome_departamento,  primeiro_nome, nome_meio, ultimo_nome,
data_nascimento, 2022 - year(data_nascimento), salario
From  funcionario, departamento
WHERE funcionario.numero_departamento = departamento.numero_departamento;

-- Questão 04 
SELECT primeiro_nome, nome_meio, ultimo_nome, data_nascimento, 2022 -year(funcionario.data_nascimento) AS idade, salario, salario * 1.15 AS 'ajuste_salario'
FROM funcionario
WHERE salario >= 35000.00 
UNION
SELECT primeiro_nome, nome_meio, ultimo_nome, data_nascimento, 2022 -year(funcionario.data_nascimento) AS idade, salario, salario * 1.2 
FROM funcionario
WHERE salario < 35000.00

-- Questão 05
SELECT departamento.nome_departamento, f.primeiro_nome as nome_funcionario, funcionario.primeiro_nome as nome_gerente
FROM departamento as d join funcionario as f on (d.numero_departamento = f.numero_departamento)
JOIN departamento join funcionario on (departamento.cpf_gerente = funcionario.cpf)
WHERE departamento.nome_departamento = d.nome_departamento
ORDER BY d.nome_departamento ASC, f.salario DESC;

-- Questão 06
SELECT  primeiro_nome, nome_meio, ultimo_nome,
nome_departamento, nome_dependente, 2022 - year(dependente.data_nascimento), dependente.sexo,
CASE 
WHEN dependente.sexo = 'M' THEN 'Masculino'
WHEN dependente.sexo = 'F' THEN 'Feminino'
END AS SEXO
FROM  funcionario, dependente, departamento
WHERE funcionario.numero_departamento = departamento.numero_departamento AND 
dependente.cpf_funcionario = cpf;

-- Questão 07
SELECT primeiro_nome, nome_meio, ultimo_nome, salario, numero_departamento
FROM funcionario
WHERE cpf_supervisor IS NULL

-- Questão 08
SELECT nome_departamento, nome_projeto, primeiro_nome, nome_meio, ultimo_nome, horas
FROM funcionario, departamento, projeto, trabalha_em
WHERE funcionario.cpf = trabalha_em.cpf_funcionario
AND trabalha_em.numero_projeto = projeto.numero_projeto
AND funcionario.numero_departamento = departamento.numero_departamento
ORDER BY departamento.numero_departamento, nome_projeto, primeiro_nome;

-- Questão 09
SELECT  nome_departamento, nome_projeto, SUM(horas) AS total_horas
FROM projeto, departamento, trabalha_em;

-- Questão 10
SELECT nome_departamento, avg(salario)
FROM funcionario AS f, departamento
GROUP BY nome_departamento
HAVING avg(salario);

-- Questão 11
SELECT primeiro_nome, nome_meio, ultimo_nome, p.nome_projeto, horas * 50 as valor_horas
FROM funcionario join projeto as p join trabalha_em as t on (p.numero_projeto = t.numero_projeto)
WHERE funcionario.cpf = t.cpf_funcionario 
ORDER BY funcionario.primeiro_nome;

-- Questão 12
SELECT  nome_departamento, nome_projeto, primeiro_nome
FROM departamento, projeto, funcionario, trabalha_em
WHERE trabalha_em.horas is null and trabalha_em.numero_projeto = projeto.numero_projeto and departamento.numero_departamento
= projeto.numero_departamento;

-- Questão 13 
SELECT primeiro_nome, nome_meio, ultimo_nome, 2022 -year(funcionario.data_nascimento) AS idade ,funcionario.sexo, nome_dependente, dependente.sexo, 2022 -year(dependente.data_nascimento) AS idade
FROM funcionario 
LEFT JOIN dependente on(cpf_funcionario = cpf)
ORDER BY idade desc;

-- Questão 14
SELECT f.numero_departamento, d.nome_departamento, COUNT(*) AS total_por_departamento 
FROM funcionario as f join departamento as d on (f.numero_departamento = d.numero_departamento)
GROUP BY numero_departamento;

-- Questão 15
SELECT f.primeiro_nome, f.nome_meio, f.ultimo_nome, d.nome_departamento, p.nome_projeto
FROM funcionario AS f 
inner join departamento d on (d.cpf_gerente = f.cpf)
inner join trabalha_em t on (t.cpf_funcionario = f.cpf)
inner join projeto p on (p.numero_projeto = t.numero_projeto);



