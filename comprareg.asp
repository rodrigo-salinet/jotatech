<%
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  C�DIGO: VirtuaStore Vers�o 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Ot�vio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revis�o)                
'# 
'#     Este programa � um software livre; voc� pode redistribu�-lo e/ou 
'#     modific�-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     � importante lembrar que qualquer altera��o feita no programa 
'#     deve ser informada e enviada para os criadores, atrav�s de e-mail 
'#     ou da p�gina de onde foi baixado o c�digo.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATEN��O: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no cr�ditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases n�o estiver presentes ou visiveis este software deixar� de ser
'#  // considerado Open-source(gratuito) e o uso sem autoriza��o ter� 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa � distribu�do com a esperan�a de que lhe seja �til,
'#     por�m SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licen�a P�blica Geral) para mais detalhes.
'# 
'#     Voc� deve receber a c�pia da Licen�a GNU com este programa, 
'#     caso contr�rio escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas d�vidas, sugest�es e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato atrav�s do e-mail 
'#     contato@virtuaworks.com.br ou pelo endere�o abaixo: 
'#     Rua Ven�ncio Aires, 1001 - Niter�i - Canoas - RS - Brasil. Cep 92110-000.
'#
'#     Para ajuda e suporte acesse: http://www.virtuastore.com.br
'#
'#     BOM PROVEITO!          
'#     Equipe VirtuaStore
'#     []'s
'#
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################

'IN�CIO DO C�DIGO
'----------------------------------------------------------------------------------------------------------------
'Este c�digo est� otimizado e roda tanto em Windows 2000/NT/XP/ME/98 quanto em servidores UNIX-LINUX com chilli!ASP
%>
<!-- #include file="df.asp" -->
<%
'Loga o usuario
if request.querystring ("login") = "sim" then
username = request("email")
password = request("senha") 
set passSet = abredb.Execute("select email,senha from clientes where email='"&Cripto(username,true)&"';")
if passSet.EOF then 

'Fecha o banco de dados
abredb.close
set abredb = nothing
response.redirect"fechapedido.asp?compra=entrar&erro=- " & strLg183 & "&user=x"
else

'Valida a senha
real_password = cripto(trim(passSet("senha")),false)
if password = real_password then
Application.lock
session("usuario") = username
Application.unlock
session.timeout = 999
response.cookies(""&nomeloja&"")("usuario")= username
response.cookies(""&nomeloja&"").expires = "01/01/"&year(now) + 1
else 
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=entrar&erro2=- " & strLg184 & "&user="&username
end if
end if 
abredb.close
set abredb = nothing
response.redirect "default.asp"
passSet.close
set passSet = nothing

'Fecha o banco de dados
abredb.close
set abredb = nothing
else
username = request("email")
password = request("senha") 
checkPass = "select email,senha from clientes where email='"&Cripto(username,true)&"';"
set passSet = abredb.Execute(checkPass)
if passSet.EOF then 
abredb.close
set abredb = nothing
response.redirect"fechapedido.asp?compra=login&erro=- " & strLg183 & "&user=x"
else
real_password = Cripto(trim(passSet("senha")),false)
if password = real_password then
Application.lock
session("usuario") = username
Application.unlock
session.timeout = 999
response.cookies(""&nomeloja&"")("usuario")= username
response.cookies(""&nomeloja&"").expires = "01/01/"&year(now) + 1
else
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=login&erro2=- " & strLg184 & "&user="&username
end if
end if 
passSet.close
set passSet = nothing
abredb.close
set abredb = nothing
response.redirect "fechapedido.asp?compra=ok"
end if
%>