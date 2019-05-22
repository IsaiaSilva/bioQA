
Dado("que eu acesso o sistema") do
  login.acesso
end

Quando("faço login com {string} e {string}") do |email, senha|
  #puts email
  #puts senha
  @login.logar(email, senha)
end

Então("vejo a mensagem {string}") do |string|
  text = page.has_text?('Autenticado com sucesso.')
  msg = find('div[id*=flash_notice]')
  #puts msg.text
  expect(msg.text).to eq(string)
end