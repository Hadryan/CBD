class Home():
    """
    Allow us to generate API Main Page.
    """
    def home(self):
        paths = [
            {
                'titulo': 'Inserção',
                'definicao': 'Inserir uma pessoa pelo seu primeiro e último nome.',
                'link': '/insert',
                'argumento': "None"
            },
            {
                'titulo': 'Pesquisa',
                'definicao': 'Pesquisar todas as pessoas existentes na base de dados.',
                'link': '/search',
                'argumento': "None"
            },
            {
                'titulo': 'Atualizar',
                'definicao': 'Atualizar biografia de uma pessoa',
                'link': '/edit/<nome>',
                'argumento': "Nome do restaurante"
            },
            {
                'titulo': 'Localidades',
                'definicao': 'Ver número de localidades distintas',
                'link': '/localidades/distintas',
                'argumento': "None"
            },
            {
                'titulo': 'Restaurantes',
                'definicao': 'Ver número de restaurantes por localidade',
                'link': '/localidades/restaurantes',
                'argumento': "None"
            },
            {
                'titulo': 'Gastronomia',
                'definicao': 'Ver número de restaurantes por gastronomia numa localidade',
                'link': '/gastronomia/localidade',
                'argumento': "None"
            },
            {
                'titulo': 'Matches',
                'definicao': 'Nome de restaurantes contendo XXXX no nome:',
                'link': '/matches/<name>',
                'argumento': "Nome que queremos ver quais restaurantes contêm, p.e, Park"
            },
        ]
        return paths