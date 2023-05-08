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
<!--#include file="topo.asp"-->
<!--#include file="checacartao.asp"-->
<%
'Chama as variaveis para finalizar compra
strPedido = Request.Form("pedido1")
strNome = Request.Form("nome1")
strEndereco = request.form("ende1")
strBairro = request.form("bairro1")
strCidade = request.form("cidade1")
strEstado = request.form("est1")
strCep = request.form("cep1")
strPais = request.form("pais1")
strFone = request.form("fone1")
strCompq = request.form("compra1")
freteqwy = request.form("frete1")
strCartao = Request.Form("cartao")
strTitular = Request.Form("titularcartao")
strExpmes = Request.Form("cartaomes")
strExpano = Request.Form("cartaoano")
strTotalCompra = Request.form("totalcompra")
numero = Request.Form("numerocartao")
vencimento = Request.form("cartaomes") & "/" & Request.form("cartaoano")

'Verifica o tipo de cart�o de credito
if strCartao = "M" or strCartao = "V" or strCartao = "D" or strCartao = "A" then

'Tira letras do numero
s=""
for x=1 to len(numero)
ch=mid(numero,x,1)
if asc(ch)>=48 and asc(ch)<=57 then
s=s & ch
end if
next
numero = s

'Valida numeros genericos
If numero = "4111111111111111" OR numero = "5500000000000004" OR numero = "340000000000009" OR numero = "30000000000004" OR numero = "60110000000004" then
erro = strLg210
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro=" & erro & "&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if

if len(vencimento) > 7 or strTitular= "" then
erro = strLg251
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro=" & erro & "&endereco="&strEndereco&"&bairro="&strBairro&"&cidade="&strCidade&"&cep="&strCep&"&fone="&strFone&"&estado="&strEstado&"&pais="&strPais&"&outropais="&strOutropais&"&#pagamento"
end if

'Valida os numeros
If numero <> "" then
chk=checkcc(numero,strCartao)
If chk = 1 then
erro = strLg210
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 2 then
erro = strLg211
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 3 then
erro =  strLg212
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 4 then
erro =  strLg213
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 5 then
erro =  strLg214
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 6 then
erro =  strLg215
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 7 then
erro =  strLg216
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
elseif chk = 8 then
erro = strLg210
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
else
erro = strLg217
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
If strExpmes = "" OR strExpano = "" then
erro = strLg218
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
validadata = day(now) & "/" & strExpmes & "/" & strExpano
if cdate(validadata) < cdate(date) then
erro = strLg219
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end  if
If strTitular = "" OR len(strTitular) <5 then
erro = strLg220
abredb.close
set abredb = nothing
response.redirect "formaspagamento.asp?erro="&erro
end if
end if

'Grava os dados da compra na matriz
intOrderID = Request.form("idcompra")
if strCartao = "M" then
txtpagamento = strLg221
strCartao = "1"
venccob = "-"
numerocob = "-"
end if
if strCartao = "V" then
txtpagamento = strLg222
strCartao = "0"
venccob = "-"
numerocob = "-"
end if
if strCartao = "A" then
txtpagamento = strLg223
strCartao = "3"
venccob = "-"
numerocob = "-"
end if
if strCartao = "D" then
txtpagamento = strLg224
strCartao = "2"
venccob = "-"
numerocob = "-"
end if
if strCartao = "sc" then
txtpagamento = strLg225
strCartao = "4"
venccob = cdate(date) + vencboleto
end if
if strCartao = "di" then
txtpagamento = strLg226
strCartao = "5"
venccob = cdate(date) + vencboleto
end if
if strCartao = "db" then
txtpagamento = strLg227
venccob = cdate(date) + vencboleto
'numerocob = "-"
strCartao = "6"
end if

if strCartao = "bl" then
txtpagamento = strLg266
venccob = cdate(date) + vencboleto
numerocob = "-"
strCartao = "7"
end if


