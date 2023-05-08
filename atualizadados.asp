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
'Chama dados do formulario
strEmail = request.form("email")
strEmaila = request.form("emailantigo")
strNome = request.form("nomecompleto")
strNascdia = request.form("nascdia")
strNascmes = request.form("nascmes")
strNascano = request.form("nascano")
strCpf = request.form("cpf")
strRg = request.form("rg")
strEndereco = request.form("endereco")
strBairro = request.form("bairro")
strCidade = request.form("cidade")
strEstado = request.form("estado")
strOutropais = request.form("outropais")
strCep = request.form("cepzz")
strPais = request.form("pais")
strFone = request.form("fone")

'Tira letras do campo CPF
s="" 
for x=1 to len(strCpf)
ch=mid(strCpf,x,1)
if asc(ch)>=48 and asc(ch)<=57 then
s=s & ch
end if
next
strCpf = s

'Tira letras do campo CEP
s="" 
for x=1 to len(strCep)
ch=mid(strCep,x,1)
if asc(ch)>=48 and asc(ch)<=57 then
s=s & ch
end if
next
strCep = s

'Tira letras do campo telefone
s="" 
for x=1 to len(strFone)
ch=mid(strFone,x,1)
if asc(ch)>=48 and asc(ch)<=57 then
s=s & ch
end if
next
strFone = s

'Tira letras do campo RG
s="" 
for x=1 to len(strRg)
ch=mid(strRg,x,1)
if asc(ch)>=48 and asc(ch)<=57 then
s=s & ch
end if
next
strRg = s

if strOutropais = "Sim" then
strEstado = "-"
strCep = "-"
end if

'Faz valida��o do CPF
Dim Numero(11), soma, resultado1, resultado2
if strCpf = "" then
strCpf = "inv"
end if
if len(strCpf) <> 11 then
strCpf = "inv"
elseif strCpf = "0000000000" then
strCpf = "inv"
elseif strCpf = "11111111111" then
strCpf = "inv"
elseif strCpf = "22222222222" then
strCpf = "inv"
elseif strCpf = "33333333333" then
strCpf = "inv"
elseif strCpf = "44444444444" then
strCpf = "inv"
elseif strCpf = "55555555555" then
strCpf = "inv"
elseif strCpf = "66666666666" then
strCpf = "inv"
elseif strCpf = "77777777777" then
strCpf = "inv"
elseif strCpf = "88888888888" then
strCpf = "inv"
elseif strCpf = "99999999999" then
strCpf = "inv"
elseif strCpf = "12345678909" then
strCpf = "inv"
else
Numero(1) = Cint(Mid(strCpf,1,1))
Numero(2) = Cint(Mid(strCpf,2,1))
Numero(3) = Cint(Mid(strCpf,3,1))
Numero(4) = Cint(Mid(strCpf,4,1))
Numero(5) = Cint(Mid(strCpf,5,1))
Numero(6) = CInt(Mid(strCpf,6,1))
Numero(7) = Cint(Mid(strCpf,7,1))
Numero(8) = Cint(Mid(strCpf,8,1))
Numero(9) = Cint(Mid(strCpf,9,1))
Numero(10) = Cint(Mid(strCpf,10,1))
Numero(11) = Cint(Mid(strCpf,11,1))
soma = 10 * Numero(1) + 9 * Numero(2) + 8 * Numero(3) + 7 * Numero(4) + 6 * Numero(5) + 5 * Numero(6) + 4 * Numero(7) + 3 * Numero(8) + 2 * Numero(9)
soma = soma -(11 * (int(soma / 11)))
if soma = 0 or soma = 1 then
resultado1 = 0
else
resultado1 = 11 - soma
end if
if resultado1 = Numero(10) then
soma = Numero(1) * 11 + Numero(2) * 10 + Numero(3) * 9 + Numero(4) * 8 + Numero(5) * 7 + Numero(6) * 6 + Numero(7) * 5 + Numero(8) * 4 + Numero(9) * 3 + Numero(10) * 2
soma = soma -(11 * (int(soma / 11)))
if soma = 0 or soma = 1 then
resultado2 = 0
else
resultado2 = 11 - soma
end if
if resultado2 = Numero(11) then
else
strCpf = "inv"
end if
else 
strCpf = "inv"
end if
end if

'Verifica se o formulario est� preenchido
if strNome = "" OR strNascdia = "" OR strNascano = "" OR strNascmes = "" OR strRg = "" OR strEndereco = "" OR strBairro = "" OR strCidade = "" OR strCep = "" OR strFone = "" OR strCpf = "" OR strCpf = "inv" then

