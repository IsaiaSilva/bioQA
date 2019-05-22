# language: pt
@listar
Funcionalidade: Listar produtos cadastrados
-Como hospital quero listar todos os produtos cadastrados

Contexto: Login
    Dado que o login com "isaiasilva.info@gmail.com" e "Bionexo2019" foi realizado com sucesso

#TC_001 -> A listagem deve ser ordenada pelo campo nome.
@list
Cenario: Listagem deve ser ordenada pelo campo nome.
    Dado que desejo listar os produtos
    Entao verifico a listagem ordenada pelo campo nome

#TC_002 -> A listagem deve ser paginada pelo total de 10 resultados.
@pag
Cenario: A listagem deve ser paginada pelo total de 10 resultados.
    Dado que desejo listar os produtos
    Quando o total de produtos for maior ou igual a 10
    Entao a paginacao deve ser exibida

#TC_003 -> As informações da listagem deve ser: Nome, Tipo, Fabricante e Status.
@fd
Cenario: Campos devem ser exibidos nas informações da listagem
    Dado que desejo listar os produtos
    Entao os campos "Nome", "Fabricante", "Tipo" e "Status" devem ser exibidos