'Formata  a data
datacob = venccob
if len(day(date)) = 1 then
diadata = "0"&day(date)
else
diadata = day(date)
end if
if len(month(date)) = 1 then
mesdata = "0"&month(date)
else
mesdata = month(date)
end if
entdiax = cdate(date) + diasentrega
if len(day(entdiax)) = 1 then
diadatax = "0"&day(entdiax)
else
diadatax = day(entdiax)
end if
if len(month(entdiax)) = 1 then
mesdatax = "0"&month(entdiax)
else
mesdatax = month(entdiax)
end if
entdiaxz = cdate(date) + vencboleto
if len(day(entdiaxz)) = 1 then
diadataxz = "0"&day(entdiaxz)
else
diadataxz = day(entdiaxz)
end if
if len(month(entdiaxz)) = 1 then
mesdataxz = "0"&month(entdiaxz)
else
mesdataxz = month(entdiaxz)
end if

'Valida a compra
set valida = abredb.Execute("SELECT status from compras WHERE idcompra = " & intOrderID & ";")
estatusdela = valida("status")
valida.close
set valida = nothing
if estatusdela = "Compra em Aberto" then

'Atualiza o pagamento e status da compra no banco de dados
set cadnovo = abredb.Execute("UPDATE compras SET pagamentovia = '"&strCartao&"', numero = '"&Cripto(numero,true)&"',vencimento = '"&Cripto(vencimento,true)&"', titular= '"&Cripto(strTitular,true)&"', status = '0' WHERE idcompra = " & intOrderID & ";")
set cadnovo = Nothing

