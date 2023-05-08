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
%>


<html>
<!-- #include file="config.asp" -->
<%

'***************************************************
' Dados do Autor:
'   Copyright (C) 2002  Data Tech Tecnologia e Inform�tica LTDA
'  daniel@seevissp.org.br - avenida daury goes de moraes, 357 - caieiras - s�o paulo - sp - 07700-000 - brasil
'***************************************************
   
' Response.Expires = 60
'Response.Expiresabsolute = Now() - 1
'Response.AddHeader "pragma","no-cache"
'Response.AddHeader "cache-control","private"
'Response.CacheControl = "no-cache"

 
SDIG=""
CDIG=""
LDIG=""
NOSSONUMERO=""
Dim atab(99)


'********************************
' CONSTANTES
'********************************

cons_banco = bol_banco
cons_dvbanco = bol_dvbanco
cons_agencia = bol_agencia
cons_conta = bol_conta
cons_carteira = bol_carteira
cons_moeda = bol_moeda
cons_especie = bol_especie
cons_cedente = bol_cedente
cons_dadoscedente= bol_dadoscedente


'********************************
' VARI�VEIS 
'********************************

var_sacado = Request.QueryString("sacador")
var_endereco = Request.QueryString("endereco")
var_bairro = Request.QueryString("bairro")
var_cidade = Request.QueryString("cidade")
var_estado = Request.QueryString("estado")
var_cep = Request.QueryString("cep")
var_cpfcnpj = CNPJ_da_sua_empresa

'*************************************** 
 Function Converten(pNumeron)
 Converten = Right(String(8,"0") &_
 cstr(pNumeron * 100),8)
 End Function
'****************************************

var_nossonumero = Converten(ccur(Request.QueryString("nossonumero")))
var_datadocumento = Request.QueryString("datadocumento")
var_datavencimento = Request.QueryString("datavencimento")
var_valordocumento = Request.QueryString("valordocumento")
var_numerodoc = Request.QueryString("numerodoc")
var_instrucoes="<B><BR> N�o receber ap�s 90 dias.<BR> Pag�vel em ag�ncias do ITA�<br> ou em qualquer ag�ncia banc�ria at� o vencimento <BR></b>"
var_observacoes="<B> <BR> Pagamento referente a compra efetuada na loja "&application("nomeloja")&"<BR> <BR> <BR> <BR></b>"

'********************************
' INICIO DO C�LCULO
'********************************

dvnossonumero=calcdig10(cons_agencia&cons_conta&cons_carteira&var_nossonumero)
dvagconta=calcdig10(cons_agencia&cons_conta)


valordia=date()
var_data=Day(valordia) & "/" & Month(valordia) & "/" & YEAR(valordia)

valorvalor1=var_valordocumento
valorvalor2=replace(valorvalor1,",","")
valorvalor2=replace(valorvalor2,".","")
valorvalor3=len(valorvalor2)
valorvalor4=10-valorvalor3
var_valor= String(""&valorvalor4&"","0") & (""&valorvalor2&"")
if valorvalor1=0 then
   var_valor=""
end if

var_fatorvencimento=fatorvencimento(""&var_datavencimento&"")
if var_fatorvencimento="0000" then
   var_datavencimento="Contra Apresenta��o"
end if



var_codigobarras=codbar(""&cons_banco&"",""&cons_moeda&"",""&var_fatorvencimento&"",""&var_valor&"",""&cons_carteira&"",""&var_nossonumero&"",""&dvnossonumero&"",""&cons_agencia&"",""&cons_conta&"",""&dvagconta&"")
var_linhadigitavel=linhadigitavel(""&var_codigobarras&"")



'**************************
FUNCTION linhadigitavel(codigobarras)
'**************************
cmplivre=mid(codigobarras,20,25)
campo1=left(codigobarras,4)&mid(cmplivre,1,5)
campo1=campo1&calcdig10(campo1)
campo1=mid(campo1,1,5)&"."&mid(campo1,6,5)

campo2=mid(cmplivre,6,10)
campo2=campo2&calcdig10(campo2)
campo2=mid(campo2,1,5)&"."&mid(campo2,6,6)