'Valida e retorna o CPF para loja processar
ElCpf = request.form("cpf")
if strCpf = "inv" then
strCpf = ElCpf
end if
s="" 
for x=1 to len(ElCpf)
ch=mid(ElCpf,x,1)
if asc(ch)>=48 and asc(ch)<=57 then
s=s & ch
end if
next
ElCpf = s
if ElCpf = "" then
erro4 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
end if
if len(ElCpf) <> 11 then
erro4 = "<font style=font-size:10px color=red>- " & strLg142 & "</font>"
elseif ElCpf = "0000000000" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "11111111111" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "22222222222" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "33333333333" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "44444444444" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "55555555555" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "66666666666" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "77777777777" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "88888888888" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "99999999999" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
elseif ElCpf = "12345678909" then
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
else
Numero(1) = Cint(Mid(ElCpf,1,1))
Numero(2) = Cint(Mid(ElCpf,2,1))
Numero(3) = Cint(Mid(ElCpf,3,1))
Numero(4) = Cint(Mid(ElCpf,4,1))
Numero(5) = Cint(Mid(ElCpf,5,1))
Numero(6) = CInt(Mid(ElCpf,6,1))
Numero(7) = Cint(Mid(ElCpf,7,1))
Numero(8) = Cint(Mid(ElCpf,8,1))
Numero(9) = Cint(Mid(ElCpf,9,1))
Numero(10) = Cint(Mid(ElCpf,10,1))
Numero(11) = Cint(Mid(ElCpf,11,1))
soma = 10 * Numero(1) + 9 * Numero(2) + 8 * Numero(3) + 7 * Numero(4) + 6 * Numero(5) + 5 * Numero(6) + 4 * Numero(7) + 3 * Numero(8) + 2 * Numero(9)
soma = soma -(11 * (int(soma / 11)))
if soma = 0 or soma = 1 then
resultado1 = 0
else
resultado1 = 11 - soma
end if
if resultado1 = Numero(10) then
soma = Numero(1) * 11 + Numero(2) * 10 + Numero(3) * 9 + Numero(4) * 8 + Numero(5) * 7 + Numero(6) * 6 + Numero(7) * 5 + Numero(8) * 4 + Numero(9) * 3 + Numero(10) * 2
soma = soma -(11 * (int(soma / 11)))
if soma = 0 or soma = 1 then
resultado2 = 0
else
resultado2 = 11 - soma
end if
if resultado2 = Numero(11) then
erro4 = ""
else
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
end if
else 
erro4 = "<font style=font-size:10px color=red>- " & strLg143 & "</font>"
end if
end if

'Verifica se a pessoa escolheu ou n�o outro pais
if strOutropais = "Sim" then
strEstado = "-"
strCep = "-"
else
if strCep = "" then
erro9 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
if isnumeric(strCep) = false then
erro9 = "<font style=font-size:10px color=red>- " & strLg144 & "</font>"
else
erro9 = ""
end if
end if
end if

'Verifica se o email j� existe na base de dados
Set dados = abredb.Execute("SELECT * FROM clientes WHERE email='"&Cripto(strEmail,true)&"';")
if dados.EOF then
strEmail = strEmail
else 
if strEmail = strEmaila then
strEmail = strEmail
else
strEmail = "sim@."
end if
end if
dados.close
set dados = nothing

'Verifica o telefone
if strFone = "" then
erro10 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
if isnumeric(strFone) = false then
erro10 = "<font style=font-size:10px color=red>- " & strLg144 & "</font>"
else
erro10 = ""
end if
end if

'Verifica o estado
if strEstado = "" then
strEstado = "-"
end if

'Verifica o endereco
if strCidade = "" then
erro8 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
erro8 = ""
end if
if strBairro = "" then
erro7 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
erro7 = ""
end if
if strEndereco = "" then
erro6 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
erro6 = ""
end if

'Verifica o RG
if strRg = "" then
erro5 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
if isnumeric(strRG) = false then
erro5 = "<font style=font-size:10px color=red>- " & strLg144 & "</font>"
else
erro5 = ""
end if
end if

'Verifica os dados pessoais
if strNascdia = "" OR strNascmes = "" OR strNascano = "" then
erro3 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
if strNascano < "1890" OR strNascano > "2002" then
erro3 = "<font style=font-size:10px color=red>- " & strLg144 & "</font>"
else
erro3 = ""
end if
end if
if strEmail = "" OR instr(strEmail, "@") = 0 Or instr(strEmail, ".") = 0 then
erro = "<font style=font-size:10px color=red>- " & strLg144 & "</font>"
end if
if strEmail = "sim@." then
erro = "<font style=font-size:10px color=red>- " & strLg145 & "</font>"
strEmail = ""
end if
if strNome = "" then
erro2 = "<font style=font-size:10px color=red>- " & strLg141 & "</font>"
else
erro2 = ""
end if%>

		<table><tr><td align="left" valign="top"><table border="0" cellspacing="4" cellpadding="4" width=590><tr><td> <font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <%=strLg9%><br><br>
					   <div align=left><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><font style=font-size:11px><font style=font-size:10px><%=strLg104%><br><%=strLg105%></font></div><table cellspacing="1" cellpadding="1" align="center" width=98%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function paises(){
		 var currentState = document.registro1.outropais.checked == false; 
		 var newState = document.registro1.outropais.checked == true;
		 	 if (newState != currentState){
			  document.registro1.cepzz.disabled = newState;
			  document.registro1.estado.disabled = newState;
			  document.registro1.pais.disabled = !newState;
			if (document.registro1.pais.disabled = !newState) {
			  document.registro1.pais.value = "Brasil";
			  }
		}
        }
// -->
</SCRIPT>

		 <form action=atualizadados.asp method=post name="registro1" onMouseOver="javascript: paises();">
		  <input type=hidden name=emailantigo value="<%=strEmaila%>">
		  <input type=hidden name=tipo value=cadastrar>
		  		 <tr><td colspan=2><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><br><b><%=strLg106%><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
				 <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg108%></td><td><table><tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><b><%=strEmaila%></b></td><td><font style=font-size:11px>&nbsp;&nbsp;&nbsp;</font><a href=email_senha.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg146%>';return true;"><img src=<%=dirlingua%>/imagens/mod_es.gif border=0></a></td></tr></table></td></tr>
				 <tr><td colspan=2><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><br><b><%=strLg107%><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></b></td></tr>
				 <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg118%></td> <td><input type=text size=40 name=nomecompleto style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%=strNome%>"> <%=erro2%></td></tr>
				 <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg117%></td> <td><select style="font-family:<%=fonte%>;font-size:11px;color:#000000;" name="nascdia">
