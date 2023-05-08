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
  	  </td></tr></table>
	</table>
	
	<DIV ID="layer1" STYLE="position:absolute; z-index:8;background-color:ffffff; width: 775px;">
	<DIV ID="layer1" STYLE="position:absolute; left:0px; top:-2px; width:775px; z-index:1"><TABLE BORDER=0 CELLSPACING=0 WIDTH=775 CELLPADDING=0><TR><TD HEIGHT=5></TD></TR><TR><TD HEIGHT=1 BGCOLOR="bcbcbc"></TD></TR><TR><TD HEIGHT=5></TD></TR></TABLE></DIV>
	<DIV ID="layer1" STYLE="position:absolute; left:0px; top:-7px; width:775px; z-index:1"><TABLE BORDER=0 CELLSPACING=0 WIDTH=775 CELLPADDING=0><TR><TD HEIGHT=5></TD></TR><TR><TD HEIGHT=1 BGCOLOR="bcbcbc"></TD></TR><TR><TD HEIGHT=5></TD></TR></TABLE></DIV>

	<TABLE BORDER=0 BGCOLOR=#ffffff CELLPADDING=3 CELLSPACING=3 WIDTH=770 ALIGN=center>
		   <TR><TD HEIGHT=10></TD><TD></TD></TR><TR ALIGN=center><TD WIDTH=40></TD><TD  WIDTH=660><FONT FACE="<%=fonte%>" STYLE=font-size:11px>&nbsp;|&nbsp;<A CLASS=baixo  HREF="default.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg4%>';return true;"><%=strLg4%></A>&nbsp;|&nbsp;
<%'Inicia os links inferiores
Set menui = abredb.Execute("SELECT * FROM sessoes WHERE ver='s' ORDER by nome;")
While Not menui.EOF%>
	  	  			<FONT FACE="<%=fonte%>" STYLE=font-size:11px><A CLASS=baixo  HREF="sessoes.asp?item=<%= menui("id") %>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%= menui("nome") %>';return true;"><%= menui("nome") %></A>&nbsp;|&nbsp;
<%menui.MoveNext
Wend
menui.Close
Set menui = Nothing%> 
<A CLASS=baixo  HREF="quemsomos.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg20%>';return true;"><%=strLg20%></A>&nbsp;|&nbsp;<A CLASS=baixo  HREF="seguranca.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg19%>';return true;"><%=strLg19%></A>&nbsp;|&nbsp;<A CLASS=baixo  HREF="como.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg16%>';return true;"><%=strLg16%></A>&nbsp;|&nbsp;<A CLASS=baixo  HREF="carrinhodecompras.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg1%>';return true;"><%=strLg1%></A>&nbsp;|&nbsp;<A CLASS=baixo  HREF="<%=link%>"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg8%>';return true;"><%=strLg8%></A>&nbsp;|&nbsp;<A CLASS=baixo  HREF="registro.asp"  onMouseOut="window.status='';return true;" onMouseOver="window.status='<%=strLg5%>';return true;"><%=strLg5%></A></DIV>
   			</td></tr>
	</tbody></table>
	<TABLE BORDER=0 BGCOLOR=#ffffff CELLPADDING=0 CELLSPACING=0 WIDTH="775">
		   <TR><TD>&nbsp;</TD></TR><TR><TD COLSPAN="2" HEIGHT="20"  BGCOLOR="<%=cor2%>" WIDTH="100%"><FONT FACE="<%=fonte%>" STYLE=font-size:11px;color:<%=fontebranca%>><B>&nbsp;&nbsp;&nbsp;<%response.write "© Copyright 2001/"&year(now)&" "&nomeloja&"&nbsp;"%></B>|<B>&nbsp;<%call BaixoC()%>
		   </TD></TR>
	</TABLE>
	</div>
	</div>
</form>
<%
'Fecha o banco de bados
abredb.close
set abredb = nothing

if err.number <> 0 then
Select Case Err.number
Case 0
Case 424
Case 3021
Case -2147352567
Case Else
Response.clear
Response.Write "<title>Erro!</title><center><br><br><font face=tahoma style=font-size:11px><h1>Erro no Sistema!</h1><br><br>N°. do erro:" & Err.number & "<br>Descrição do erro:" & Err.Description & "<br><hr size=1><br><font color=red><b>Informe ao administrador do sistema os erros acima!</b></font><br><br>Pedimos desculpas pela inconveniência.<br><br><hr size=1><br>Se você estiver inserindo dados em sua loja NÃO use: aspas simples ('), barra (/) e parêntes (())<br><Br><a href=""javascript: history.go(-1);"">Voltar para página anterior</a>"
End Select
else
end if
%>
