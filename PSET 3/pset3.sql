/* o script pode ser feito dessas 2 maneiras*\
with recursive pset
as(select c.nome
from classificacao  c
where codigo_pai is null
union ALL
select c.nome
from classificacao c
inner join pset on codigo = codigo_pai
where codigo_pai is not null)
select codigo, codigo_pai, nome
from classificacao c 
order by codigo asc, codigo_pai asc;


select codigo, codigo_pai, nome
from classificacao c ;
order by codigo asc, codigo_pai asc;