<% if strNascdia = "" then%>
   	  			 <option select value=""><%=strLg147%>
<%else%>
				 <option value="<%= strNascdia %>" selected><%= strNascdia %></option><option value="">---</option>
<%end if%>
	  	  		 <option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07">07<option value="08">08<option value="10">10<option value="11">11<option value="12">12<option value="13">13<option value="14">14<option value="15">15<option value="16">16 <option value="17">17 <option value="18">18<option value="19">19<option value="20">20 <option value="21">21 <option value="22">22<option value="23">23<option value="24">24 <option value="25">25<option value="26">26<option value="27">27<option value="28">28<option value="29">29<option value="30">30 <option value="31">31</option></select><font style=font-size:11px><b>/</b><select style="font-family:<%=fonte%>;font-size:11px;color:#000000;" name="nascmes">
<% if strNascmes = "" then%>
   	  			 <option value=""> <%=strLg148%>
<%else%>
				 <option value="<%= strNascmes %>" selected><%= strNascmes %></option>
				 <option value="">---</option>
<%end if%>
                  <option value="Jan">Jan <option value="Fev">Fev<option value="Mar">Mar<option value="Abr">Abr<option value="Mai">Mai <option value="Jun">Jun <option value="Jul">Jul<option value="Ago">Ago<option value="Set">Set<option value="Out">Out<option value="Nov">Nov<option value="Dez">Dez</option></select><font style=font-size:11px><b>/</b></font><input style="font-family:<%=fonte%>;font-size:11px;color:#000000;" maxLength="4" size="5" name="nascano" value="<%=strNascano%>"> <%=erro3%></td></tr>
	  			  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg116%></td><td><font style=font-size:11px><input type=text size=19 name=cpf style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%=strCpf%>"> <%=erro4%></td></tr>
				  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg115%></td><td><font style=font-size:11px><input type=text size=19 name=rg style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%=strRg%>"> <%=erro5%></td></tr>
				  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg114%></td><td><font style=font-size:11px><input type=text size=37 name=endereco style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%=strEndereco%>"> <%=erro6%></td></tr>
				  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg113%></td><td><font style=font-size:11px><input type=text size=15 name=bairro style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%=strBairro%>"> <%=erro7%></td></tr>
				  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg112%></td><td><font style=font-size:11px><input type=text size=34 name=cidade style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%=strCidade%>"> <%=erro8%></td></tr>
				  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg111%></td><td><select style=font-family:<%=fonte%>;font-size:11px;color:#000000; name="estado"> 
<%if strOutropais = "Sim" then%>
	 			  	<option value="AC">AC<option value="AL">AL<option value="AM">AM<option value="AP">AP<option value="BA">BA<option value="CE">CE<option value="DF">DF<option value="ES">ES<option value="GO">GO<option value="MA">MA<option value="MG">MG<option value="MS">MS<option value="MT">MT<option value="PA">PA<option value="PB">PB<option value="PE">PE<option value="PI">PI<option value="PR">PR<option value="RJ">RJ<option value="RN">RN<option value="RO">RO<option value="RR">RR<option value="RS">RS<option value="SC">SC<option value="SE">SE<option value="SP">SP<option value="TO">TO</option></select><font face="<%=fonte%>" style=font-family:<%=fonte%>;font-size:11px;color:#000000;>  <input type="checkbox" name="outropais" value="Sim" onclick="javascript: paises();" checked>Outro Pa�s</td></tr><tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;>CEP:</td><td><input type=text size=13 name=cepzz style=font-family:<%=fonte%>;font-size:11px;color:#000000; value=""></td></tr>
				 <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;>Pa�s:</td><td><select style=font-family:<%=fonte%>;font-size:11px;color:#000000; name="pais">
<% if strPais = "" OR strPais = "Brasil" then%>
   	  		  	   <option value="Brasil" select>Brasil</option>
<%else%>
				   <option value="<%= strPais %>" select><%= strPais %></option><option value="">-----------------------------------------</option><option value="Brasil">Brasil</option>