'Corpo do e-mail de envio de compras
strMensagem = ""
strMensagem = strMensagem & " <!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>"
strMensagem = strMensagem & "  <HTML><HEAD>"
strMensagem = strMensagem & "  <META content='text/html; charset=iso-8859-1' http-equiv=Content-Type>"
strMensagem = strMensagem & "  <META content='Microsoft FrontPage 5.0' name=GENERATOR></HEAD>"
strMensagem = strMensagem & "  <BODY>"
strMensagem = strMensagem & "  <DIV align=justify>"
strMensagem = strMensagem & "  <TABLE border=0 cellSpacing=0 width=""98%"">"
strMensagem = strMensagem & "    <TBODY>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=4 height=42>"
strMensagem = strMensagem & "        <DIV align=center><font face="&fonte&"><B><FONT style=font-size:17px color=000000>"&tituloloja&"</FONT></B><BR><FONT style=font-size:11px>"&endereco11&" - "&bairro11&"<BR>"&cidade11&"/"&estado11&" - "&pais11&" - <a href='mailto:"&emailloja&"'>"&emailloja&"<BR></FONT></DIV></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=4><FONT face="&fonte&">"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "       </FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD align=left colSpan=2><FONT face="&fonte&"><FONT color=#000000"
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><B>Compra de "&strNome&"</B></FONT> "
strMensagem = strMensagem & "        </FONT>"
strMensagem = strMensagem & "      <TD align=right colSpan=2><B><FONT face="&fonte&"><FONT color=#000000"
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Data: </B>"&diadata&"/"&mesdata&"/"&year(date)&" </FONT>"
strMensagem = strMensagem & "        <DIV></DIV></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=4>"
strMensagem = strMensagem & "        <DIV><FONT face="&fonte&">"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT></DIV>"
strMensagem = strMensagem & strPedidoz = replace(strPedido,",","")
strMensagem = strMensagem & "        <DIV><FONT face="&fonte&" style='FONT-SIZE: 11px'>Obrigado por comprar na"
strMensagem = strMensagem & "        "&nomeloja&"!<BR>Esta � a confirma��o de que seu pedido de No. <STRONG>#"&strPedidoz&""
strMensagem = strMensagem & "        </STRONG>foi finalizado com sucesso.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV><FONT face="&fonte&">"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT><FONT face="&fonte&"><FONT color=#000000"
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>  </DIV>"
strMensagem = strMensagem & "        <DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><STRONG>Entrega</STRONG></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Para que o pedido chegue o mais"
strMensagem = strMensagem & "        r�pido poss�vel, realizamos a entrega imediata do(s) item(ns) que j� est�o "
strMensagem = strMensagem & "        dispon�veis no estoque. Os outros itens s�o enviados t�o logo entregues "
strMensagem = strMensagem & "        pelos fornecedores, conforme o prazo informado no momento da "
strMensagem = strMensagem & "       compra.<BR>Para evitar extravios e garantir que a entrega seja feita corretamente, o"
strMensagem = strMensagem & "        pedido somente ser� deixado no endere�o solicitado mediante a assinatura "
strMensagem = strMensagem & "        de quem for receb�-lo.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&" style='FONT-SIZE: 11px'>"
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        &nbsp;</DIV></FONT>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><STRONG>Frete</STRONG></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=left> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&"><FONT "
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Todos os produtos comprados"
strMensagem = strMensagem & "        na&nbsp;"&nomeloja&" s�o acrescidos do valor de frete. O valor do frete �"
strMensagem = strMensagem & "        calculado somando-se uma taxa b�sica de envio com uma taxa de envio por "
strMensagem = strMensagem & "        produto. Ambas variam por regi�o. O valor total do frete est� associado ao"
strMensagem = strMensagem & "        pedido e sempre ser� cobrado integralmente no primeiro envio. Caso haja "
strMensagem = strMensagem & "        indisponibilidade de produtos para envios posteriores, a taxa cobrada por"
strMensagem = strMensagem & "        aquele item ser� restitu�da de acordo com a pol�tica de "
strMensagem = strMensagem & "        reembolso.<BR></FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>O&nbsp;envio parcial do pedido&quot; n�o implica no "
strMensagem = strMensagem & "          pagamento de v�rios fretes. A taxa de frete � sempre &quot; calculada em "
strMensagem = strMensagem & "          fun��o da compra integral.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&" style='FONT-SIZE: 11px'><FONT "
strMensagem = strMensagem & "        face="&fonte&" style='FONT-SIZE: 11px'>  "
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV> </DIV>"
strMensagem = strMensagem & "       <DIV align=left><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><STRONG>Pagamento</STRONG></FONT></DIV>"
strMensagem = strMensagem & "        <DIV> </DIV>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&" style='FONT-SIZE: 11px'>ATEN��O: como o"
strMensagem = strMensagem & "        pedido j� foi conclu�do, n�o � poss�vel alterar a forma de "
strMensagem = strMensagem & "        pagamento. Caso necessite mudar, entre em contato para que possamos esta "
strMensagem = strMensagem & "          cancelando a sua compra e realizando uma nova.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>Nos pedidos feitos com cart�o"
strMensagem = strMensagem & "        de cr�dito, o d�bito � feito parcialmente � medida que os itens s�o "
strMensagem = strMensagem & "        disponibilizados para envio. Desta forma, pedidos com op��o de "
strMensagem = strMensagem & "        parcelamento, podem sofrer altera��o na quantidade de parcelas "
strMensagem = strMensagem & "        solicitadas.<BR>A confirma��o de pagamento dos pedidos"
strMensagem = strMensagem & "        feitos com boleto banc�rio, dep�sito banc�rio simples ou identificado e "
strMensagem = strMensagem & "          transferencia "
strMensagem = strMensagem & "        deve ser feita em at� 5 (cinco) �teis , � preciso entrar em contato via telefone ou e-mail nos enviando os dados para confirma��o de pagamento.</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify> </DIV>"
strMensagem = strMensagem & "        <DIV align=justify><FONT face="&fonte&" style='FONT-SIZE: 11px'>LEMBRE-SE de"
strMensagem = strMensagem & "        acrescentar este prazo (at� 5 dias �teis) ao prazo de envio do(s) item(ns) "
strMensagem = strMensagem & "        do pedido citado(s) abaixo:</FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=justify><br>"
strMensagem = strMensagem & "          <font face= "&fonte&"><strong><font style=font-size: 11px>"
strMensagem = strMensagem & "          Dados dos Contas Banc�rias:</font></strong></font><br>"
strMensagem = strMensagem & " &nbsp;<table border=0 cellSpacing=0 width=575>"
strMensagem = strMensagem & "    				 	 		<tr><font face= "&fonte&"  style=font-size:11px;color:000000> "
strMensagem = strMensagem & "                               <td>"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" ><b>Banco:</b> "
strMensagem = strMensagem & "                               Bradesco<br><b>Ag�ncia:</b> 1599"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber8 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td><td>"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" ><b>Conta "
strMensagem = strMensagem & "                               Poupan�a:</b> 1004603-3<br><b>Para: </b>Edilson "
strMensagem = strMensagem & "                               Louren�o N de Souza"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber9 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td>"
strMensagem = strMensagem & " 							           </font>"
strMensagem = strMensagem & " 							           </tr>"
strMensagem = strMensagem & "    				 	 		<tr><font face= "&fonte&"  style=font-size:11px;color:000000> "
strMensagem = strMensagem & "                               <td>"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;  face= "&fonte&"  color= #000080 ><b>Banco:</b> "
strMensagem = strMensagem & "                               Ita�<br><b>Ag�ncia:</b> 0874"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber7 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;color:#000080;  face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td><td>"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;  face= "&fonte&"  color= #000080 ><b>Conta "
strMensagem = strMensagem & "                               Poupan�a:</b> 33818-9<br><b>Para: </b>Evandro "
strMensagem = strMensagem & "                               Louren�o N de Souza"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber10 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style= font-family:"&fonte&";font-size:11px;color:#000080;  face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=   width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td>"
strMensagem = strMensagem & " 							           </font>"
strMensagem = strMensagem & " 							           </tr>"
strMensagem = strMensagem & "    				 	 		<tr><font face= "&fonte&"  style=font-size:11px;color:000000> "
strMensagem = strMensagem & "                               <td><font style=font-family:"&fonte&";font-size:11px;color:#000000;><b>Banco:</b> "
strMensagem = strMensagem & "                               Caixa Econ�mica Federal<br><b>Ag�ncia:</b> 1584"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber6 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td><td><font style=font-family:"&fonte&";font-size:11px;color:#000000;><b>Conta Corrente:</b> "
strMensagem = strMensagem & "                               2993-6<br><b>Para: </b>Edilson Louren�o N de Souza"
strMensagem = strMensagem & "                               <table border= 0  cellpadding= 0  cellspacing= 0  style= border-collapse: collapse  bordercolor= #111111  width= 100%  id= AutoNumber11 >"
strMensagem = strMensagem & "                                 <tr>"
strMensagem = strMensagem & "                                   <td width= 100% >"
strMensagem = strMensagem & "                               <font style=font-family:"&fonte&";font-size:11px;color:#000000; face= "&fonte&" >"
strMensagem = strMensagem & "                                   <img border= 0  src=    width= 10  height= 10 ></td>"
strMensagem = strMensagem & "                                 </tr>"
strMensagem = strMensagem & "                               </table>"
strMensagem = strMensagem & "                               </td>"
strMensagem = strMensagem & " 							           </font>"
strMensagem = strMensagem & " 							           </tr>"
strMensagem = strMensagem & " 						</table>"
strMensagem = strMensagem & "          <p><br>"
strMensagem = strMensagem & " &nbsp;</DIV>"
strMensagem = strMensagem & "        <DIV><FONT face=Arial style='FONT-SIZE: 11px'><FONT face="&fonte&""
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'>  "
strMensagem = strMensagem & "        <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "        </FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&" style='FONT-SIZE: 11px'><FONT "
strMensagem = strMensagem & "        face="&fonte&" size=2> </FONT></FONT></DIV>"
strMensagem = strMensagem & "        <DIV align=left><FONT face="&fonte&" style='FONT-SIZE: 11px'><STRONG>Seu"
strMensagem = strMensagem & "        Pedido</STRONG></FONT></FONT></FONT><FONT face="&fonte&" "
strMensagem = strMensagem & "        style='FONT-SIZE: 11px'><BR><BR></DIV></DIV></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR>"
strMensagem = strMensagem & "      <TD colSpan=2><FONT face="&fonte&"><FONT color=#000000 style='COLOR: #000000; FONT-SIZE: 11px'><B>Endere�o:"
strMensagem = strMensagem & "        </B>"&strEndereco&"<BR><B>Bairro: </B>"&strBairro&" "
strMensagem = strMensagem & "        <BR><B>Local:</B> "&strCidade&"-"&strEstado&" </FONT></FONT></TD>"
strMensagem = strMensagem & "      <TD colSpan=2><FONT face="&fonte&"><FONT color=#000000 style='COLOR: #000000; FONT-SIZE: 11px'><B>CEP:</B> "
strMensagem = strMensagem & "        "&strCep&" <BR><B>Pa�s:</B> "&strPais&" <BR><B>Telefone:</B> "&strFone&" "
strMensagem = strMensagem & "        </FONT></FONT></TD></TR>"
strMensagem = strMensagem & "    <TR bgColor=#ffffff>"
strMensagem = strMensagem & "      <TD colSpan=4><b><FONT face="&fonte&"><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table><FONT color=#000000 style='COLOR: #000000; FONT-SIZE: 11px'>Forma de Pagamento:</b> "&txtpagamento&"</font></font><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table></TD></TR>"
strMensagem = strMensagem & "    <TR bgColor="&cor3&">"
strMensagem = strMensagem & "      <TD align=left noWrap vAlign=center width='15%'><FONT color=#000000"
strMensagem = strMensagem & "        face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px' "
strMensagem = strMensagem & "        style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Quantidade<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "      <TD align=left noWrap vAlign=center width='44%'><FONT color=#000000 "
strMensagem = strMensagem & "        face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px' "
strMensagem = strMensagem & "        style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Produto<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "      <TD align=left vAlign=center width='16%'><FONT color=#000000 face="&fonte&" "
strMensagem = strMensagem & "        style='COLOR: #000000; FONT-SIZE: 11px' style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Pre�o "
strMensagem = strMensagem & "        Unit�rio<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "      <TD align=right noWrap vAlign=center width='25%'><FONT color=#000000"
strMensagem = strMensagem & "        face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px' style='BACKGROUND-COLOR: "&cor3&"'><STRONG>Pre�o"
strMensagem = strMensagem & "        Total<STRONG></FONT></STRONG></STRONG></TD></TR>"

