-- 1.    Quais são os valores máximo e mínimo das seguintes colunas:
-- o    total
select max(total) from pokemon; 

select min(total) from pokemon;

-- o    hp
select max(hp) from pokemon; 

select min(hp) from pokemon;

-- o    ataque
select max(ataque) from pokemon; 

select min(ataque) from pokemon;
 
-- o    defesa
select max(defesa) from pokemon; 

select min(defesa) from pokemon;

-- o    ataque_especial
select max(ataque_especial) from pokemon; 

select min(ataque_especial) from pokemon;

-- o    defesa_especial
select max(ataque_especial) from pokemon; 

select min(ataque_especial) from pokemon;

-- o    velocidade
select max(velocidade) from pokemon; 

select min(velocidade) from pokemon;

-- o    taxa_captura
select max(taxa_captura) from pokemon; 

select min(taxa_captura) from pokemon;

-- 2.    Quantas cores diferentes possuem os pokémons?
select  count(distinct cor) Quantidade  from pokemon ;

-- 3.    Qual é o peso médio dos pokémons?
select avg (peso_kg) from pokemon;

-- 4.    Qual é a soma das alturas dos pokémons?
select sum(altura_m) from pokemon;

-- 5.    Quantos pokémons estão cadastrados no banco de dados?
select count(nome) from pokemon;

-- 6.    Qual é o altura média dos pokémons?
select avg(altura_m) from pokemon;

-- 7.    Qual é o desvio padrão do valor de HP dos pokémons?
select std(hp) from pokemon;

-- 8.    Quantos pokémons possuem tipo2?
select count(tipo2) from pokemon;

-- 9.    Quantos são os diferentes tipos primários dos pokémons?
select  count(distinct tipo1) from pokemon;

-- 10.    Qual é a soma dos pesos dos pokémons?
select sum(peso_kg) from pokemon;

-- 11.    Qual é a quantidade de Pokémons lendários e não lendários
select count(nome) Lendario, (select count(nome)from pokemon where nome <> lendario) Nao_lendario 
from pokemon 
where nome = lendario;

-- 12.    Qual é a quantidade de pokémons para cada uma das diferentes cores ordenadas decrescente?
SELECT cor, COUNT(*) as quantidade
FROM pokemon
GROUP BY cor
ORDER BY quantidade desc;

-- 13.    Qual é a média de peso e altura de cada um dos tipos primários dos pokémons? 
-- Ordene os resultados decrescente respectivamente por média de peso e altura.
SELECT tipo1, avg (peso_kg) as med_peso, avg (altura_m) as med_altura
FROM pokemon
GROUP BY tipo1
ORDER BY med_peso, med_altura desc;

-- 14.    Qual é a taxa de captura média por cor de cada um dos pokémons lendários?
SELECT cor, avg (taxa_captura) taxa_captura_lendarios
FROM pokemon
where  lendario is not null
GROUP BY cor;

-- 15.    Qual os tipos primários que possuem a taxa de captura média acima de 100
select  tipo1, avg(taxa_captura)> 100 Taxa_Media
from pokemon
group by tipo1 ;

-- 16.    Agrupados por cor, quais pokémons não lendários possuem média total abaixo de 400
SELECT cor, nome , avg(total)< 400
FROM pokemon
where  nome <> lendario
GROUP BY cor;

-- 17.    Qual o valor máximo total em cada uma das gerações?
SELECT geracao, max(total) as valor_maximo
FROM pokemon
GROUP BY geracao;

-- 18.    Quantos pokémons lendários existem em cada uma das gerações?
SELECT geracao, count(lendario) as qtd_pokemon_lendarios
FROM pokemon
GROUP BY geracao;

-- 19.    Em cada uma das gerações, quantos pokémons tem tipos primários e secundários e qual a taxa_captura média deles?
SELECT geracao, count(nome) as quantidade, taxa_captura
FROM pokemon
where tipo1 is not null
 and tipo2 is not null 
GROUP BY geracao;

-- 20.    Qual é a quantidade de cores de cada um dos pokémons lendários em todas as gerações?
SELECT geracao, count(cor) as quantidade_cor
FROM pokemon
where lendario is not null
GROUP BY geracao;