# language: pt

@cadastrar
Funcionalidade: Cadastrar Medicamentos e Materiais Médicos para futuras compras
-Como hospital quero cadastrar Medicamentos e Materiais Médicos para futuras compras.

Contexto: Login
    Dado que o login com "isaiasilva.info@gmail.com" e "Bionexo2019" foi realizado com sucesso

#TC_001
Cenario: Cadastrar Medicamento
    Dado que desejo cadastrar um novo produto
    Quando eu preencho todos os campos e escolho o tipo "Medicamento"
    E clico no botão Criar Produto
    Entao a mensagem "Produto criado com sucesso." é exibida

#TC_002
@mat
Cenario: Cadastrar Medicamento
    Dado que desejo cadastrar um novo produto
    Quando eu preencho todos os campos e escolho o tipo "Material Médico"
    E clico no botão Criar Produto
    Entao a mensagem "Produto criado com sucesso." é exibida

#TC_003
@obg
Cenario: Validar campos obrigatórios
    Dado que desejo cadastrar um novo produto
    Quando eu não preencho os campos
    E clico no botão Criar Produto
    Entao uma mensagem informando a obrigatoriedade dos campos deve ser exibida
    
#TC_004
@fab
Cenario: Validar campo fabricante
    Dado que desejo cadastrar um novo produto
    Quando eu não preencho os campos
    E clico no botão Criar Produto
    Entao uma mensagem de validação deve ser exibida

#TC_005
@fields
Cenario: Campos devem existir e serem visiveis
    Dado que desejo cadastrar um novo produto
    Entao vejo os campos "Código", "Nome", "Tipo", "Preço", "Fabricante", "Descrição", "Status"

#TC_006 - # O campo tipo deve aceitar apenas Medicamentos e Materiais Médicos.
@tipo
Cenario: O campo tipo deve aceitar apenas Medicamentos e Materiais Médicos.
Dado que desejo cadastrar um novo produto
Entao o campo tipo possui apenas os valores "Medicamento" e "Materias Médicos"