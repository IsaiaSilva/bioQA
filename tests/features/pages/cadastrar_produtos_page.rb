=begin  
    @Autor: Isaias Silva
    @Descrição: Esta classe, ou essa (PageObject), é utilizada para mapear os objetos
                e criar métodos e ações da tela de login.
                @Classe LoginScreen -> herda todos os métodos da clase BaseScreen.
=end

class CadastrarProdutoPage 
    include Capybara::DSL

    def cadastrar_novo
        find(:xpath, '//html/body/nav/div[2]/ul[1]/li[1]/a/span[1]').click
        find(:xpath, '//html/body/nav/div[2]/ul[1]/li[1]/ul/li[2]/a').click
    end

    def preencher_formulario(tipo)
        
      produto       = Faker::Commerce.product_name
      codigo        = Faker::Code.sin 
      fornecedor    = Faker::Company.industry
      descricao     = Faker::Lorem.paragraph(2, true)
      preco         = Faker::Commerce.price

       find('#product_name').set produto
       find('#product_code').set codigo
       find('#product_manufacturer').set fornecedor
       find('#product_description').set descricao
       find('#product_price').set preco

       if tipo == "Medicamento"
            find('#product_kind').all(:css, 'option').find { |o| o.value == 'med' }.select_option
       else
            find('#product_kind').all(:css, 'option').find { |o| o.value == 'mat' }.select_option
       end      
       
       find('#product_status').all(:css, 'option').find { |o| o.value == 'enable' }.select_option     

    end

    def cadastrar_produto
        find('input[type="submit"]').click
    end

    def formulario_vazio
        find('#product_name').set ''
        find('#product_code').set ''
        find('#product_manufacturer').set ''
        find('#product_description').set ''
        find('#product_price').set ''  
    end




end
