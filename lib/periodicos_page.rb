# encoding: UTF-8
# Classe responsável pelas interações com a página de configurações dos relatórios
# do tipo periódico
# 
# Author::  Giovani Portelinha Maia

class PeriodicosPage
  attr_reader :driver, :elemento
  def initialize(driver, elemento)
    @driver = driver
    @elemento = elemento
  end
  
  # Método para verificar se o relatório de acompanhamento de vendas geral foi carregado
  def abriu_acompanhamento_geral?
    return @elemento.text_field(:id, 'cadastro:txtNome').exists?
  end  
end
