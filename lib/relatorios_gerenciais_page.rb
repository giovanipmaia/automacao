# encoding: UTF-8
# Classe responsável pelas interações da transação de relatórios gerenciais
# 
# Author::  Giovani Portelinha Maia

require 'periodicos_page'

class RelatoriosGerenciaisPage
  attr_reader :driver, :elemento, :relatorios
  def initialize(driver, elemento)
    @driver = driver
    @elemento = elemento
    @relatorios = {
      'acompanhamento_geral' => 'Acompanhamento de Vendas Geral', #periódico
      'acompanhamento_produto' => 'Acompanhamento de Vendas por Produto', #periódico
      'acompanhamento_secao' => 'Acompanhamento de Vendas por Seção', #periódico
      'cadastro_produtos' => 'Cadastro de Produtos', #semanal
      'taxa_aprovacao' => 'Taxa de Aprovação' #diário
    }
  end
  
  # Método para verificar se a transação de gerenciamento de relatório foi aberta
  def abriu_transacao?
    # exemplo usando expressão regular para evitar problema com acentos
    # @driver.label(:text, /Relat.rios/).click
    return @elemento.label(:text, 'Configuração de Relatórios Gerenciais').exists?
  end
  
  # Método para verificar se todos os relatórios foram carregados
  def listou_relatorios?
    @relatorios.each do |hash, relatorio|
      unless @elemento.td(:text, relatorio).exists?
        return false
      end
    end
    return true
  end
  
  def abrir_relatorio(relatorio)
    @elemento.table(:id, 'selecao:grid').rows.each do |row|
      # percorre todas as linhas da lista de relatórios existentes
      # procurando pelo relatório especificado
      row.cells.each do |cell|
        if(cell.text.include?(@relatorios[relatorio]))
          row.td(:index, 2).div(:class, 'btAtivo').click()
          elemento = @driver.frame(:id, 'abTrans1').frame(:id, 'abasPanel_1')
          return PeriodicosPage.new(@driver, elemento)
        end
      end
    end    
  end  
  
  def possui_botao_cadastrar?
    return @elemento.link(:text, 'Novo Registro').exists?
  end
end