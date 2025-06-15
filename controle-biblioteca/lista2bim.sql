# Exercícios
#1 nome dos alunos e os tıtulos dos livros que eles pegaram emprestado.
select alunos.nome, titulo 
from alunos, livros, emprestimos 
where alunos.id = emprestimos.id_aluno and livros.id = emprestimos.id_livro;

#2 tıtulos dos livros, nomes dos autores e a categoria de cada livro.
select titulo, autores.nome, categorias.nome 
from livros, autores, categorias 
where autores.id = livros.id_autor and categorias.id = livros.id_categoria;

#3 emprestimos realizados com nome do aluno, tıtulo do livro e data do emprestimo.
select alunos.nome, titulo, data_emprestimo 
from alunos, livros, emprestimos 
where alunos.id = emprestimos.id_aluno and livros.id = emprestimos.id_livro;

#4 nome dos funcionarios que registraram emprestimos e os respectivos livros emprestados.
select funcionarios.nome, titulo 
from funcionarios, livros, emprestimos 
where funcionarios.id = emprestimos.id_funcionario and livros.id = emprestimos.id_livro;

#5 nome dos autores e quantos livros eles possuem cadastrados.
select autores.nome, count(livros.id) as qtd_livros
from autores
left join livros on autores.id = livros.id_autor
group by autores.nome;

#6 nomes dos alunos que pegaram livros da categoria “Ficcao”.
select alunos.nome 
from alunos, categorias, emprestimos, livros
where alunos.id = emprestimos.id_aluno 
and categorias.nome = "Ficção" 
and categorias.id = livros.id_categoria 
and livros.id = emprestimos.id_livro;

#7 Liste os livros emprestados por alunos do curso de “Engenharia”.
select titulo
from alunos, livros, emprestimos
where alunos.curso = "Engenharia"
and alunos.id = emprestimos.id_aluno
and emprestimos.id_livro = livros.id;

#8 Mostre os nomes dos alunos e o nome do funcionario que registrou cada emprestimo.
select alunos.nome, funcionarios.nome
from alunos, funcionarios, emprestimos
where alunos.id = emprestimos.id_aluno
and funcionarios.id = emprestimos.id_funcionario;

#9 Liste os livros publicados antes do ano 2000 e os nomes dos autores correspondentes.
select titulo, autores.nome
from livros, autores
where ano_publicacao<'2000'
and livros.id_autor = autores.id;

#10 a quantidade de emprestimos feitos por cada aluno.
select alunos.nome, count(emprestimos.id_aluno) as qtd_emprestimos
from alunos
left join emprestimos on alunos.id = emprestimos.id_aluno
group by alunos.nome;

#11 nomes dos autores que tem livros na categoria “Historia”.
select autores.nome
from autores, livros, categorias
where categorias.nome = "História"
and autores.id = livros.id_autor
and livros.id_categoria = categorias.id;

#12 nomes dos livros e suas respectivas datas de devolu ̧c ̃ao, junto do nome do aluno.
select titulo, data_devolucao, alunos.nome
from livros, emprestimos, alunos
where livros.id = emprestimos.id_livro
and alunos.id = emprestimos.id_aluno
and data_devolucao is not null;

#13 funcion ́arios que trabalharam com empr ́estimos de livros da categoria “Auto-ajuda”.
select funcionarios.nome
from funcionarios, emprestimos, livros, categorias
where categorias.nome = "Autoajuda"
and categorias.id = livros.id_categoria
and livros.id = emprestimos.id_livro
and emprestimos.id_funcionario = funcionarios.id;

#14 alunos que ainda n ̃ao devolveram os livros
select alunos.nome
from alunos, emprestimos
where alunos.id = emprestimos.id_aluno
and data_devolucao is null;

#15 livros emprestados por alunos nascidos ap ́os o ano 2000.
select titulo
from livros, alunos, emprestimos
where alunos.id = emprestimos.id_aluno
and livros.id = emprestimos.id_livro
and data_nascimento >= '2000-%'
group by titulo;

#16 categorias com mais de 3 livros cadastrados.
select categorias.nome
from categorias, livros
where categorias.id = livros.id_categoria
group by categorias.nome
having count(livros.id_categoria) > 3;

#17 os emprestimos que ocorreram em um determinado mes (ex: janeiro).
select * from emprestimos
where month(data_emprestimo) = 1;

#18 titulos dos livros que foram emprestados mais de uma vez.
select titulo 
from livros, emprestimos
where livros.id = emprestimos.id_livro
group by titulo
having count(emprestimos.id_livro) >1;

#19 nome dos alunos e os livros que pegaram, onde o autor e brasileiro.
select alunos.nome, titulo
from alunos, livros, autores, emprestimos
where alunos.id = emprestimos.id_aluno
and livros.id = emprestimos.id_livro
and autores.id = livros.id_autor
and autores.nacionalidade in ("Brasileiro", "Brasileira");

#20 autores que nao possuem livros cadastrados no sistema.
select autores.nome, autores.id
from autores, livros
where autores.id not in(
	select id_autor from livros
)
group by autores.nome;

#21 as categorias que ainda nao tem livros emprestados.
select categorias.nome
from categorias, livros
where ((categorias.id = livros.id_categoria) or (categorias.id not in (select livros.id_categoria from livros)))
and livros.id not in (
	select emprestimos.id_livro from emprestimos where emprestimos.id_livro is not null
)
group by categorias.nome;

#22 funcionarios que registraram mais de 10 emprestimos.
select funcionarios.nome, count(emprestimos.id_funcionario) as emprestimos_feitos
from funcionarios, emprestimos
where funcionarios.id = emprestimos.id_funcionario
group by funcionarios.nome
having count(emprestimos.id_funcionario)>10;

#23 os alunos que pegaram livros de autores estrangeiros.
select alunos.nome
from alunos, emprestimos, autores, livros
where alunos.id = emprestimos.id_aluno
and autores.id = livros.id_autor
and livros.id = emprestimos.id_livro
and (autores.nacionalidade not in ('Brasileiro','Brasileira'))
group by alunos.nome;

#24 nomes de alunos, livros e autores para todos os emprestimos realizados.
select alunos.nome, titulo, autores.nome
from alunos, livros, autores, emprestimos
where alunos.id = emprestimos.id_aluno
and livros.id = emprestimos.id_livro
and autores.id = livros.id_autor
order by alunos.nome asc;

#25 os livros e quantas vezes cada um foi emprestado, ordenado do mais para o menosemprestado.
select titulo, count(emprestimos.id_livro) as qtd_emprestados
from livros
left join emprestimos on livros.id = emprestimos.id_livro
group by titulo
order by qtd_emprestados desc