'Chama os produtos comprados

set pedidos = abredb.Execute("SELECT idprod, quantidade FROM pedidos WHERE idcompra='"&intOrderID&"';")
while not pedidos.EOF
idprod = pedidos("idprod")
quantidade = pedidos("quantidade")
set produtos = abredb.Execute("SELECT preco, nome, peso FROM produtos WHERE idprod="&idprod&";")
preco = produtos("preco")
peso = produtos("peso")
nome = produtos("nome")

intProdID = idprod
strProdNome = nome
pesoz = peso
intProdPric = preco
intQuant = quantidade
prodvalor = formatNumber(intProdPric,2)
prodvalort = formatNumber((intQuant * intProdPric),2)

strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD align=left vAlign=center width='15%'><FONT face="&fonte&" size=2><FONT"
strMensagem = strMensagem & "      face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px'>"&intQuant&" </FONT></FONT></TD>"
strMensagem = strMensagem & "   <TD align=left width='44%'><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'> "&strProdNome&" </FONT></TD>"
strMensagem = strMensagem & "    <TD align=right width='16%'><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'>" & strLgMoeda & " " & prodvalor&" </FONT></TD>"
strMensagem = strMensagem & "    <TD align=right width='25%'><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'>" & strLgMoeda & " " &prodvalort&" </FONT></TD></TR>"