campo3=mid(cmplivre,16,10)
campo3=campo3&calcdig10(campo3)
campo3=mid(campo3,1,5)&"."&mid(campo3,6,6)

campo4=mid(codigobarras,5,1)

campo5=int(mid(codigobarras,6,14))

if campo5=0 then
	campo5="000"
end if

linhadigitavel=campo1&"&nbsp;&nbsp;"&campo2&"&nbsp;&nbsp;"&campo3&"&nbsp;&nbsp;"&campo4&"&nbsp;&nbsp;"&campo5
'*************************
END FUNCTION
'*************************




'valortal=CALCdig10("11513024791005193100033")
'response.write valortal

'**************************
FUNCTION CALCDIG10(cadeia)
'**************************
	mult=(len(cadeia) mod 2) 
	mult=mult+1
	total=0
	for pos=1 to len(cadeia)
		res= mid(cadeia, pos, 1) * mult
		if res>9 then
			res=int(res/10) + (res mod 10)
		end if
		total=total+res
		if mult=2 then
			mult=1
		else
			mult=2
		end if
	next
	total=((10-(total mod 10)) mod 10 )
	CALCDIG10=total
'*************************
END FUNCTION
'*************************




'valortal1=CALCdig11("0339000000000103581481302647800076960003348",9,0)
'response.write valortal1

'**************************
FUNCTION CALCDIG11(cadeia,limitesup,lflag)
'**************************
mult=1 + (len(cadeia) mod (limitesup-1))
if mult=1 then
	mult=limitesup
end if
total=0
for pos=1 to len(cadeia)
	total=total+(mid(cadeia,pos,1) * mult)
	mult=mult-1
	if mult=1 then
		mult=limitesup
	end if
Next
nresto=(total mod 11)
if lflag = 1 then
	calcdig11=nresto
else
	if nresto=0 or nresto=1 or nresto=10 then
		ndig=1
	else
		ndig=11 - nresto	
	end if
	calcdig11=ndig
end if

'*************************
END FUNCTION
'*************************



'**************************
FUNCTION fatorvencimento(vencimento)
'**************************

if len(vencimento)<8 then
   fatorvencimento="0000"
else
   fatorvencimento=datevalue(""&vencimento&"")-datevalue("1997/10/07")
end if

'*************************
END FUNCTION
'*************************




'**************************
FUNCTION codbar(banco,moeda,vencimento,valor,carteira,nossonumero,dvnossonumero,agencia,conta,dvagconta)
'**************************

strcodbar=banco&moeda&vencimento&valor&carteira&nossonumero&dvnossonumero&agencia&conta&dvagconta&"000"
dv3=calcdig11(strcodbar,9,0)
codbar=banco&moeda&dv3&vencimento&valor&carteira&nossonumero&dvnossonumero&agencia&conta&dvagconta&"000"
'*************************
END FUNCTION
'*************************




'**************************
Sub WBarCode( Valor )
'**************************

Dim f, f1, f2, i
Dim texto
Const fino = 1
Const largo = 3
Const altura = 50
Dim BarCodes(99)

if isempty(BarCodes(0)) then
  BarCodes(0) = "00110"
  BarCodes(1) = "10001"
  BarCodes(2) = "01001"
  BarCodes(3) = "11000"
  BarCodes(4) = "00101"
  BarCodes(5) = "10100"
  BarCodes(6) = "01100"
  BarCodes(7) = "00011"
  BarCodes(8) = "10010"
  BarCodes(9) = "01010"
  for f1 = 9 to 0 step -1
    for f2 = 9 to 0 Step -1
      f = f1 * 10 + f2
      texto = ""
      for i = 1 To 5
        texto = texto & mid(BarCodes(f1), i, 1) + mid(BarCodes(f2), i, 1)
      next
      BarCodes(f) = texto
    next
  next
end if

'Desenho da barra


' Guarda inicial
%>

<head>