<%end if%>
	  	  		   <option value="Afeganist�o">Afeganist�o</option><option value="�frica do Sul">�frica do Sul</option><option value="Aland - Finl�ndia">Aland - Finl�ndia</option><option value="Alb�nia">Alb�nia</option><option value="Alemanha">Alemanha</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Anguilla - Reino Unido">Anguilla - Reino Unido</option><option value="Ant�rtida">Ant�rtida</option><option value="Ant�gua e Barbuda">Ant�gua e Barbuda</option><option value="Antilhas Holandesa">Antilhas Holandesas</option><option value="Ar�bia Saudita">Ar�bia Saudita</option><option value="Arg�lia">Arg�lia</option><option value="Argentina">Argentina</option><option value="Arm�nia">Arm�nia</option><option value="Aruba - Holanda">Aruba - Holanda</option><option value="Ascens�o - Reino Unido">Ascens�o - Reino Unido</option><option value="Austr�lia">Austr�lia</option><option value="�ustria">�ustria</option><option value="Azerbaij�o">Azerbaij�o</option><option value="Bahamas">Bahamas</option><option value="Bahrein">Bahrein</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="B�lgica">B�lgica</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermudas - Reino Unido">Bermudas - Reino Unido</option><option value="Bioko - Guin� Equatorial">Bioko - Guin� Equatorial</option>
				   <option value="Bol�via">Bol�via</option><option value="B�snia-Herzeg�vina">B�snia-Herzeg�vina</option><option value="Botsuana">Botsuana</option><option value="Brunei">Brunei</option><option value="Bulg�ria">Bulg�ria</option><option value="Burkina Fasso">Burkina Fasso</option><option value="Burundi">Burundi</option><option value="But�o">But�o</option><option value="Cabo Verde">Cabo Verde</option><option value="Camar�es">Camar�es</option><option value="Camboja">Camboja</option><option value="Canad�">Canad�</option><option value="Cazaquist�o">Cazaquist�o</option><option value="Ceuta - Espanha">Ceuta - Espanha</option><option value="Chade">Chade</option><option value="Chile">Chile</option><option value="China">China</option><option value="Chipre">Chipre</option><option value="Cidade do Vaticano">Cidade do Vaticano</option><option value="Cingapura">Cingapura</option><option value="Col�mbia">Col�mbia</option><option value="Congo">Congo</option><option value="Cor�ia do Norte">Cor�ia do Norte</option><option value="Cor�ia do Sul">Cor�ia do Sul</option><option value="C�rsega - Fran�a">C�rsega - Fran�a</option><option value="Costa do Marfim">Costa do Marfim</option><option value="Costa Rica">Costa Rica</option><option value="Creta - Gr�cia">Creta - Gr�cia</option><option value="Cro�cia">Cro�cia</option><option value="Cuba">Cuba</option><option value="Cura�ao - Holanda">Cura�ao - Holanda</option><option value="Dinamarca">Dinamarca</option>
				   <option value="Djibuti">Djibuti</option><option value="Dominica">Dominica</option><option value="Egito">Egito</option><option value="El Salvador">El Salvador</option><option value="Emirado �rabes Unidos">Emirado �rabes Unidos</option><option value="Equador">Equador</option><option value="Eritr�ia">Eritr�ia</option><option value="Eslov�quia">Eslov�quia</option><option value="Eslov�nia">Eslov�nia</option><option value="Espanha">Espanha</option><option value="Estados Unidos">Estados Unidos</option><option value="Est�nia">Est�nia</option><option value="Eti�pia">Eti�pia</option><option value="Fiji">Fiji</option><option value="Filipinas">Filipinas</option><option value="Finl�ndia">Finl�ndia</option><option value="Fran�a">Fran�a</option><option value="Gab�o">Gab�o</option><option value="G�mbia">G�mbia</option><option value="Gana">Gana</option><option value="Ge�rgia">Ge�rgia</option><option value="Gibraltar - Reino Unido">Gibraltar - Reino Unido</option><option value="Granada">Granada</option><option value="Gr�cia">Gr�cia</option><option value="Groenl�ndia - Dinamarca">Groenl�ndia - Dinamarca</option><option value="Guadalupe - Fran�a">Guadalupe - Fran�a</option><option value="Guam - Estados Unidos">Guam - Estados Unidos</option><option value="Guatemala">Guatemala</option><option value="Guiana">Guiana</option><option value="Guiana Francesa">Guiana Francesa</option><option value="Guin�">Guin�</option><option value="Guin� Equatorial">Guin� Equatorial</option>
				   <option value="Guin�-Bissau">Guin�-Bissau</option><option value="Haiti">Haiti</option><option value="Holanda">Holanda</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Hungria">Hungria</option><option value="I�men">I�men</option><option value="IIhas Virgens - Estados Unidos">IIhas Virgens - Estados Unidos</option><option value="Ilha de Man - Reino Unido">Ilha de Man - Reino Unido</option><option value="Ilha Natal - Austr�lia">Ilha Natal - Austr�lia</option><option value="Ilha Norfolk - Austr�lia">Ilha Norfolk - Austr�lia</option><option value="Ilha Pitcairn - Reino Unido">Ilha Pitcairn - Reino Unido</option><option value="Ilha Wrangel - R�ssia">Ilha Wrangel - R�ssia</option><option value="Ilhas Aleutas - Estados Unidos">Ilhas Aleutas - Estados Unidos</option><option value="Ilhas Can�rias - Espanha">Ilhas Can�rias - Espanha</option><option value="Ilhas Cayman - Reino Unido">Ilhas Cayman - Reino Unido</option><option value="Ilhas Comores">Ilhas Comores</option><option value="Ilhas Cook - Nova Zel�ndia">Ilhas Cook - Nova Zel�ndia</option><option value="Ilhas do Canal - Reino Unido">Ilhas do Canal - Reino Unido</option><option value="Ilhas Salom�o">Ilhas Salom�o</option><option value="Ilhas Seychelles">Ilhas Seychelles</option><option value="Ilhas Tokelau - Nova Zel�ndia">Ilhas Tokelau - Nova Zel�ndia</option><option value="Ilhas Turks e Caicos - Reino Unido">Ilhas Turks e Caicos - Reino Unido</option>
				   <option value="Ilhas Virgens - Reino Unido">Ilhas Virgens - Reino Unido</option><option value="Ilhas Wallis e Futuna - Fran�a">Ilhas Wallis e Futuna - Fran�a</option><option value="Ilhsa Cocos - Austr�lia">Ilhsa Cocos - Austr�lia</option><option value="�ndia">�ndia</option><option value="Indon�sia">Indon�sia</option><option value="Ir�">Ir�</option><option value="Iraque">Iraque</option><option value="Irlanda">Irlanda</option><option value="Isl�ndia">Isl�ndia</option><option value="Israel">Israel</option><option value="It�lia">It�lia</option><option value="Iugosl�via">Iugosl�via</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen - Noruega">Jan Mayen - Noruega</option><option value="Jap�o">Jap�o</option><option value="Jord�nia">Jord�nia</option><option value="Kiribati">Kiribati</option><option value="Kuait">Kuait</option><option value="Laos">Laos</option><option value="Lesoto">Lesoto</option><option value="Let�nia">Let�nia</option><option value="L�bano">L�bano</option><option value="Lib�ria">Lib�ria</option><option value="L�bia">L�bia</option><option value="Liechtenstein">Liechtenstein</option><option value="Litu�nia">Litu�nia</option><option value="Luxemburgo">Luxemburgo</option><option value="Macau - Portugal">Macau - Portugal</option><option value="Maced�nia">Maced�nia</option><option value="Madagascar">Madagascar</option><option value="Madeira - Portugal">Madeira - Portugal</option><option value="Mal�sia">Mal�sia</option><option value="Malaui">Malaui</option>
				   <option value="Maldivas">Maldivas</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marrocos">Marrocos</option><option value="Martinica - Fran�a">Martinica - Fran�a</option><option value="Maur�cio - Reino Unido">Maur�cio - Reino Unido</option><option value="Maurit�nia">Maurit�nia</option><option value="M�xico">M�xico</option><option value="Micron�sia">Micron�sia</option><option value="Mo�ambique">Mo�ambique</option><option value="Moldova">Moldova</option><option value="M�naco">M�naco</option><option value="Mong�lia">Mong�lia</option><option value="MontSerrat - Reino Unido">MontSerrat - Reino Unido</option><option value="Myanma">Myanma</option><option value="Nam�bia">Nam�bia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Nicar�gua">Nicar�gua</option><option value="N�ger">N�ger</option><option value="Nig�ria">Nig�ria</option><option value="Niue">Niue</option><option value="Noruega">Noruega</option><option value="Nova Bretanha - Papua-Nova Guin�">Nova Bretanha - Papua-Nova Guin�</option><option value="Nova Caled�nia - Fran�a">Nova Caled�nia - Fran�a</option><option value="Nova Zel�ndia">Nova Zel�ndia</option><option value="Om�">Om�</option><option value="Palau - Estados Unidos">Palau - Estados Unidos</option><option value="Palestina">Palestina</option><option value="Panam�">Panam�</option><option value="Papua-Nova Guin�">Papua-Nova Guin�</option><option value="Paquist�o">Paquist�o</option>
				   <option value="Paraguai">Paraguai</option><option value="Peru">Peru</option><option value="Polin�sia Francesa">Polin�sia Francesa</option><option value="Pol�nia">Pol�nia</option><option value="Porto Rico">Porto Rico</option><option value="Portugal">Portugal</option><option value="Qatar">Qatar</option><option value="Qu�nia">Qu�nia</option><option value="Quirguist�o">Quirguist�o</option><option value="Reino Unido">Reino Unido</option><option value="Rep�blica Centro-Africana">Rep�blica Centro-Africana</option><option value="Rep�blica Dominicana">Rep�blica Dominicana</option><option value="Rep�blica Tcheca">Rep�blica Tcheca</option><option value="Rom�nia">Rom�nia</option><option value="Ruanda">Ruanda</option><option value="R�ssia">R�ssia</option><option value="Samoa Ocidental">Samoa Ocidental</option><option value="San Marino">San Marino</option><option value="Santa Helena - Reino Unido">Santa Helena - Reino Unido</option><option value="Santa L�cia">Santa L�cia</option><option value="S�o Cristov�o e N�vis">S�o Cristov�o e N�vis</option><option value="S�o Tom� e Pr�ncipe">S�o Tom� e Pr�ncipe</option><option value="S�o Vicente e Granadinas">S�o Vicente e Granadinas</option><option value="Sardenha - It�lia">Sardenha - It�lia</option><option value="Senegal">Senegal</option><option value="Serra Leoa">Serra Leoa</option><option value="S�ria">S�ria</option><option value="Som�lia">Som�lia</option><option value="Sri Lanka">Sri Lanka</option><option value="Suazil�ndia">Suazil�ndia</option>
				   <option value="Sud�o">Sud�o</option><option value="Su�cia">Su�cia</option><option value="Su��a">Su��a</option><option value="Suriname">Suriname</option><option value="Tadjiquist�o">Tadjiquist�o</option><option value="Tail�ndia">Tail�ndia</option><option value="Taiti">Taiti</option><option value="Taiwan">Taiwan</option><option value="Tanz�nia">Tanz�nia</option><option value="Terra de Francisco Jos� - R�ssia">Terra de Francisco Jos� - R�ssia</option><option value="Togo">Togo</option><option value="Tonga">Tonga</option><option value="Trinidad e Tobago">Trinidad e Tobago</option><option value="Trist�o da Cunha - Reino Unido">Trist�o da Cunha - Reino Unido</option><option value="Tun�sia">Tun�sia</option><option value="Turcomenist�o">Turcomenist�o</option><option value="Turquia">Turquia</option><option value="Tuvalu">Tuvalu</option><option value="Ucr�nia">Ucr�nia</option><option value="Uganda">Uganda</option><option value="Uruguai">Uruguai</option><option value="Uzbequist�o">Uzbequist�o</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietn�">Vietn�</option><option value="Zaire">Zaire</option><option value="Z�mbia">Z�mbia</option><option value="Zimb�bue">Zimb�bue</option></select></td></tr>
