# encoding: UTF-8
# Classe responsável pelas interações com a página de login
# 
# Author::  Giovani Portelinha Maia

require 'home_page'

class LoginPage
  attr_reader :driver
  
  # Redireciona o browser para a página de login
  # 
  # Parâmetros:
  # - +driver+ instância do driver utlizado
  # - +url+ url da página de login  
  def initialize(driver, url)
    @driver = driver
    @driver.goto url
  end
  
  # Método responsável por logar o usuário no portal
  # 
  # Parâmetros: 
  # - +usuario+ o login do usuário a ser utilizado
  # - +senha+ senha do usuário usado
  def login(usuario, senha)
    @driver.text_field(:id, 'login:txtUsr').set usuario
    @driver.element(:id, 'pwdTmp').focus
    @driver.text_field(:id, 'pwdTmp').set senha
    @driver.text_field(:id, 'login:txtPwd').set senha
    
    @driver.link(:id, 'login:cmdLogin').click
    return HomePage.new(@driver)
  end
end