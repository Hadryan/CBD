-- 1)
/**
  Obter o livro com mais quantidade disponível em stock.
 */
SELECT titulo, max(quantidade) AS quantidade
FROM livros;
-- 2)
/**
  Selecionar todas as pessoas que selecionaram o livro 9789898868488.
 */
SELECT requerente
FROM requitadosByUser
WHERE livros CONTAINS '9789898868488' ALLOW FILTERING;
-- 3)
/**
  Selecionar os primeiros 5 livros.
 */
SELECT *
FROM livros
LIMIT 5;
-- 4)
/**
    Selecionar todos os que contêm o isb 9789898868494 agrupados pela categoria.
 */
SELECT *
FROM categorias
WHERE livros CONTAINS '9789898868494'
GROUP BY categoria ALLOW FILTERING;
-- 5)
/**
  Determinar a quantidade média de livros.
 */
SELECT AVG(quantidade) AS media
FROM livros ALLOW FILTERING;
-- 6)
/**
  Selecionar todos os funcionários que contém funções de limpeza
 */
SELECT *
FROM funcionarios
WHERE funcoes CONTAINS 'Limpeza';
-- 7)
/**
    Selecionar todos os titulos de livros começados por "Para"
 */
CREATE CUSTOM INDEX nomes ON livros (titulo) USING 'org.apache.cassandra.index.sasi.SASIIndex' WITH OPTIONS = {'mode': 'CONTAINS', 'analyzer_class': 'org.apache.cassandra.index.sasi.analyzer.StandardAnalyzer', 'case_sensitive': 'false'};
SELECT titulo
FROM livros
WHERE titulo LIKE 'Para*';
-- 8)
/**
  Obter o livro com menos
 */
SELECT titulo, min(quantidade) as quantidade
FROM livros;

-- 9)
/**
Obter os livros de um autor ordenador por ordem decrescente do título.
 */
SELECT *
FROM livros_nome
WHERE autor = 'Taro Gomi'
ORDER BY titulo DESC;

-- 10)
/**
  Obter o número de obras começadas por 'Para*', agrupadas por autor
 */
CREATE CUSTOM INDEX lnomes ON livros_nome (titulo) USING 'org.apache.cassandra.index.sasi.SASIIndex' WITH OPTIONS = {'mode': 'CONTAINS', 'analyzer_class': 'org.apache.cassandra.index.sasi.analyzer.StandardAnalyzer', 'case_sensitive': 'false'};
SELECT autor, count(titulo) as num_obras
FROM livros_nome
WHERE titulo LIKE 'Para*'
GROUP by autor;