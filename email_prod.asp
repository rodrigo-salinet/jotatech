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
<!-- #include file="topo.asp" -->
<%

' Dados do e-mail
strEmail    = request.form("email")
strIdProd   = request.form("idProd")
strNomeProd = request.form("nome")
strFab      = request.form("Fabricante")
strAssunto  = "Solicita��o de Produtos"

'Busca o nome do cliente
set rs = abredb.execute("select nome from clientes where email='" & Cripto(Session("usuario"),true) & "'")
if not rs.eof then
strNome = Cripto(rs("nome"),false)
end if
rs.close
set rs = nothing

If strEmail = "" Or instr(strEmail, "@") = 0 Or instr(strEmail, ".") = 0 then
   response.redirect "produtos.asp?produto="&strIdProd&"&erro=Preencha o E-Mail Corretamente!"
end if

'Monta a Mensagem
StrMsg = "Id: " & strIdProd & vbNewLine
strMsg = strMsg & "Nome do Produto: " & strNomeProd & vbNewLine
strMsg = strMsg & "Fabricante: " & strFab & vbNewLine
strMsg = strMsg & "Quem Solicitou: " & strEmail

%>

<!--#include file="email.asp"-->
<%EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), strEmail, "", emailloja, strAssunto, strMsg%>

   			   	 <table><tr><td align="left" valign="top">
				 				<table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="tahoma,arial,helvetica" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <%=strLg14%><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><p align=center><font style=font-size:17px; color=#000000><b><%=strLg124%></b></font></p><p align=center><%=strLg125%> <b><%if strNome="" then Response.Write "Visitante" else Response.Write strNome end if %></b>, <%=strLg252%><br><%=strLg127%><br></p><p align=center></b><a href=default.asp><img src="<%=dirlingua%>/imagens/continuar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg68%>';return true;" border=0></a></p> <br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
								</table></td></tr>
				</table>
<!-- #include file="baixo.asp" -->