<%else
if strEstado = "" then
else%>
	  		   	  <option value="<%= strEstado %>" select><%= strEstado %></option>
			   	  <option value="">---</option>
<%end if%>
	  	  		  <option value="AC">AC<option value="AL">AL<option value="AM">AM<option value="AP">AP<option value="BA">BA<option value="CE">CE<option value="DF">DF<option value="ES">ES<option value="GO">GO<option value="MA">MA<option value="MG">MG<option value="MS">MS<option value="MT">MT<option value="PA">PA<option value="PB">PB<option value="PE">PE<option value="PI">PI<option value="PR">PR<option value="RJ">RJ<option value="RN">RN<option value="RO">RO<option value="RR">RR<option value="RS">RS<option value="SC">SC<option value="SE">SE<option value="SP">SP<option value="TO">TO</option></select><font face="<%=fonte%>" style=font-family:<%=fonte%>;font-size:11px;color:#000000;>  <input type="checkbox" name="outropais" value="Sim" onclick="javascript: paises();">Outro Pa�s</td></tr>
				  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;>CEP:</td><td><input type=text size=13 name=cepzz style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%= strCep %>"><%= erro9 %></td></tr>
				  <tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;>Pa�s:</td><td><select style=font-family:<%=fonte%>;font-size:11px;color:#000000; name="pais">
