# language: pt

@editar
Funcionalidade: Listar produtos cadastrados
-Como hospital quero editar os produtos previamente cadastrados

Contexto: Login
    Dado que o login com "isaiasilva.info@gmail.com" e "Bionexo2019" foi realizado com sucesso

#TC_001 -> Devo acessar o produto pela listagem
@edit1
Cenario: Devo acessar o produto pela listagem
    Dado que desejo listar os produtos
    Quando eu clico em um produto
    Entao verifico as informacoes do produto

#TC_002, TC#003 -> Todos os campos devem poder ser editados
@edit2
Cenario: Todos os campos devem poder ser editados
    Dado que desejo listar os produtos
    Quando eu clico em um produto
    E altero todos seus valores
    E clico no botão Update Product
    Entao uma mensagem de sucesso é exibida

#TC_004 -> Deve conter um link de volta a listagem
@edit4
Cenario: Deve conter um link de volta a listagem
    Dado que desejo listar os produtos
    Quando eu clico em um produto
    E altero todos seus valores
    Entao verifico que um link de volta a listagem é exibido