pedidos.MoveNext
wend
pedidos.Close
set pedidos = Nothing
produtos.Close
set produtos = Nothing

strMensagem = strMensagem & "  <TR bgColor="&cor3&">"
strMensagem = strMensagem & "    <TD colSpan=4 heigth='5'></TD>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD align=left colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG>Total da"
strMensagem = strMensagem & "      compra<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "    <TD align=right colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG><B>" & strLgMoeda & " "&formatnumber(strCompq,2)&"</B>"
strMensagem = strMensagem & "      <STRONG></FONT></STRONG></STRONG></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "   <TD align=left colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG>Valor da Entrega<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "    <TD align=right colSpan=2 vAlign=center><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG><B>" & strLgMoeda & " " &formatnumber(request.form("frete1"),2)&"</B>"
strMensagem = strMensagem & "      <STRONG></FONT></STRONG></STRONG></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD align=left colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG>Sua "
strMensagem = strMensagem & "      compra<STRONG></FONT></STRONG></STRONG></TD>"
strMensagem = strMensagem & "    <TD align=right colSpan=2 vAlign=center><FONT face="&fonte&""
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><STRONG><B>" & strLgMoeda & " " &formatnumber(Request.form("totalae"),2)&"</B>"
strMensagem = strMensagem & "      <STRONG></FONT></STRONG></STRONG></TD></TR>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4></TD></TR>"
strMensagem = strMensagem & "  <TR bgColor=#ffffff>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT color=#000000 style='FONT-SIZE: 11px'>"
strMensagem = strMensagem & "      <DIV align=left> </DIV>"
strMensagem = strMensagem & "      <DIV align=left><FONT face=Arial size=2>"
strMensagem = strMensagem & "      <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "      &nbsp;</FONT></DIV>"
strMensagem = strMensagem & "      <DIV align=left><FONT face="&fonte&"><FONT style='FONT-SIZE: 11px'>LEMBRE-SE"
strMensagem = strMensagem & "      de que os dados acima devem estar corretos e completos para n�o haver "
strMensagem = strMensagem & "      demora e dificuldade na entrega do pedido.<BR></DIV>"
strMensagem = strMensagem & "      <DIV> </DIV>"
strMensagem = strMensagem & "      <DIV align=left><FONT face="&fonte&"><FONT"
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'>Atenciosamente,<BR>Atendimento ao"
strMensagem = strMensagem & "      Cliente</FONT><BR></FONT></DIV></FONT></TD>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4 vAlign=top>"
strMensagem = strMensagem & "      <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor="&cor3&"></td></tr><tr><td height=5></td></tr></table>"
strMensagem = strMensagem & "    </TD></TD>"
strMensagem = strMensagem & "  <TR>"
strMensagem = strMensagem & "    <TD colSpan=4><FONT face="&fonte&"><B><FONT style=font-size:13px>Equipe"
strMensagem = strMensagem & "      "&nomeloja&"</FONT></B><BR><FONT face="&fonte&" "
strMensagem = strMensagem & "      style='COLOR: #000000; FONT-SIZE: 11px'><A "
strMensagem = strMensagem & "      href='http://"&urlloja&"'>"&urlloja&"</A><BR><FONT"
strMensagem = strMensagem & "      face="&fonte&" style='COLOR: #000000; FONT-SIZE: 11px'><A "
strMensagem = strMensagem & "      href='mailto:"&emailloja&"'>"&emailloja&"</A><BR></FONT></FONT></FONT></TD></TR></TBODY></TABLE></DIV></BODY></HTML>"

