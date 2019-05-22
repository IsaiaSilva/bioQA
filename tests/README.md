[objetivo]
Automação Web - sistema de entrevista Bionexo
    
[ambiente]
_ambiente: http://qainterview.qa.cloud.bionexo.com.br/

[ParaExecutar]
Navegue até o diretório:  bioQA\tests
[1] Executar todos cenários: bundle exec cucumber
[2] Executar cenários de cadastro -> bundle exec cucumber -t @cadastrar
[3] Executar cenários de listagem -> bundle exec cucumber -t @listar
[4] Executar cenários de edição   -> bundle exec cucumber -t @editar]

[frameworks]
_cucumber
_capybara
_rspec
_selenium

[specifications]
_http://qainterview.qa.cloud.bionexo.com.br/


[observações]
_001 - Instalar as gems necessárias (GemFile) -> bundle install
_para rodar os teste => Clonar o projeto e dar um bundle install na raíz (tests)
_através do terminal utilizar o comando: ter feito as configurações e instalação do ambiente corretamente

[contato]
qa.eng.isaiasilva@gmail.com / 
isaiasilva.info@gmail.com