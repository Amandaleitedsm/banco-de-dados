-- Inserindo alunos
INSERT INTO alunos (nome, curso, data_nascimento) VALUES
('Ana Souza', 'Engenharia', '2002-05-14'),
('Carlos Lima', 'Administração', '1998-11-22'),
('Beatriz Rocha', 'Engenharia', '2001-09-10'),
('Diego Martins', 'História', '1995-04-07'),
('Lucas Fernandes', 'Engenharia', '2000-05-15'),
('Beatriz Souza', 'Direito', '1999-09-22'),
('Rafael Lima', 'Medicina', '2001-03-10'),
('Camila Oliveira', 'Arquitetura', '2002-12-05'),
('Thiago Pereira', 'Engenharia', '1998-07-19'),
('Larissa Costa', 'Psicologia', '2000-11-30'),
('Felipe Martins', 'História', '2001-01-17'),
('Juliana Rocha', 'Design Gráfico', '1999-06-08'),
('Bruno Almeida', 'Engenharia', '2002-04-25'),
('Carolina Mendes', 'Filosofia', '2000-08-14');


-- Inserindo autores
INSERT INTO autores (nome, nacionalidade) VALUES
('Mariana Costa', 'Brasileira'),
('Carlos Andrade', 'Brasileiro'),
('Machado de Assis', 'Brasileiro'),
('George Orwell', 'Britânico'),
('J.K. Rowling', 'Britânica'),
('Stephen King', 'Americano'),
('Ana Ribeiro', 'Brasileira'),
('João Silva', 'Brasileiro'),
('Fernanda Lima', 'Brasileira'),
('Luciana Prado', 'Brasileira'),
('André Figueiredo', 'Brasileiro'),
('Sofia Martins', 'Portuguesa'),
('Miguel Torres', 'Argentino'),
('Laura Albuquerque', 'Brasileira'),
('Pedro Hernandez', 'Mexicano'),
('Isabela Ramos', 'Brasileira'),
('Giovanni Bianchi', 'Italiano'),
('Emma Dubois', 'Francesa'),
('Takashi Yamada', 'Japonês');

select * from autores;


-- Inserindo categorias
INSERT INTO categorias (nome) VALUES
('Ficção'),
('História'),
('Autoajuda'),
('Romance'),
('Ficção Científica'),
('Literatura Brasileira'),
('Terror'),
('Filosofia'),
('Suspense'),
('Enciclopédia');

select * from categorias;


-- Inserindo funcionários
INSERT INTO funcionarios (nome, setor) VALUES
('Mariana Silva', 'Atendimento'),
('Roberto Mendes', 'Atendimento'),
('Fernanda Costa', 'Cadastro'),
('Mariana Silva', 'Atendimento'),
('Roberto Mendes', 'Atendimento'),
('Fernanda Costa', 'Cadastro'),
('Daniel Vasconcelos', 'Cadastro'),
('Patrícia Mendes', 'Atendimento'),
('Eduardo Lima', 'Suporte');


-- Inserindo livros
INSERT INTO livros (titulo, id_autor, id_categoria, ano_publicacao) VALUES
('Dom Casmurro', 1, 4, 1899),
('1984', 2, 1, 1949),
('Harry Potter', 3, 1, 1997),
('O Iluminado', 4, 1, 1977),
('A Arte da Guerra', 1, 3, -500),
('As Grandes Guerras Mundiais', '6', '2', '2008'),
('A Máquina do Tempo 2.0', 2, 5, 2015),      
('Contos do Sertão', 7, 6, 1999),               
('O Sorriso da Meia-Noite', 8, 7, 2012),       
('Pensamentos Modernos', 9, 8, 2020),          
('O Enigma do Futuro', 2, 5, 2022),             
('História do Brasil Colonial', 1, 2, 2005),    
('Poemas de Um Tempo', 7, 6, 2001),             
('Sombras da Floresta', 8, 7, 2018),            
('A Essência do Ser', 9, 8, 2010);
  
select * from livros ORDER BY id ASC;


-- Inserindo empréstimos

INSERT INTO emprestimos (id_aluno, id_livro, id_funcionario, data_emprestimo, data_devolucao) VALUES
(5, 2, 1, '2024-03-05', '2024-03-21'),  -- devolvido
(6, 4, 2, '2024-03-22', NULL),          -- ainda com o aluno
(7, 6, 1, '2024-02-28', '2024-03-15'),  -- devolvido
(8, 8, 2, '2024-04-01', NULL),          -- ainda com o aluno
(9, 9, 3, '2024-01-12', '2024-01-25'),  -- devolvido
(10, 10, 3, '2024-04-02', NULL),       -- ainda com o aluno
(3, 5, 2, '2023-08-04', '2023-08-16'),
(1, 2, 1, '2024-03-01', '2024-03-15'),
(2, 3, 2, '2024-03-02', '2024-03-16'),
(3, 1, 3, '2024-03-05', '2024-03-19'),
(4, 4, 1, '2024-03-10', NULL), -- Livro ainda não devolvido
(11, 11, 1, '2024-04-03', '2024-04-10'),
(12, 15, 1, '2024-04-04', NULL),
(13, 5, 1, '2024-04-04', '2024-04-15'),
(14, 14, 1, '2024-04-05', NULL),
(1, 15, 1, '2024-04-05', '2024-04-20'),
(2, 1, 1, '2024-04-06', NULL),
(3, 14, 1, '2024-04-06', '2024-04-22'),
(4, 11, 1, '2024-04-06', NULL),
(5, 13, 1, '2024-04-07', '2024-04-23'),
(6, 13, 1, '2024-04-07', NULL),
(7, 14, 1, '2024-04-08', NULL),
(8, 15, 2, '2024-04-08', '2024-04-21'),
(9, 4, 2, '2024-04-08', NULL),
(10, 8, 2, '2024-04-08', NULL),
(11, 11, 4, '2024-04-09', NULL),
(12, 3, 4, '2024-04-09', '2024-04-18'),
(13, 13, 5, '2024-04-09', NULL);

select * from emprestimos;