'Envia o e-mail


%>
<!--#include file="email.asp"-->
<%
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", session("usuario"), "Confirma��o de compra na "&nomeloja&"!", strMensagem
EnviaEmail Application("HostLoja"), Application("ComponenteLoja"), emailloja, "", emailloja, "Compraram na "&nomeloja&"!", "strMensagem"

else
end if%>
  	  		   <table><tr><td align="left" valign="top">
			   				  <table border="0" cellspacing="4" cellpadding="4" width=580><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><b>Home</b></a> � Compra conclu�da!<br><br><div align=left> <table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></div>
							  		 <table border=0 cellSpacing=0 width=575><TR><TD colSpan=4 height=42><DIV align=center><B><FONT style=font-size:17px color=000000><%=tituloloja%></FONT></B><BR><FONT style=font-size:11px><%=endereco11%> - <%=bairro11%><BR><%=cidade11%>/<%=estado11%> - <%=pais11%> - <a href="mailto:<%=emailloja%>" style=text-decoration:none;><%=emailloja%><BR></DIV></TD></TR>
									 <tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
									 <tr><td colSpan=2 align=left><FONT style=font-size:11px color=000000><B>Compra de <%=Request.Form("nome1")%></B><TD colSpan=2 align=right><B><FONT style=font-size:11px color=000000>Data: </B> <%=diadata&"/"&mesdata&"/"&year(date)%></div></TD></TR>
									 <tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
									 <tr><td colspan=4><font style=font-size:11px;color:000000><b>Dados da entrega e do pedido </b></td></tr>
									 <tr><td colSpan=2><font style=font-size:11px color=000000><b>Endere�o: </b><%=strEndereco%><br><b>Bairro: </b> <%=strBairro%><br><b> Local:</b> <%=strCidade%>-<%=strEstado%></td><td colSpan=2><font style=font-size:11px color=000000><b> CEP:</b> <%=strCep%><br><b> Pa�s:</b> <%=strPais%><br><b> Telefone:</b> <%=strFone%></td></TR>
<%
valortotalx = request.form("totalae")

'Chama o nome da forma de pagament escolhida
if strCartao="0" then
forma = strLg222
end if
if strCartao="1" then
forma = strLg221
end if
if strCartao="2" then
forma = strLg224
end if
if strCartao="3" then
forma = strLg223
end if
if strCartao="4" then
forma = strLg225
end if
if strCartao="6" then
forma = "Transfer�ncia Eletr�nica"
end if
if strCartao="5" then
forma = "Dep�sito Banc�rio"
end if
if strCartao="7" then
forma = "Boleto Banc�rio"
end if
%>
	  			  		   		<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Informa��es sobre sua compra</b></td></tr>
								<tr><td width=30%><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Sub-total:</b>&nbsp;<%= strLgMoeda & " " & formatnumber(strCompq,2)%></td><td width=20%><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Frete:&nbsp;</b><%= strLgMoeda & " " & formatnumber(request.form("frete1"),2)%></td><td width=25%><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Valor Total:&nbsp;</b><%=strLgMoeda & " " & formatnumber(valortotalx,2)%></td><td width=40%></td></tr>
								<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Informa��es de pagamento (<%=forma%>)</b></td></tr>
