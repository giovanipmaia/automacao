# encoding: UTF-8
# 
# https://projetos.voiza.com.br/issues/6460
# Critérios de funcionamento 
# - Deve listar todos os relatórios gerenciais cadastrados no sistema (b2c_relatoriogerencial)
# - Deve ser possível selecionar um relatório para edição.
# - Não deve ser possível o cadastro de novos relatórios por essa transação.
# 
# Tela de Cadastro
# - Montar um label mostrando o nome do relatório sendo editado.
# - O campo “ativo” (b2c_relatoriogerencial.ativo) indica se o envio de 
# email do relatório está ativo ou não.
# - Se o tipo de relatório for “Semanal” devem ser exibidos campos para informar 
# dia da semana e hora de envio. Montar o combo de dia com as opções de segunda 
# à domingo e o combo de hora de 01:00 à 00:00. 
# (campos b2c_relatoriogerencial.diaEnvio e b2c_relatoriogerencial.horaEnvio).
# - Se o tipo de relatório for “Diário” deve ser exibido campo para informar a 
# hora de envio. Montar o combo de hora de 01:00 à 00:00. 
# (campo b2c_relatoriogerencial.horaEnvio).
# - Se o tipo de relatório for “Periódico” deve ser exibida tabela listando os 
# horários de 01:00 à 00:00 e pertindo a marcado do horário para cada um dos
#  negócios do sistema (essa seleção será gravada em b2c_relatoriogerencialhorario).

$:.unshift File.join(File.dirname(__FILE__),'..','test')

require 'test-unit' 

require 'relatorios_gerenciais_teste'
require 'relatorio_semanal_teste'
require 'relatorio_diario_teste'
require 'relatorio_periodico_teste'