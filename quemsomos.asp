<%
'#########################################################################################
'#----------------------------------------------------------------------------------------
'#########################################################################################
'#
'#  CÓDIGO: VirtuaStore Versão 1.2 - Copyright 2001-2003 VirtuaWorks                                    
'#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
'#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
'#  AUTORES: Otávio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revisão)                
'# 
'#     Este programa é um software livre; você pode redistribuí-lo e/ou 
'#     modificá-lo sob os termos do GNU General Public License como 
'#     publicado pela Free Software Foundation.
'#     É importante lembrar que qualquer alteração feita no programa 
'#     deve ser informada e enviada para os criadores, através de e-mail 
'#     ou da página de onde foi baixado o código.
'#
'#  //-------------------------------------------------------------------------------------
'#  // LEIA COM ATENÇÃO: O software VirtuaStore 1.2 deve conter as frases
'#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
'#  // o link para o site http://www.virtuastore.com.br no créditos da 
'#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
'#  // frases não estiver presentes ou visiveis este software deixará de ser
'#  // considerado Open-source(gratuito) e o uso sem autorização terá 
'#  // penalidades judiciais de acordo com as leis de pirataria de software.
'#  //--------------------------------------------------------------------------------------
'#      
'#     Este programa é distribuído com a esperança de que lhe seja útil,
'#     porém SEM NENHUMA GARANTIA. Veja a GNU General Public License
'#     abaixo (GNU Licença Pública Geral) para mais detalhes.
'# 
'#     Você deve receber a cópia da Licença GNU com este programa, 
'#     caso contrário escreva para
'#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
'#     Boston, MA  02111-1307  USA
'# 
'#     Para enviar suas dúvidas, sugestões e/ou contratar a VirtuaWorks 
'#     Internet Design entre em contato através do e-mail 
'#     contato@virtuaworks.com.br ou pelo endereço abaixo: 
'#     Rua Venâncio Aires, 1001 - Niterói - Canoas - RS - Brasil. Cep 92110-000.
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

'INÍCIO DO CÓDIGO
'----------------------------------------------------------------------------------------------------------------
'Este código está otimizado e roda tanto em Windows 2000/NT/XP/ME/98 quanto em servidores UNIX-LINUX com chilli!ASP
%>
  	  <!-- #include file="topo.asp" -->
	 <DIV ID="layer1" STYLE="position:absolute; left:600px; top:80px; z-index:1"><IMG SRC="<%=dirlingua%>/imagens/TROFEU.GIF" BORDER="0"></DIV>
	 	  <TABLE><TR><TD ALIGN="left" VALIGN="top">
		  				 <TABLE BORDER="0" CELLSPACING="4" CELLPADDING="4" WIDTH=590><TR><TD><FONT FACE="<%=fonte%>" STYLE=font-size:11px;color:000000> <A HREF=default.asp STYLE=text-decoration:none; onMouseOut="window.status='';return true;" onMouseOver="window.status='Home';return true;"><B>Home</B></A> » <%=strLg20%><BR><BR><DIV ALIGN=left> <TABLE BORDER=0 CELLSPACING=0 WIDTH=100% CELLPADDING=0><TR><TD HEIGHT=5></TD></TR><TR><TD HEIGHT=1 BGCOLOR=<%=cor3%>></TD></TR><TR><TD HEIGHT=5></TD></TR></TABLE></DIV><FONT FACE="<%=fonte%>" STYLE=font-size:13px><STRONG><BR><%=strLg20%></STRONG></FONT></p><DIV ALIGN=justify><FONT STYLE=font-size:11px FACE=<%=fonte%>><B><%=strLg256%></B><BR><BR><%=strLgquemsomos%><BR><BR><B><%=strLg257%></B><BR><BR>
						 <%=strLg258%><BR><BR><%=Telefone_da_sua_loja%><BR><BR><B><%=strLg259%></B><BR><BR><%=strLg260%> <A HREF="mailto:<%=Email_da_sua_loja%>"><%=Email_da_sua_loja%></A><BR><BR><B><%=strLg261%></B><BR><BR><%=strLg78 & " " & Endereco_da_sua_loja%><BR><%=strLg80 & " " & Cidade_da_sua_loja & " / " & Estado_da_sua_loja%><BR><%=strLg82 & " " & CEP_da_sua_loja%><BR><BR><TABLE BORDER=0 CELLSPACING=0 WIDTH=100% CELLPADDING=0><TR><TD HEIGHT=5></TD></TR><TR><TD HEIGHT=1 BGCOLOR=<%=cor3%>></TD></TR><TR><TD HEIGHT=5></TD></TR></TABLE><CENTER><A HREF="default.asp" STYLE=text-decoration:none onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg41%>';return true;"><FONT FACE="<%=fonte%>" STYLE=font-size:11px>:: <B><%=strLg41%></B> ::</A></font></CENTER></TD></TR>
						 </TABLE></TD></TR>
		 </TABLE>
		 <!-- #include file="baixo.asp" -->