<%
'Chama pela forma de pagamento a tela final
if strCartao="0" OR strCartao="1" OR strCartao="2" OR strCartao="3" then%>
   				 				  <tr><td colspan=2><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>�ltimos D�gitos:</b> <%=left(numero,2) & "/" & right(numero,5)%><br><b>Titular:</b> <%=strTitular%> <br></td><td colspan=2 valign=top><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>Expira��o do Cart�o:</b> <%=strExpmes & "/" & strExpano%><br></td></tr> <tr><td colspan=4><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><br><center><b>Status da transa��o:</b><font color=#a51905> <b>Compra confirmada com a operadora do <%=forma%>!</font></b></center></td></tr>
<%end if
if strCartao="4" then%>
   				 	   			  <tr><td colspan=4><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><center><font color=#a51905> <br><b>Seu pedido dever� ser retirado na ag�ncia dos CORREIOS mais pr�xima do endere�o informado para entrega e o pagamento ser� feito no ato, agrade�emos a prefer�ncia! </b></font></center></td></tr>
<%
end if
if strCartao="5" then
%>
   				 	 		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	 		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg267%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Ag�ncia:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg268%></td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg269%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg270%></td></tr>
   				 	 		<tr><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	 		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg271%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Ag�ncia:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg272%></td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg273%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg274%></td></tr>
   				 	 		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	 		<tr><td colspan=2 bgcolor="#F0F0F0"><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>Banco:</b> <%=bancopag%><br><b>Ag�ncia:</b> <%=agpag%>
                              </td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg275%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>:</b> <%=contapag%><br><b>Para: </b><%=pagpara%>
                              </td></tr>
							<tr><td colspan=4><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><center>
                              <p align="left">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:000000;" face="<%=fonte%>" color="#a51905">
                              <b><br>
                              C�digo para o Dep�sito: #</b></font><font style="font-size:11px; color:000000" color=000000 face="<%=fonte%>"><b><%=replace(strPedido,",","")%></b></font></p>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><center>
                              <p><font color=#a51905> <b>Envie-nos um e-mail com o c�digo de dep�sito para confirma��o do pagamento. Ap�s a verifica��o, seu pedido ser� liberado imediatamente para entrega!</b></font></p>
                              </center></center></td></tr>
<%
'Atualiza o numero do deposito identificdo
end if
if strCartao="6" then%>
   				 	   		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	   		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg267%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Ag�ncia:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg268%></font></td>
                              <td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><b>:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg269%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg270%></font></td></tr>
   				 	   		<tr><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style="font-family:<%=fonte%>;font-size:11px; color:000000" face="<%=fonte%>" color="#000080">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;" face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	   		<tr><td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>Banco:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg271%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Ag�ncia:</b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg272%></font></td>
                              <td colspan=2 bgcolor="#F0F0F0">
                              <font face="<%=fonte%>" style=font-size:11px;color:000000>
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000080;font-weight:700" face="<%=fonte%>">
                              <%=strLg276%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><b>: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg273%></font><font style="font-family:<%=fonte%>;font-size:11px;" face="<%=fonte%>" color="#000080"><br><b>Para: </b>
                              </font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <%=strLg274%></font></td></tr>
   				 	   		<tr><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td><td colspan=2>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></td></tr>
   				 	   		<tr><td colspan=2 bgcolor="#F0F0F0"><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>Banco:</b> <%=bancopag%><br><b>Ag�ncia:</b> <%=agpag%>
                              </td><td colspan=2 bgcolor="#F0F0F0">
                              <font style="font-family:<%=fonte%>;font-size:11px;color:#000000; font-weight:700" face="<%=fonte%>">
                              <%=strLg275%></font><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b>:</b> <%=contapag%><br><b>Para: </b><%=pagpara%>
                              </td></tr>
							           </font>
							<tr><td colspan=4>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><center>
                              <p><font color=#a51905> <b><br>
                              <br>
                              Ap�s a confirma��o do pagamento seu pedido ser� imediatamente liberado para entrega!</b></font></p>
                              </center></td></tr>