<% if strPais = "" OR strPais = "Brasil" then%>
   	  		  	   <option value="Brasil" select>Brasil</option>
<%else%>
				   <option value="<%= strPais %>" select><%= strPais %></option>
				   <option value="">-----------------------------------------</option>
				   <option value="Brasil">Brasil</option>
<%end if%>
	  	  		   <option value="Afeganist�o">Afeganist�o</option><option value="�frica do Sul">�frica do Sul</option><option value="Aland - Finl�ndia">Aland - Finl�ndia</option><option value="Alb�nia">Alb�nia</option><option value="Alemanha">Alemanha</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Anguilla - Reino Unido">Anguilla - Reino Unido</option><option value="Ant�rtida">Ant�rtida</option><option value="Ant�gua e Barbuda">Ant�gua e Barbuda</option><option value="Antilhas Holandesa">Antilhas Holandesas</option><option value="Ar�bia Saudita">Ar�bia Saudita</option><option value="Arg�lia">Arg�lia</option><option value="Argentina">Argentina</option><option value="Arm�nia">Arm�nia</option><option value="Aruba - Holanda">Aruba - Holanda</option><option value="Ascens�o - Reino Unido">Ascens�o - Reino Unido</option><option value="Austr�lia">Austr�lia</option><option value="�ustria">�ustria</option><option value="Azerbaij�o">Azerbaij�o</option><option value="Bahamas">Bahamas</option><option value="Bahrein">Bahrein</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="B�lgica">B�lgica</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermudas - Reino Unido">Bermudas - Reino Unido</option><option value="Bioko - Guin� Equatorial">Bioko - Guin� Equatorial</option>
				   <option value="Bol�via">Bol�via</option><option value="B�snia-Herzeg�vina">B�snia-Herzeg�vina</option><option value="Botsuana">Botsuana</option><option value="Brunei">Brunei</option><option value="Bulg�ria">Bulg�ria</option><option value="Burkina Fasso">Burkina Fasso</option><option value="Burundi">Burundi</option><option value="But�o">But�o</option><option value="Cabo Verde">Cabo Verde</option><option value="Camar�es">Camar�es</option><option value="Camboja">Camboja</option><option value="Canad�">Canad�</option><option value="Cazaquist�o">Cazaquist�o</option><option value="Ceuta - Espanha">Ceuta - Espanha</option><option value="Chade">Chade</option><option value="Chile">Chile</option><option value="China">China</option><option value="Chipre">Chipre</option><option value="Cidade do Vaticano">Cidade do Vaticano</option><option value="Cingapura">Cingapura</option><option value="Col�mbia">Col�mbia</option><option value="Congo">Congo</option><option value="Cor�ia do Norte">Cor�ia do Norte</option><option value="Cor�ia do Sul">Cor�ia do Sul</option><option value="C�rsega - Fran�a">C�rsega - Fran�a</option><option value="Costa do Marfim">Costa do Marfim</option><option value="Costa Rica">Costa Rica</option><option value="Creta - Gr�cia">Creta - Gr�cia</option><option value="Cro�cia">Cro�cia</option><option value="Cuba">Cuba</option><option value="Cura�ao - Holanda">Cura�ao - Holanda</option><option value="Dinamarca">Dinamarca</option>
				   <option value="Djibuti">Djibuti</option><option value="Dominica">Dominica</option><option value="Egito">Egito</option><option value="El Salvador">El Salvador</option><option value="Emirado �rabes Unidos">Emirado �rabes Unidos</option><option value="Equador">Equador</option><option value="Eritr�ia">Eritr�ia</option><option value="Eslov�quia">Eslov�quia</option><option value="Eslov�nia">Eslov�nia</option><option value="Espanha">Espanha</option><option value="Estados Unidos">Estados Unidos</option><option value="Est�nia">Est�nia</option><option value="Eti�pia">Eti�pia</option><option value="Fiji">Fiji</option><option value="Filipinas">Filipinas</option><option value="Finl�ndia">Finl�ndia</option><option value="Fran�a">Fran�a</option><option value="Gab�o">Gab�o</option><option value="G�mbia">G�mbia</option><option value="Gana">Gana</option><option value="Ge�rgia">Ge�rgia</option><option value="Gibraltar - Reino Unido">Gibraltar - Reino Unido</option><option value="Granada">Granada</option><option value="Gr�cia">Gr�cia</option><option value="Groenl�ndia - Dinamarca">Groenl�ndia - Dinamarca</option><option value="Guadalupe - Fran�a">Guadalupe - Fran�a</option><option value="Guam - Estados Unidos">Guam - Estados Unidos</option><option value="Guatemala">Guatemala</option><option value="Guiana">Guiana</option><option value="Guiana Francesa">Guiana Francesa</option><option value="Guin�">Guin�</option><option value="Guin� Equatorial">Guin� Equatorial</option>
				   <option value="Guin�-Bissau">Guin�-Bissau</option><option value="Haiti">Haiti</option><option value="Holanda">Holanda</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Hungria">Hungria</option><option value="I�men">I�men</option><option value="IIhas Virgens - Estados Unidos">IIhas Virgens - Estados Unidos</option><option value="Ilha de Man - Reino Unido">Ilha de Man - Reino Unido</option><option value="Ilha Natal - Austr�lia">Ilha Natal - Austr�lia</option><option value="Ilha Norfolk - Austr�lia">Ilha Norfolk - Austr�lia</option><option value="Ilha Pitcairn - Reino Unido">Ilha Pitcairn - Reino Unido</option><option value="Ilha Wrangel - R�ssia">Ilha Wrangel - R�ssia</option><option value="Ilhas Aleutas - Estados Unidos">Ilhas Aleutas - Estados Unidos</option><option value="Ilhas Can�rias - Espanha">Ilhas Can�rias - Espanha</option><option value="Ilhas Cayman - Reino Unido">Ilhas Cayman - Reino Unido</option><option value="Ilhas Comores">Ilhas Comores</option><option value="Ilhas Cook - Nova Zel�ndia">Ilhas Cook - Nova Zel�ndia</option><option value="Ilhas do Canal - Reino Unido">Ilhas do Canal - Reino Unido</option><option value="Ilhas Salom�o">Ilhas Salom�o</option><option value="Ilhas Seychelles">Ilhas Seychelles</option><option value="Ilhas Tokelau - Nova Zel�ndia">Ilhas Tokelau - Nova Zel�ndia</option><option value="Ilhas Turks e Caicos - Reino Unido">Ilhas Turks e Caicos - Reino Unido</option>
				   <option value="Ilhas Virgens - Reino Unido">Ilhas Virgens - Reino Unido</option><option value="Ilhas Wallis e Futuna - Fran�a">Ilhas Wallis e Futuna - Fran�a</option><option value="Ilhsa Cocos - Austr�lia">Ilhsa Cocos - Austr�lia</option><option value="�ndia">�ndia</option><option value="Indon�sia">Indon�sia</option><option value="Ir�">Ir�</option><option value="Iraque">Iraque</option><option value="Irlanda">Irlanda</option><option value="Isl�ndia">Isl�ndia</option><option value="Israel">Israel</option><option value="It�lia">It�lia</option><option value="Iugosl�via">Iugosl�via</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen - Noruega">Jan Mayen - Noruega</option><option value="Jap�o">Jap�o</option><option value="Jord�nia">Jord�nia</option><option value="Kiribati">Kiribati</option><option value="Kuait">Kuait</option><option value="Laos">Laos</option><option value="Lesoto">Lesoto</option><option value="Let�nia">Let�nia</option><option value="L�bano">L�bano</option><option value="Lib�ria">Lib�ria</option><option value="L�bia">L�bia</option><option value="Liechtenstein">Liechtenstein</option><option value="Litu�nia">Litu�nia</option><option value="Luxemburgo">Luxemburgo</option><option value="Macau - Portugal">Macau - Portugal</option><option value="Maced�nia">Maced�nia</option><option value="Madagascar">Madagascar</option><option value="Madeira - Portugal">Madeira - Portugal</option><option value="Mal�sia">Mal�sia</option><option value="Malaui">Malaui</option>
				   <option value="Maldivas">Maldivas</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marrocos">Marrocos</option><option value="Martinica - Fran�a">Martinica - Fran�a</option><option value="Maur�cio - Reino Unido">Maur�cio - Reino Unido</option><option value="Maurit�nia">Maurit�nia</option><option value="M�xico">M�xico</option><option value="Micron�sia">Micron�sia</option><option value="Mo�ambique">Mo�ambique</option><option value="Moldova">Moldova</option><option value="M�naco">M�naco</option><option value="Mong�lia">Mong�lia</option><option value="MontSerrat - Reino Unido">MontSerrat - Reino Unido</option><option value="Myanma">Myanma</option><option value="Nam�bia">Nam�bia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Nicar�gua">Nicar�gua</option><option value="N�ger">N�ger</option><option value="Nig�ria">Nig�ria</option><option value="Niue">Niue</option><option value="Noruega">Noruega</option><option value="Nova Bretanha - Papua-Nova Guin�">Nova Bretanha - Papua-Nova Guin�</option><option value="Nova Caled�nia - Fran�a">Nova Caled�nia - Fran�a</option><option value="Nova Zel�ndia">Nova Zel�ndia</option><option value="Om�">Om�</option><option value="Palau - Estados Unidos">Palau - Estados Unidos</option><option value="Palestina">Palestina</option><option value="Panam�">Panam�</option><option value="Papua-Nova Guin�">Papua-Nova Guin�</option><option value="Paquist�o">Paquist�o</option>
				   <option value="Paraguai">Paraguai</option><option value="Peru">Peru</option><option value="Polin�sia Francesa">Polin�sia Francesa</option><option value="Pol�nia">Pol�nia</option><option value="Porto Rico">Porto Rico</option><option value="Portugal">Portugal</option><option value="Qatar">Qatar</option><option value="Qu�nia">Qu�nia</option><option value="Quirguist�o">Quirguist�o</option><option value="Reino Unido">Reino Unido</option><option value="Rep�blica Centro-Africana">Rep�blica Centro-Africana</option><option value="Rep�blica Dominicana">Rep�blica Dominicana</option><option value="Rep�blica Tcheca">Rep�blica Tcheca</option><option value="Rom�nia">Rom�nia</option><option value="Ruanda">Ruanda</option><option value="R�ssia">R�ssia</option><option value="Samoa Ocidental">Samoa Ocidental</option><option value="San Marino">San Marino</option><option value="Santa Helena - Reino Unido">Santa Helena - Reino Unido</option><option value="Santa L�cia">Santa L�cia</option><option value="S�o Cristov�o e N�vis">S�o Cristov�o e N�vis</option><option value="S�o Tom� e Pr�ncipe">S�o Tom� e Pr�ncipe</option><option value="S�o Vicente e Granadinas">S�o Vicente e Granadinas</option><option value="Sardenha - It�lia">Sardenha - It�lia</option><option value="Senegal">Senegal</option><option value="Serra Leoa">Serra Leoa</option><option value="S�ria">S�ria</option><option value="Som�lia">Som�lia</option><option value="Sri Lanka">Sri Lanka</option><option value="Suazil�ndia">Suazil�ndia</option>
				   <option value="Sud�o">Sud�o</option><option value="Su�cia">Su�cia</option><option value="Su��a">Su��a</option><option value="Suriname">Suriname</option><option value="Tadjiquist�o">Tadjiquist�o</option><option value="Tail�ndia">Tail�ndia</option><option value="Taiti">Taiti</option><option value="Taiwan">Taiwan</option><option value="Tanz�nia">Tanz�nia</option><option value="Terra de Francisco Jos� - R�ssia">Terra de Francisco Jos� - R�ssia</option><option value="Togo">Togo</option><option value="Tonga">Tonga</option><option value="Trinidad e Tobago">Trinidad e Tobago</option><option value="Trist�o da Cunha - Reino Unido">Trist�o da Cunha - Reino Unido</option><option value="Tun�sia">Tun�sia</option><option value="Turcomenist�o">Turcomenist�o</option><option value="Turquia">Turquia</option><option value="Tuvalu">Tuvalu</option><option value="Ucr�nia">Ucr�nia</option><option value="Uganda">Uganda</option><option value="Uruguai">Uruguai</option><option value="Uzbequist�o">Uzbequist�o</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietn�">Vietn�</option><option value="Zaire">Zaire</option><option value="Z�mbia">Z�mbia</option><option value="Zimb�bue">Zimb�bue</option></select></td></tr>
