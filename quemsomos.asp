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
	 <DIV ID="layer1" STYLE="position:absolute; left:600px; top:80px; z-index:1"><IMG SRC="<%=dirlingua%>/imagens/TROFEU.GIF" BORDER="0"></DIV>
	 	  <TABLE><TR><TD ALIGN="left" VALIGN="top">
		  				 <TABLE BORDER="0" CELLSPACING="4" CELLPADDING="4" WIDTH=590><TR><TD><FONT FACE="<%=fonte%>" STYLE=font-size:11px;color:000000> <A HREF=default.asp STYLE=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><B>Home</B></A> � <%=strLg20%><BR><BR><DIV ALIGN=left> <TABLE BORDER=0 CELLSPACING=0 WIDTH=100% CELLPADDING=0><TR><TD HEIGHT=5></TD></TR><TR><TD HEIGHT=1 BGCOLOR=<%=cor3%>></TD></TR><TR><TD HEIGHT=5></TD></TR></TABLE></DIV><FONT FACE="<%=fonte%>" STYLE=font-size:13px><STRONG><BR><%=strLg20%></STRONG></FONT></p><DIV ALIGN=justify><FONT STYLE=font-size:11px FACE=<%=fonte%>><B><%=strLg256%></B><BR><BR><%=strLgquemsomos%><BR><BR><B><%=strLg257%></B><BR><BR>
						 <%=strLg258%><BR><BR><%=Telefone_da_sua_loja%><BR><BR><B><%=strLg259%></B><BR><BR><%=strLg260%> <A HREF="mailto:<%=Email_da_sua_loja%>"><%=Email_da_sua_loja%></A><BR><BR><B><%=strLg261%></B><BR><BR><%=strLg78 & " " & Endereco_da_sua_loja%><BR><%=strLg80 & " " & Cidade_da_sua_loja & " / " & Estado_da_sua_loja%><BR><%=strLg82 & " " & CEP_da_sua_loja%><BR><BR><TABLE BORDER=0 CELLSPACING=0 WIDTH=100% CELLPADDING=0><TR><TD HEIGHT=5></TD></TR><TR><TD HEIGHT=1 BGCOLOR=<%=cor3%>></TD></TR><TR><TD HEIGHT=5></TD></TR></TABLE><CENTER><A HREF="default.asp" STYLE=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><FONT FACE="<%=fonte%>" STYLE=font-size:11px>:: <B><%=strLg41%></B> ::</A></font></CENTER></TD></TR>
						 </TABLE></TD></TR>
		 </TABLE>
		 <!-- #include file="baixo.asp" -->