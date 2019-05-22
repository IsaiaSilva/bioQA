#TC_001 and TC_002
Dado("que o login com {string} e {string} foi realizado com sucesso") do |email, senha|
    login.acesso
    @login.logar(email, senha)
end

Dado("que desejo cadastrar um novo produto") do
    cadastrar.cadastrar_novo
end
  
Quando("eu preencho todos os campos e escolho o tipo {string}") do |tipo|
    cadastrar.preencher_formulario(tipo)
end
  
Quando("clico no botão Criar Produto") do
    cadastrar.cadastrar_produto
end
  
Entao("a mensagem {string} é exibida") do |string|
    msg = find('#flash_notice')
    #puts msg.text
    expect(msg.text).to eq 'Produto criado com sucesso.'
end

#TC_003
Quando("eu não preencho os campos") do
    cadastrar.formulario_vazio
end
  
Entao("uma mensagem informando a obrigatoriedade dos campos deve ser exibida") do
    msg_nome        = find(:xpath, '//*[@id="new_product"]/div[2]/div[1]/div/span')
    msg_codigo      = find(:xpath, '//*[@id="new_product"]/div[2]/div[2]/div/span')
    msg_preco       = find(:xpath, '//*[@id="new_product"]/div[4]/div[2]/div/div/span')
    msg_descricao   = ''
    
    #Rolar para baixo, para exibir os demais dados
    page.execute_script "window.scrollBy(0,10000)"

    expect(msg_nome.text).to eq 'Nome é um campo obrigatório'
    expect(msg_codigo.text).to eq 'Código é um campo obrigatório'
    expect(msg_preco.text).to eq 'Preço é um campo obrigatório'

   
    puts "De acordo com o requisito da User Story 01 - Todos os campos são obrigatórios"
    puts "O campo '#Descrição' não possui validação de obrigatóriedade, portanto uma issue deve ser aberta, para atender o requisito proposto!"
 
    expect(msg_descricao).to eq 'Descrição é um campo obrigatório'
    
end

#TC_004
Entao("uma mensagem de validação deve ser exibida") do
    msg_fabricante  = find(:xpath, '//*[@id="new_product"]/div[3]/div/div/span')
    puts msg_fabricante
    puts "O campo '#Fabricante' apresenta erro de tradução ou código técnico, portanto uma issue deve ser aberta."
    expect(msg_fabricante.text).to eq 'Fabricante é um campo obrigatório'

  end

#TC_005 -> Por dedução o campo detalhes descrito no requisito -> é o campo descrição
Entao("vejo os campos {string}, {string}, {string}, {string}, {string}, {string}, {string}") do |codigo, nome, tipo, preco, fabricante, detalhes, status|

    expect(page).to have_selector('#product_name')
    expect(page).to have_selector('#product_code')
    expect(page).to have_selector('#product_manufacturer')
    expect(page).to have_selector('#product_description')
    expect(page).to have_selector('#product_price')
    expect(page).to have_selector('#product_kind')
    expect(page).to have_selector('#product_status')

    page.has_text?('lorem ipsum')
end

#TC_006
Entao("o campo tipo possui apenas os valores {string} e {string}") do |medicamentos, mat_medicos|
    #puts medicamentos
    #puts mat_medicos
    med = find('#product_kind').all(:css, 'option').find { |o| o.value == 'med' }.select_option
    mat = find('#product_kind').all(:css, 'option').find { |o| o.value == 'mat' }.select_option

    expect(med.text).to eq medicamentos
    expect(mat.text).to eq mat_medicos

    #clicar para abrir o combo e exibir os 2 valores no print do relatório
    #find('#product_kind').click
    #sleep 2
end