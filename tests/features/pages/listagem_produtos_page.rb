class ListarProdutoPage 
    include Capybara::DSL

    def menu_listar
        find(:xpath, '//html/body/nav/div[2]/ul[1]/li[1]/a/span[1]').click
        find(:xpath, '//html/body/nav/div[2]/ul[1]/li[1]/ul/li[1]/a').click
    end

    def paginacao(count)
     #  puts count
        if count >= 10
           result = find(:css, 'body > div > div:nth-child(3) > div > nav > span.next > a', :visible => true).text
           #p result
        else
            'Caso não seja Paginado em 10 e a paginação não seja exibida, o teste irá FALHAR!'
        end
    end

end
