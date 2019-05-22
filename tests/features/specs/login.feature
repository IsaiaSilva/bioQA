#language:pt

@login
Funcionalidade: Efetuar Login 
    Para que eu possa cadastrar produtos e medicamentos hospitalares
    Sendo um usuário
    Posso acessar o sistema com meu usuario e senha previamente cadastrados.

    Contexto: Home
        Dado que eu acesso o sistema

    Cenario: Usuário autenticado
        Quando faço login com "isaiasilva.info@gmail.com" e "Bionexo2019"
        Então vejo a mensagem "Autenticado com sucesso."
