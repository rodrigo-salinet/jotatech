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
'Chama os dados da compra
pag = request.querystring("itens")
pagdxx = request.querystring("pagina")
if pag = "" then
inicial = 0
final = 3
else
inicial = pag
final = 3
end if
set rs = abredb.Execute("SELECT idcompra,pedido,datacompra,frete,totalcompra,status FROM compras WHERE clienteid='"&Cripto(session("usuario"),true)&"' and status <> 'Compra em Aberto' ORDER by datacompra desc")
if rs.eof or rs.bof then
%>
   		  <table><tr><td align="left" valign="top">
		  				 <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <%=strLg10%> </b><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br><br><br><center><b><%=strLg204%>&nbsp;<%=nomeloja%>!</b></center><br><br><br><center><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg41%></b> ::</a></font></center></center></td></tr>
						 </table></td></tr>
		   </table>
		  <!-- #include file="baixo.asp" -->
<%
response.end
else
'Chama as compras do usuario
username=session("usuario")
%>
  		<table><tr><td align="left" valign="top">
					   <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <%=strLg10%></b><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><br>
<%
'Verifica o numero do pedido e o nome do cliente
Set dados = abredb.Execute("SELECT email,nome FROM clientes WHERE email='"&Cripto(session("usuario"),true)&"';")
if dados.EOF then
nomez = ""
else
nomez = Cripto(dados("nome"),false)
end if
dados.Close
set dados = Nothing
rs.close
set rs = nothing
%>
  	   	 		   	 			   <b><%=strLg119%>&nbsp; <%=nomez%></b><br><br><center>
								   		  <table BORDER="0" CELLSPACING="1" CELLPADDING="3"><tr><td bgcolor=#ffffff>
<% set compras = abredb.Execute("SELECT clienteid, idcompra, pedido, datacompra, frete, totalcompra FROM compras WHERE clienteid='" & Cripto(Session("usuario"),true) & "' AND status <> 'Compra em Aberto' Order by datacompra desc")
if not compras.eof then
do while not compras.eof%>
									  		 <table border=0 align=center width=495 cellspacing="1" cellpadding="1">
											 <tr><td align=right><img src="<%=dirlingua%>/imagens/flecha.gif" border=0><img src="<%=dirlingua%>/imagens/flecha.gif" border=0><img src="<%=dirlingua%>/imagens/flecha.gif" border=0>&nbsp;&nbsp;</td>
											 <td valign=center width=100%>
											 <font face="<%=fonte%>" style=font-size:11px;color:000000>
											 <b>Compra Efetuada na Data:</b>&nbsp;<%= compras("datacompra")%><br>
											 <b>Total da Compra:</b>&nbsp;<%= strLgMoeda & " " &Cripto(compras("totalcompra"),false)%><br>
											 <b>Total do Frete:</b>&nbsp;<%= strLgMoeda & " " &Cripto(compras("frete"),false)%></font><br></td>
											 <td align=right valign=bottom><a href=infocomp.asp?pedido=<%= compras("pedido")%>><img src="<%=dirlingua%>/imagens/detalhes.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg30%>';return true;" border=0></a></td></tr>
											 <tr><td colspan=3><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
                     						 </table>
<%
compras.movenext
loop
compras.close
set compras = nothing
end if
end if
%>

									</td></tr> </table>
									<br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><a HREF="default.asp" style=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><font face="<%=fonte%>" style=font-size:11px>:: <b><%=strLg4%></b> ::</a></font></center></td></tr></table>

					</td></tr></table>
					<!-- #include file="baixo.asp" -->
					