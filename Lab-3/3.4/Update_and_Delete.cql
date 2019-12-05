-- Update
UPDATE funcionarios SET funcoes = funcoes + {'Contador de histórias'} WHERE funcID = 0b743bf6-1508-11ea-af61-f58bd8d3766a;
UPDATE requitadosByUser SET livros = ['9789898868494', '9789898868488'] WHERE requerente = 6a4264d0-1504-11ea-af61-f58bd8d3766a;
UPDATE categorias SET livros= livros + {2:'9789898868488'} WHERE categoria = 'Romance';
UPDATE livros SET quantidade = 5 WHERE isbn = '9789898868481';
UPDATE utilizadores SET nome = 'João Abélio' WHERE userId = 6a4264d6-1504-11ea-af61-f58bd8d3766a;

-- Delete
UPDATE categorias SET livros = livros - {2} WHERE categoria = 'Romance';
UPDATE funcionarios SET funcoes = funcoes - {'Contador de histórias'} WHERE funcID = 0b743bf6-1508-11ea-af61-f58bd8d3766a;
UPDATE requitadosByUser SET livros = livros - ['9789898868494'] WHERE requerente = 6a4264d0-1504-11ea-af61-f58bd8d3766a;
DELETE FROM livros WHERE isbn = '9789898868481';
DELETE FROM categorias WHERE categoria = 'Romance';