<%end if%><tr><td><font style=font-family:<%=fonte%>;font-size:11px;color:#000000;><%=strLg109%></td><td><input type=text size=15 name=fone style=font-family:<%=fonte%>;font-size:11px;color:#000000; value="<%=strFone%>"> <font style=font-family:<%=fonte%>;font-size:9px;color:#000000;><%=erro10%></td></tr>
	  			<tr><td colspan=2><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
				<tr align=center><td valign=top><div id="layer1" style="position:absolute; left:325px"><input type=image src=<%=dirlingua%>/imagens/atualiza.gif onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg66%>';return true;"></div></td><td valign=top></form><div id="layer1" style="position:absolute; left:480px"><a href=default.asp><img src="<%=dirlingua%>/imagens/cancelar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg100%>';return true;" border=0></a></div></td></tr></table></form></td></tr>
			</table></td></tr>
	</table>
	<!-- #include file="baixo.asp" -->
<%else

'Transformas os m�s em numeros
if strNascmes = "Jan" then
strNascmes = "01"
end if
if strNascmes = "Fev" then
strNascmes = "02"
end if
if strNascmes = "Mar" then
strNascmes = "03"
end if
if strNascmes = "Abr" then
strNascmes = "04"
end if
if strNascmes = "Mai" then
strNascmes = "05"
end if
if strNascmes = "Jun" then
strNascmes = "06"
end if
if strNascmes = "Jul" then
strNascmes = "07"
end if
if strNascmes = "Ago" then
strNascmes = "08"
end if
if strNascmes = "Set" then
strNascmes = "09"
end if
if strNascmes = "Out" then
strNascmes = "10"
end if
if strNascmes = "Nov" then
strNascmes = "11"
end if
if strNascmes = "Dez" then
strNascmes = "12"
end if
if strPais = "" then
strPais = "Brasil"
end if

