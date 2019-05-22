#TC_001
Quando("eu clico em um produto") do                                                      
    editar.selecionar_produto    
end                                                                                      
                                                                                           
Entao("verifico as informacoes do produto") do     
    #Todos os campos existem e são visiveis? SIM -> Pass
    expect(page).to have_selector('#product_name', :visible => true)
    expect(page).to have_selector('#product_code', :visible => true)
    expect(page).to have_selector('#product_manufacturer', :visible => true)
    expect(page).to have_selector('#product_description', :visible => true)
    expect(page).to have_selector('#product_price', :visible => true)
    expect(page).to have_selector('#product_kind', :visible => true)
    expect(page).to have_selector('#product_status', :visible => true)
end                                                                                      
                 
#TC_002 and TC_003
Quando("altero todos seus valores") do                     
    editar.editar_valores
end                                                                                      
                                                                                        
Quando("clico no botão Update Product") do                                               
    editar.salvar_alteracoes
end                                                                                      
                                                                                        
Entao("uma mensagem de sucesso é exibida") do                                       
    msg = find('#flash_notice')        
    expect(msg.text).to eq 'Produto atualizado com sucesso.'
end                                                                                                                                                                          
               
#TC_004
Entao("verifico que um link de volta a listagem é exibido") do    
    expect(page).to have_link("Voltar", :href=>"/products")
end                                                                                      
                                                                                        