<%
end if

'* ANTEN��O: precisa ter no banco a tabela BOLETO com o campo NOSSO. *
'Pagamento por Boleto

if strCartao="7" then

'Pega o �ltimo nosso n�mero
Set rsNosso = abredb.Execute("SELECT nosso from boleto;")
strNosso = rsNosso("nosso")

strNosso = strNosso + 1

'Atualiza o nosso n�mero
set rsNosso = abredb.Execute("UPDATE boleto SET nosso = '"&strNosso&"';")

%>

							  <tr><td colspan=4>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>"><center>
                              <p>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10">
<script LANGUAGE="JavaScript">
       function Boleto() {
                remote = window.open("","remotewin","'toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=no,copyhistory=no,width=720,height=500'");
                remote.location.href = "<%=caminho_boleto%>?sacador=<%=Request.Form("nome1")%>&endereco=<%=strEndereco%>&bairro=<%=strBairro%>&cidade=<%=strCidade%>&estado=<%=strEstado%>&cep=<%=strCep%>&nossonumero=<%=strNosso%>&datadocumento=<%=diadata&"/"&mesdata&"/"&year(date)%>&datavencimento=<%=diadatax&"/"&mesdatax&"/"&year(entdiax)%>&valordocumento=<%=formatnumber(valortotalx,2)%>&numerodoc=<%=replace(strPedido,",","")%>";
                remote.opener = window;
                remote.opener.name = "imagem1";
                }

                              </script>
                                  </font></font><font color=#a51905><b><br>
                              <img border="0" src="<%=dirlingua%>/imagens/boleto_news_2.gif"><br>
                              </b></font>
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                              <font style=font-family:<%=fonte%>;font-size:11px;color:#000000; face="<%=fonte%>">
                                  <img border="0" src="<%=dirlingua%>/imagens/trans.gif" width="10" height="10"></font></font><font color=#a51905><b><br>
                              <a href="javascript:Boleto()">
                              <img border="0" src="<%=dirlingua%>/imagens/ver_boleto.gif"></a><br>
                              <br>
                              Ap�s a confirma��o do pagamento do BOLETO seu pedido ser� imediatamente liberado para entrega!</b></font></p>
                              </center></td></tr>

<%
'rsNosso.close
'Set rsNosso = Nothing
end if
%>
	  	  					<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Entrega da compra
                              ap�s a confirma��o do pagamento</b></td></tr>
							<tr><td colspan=2><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Compra efetuada em:</b> <%=diadata&"/"&mesdata&"/"&year(date)%></td><td colspan=2><font style=font-size:11px;font-family:<%=fonte%>;color:000000><b>Previs�o de entrega do pedido:</b> <%=diadatax&"/"&mesdatax&"/"&year(entdiax)%></td></tr>
							<tr><td colspan=4><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
							<tr bgcolor=#ffffff><td colspan=4><font style=font-size:11px color=000000><center>Detalhes e informa��es sobre a sua compra j� foram enviadas para o e-mail <b><%=request.form("email1")%></b>.<br>O n�mero do seu pedido � <b>#<%=replace(strPedido,",","")%></b>, anote-o em um local seguro.<br>Sua sess�o foi finalizada e todos os produtos do seu Carrinho de Compras foram removidos.</tr>
<%
'Abandona a sess�o de compras do cliente
session.abandon %>
				   	  		  <tr><td colspan=4 valign=top><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></tr></td><form action=fim.asp><input type=hidden name=usuario value="<%= strUser %>">
							  <tr align=center><td colspan=2 valign=top><div id="layer1"><input type="image" name="fecha" src=<%=dirlingua%>/imagens/finaliza.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='Finalizar Compras';return true;"></div></td><td colspan=2 valign=top>
                                </form><div id="layer1"><input type="image" name="fecha" src=<%=dirlingua%>/imagens/printrecibo.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='Imprimir Recibo';return true;" OnClick="javascript: print()"></div></td></tr>
						</table></form></td></tr>
				</table></td></tr>
		</table>
		</font></font></font></b>
		<!-- #include file="baixo.asp" -->