'Atualiza os dados do cliente
set atualiza = abredb.Execute("update clientes set nome = '" & Cripto(strNome,true) & "', endereco='" & Cripto(strEndereco,true) & "', tel = '" & Cripto(strFone,true) & "', cep = '" & Cripto(strCep,true) & "', nascimento = '" & Cripto(strNascdia&"/"&strNascmes&"/"&strNascano,true) & "', rg='" & Cripto(strRg,true) & "', " &_
"cpf='"&Cripto(strCpf,true)&"', estado='"&Cripto(strEstado,true)&"', cidade='"&Cripto(strCidade,true)&"', " &_
"bairro='"&Cripto(strBairro,true)&"', pais='"&Cripto(strPais,true)&"' WHERE email='"&Cripto(strEmaila,true)&"';")
%>
  				<table><tr><td align="left" valign="top">
							   <table border="0" cellspacing="4" cellpadding="4" width=590><tr><td><font face="<%=fonte%>" style=font-size:11px;color:000000> <a href=default.asp style=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><b><%=strLg4%></b></a> � <%=strLg149%><br><br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table><p align=center><font style=font-size:17px; color=#000000><b><%=strLg150%></b></font></p><p align=center><%=strLg151%></p><p align=center></b><a href=default.asp><img src="<%=dirlingua%>/imagens/continuar.gif" onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg68%>';return true;" border=0></a></p> <br><table border=0 cellspacing=0 width=100% cellpadding=0><tr><td height=5></td></tr><tr><td height=1 bgcolor=<%=cor3%>></td></tr><tr><td height=5></td></tr></table></td></tr>
							   </table></td></tr>
				</table>
			<!-- #include file="baixo.asp" -->
<%end if%>