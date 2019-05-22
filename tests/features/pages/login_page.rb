=begin  
    @Autor: Isaias Silva
    @Descrição: Esta classe, ou essa (PageObject), é utilizada para mapear os objetos
                e criar métodos e ações da tela de login.
                @Classe LoginScreen -> herda todos os métodos da clase BaseScreen.
=end

class LoginPage 
    include Capybara::DSL
    
    def acesso
      visit '/'
    end

    def logar(email, senha)
        find('#user_email').set email
        find('#user_password').set senha
        find('#sign_in').click
      end

end