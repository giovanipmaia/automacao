# encoding: UTF-8
# Classe responsável pela realização dos testes funcionais na página de 
# gerenciamento dos relatórios gerenciais
# 
# https://projetos.voiza.com.br/issues/6460# 
# Critérios de funcionamento 
# - Deve listar todos os relatórios gerenciais cadastrados no sistema (b2c_relatoriogerencial)
# - Deve ser possível selecionar um relatório para edição.
# - Não deve ser possível o cadastro de novos relatórios por essa transação.
# 
# Author:: Giovani Portelinha Maia

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'watir'
require 'test-unit'
require 'login_page'

class RelatoriosGerenciais < Test::Unit::TestCase
  self.test_order = :defined
  attr_reader :driver, :login, :senha, :url_base
  
  # Método chamado antes de cada teste
  # Itens para serem repetidos antes de cada teste
  def setup    
    @login = "admin"
    @senha = "123"
    @url_base = 'http://localhost:8080/angeloni/'    
    @driver = Watir::Browser.new #:phantomjs
	end

  # Método chamado ao fim de cada teste
  # Itens para serem repetidos ao fim de cada teste
  def teardown    
    @driver.close
  end 
  
  # verifica se todos os relatórios foram carregados
  def test_listar_relatorios
    home = LoginPage.new(@driver, @url_base).login(@login, @senha)
    relatorios = home.abrir_relatorios_gerenciais
    # Este assert é questionável visto que o segundo irá falhar caso este falhe
    #assert(relatorios.abriu_transacao?, 'Falhou em abrir a transação de gerenciamento de relatórios!')
    assert(relatorios.listou_relatorios?, 'Falhou em carregar todos os relatórios!')
  end
  
  # verifica se conseguiu abrir o relatório de acompanhamento geral
  def test_abrir_relatorio_para_edicao
    home = LoginPage.new(@driver, @url_base).login(@login, @senha)
    # o teste tenta abrir o relatório de acompanhamento de vendas geral, 
    # mas poderia ser qualquer um dos outros relatórios
    relatorio = home.abrir_relatorios_gerenciais.abrir_relatorio("acompanhamento_geral")
    assert(relatorio.abriu_acompanhamento_geral?, 'Falhou em abrir o relatório')
  end
  
  # verifica se não está sendo mostrado o botão para cadastro de novo relatório
  def test_nao_deve_cadastrar_novo_relatorio
    home = LoginPage.new(@driver, @url_base).login(@login, @senha)
    assert_false(home.abrir_relatorios_gerenciais.possui_botao_cadastrar?)
  end
end