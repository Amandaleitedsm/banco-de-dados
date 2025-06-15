create database if not exists lista2bim;
use lista2bim;
create table alunos(
	id int primary key auto_increment,
    nome varchar(45) not null,
    curso varchar(45) not null,
    data_nascimento date not null
);
create table autores(
	id int primary key auto_increment,
    nome varchar(45) not null,
    nacionalidade varchar(45) not null
);
create table categorias(
	id int primary key auto_increment,
    nome varchar(45) not null
);
create table funcionarios(
	id int primary key auto_increment,
    nome varchar(45) not null,
    setor varchar(45) not null
);
create table livros(
	id int primary key auto_increment,
    titulo varchar(45) not null,
    id_autor int not null,
    id_categoria int not null,
    foreign key (id_autor) references autores(id),
    foreign key (id_categoria) references categorias(id),
    ano_publicacao int
);
create table emprestimos(
	id int primary key auto_increment,
    id_aluno int not null,
    id_livro int not null,
    id_funcionario int not null,
    foreign key (id_aluno) references alunos(id),
    foreign key (id_livro) references livros(id),
    foreign key (id_funcionario) references funcionarios(id),
    data_emprestimo date not null,
    data_devolucao date
);
