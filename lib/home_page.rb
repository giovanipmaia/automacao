# encoding: UTF-8
# Classe responsável pelas interações com a página inicial do sistema
# 
# Author::  Giovani Portelinha Maia

require 'relatorios_gerenciais_page'

class HomePage
  attr_reader :driver
  def initialize(driver)
    @driver = driver
  end
  
  # Procura pela saudação de boas vindas para verificar se o usuário está logado
  def usuario_logado?
    return @driver.text.include?('Bem vindo')
  end
  
  def menu
    return @driver.element(:id, 'main:PanelBarPai')
  end
  
  def frame_de_conteudo
    return @driver.frame(:id, 'abTrans1').frame(:id, 'abasPanel_0')
  end
  
  def abrir_relatorios_gerenciais
    self.menu.label(:text, 'Relatórios').click
    self.menu.label(:text, 'Configuração de Relatórios Gerenciais').click
    return RelatoriosGerenciaisPage.new(@driver, self.frame_de_conteudo)
  end
end
