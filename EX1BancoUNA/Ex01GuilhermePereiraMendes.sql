
## Consultas

##1. Selecione o banco de dados (esquema) `pokédex`.

##```sql
use pokedex; -- Selecionar banco de dados 
##--```

##--2. Obtenha informações da estrutura da tabela `Pokémon`.

##--```sql
desc pokemon ; -- Carregar a Tabela 
##--```

##--3. Selecione todos os pokémons cadastrados no banco de dados.

##```sql
select * from pokemon ; 
##--```

##--4. Selecione o `numero`, `nome`, `cor`, `altura_m` e `peso_kg` de todos os pokémons cadastrados.

##--```sql
select numero, nome, cor, altura_m , peso_kg from pokemon ;
##--```

##--5. Qual é o `numero` e o `nome` de todos os pokémons da primeira geração?

##--```sql
select numero , nome from pokemon
where geracao = 1 ;
##--```

##--6. Quais são os pokémons `Amarelo` da primeira geração?

##--```sql
select nome from pokemon
where geracao = '1'
and cor = 'amarelo' ;

##--```

##--7. Qual é o pokémon mais forte?

##--```sql
select nome from pokemon
where total = (select max(total) from pokemon)

##--```

##--8. Selecione o `numero`, `nome` e `tipo1`; de todos os pokémons cujo tipo primário é `Fire`.

##--```sql
select numero, nome, tipo1 from pokemon
where tipo1 = 'Fire'

##--```

##--10. Selecione em ordem decrescente o `numero`, `nome` e `defesa` de todos os pokémons.

##--```sql
select numero, nome, defesa from pokemon
order by 1,2,3

##--```


##--11. Qual o pokémon possui *menor* taxa de captura? Selecione apenas `numero` e `nome`.

##--```sql
select numero, nome from pokemon 
where taxa_captura = (select max(taxa_captura) from pokemon)

##--```

##--12. Selecione todos pokémons que não possuem tipo secundário, ou seja, `tipo2`.

##--```sql
select nome from pokemon
where tipo2 is null 
##--```

##--13. Selecione `numero`, `nome`, `tipo1`, `tipo2` de todos os pokémons que possuem o peso entre 100kg e 500kg.

##--```sql
select numero, nome, tipo1, tipo2 from pokemon
where peso_kg BETWEEN 100 AND 500;

##--```


##--14. Crie um ranking dos top 10 pokémons mais velozes, contendo `numero`, `nome` e `velocidade`.

##--```sql
select numero, nome, velocidade from pokemon  
order by 3 desc LIMIT 10
##--``` 


##--15. Selecione `numero`, `nome`, `tipo1`, `tipo2`, `taxa_captura` dos pokémons que possuem os dois tipos e tenham uma taxa de captura acima de 100. Ordene os resultados decrescente pela taxa de captura.

##--```sql
select numero, nome, tipo1, tipo2, taxa_captura from pokemon
where tipo1 is not null
and tipo2 is not null
and taxa_captura > '100'

##--```

##--16. Quais são os tipos primários dos pokémons?

##--```sql
select tipo1 from pokemon 
##--```

##--17. Selecione o `numero`, `nome` e `cor`; de todos os pokémons que o nome começa com a letra `D`.

##--```sql
select numero, nome, cor from pokemon
where nome LIKE 'd%'
##--```

##--18. Qual é o pokémon mais poderoso de todas as gerações?

##--```sql
select nome from pokemon
where total = (select max(total) from pokemon)
##--```

##--19. Selecione o `numero`, `nome`, `defesa`, `ataque` dos pokémons com defesa > 60 e ataque <= 70; ordenados decrescente pelo `total`. 

##--```sql
select numero, nome, defesa, ataque from pokemon
where defesa BETWEEN '60' AND '70'
order by total desc
##--```

##--20. Selecione todos os pokémons do tipo `Planta` e `Venenoso` que não sejam `Green`, ordenado crescente pelo `nome`.

##--```sql
select nome, cor from pokemon 
where tipo1 = 'planta'
or tipo1 = 'venenoso'
and cor != 'green';
##--```

##--21. Selecione de maneira crescente os nomes dos pokémons que possuem a letra y na 4ª posição do nome.

##--```sql
select nome from pokemon
where nome LIKE '___d%'
order by 1 
##--```

##--22. Qual é o maior valor de `ataque_especial` cadastrado?

##--```sql
select max(ataque_especial) from pokemon
##--```

##--23. Selecione o `numero`, `nome` e `altura_m` dos pokémons que possuem altura acima de 2,10m.

##--```sql
select numero, nome, altura_m from pokemon
where altura_m > '2,10'
order by 2

##--24. Quais são as diferentes tipos de cores dos pokémons? Apresente os resultados de maneira crescente pelo nome da cor.

##--```sql
select distinct cor from pokemon
order by 1;
##--```

