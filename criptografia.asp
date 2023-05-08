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


Function Cripto(StrCripto, BolAcao) 'In�cio de da fun��o de criptografia. Aonde o par�metro String � o valor que ser� criptografado ou descriptografado. E o par�metro BolAcao � um valor booleano (True ou False) para indicar se deve ser criptografado (True) ou descriptografado (False).

Dim X , i, n, TamChave, Valor 'Declara��o das vari�veis.
Dim aChaves(9) 'Declara��o do Array que contem as chaves de criptografia

aChaves(0) = 77 'Atribui��o dos valores dos caracteres que ser�o utilizados
aChaves(1) = 84 'como chave de criptografia
aChaves(2) = 79
aChaves(3) = 65
aChaves(4) = 73
aChaves(5) = 78
aChaves(6) = 67
aChaves(7) = 70
aChaves(8) = 82

X = Empty 'Atribui o valor vazio para a vari�vel X

For i = 1 To Len(StrCripto) 'Inicia um Loop For que deve ser repetido a quantidade de vezes de acordo com o tamanho da String que deve ser criptografada.
    n = Asc(Mid(StrCripto, i, 1))
	
    If n > 31 Then 'mant�m controles intactos
       n = n - 32 'desconsidera controles (Caracteres de 0 a 31)
       If BolAcao Then
          Valor = 1
       Else
          Valor = -1
       End If
       n = n + (aChaves((i - 1) Mod 9)) * Valor
       n = n Mod 224 ' Caracteres 256 - 32 desconsiderados
          If n < 0 Then
             n = 224 + n
          End If
       n = n + 32 ' Reajusta para caracteres normais
    End If
	
    X = X & Chr(n) 'Armazena na vari�vel X os caracteres que foram modificados
Next

       If BolAcao Then
          Cripto = EHtmlEncode(X) 'Retorna o valor da vari�vel X para a fun��o
       Else
         Cripto = EHtmlDecode(X) 'Retorna o valor da vari�vel X para a fun��o
       End If


End Function

Function EHtmlEncode(StrString)
StrString = Replace(StrString, ",", ",")
StrString = Replace(StrString, "'", "'")
StrString = Replace(StrString, """", """")
StrString = Replace(StrString, "=", "=")
StrString = Replace(StrString, ".", ".")
StrString = Replace(StrString, "(", "(")
StrString = Replace(StrString, "set", "set")
StrString = Replace(StrString, "SET", "SET")
StrString = Replace(StrString, " where ", "where")
StrString = Replace(StrString, " WHERE ", "WHERE")
StrString = Replace(StrString, ")", "(")
StrString = Replace(StrString, Chr(32), Chr(32))
StrString = Replace(StrString, Chr(13), Chr(13))
StrString = Replace(StrString, Chr(0), Chr(0))
StrString = Replace(StrString, Chr(10) & Chr(10), Chr(10) & Chr(10))
StrString = Replace(StrString, Chr(10), Chr(10))
StrString = Replace(StrString, Chr(9), Chr(9))
StrString = Replace(StrString, Chr(11), Chr(11))
StrString = Replace(StrString, Chr(12), Chr(12))
StrString = Replace(StrString, Chr(60), Chr(60))
StrString = Replace(StrString, "/", "/")
StrString = Replace(StrString, "\", "\")
EHtmlEncode = StrString
End Function

Function EHtmlDecode(StrString)
StrString = Replace(StrString, "_a", "_a")
StrString = Replace(StrString, "_b", "_b")
StrString = Replace(StrString, "_c", "_c")
StrString = Replace(StrString, "_d", "_d")
StrString = Replace(StrString, "_e", "_e")
StrString = Replace(StrString, "_f", "_f")
StrString = Replace(StrString, "_g", "_g")
StrString = Replace(StrString, "_h", "_h")
StrString = Replace(StrString, "_i", "_i")
StrString = Replace(StrString, "_j", "_j")
StrString = Replace(StrString, "_l", "_l")
StrString = Replace(StrString, "_m", "_m")
StrString = Replace(StrString, "_n", "_n")
StrString = Replace(StrString, "_o", "_o")
StrString = Replace(StrString, "_p", "_p")
StrString = Replace(StrString, "_q", "_q")
StrString = Replace(StrString, "_r", "_r")
StrString = Replace(StrString, "_s", "_s")
StrString = Replace(StrString, "_t", "_t")
StrString = Replace(StrString, "_u", "_u")
StrString = Replace(StrString, "_v", "_v")
StrString = Replace(StrString, "_x", "_x")
EHtmlDecode = StrString
End Function


%>