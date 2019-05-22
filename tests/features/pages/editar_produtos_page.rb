class EditarProdutoPage 
    include Capybara::DSL

    def selecionar_produto
        # CLica no primeiro produto da lista (O clique de seleção do produto pode ser realizado em todos os campos...foi escolhido apenas um)
        produto_nome = find('body > div > table > tbody > tr:nth-child(2) > td:nth-child(1)').click
        
      #  produto_codigo = find(:xpath, '//html/body/div/table/tbody/tr[2]/td[2]').click
      #  produto_fabricante = find('body > div > table > tbody > tr:nth-child(2) > td:nth-child(3)').click
      #  produto_tipo = find('body > div > table > tbody > tr:nth-child(2) > td:nth-child(4)').click
      #  produto_status = find('body > div > table > tbody > tr:nth-child(2) > td:nth-child(5) > span').click
    end

    def editar_valores
        #Mapeando valores Fakers na edição
        produto       = Faker::Commerce.product_name
        codigo        = Faker::Code.sin 
        fornecedor    = Faker::Company.industry
        descricao     = Faker::Lorem.paragraph(2, true)
        preco         = Faker::Commerce.price

        #Limpar o campos
        find('#product_name').set ''
        find('#product_name').set ''
        find('#product_code').set ''
        find('#product_manufacturer').set ''
        find('#product_description').set ''
        find('#product_price').set ''

        #Inserir valores Fakers
        find('#product_name').set produto
        find('#product_code').set codigo
        find('#product_manufacturer').set fornecedor
        find('#product_description').set descricao
        find('#product_price').set preco

        tipo = find('#product_kind').find('option[selected]').text
        status = find('#product_status').find('option[selected]').text
     
        #Trocar o tipo(se medicamento, troca para materias e vice-versa)
        if tipo == "Medicamento"
            find('#product_kind').all(:css, 'option').find { |o| o.value == 'mat' }.select_option  
        else 
            find('#product_kind').all(:css, 'option').find { |o| o.value == 'med' }.select_option
        end

        #Trocar o status(se ativo, troca para desativo e vice-versa)
        if status == "Ativo"
            find('#product_status').all(:css, 'option').find { |o| o.value == 'disable' }.select_option   
        else
            find('#product_status').all(:css, 'option').find { |o| o.value == 'enable' }.select_option   
        end
    end

    def salvar_alteracoes
        sleep 2
        find('#edit_product_712 > div:nth-child(6) > div:nth-child(4) > div > div > input').click
        sleep 2
    end

end