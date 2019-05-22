Dir[File.join(File.dirname(__FILE__),'../pages/*_page.rb')].each { |file| require file }

module PageObjects
    # Os métodos abaixo servem para verificar se a classe foi instanciada. Se instanciada o método nada faz.
    # Porém se não foi instanciada, o método irá instanciar a classe.

     def login
        @login ||= LoginPage.new
     end   

     def cadastrar
         @cadastrar ||= CadastrarProdutoPage.new         
     end
    
    def listar
        @listar ||= ListarProdutoPage.new         
    end


     def editar
        @editar ||= EditarProdutoPage.new
     end 
     
end