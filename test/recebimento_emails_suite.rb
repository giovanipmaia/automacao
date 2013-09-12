# encoding: UTF-8
# 
# https://projetos.voiza.com.br/issues/6398
# Tela de Filtro
# - Montar combo de relatórios com registros da tabela b2c_relatoriogerencial.
# - Montar combo de negócios com os 3 negócios do sistema.
# - O Button hit de usuário deve navegar para pesquisa de usuário e 
# permitir a seleção de qualquer usuário do manager.
# - Ao pesquisar devem ser exibidos os registros de relatórios associados 
# aos usuários em determinados negócios (b2c_relatoriogerencialusuario).
#
# Tela de Cadastro
# - Montar combo de relatórios com registros da tabela b2c_relatoriogerencial.
# - Montar o combo de negócios com os 3 negócios do sistema.
# - O Button hit de usuário deve navegar para pesquisa de usuário e 
# permitir a seleção de qualquer usuário do manager.
# - Todos os campos são obrigatórios.
# - Ao selecionar a opção “Horários específicos” deve ser exibo a tabela na 
# parte inferior listando os horários de 01:00 a 00:00 com opção de marcar 
# os horários que esse usuário deve receber o email (os horários devem ser 
# gravados na tabela b2c_relatoriogerencialhorariousuario).
# - A opção de envio selecionada (Todos horários ou horário específico) 
# deve ser gravada na associação do usuário com o relatório 
# (b2c_relatoriogerencialusuario .horarioEspecifico).
# - Deve ser possível salvar a associação de um usuário com o relatório 
# selecionado para o negócio selecionado (salvar b2c_relatoriogerencialusuario 
# e também em b2c_relatoriogerencialhorariousuario caso seja selecionado 
# o tipo “horário específico”).
# - Deve ser possível remover a associação de um usuário à um relatório.

$:.unshift File.join(File.dirname(__FILE__),'..','test')

require 'test-unit' 

require 'recebimento_emails_teste'
#require 'relatorio_semanal_teste'
#require 'relatorio_diario_teste'
#require 'relatorio_periodico_teste'