##--25. Selecione o `nome` e `velocidade` dos pokémons com velocidade entre 30 e 70. Ordene os resultados por nome (crescente) e velocidade (decrescente)

##--```sql
select nome, velocidade from pokemon 
where velocidade between '30' and '70'
order by 1 asc, 2 desc
##--```

##--26. Quem são os pokémons lendários? Apresente os resultados ordenados por `total` decrescente.

##--```sql
select nome from pokemon
where lendario is not null
order by total desc
##--```


##--27. Selecione os pokémons da primeira geração com taxa de captura igual a 255.

##--```sql
select nome from pokemon
where geracao = '1'
and taxa_captura = '255'
##--```


##--28. Quem é o mais poderoso? selecione o `Pikachu`, `Squirtle`, `Bulbasaur` e `Charmander`; ordenados decrescente pelo `total`. 

##--```sql
select distinct nome, max(total) from pokemon
where nome = 'Pikachu'
and nome = 'Squirtle'
and nome = 'Bulbasaur'
and nome = 'Charmander' 
order by total desc
##--```

##--29. Quem são os pokémons da primeira geração, que começam com a letra `d` e não possuem tipo secundário?
##--Ordene os resultados crescente por `taxa_captura` e decrescente pelo `total`.

##--```sql
select nome from pokemon
where geracao = '1'
and nome LIKE 'd%'
and tipo2 is null 
order by taxa_captura asc, total desc
##--```

##--30. Qual é o ranking dos top 5 pokémons lendários com maior `taxa_captura` e `total`? Apresente apenas `numero, nome, total, taxa_captura` nos resultados.

##--```sql
select numero, nome, total, taxa_captura from pokemon 
where taxa_captura = (select max(taxa_captura) from pokemon)
and total = (select max(total) from pokemon)
and lendario is not null
order by 3 LIMIT 10

##--```

##-31. Selecione o `numero`, `nome`, `peso_kg` dos pokémons com peso entre 2kg e 3kgs?

##--```sql
select numero, nome, peso_kg from pokemon 
where peso_kg between '2' and '3'
order by 3
##--```

##--32. Selecione o `numero`, `nome`, `tipo1` e `tipo2` dos pokémons com tipo primário `Normal`, que não possuem tipo secundário. Existe algum pokémon lendário nos resultados, se sim, os remova dos resultados?

##--```sql
select numero, nome, tipo1, tipo2 from pokemon 
where tipo1 = 'normal'
and tipo2 is null 
and lendario is null 
##--```

##33. Quem são os pokémons do tipo `Water` que não são azuis? Apresente `numero`, `nome`, `tipo1`, `tipo2` e `cor`, ordenados pelo `nome` de maneira crescente.

##--```sql
select numero, nome, tipo1, tipo2, cor from pokemon 
where tipo1 = 'Water' or tipo2 = 'Water'
and cor != 'azuis'

##--```

##--34. Crie um ranking dos top 10 pokémons mais lentos.

##--```sql
select nome from pokemon
order by velocidade LIMIT 10

##--```

##--35. Selecione os pokémons cujo nome comece e termine com a letra `a`. 

##--```sql
select nome from pokemon
where nome LIKE 'a%'
and nome LIKE '%a' 
##--```

##--36. Quem são os pokémons do tipo `Fire` que não são vermelhos? Apresente `numero`, `nome`, `tipo1`, `tipo2` e `cor`, ordenados pelo `nome` de maneira crescente.

##--```sql
select numero, nome, tipo1, tipo2, cor from pokemon 
where tipo1 = 'Fire' or tipo2 = 'Fire'
and cor != 'vermelhos'
##--```

##--37. Quais são os diferentes tipos de `peso_kg` dos pokémons? Apresente os resultados ordenados de maneira crescente.

##--```sql
select distinct peso_kg from pokemon
order by 1
##--```

##--38. Selecione o `numero`, `nome` e `hp` dos pokémons com valores entre 0 e 100. Ordene os resultados de maneira crescente por `hp` e `nome`.

##--```sql
select numero, nome, hp from pokemon
where hp between '0' and '100'
order by 2,3
##--```

##--39. Selecione o `numero`, `nome`, `hp`, `ataque`, `defesa` e `total`; dos pokémons com valores de `hp`, `ataque`, `defesa` maiores ou iguais a 100.

##--```sql
select numero,nome,hp,ataque,defesa,total from pokemon
where hp >= '100'
and ataque >= '100'
and defesa >= '100'
order by 2

##--```

##--40. Selecione todos os pokémons do tipos `Water` e `Gelo`, ordenados decrescente por `total`.

##--```sql
select * from pokemon
where tipo1 = 'Water' or tipo1 = 'Gelo' or tipo2 = 'Water' or tipo2 = 'Gelo'
order by total desc 
##--```