<STYLE type=text/css>
.ti { FONT: 9px tahoma, Helvetica, sans-serif }
.ct { FONT: 9px tahoma; COLOR: navy }
.cn { FONT: 9px Arial; COLOR: black }
.cp { FONT: bold 11px tahoma; COLOR: black }
.ld { FONT: bold 12px tahoma; COLOR: #000000 }
.bc { FONT: bold 16px tahoma; COLOR: #000000 }
</STYLE>

</head>


<img src=p.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=b.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=p.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=b.gif width=<%=fino%> height=<%=altura%> border=0><img 

<%
texto = valor
if len( texto ) mod 2 <> 0 then
  texto = "0" & texto
end if


' Draw dos dados
do while len(texto) > 0
  i = cint( left( texto, 2) )
  texto = right( texto, len( texto ) - 2)
  f = BarCodes(i)
  for i = 1 to 10 step 2
    if mid(f, i, 1) = "0" then
      f1 = fino
    else
      f1 = largo
    end if
    %>
    src=p.gif width=<%=f1%> height=<%=altura%> border=0><img 
    <%
    if mid(f, i + 1, 1) = "0" Then
      f2 = fino
    else
      f2 = largo
    end if
    %>
    src=b.gif width=<%=f2%> height=<%=altura%> border=0><img 
    <%
  next
loop

' Draw guarda final
%>
src=p.gif width=<%=largo%> height=<%=altura%> border=0><img 
src=b.gif width=<%=fino%> height=<%=altura%> border=0><img 
src=p.gif width=<%=1%> height=<%=altura%> border=0>

<%
'**************************
end sub
'**************************
%>


<SCRIPT language=JavaScript>
var da = (document.all) ? 1 : 0;
var pr = (window.print) ? 1 : 0;
var mac = (navigator.userAgent.indexOf("Mac") != -1); 

function x86(){
if (pr) // NS4, IE5
window.print()
else if (da && !mac) // IE4 (Windows)
vbx86()
else // outros browsers
alert("Desculpe seu browser n�o suporta esta fun��o. Por favor utilize a barra de trabalho para imprimir a p�gina.");
return false;}
if (da && !pr && !mac) with (document) {
writeln('<OBJECT ID="WB" WIDTH="0" HEIGHT="0" CLASSID="clsid:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>');
writeln('<' + 'SCRIPT LANGUAGE="VBScript">');
writeln('Sub window_onunload');
writeln('  On Error Resume Next');
writeln('  Set WB = nothing');
writeln('End Sub');
writeln('Sub vbx86');
writeln('  OLECMDID_PRINT = 6');
writeln('  OLECMDEXECOPT_DONTPROMPTUSER = 2');
writeln('  OLECMDEXECOPT_PROMPTUSER = 1');
writeln('  On Error Resume Next');
writeln('  WB.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER');
writeln('End Sub');
writeln('<' + '/SCRIPT>');}
</SCRIPT>



<CENTER>

<p>
<br>
<TABLE WIDTH="660" CELLSPACING=0 CELLPADDING=0 BORDER=0>
  	<TR>
		<TD class=cp VALIGN=BOTTOM WIDTH=225><IMG SRC="<%=dirlingua%>/imagens/logoitau.gif" width="129" height="26"></TD>
		<TD ALIGN=RIGHT VALIGN=BOTTOM><FONT class=ld><B>RECIBO DO SACADO</B></FONT></TD>
	</TR>
</TABLE>
<TABLE WIDTH="660" BORDER=1 CELLSPACING=0 CELLPADDING=1>
  <TR>
			<TD COLSPAN=2><FONT class=ct>Cedente</FONT><BR><FONT class=cp>&nbsp;<%=cons_cedente%></FONT></TD>
			<TD width=15%><FONT class=ct>Ag&ecirc;ncia / C&oacute;digo Cedente</FONT><BR>
					<FONT align=center class=cn>&nbsp;<%=cons_agencia%>&nbsp;/&nbsp;<%=cons_conta%>-<%=dvagconta%></FONT></TD>
   			<TD width=15%><FONT class=ct>Nosso N�mero</FONT><BR><FONT class=cn>&nbsp;<%=cons_carteira%>&nbsp;/&nbsp;<%=var_nossonumero%>-<%=dvnossonumero%></FONT></TD>
			<TD width=20% bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Vencimento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_datavencimento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
   		<TD COLSPAN=2><FONT class=ct>Sacado</FONT><BR><FONT class=cp>&nbsp;<%=var_sacado%></FONT></TD>
		<TD width=15%><FONT class=ct>Data Processamento</FONT><BR><FONT align=center class=cn>&nbsp;<%=var_data%></FONT></TD>
   		<TD width=15%><FONT class=ct>N�mero Documento</FONT><BR><FONT class=cn>&nbsp;<%=var_numerodoc%></FONT></TD>
			<TD width=20% bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Valor do Documento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_valordocumento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
   		<TD><FONT class=ct>CPF / CNPJ</FONT><BR><FONT class=cp>&nbsp;<%=var_cpfcnpj%></FONT></TD>
   		<TD width=15%><FONT class=ct>(-) Desconto / Abatimento</FONT><BR><FONT class=cp><br></FONT></TD>
   		<TD width=15%><FONT class=ct>(-) Outras Dedu&ccedil;&otilde;es</FONT><BR><FONT class=cn><br></FONT></TD>
   		<TD width=15%><FONT class=ct>(+) Mora / Multa</FONT><BR><FONT class=cn><br></FONT></TD>
   		<TD width=20% bgcolor="#CCCCCC"><FONT class=ct>(=) Valor Cobrado</FONT><BR><FONT class=cp><br></FONT></TD>
	</TR>
	<TR>
   		<TD COLSPAN=5 valign=top align=left>
			<FONT class=ct>Observa��es:</FONT><br>
			<TABLE WIDTH="640" ALIGN=RIGHT CELLSPACING=0 CELLPADDING=0 BORDER=0>
				<TR>
					<TD valign=top align=left>
      						<FONT class=cn>
							<%=var_observacoes%>
 	 					</FONT>
	 				</TD>
				</TR>
			</TABLE>
	 	</TD>
	</TR>
</TABLE>
<TABLE WIDTH="660" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR>
			<TD align=right><FONT class=ct>Autentica&ccedil;&atilde;o Mec&acirc;nica</FONT><BR><BR><BR></TD>
  </TR>
</TABLE>

<img src="<%=dirlingua%>/imagens/corte.gif" border=0 width="660"><br><br>

<TABLE WIDTH="660" BORDER=0 CELLSPACING=0 CELLPADDING=0>
  <tr>
		<td class=cp width=150><div align="left"><img src="<%=dirlingua%>/imagens/logoitau.gif" width="129" height="26"></div></td>
  		<td width=3 valign="bottom"><img height=22 src="barra.gif" width=2 border=0></td>
	  	<td class=cpt  width=58 valign="bottom"><div align="center"><font class="bc"><%=cons_banco%>-<%=cons_dvbanco%></font></div></td>
  		<td width=3 valign="bottom"><img height=22 src="barra.gif" width=2 border=0></td>
	  	<td class=ld align=right width=453 valign="bottom"><span class='ld'><p align="right">&nbsp;<%=var_linhadigitavel%></span></td>
  </tr>
</TABLE>
<TABLE WIDTH="660" BORDER=1 CELLSPACING=0 CELLPADDING=1>
  <TR>
			<TD COLSPAN=5 WIDTH=500>
					<FONT class=ct>Local de Pagamento</FONT><BR>
					<FONT class=cp>&nbsp;AT� O VENCIMENTO PAG�VEL EM QUALQUER BANCO</FONT>
			</TD>
			<TD width=170 bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Vencimento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_datavencimento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TD COLSPAN=5 WIDTH=500><FONT class=ct>Cedente</FONT><BR><FONT class=cn>&nbsp;<%=cons_cedente%></FONT></TD>
			<TD width=170>
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Ag&ecirc;ncia / C&oacute;digo Cedente</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cn><%=cons_agencia%>&nbsp;/&nbsp;<%=cons_conta%>-<%=dvagconta%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TD valign=top><FONT class=ct>Data Documento</FONT><BR><FONT class=cn>&nbsp;<%=var_datadocumento%></FONT></TD>
			<TD valign=top><FONT class=ct>N�mero Documento</FONT><BR><FONT class=cn>&nbsp;<%=var_numerodoc%></FONT></TD>
			<TD valign=top><FONT class=ct>Tipo Docu.</FONT><BR><FONT class=cn>&nbsp;DP</FONT></TD>
			<TD valign=top><FONT class=ct>Aceite</FONT><BR><FONT class=cn>&nbsp;N</FONT></TD>
			<TD valign=top><FONT class=ct>Data Processamento</FONT><BR><FONT class=cn>&nbsp;<%=var_data%></FONT></TD>
			<TD width=170>
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Nosso N�mero</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cn><%=cons_carteira%>&nbsp;/&nbsp;<%=var_nossonumero%>-<%=dvnossonumero%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TD valign=top><FONT class=ct>Uso Banco</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
			<TD valign=top><FONT class=ct>Carteira</FONT><BR><FONT class=cn>&nbsp;<%=cons_carteira%></FONT></TD>
			<TD valign=top><FONT class=ct>Esp�cie</FONT><BR><FONT class=cn>&nbsp;<%=cons_especie%></FONT></TD>
			<TD valign=top><FONT class=ct>Quantidade</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
			<TD valign=top><FONT class=ct>Valor</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
			<TD width=170 bgcolor="#CCCCCC">
			   <TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=0>
				     <TR><TD align=left><FONT class=ct>Valor do Documento</FONT></TD></TR>
						 <TR><TD align=center><FONT class=cp><%=var_valordocumento%></FONT></TD></TR>
				 </TABLE>
			</TD>
	</TR>
	<TR>
			<TH COLSPAN=5 ROWSPAN=4 valign=top align=LEFT ><FONT class=ct>Instru&ccedil;&otilde;es</FONT><BR>
 				<TABLE WIDTH="475" ALIGN=RIGHT CELLSPACING=0 CELLPADDING=0 BORDER=0>
					<TR>
						<TD valign=top align=left>
							<FONT class=cn>
								<%=var_instrucoes%>
							</FONT>
						</TD>
					</TR>
				</TABLE>
			</TH>
			<TD WIDTH=170><FONT class=ct>(-) Desconto / Abatimento</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD WIDTH=170><FONT class=ct>(-) Outras Dedu��es</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD WIDTH=170><FONT class=ct>(+) Mora / Multa</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD WIDTH=170 bgcolor="#CCCCCC"><FONT class=ct>(=) Valor Cobrado</FONT><BR><FONT class=cn>&nbsp;</FONT></TD>
	</TR>
	<TR>
			<TD COLSPAN=6 valign=top>
					<FONT class=ct>Sacado</FONT><BR>
						<TABLE WIDTH="640" ALIGN=RIGHT CELLSPACING=0 CELLPADDING=0 BORDER=0>
							<TR>
								<TD valign=top align=left>
									<FONT class=cn>
										<%=var_sacado%><BR>
										<%=var_endereco%><BR>
										<%=var_bairro%><BR>
										<%=var_cep%>&nbsp;-&nbsp;<%=var_cidade%>&nbsp;-&nbsp;<%=var_estado%><BR>
										<%=var_cpfcnpj%><BR>
									</FONT>
	 							</TD>
							</TR>
						</TABLE>
			</TD>
	</TR>
</TABLE>
<TABLE WIDTH="660" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR>
			<TD class=ct align=right>
  				<div align="right">Autentica��o Mec�nica - <b class="cp">Ficha de Compensa��o</b></div>
			</TD>
	</TR>
	<TR>
			<TD align=left>
					<%
						call wbarcode(var_codigobarras)
					%>
			</TD>
	</TR>
</TABLE>

<BR>
<img src="<%=dirlingua%>/imagens/corte.gif" border=0 width="660">
<BR>

<table width='640' cellspacing=5 cellpadding=0 border=0>
	<tr>
			<form name='forma'>
						<td align="center"><input type=button value=' Imprimir Boleto' onClick='x86()' name='button'></td>
			</form>
	</tr>
</table>

</CENTER>

</HTML>
