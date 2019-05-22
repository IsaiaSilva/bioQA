#TC_001
Dado("que desejo listar os produtos") do
    listar.menu_listar
end
  
Entao("verifico a listagem ordenada pelo campo nome") do
    @count_linhas = all('body > div > table > tbody > tr > td:nth-child(1)').count
    #p count_linhas

    array = []
    2.upto(@count_linhas) do |number| 
        array << find("body > div > table > tbody > tr:nth-child(#{number}) > td:nth-child(1)").text
    end

    array.each_cons(2) do |elemento_atual, proximo_elemento|
        el = proximo_elemento
        
        result = expect(elemento_atual).to be <= el 
        #puts result
        if result == true
            puts "A ORDEM DO PRODUTO->#{elemento_atual}, É MENOR OU iGUAL AO PRODUTO:#{el}" 
        else
            puts 'Caso a listagem não esteja ordenada pelo campo nome o teste irá falhar...'
            #Um bug deve ser aberto. Quando o time de desenvolvimento corrigir o bug e a lista estiver em ordem alfabética, o teste irá passar., ' 
        end
    end

end

#TC_002
Quando("o total de produtos for maior ou igual a {int}") do |int|
    @count_linhas = int 
    listar.paginacao(@count_linhas)
end
  
Entao("a paginacao deve ser exibida") do
    result = find(:css, 'body > div > div:nth-child(3) > div > nav > span.next > a', :visible => true)
    expect(result.text).to eq 'Próximo >'
end

#TC_003
Entao("os campos {string}, {string}, {string} e {string} devem ser exibidos") do |nome, fabricante, tipo, status|
    n = find('body > div > table > tbody > tr:nth-child(1) > th:nth-child(1)')
    f = find('body > div > table > tbody > tr:nth-child(1) > th:nth-child(3)')
    t = find('body > div > table > tbody > tr:nth-child(1) > th:nth-child(4)')
    s = find('body > div > table > tbody > tr:nth-child(1) > th:nth-child(5)')

    expect(n.text).to eq nome
    expect(f.text).to eq fabricante
    expect(t.text).to eq tipo
    expect(s.text).to eq status

    expect(page).to have_selector('body > div > table > tbody > tr:nth-child(1) > th:nth-child(1)', :visible => true)
    expect(page).to have_selector('body > div > table > tbody > tr:nth-child(1) > th:nth-child(2)', :visible => true)
    expect(page).to have_selector('body > div > table > tbody > tr:nth-child(1) > th:nth-child(3)', :visible => true)
    expect(page).to have_selector('body > div > table > tbody > tr:nth-child(1) > th:nth-child(4)', :visible => true)
    expect(page).to have_selector('body > div > table > tbody > tr:nth-child(1) > th:nth-child(5)', :visible => true)
end