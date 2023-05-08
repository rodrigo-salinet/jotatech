#########################################################################################
#----------------------------------------------------------------------------------------
#########################################################################################
#
#  C�DIGO: VirtuaStore Vers�o 1.2 - Copyright 2001-2003 VirtuaWorks                                    
#  URL: www.virtuastore.com.br / www.virtuaworks.com.br                                                           
#  E-MAIL: webmaster@virtuaworks.com.br                                                                                          
#  AUTORES: Ot�vio Dias(Desenvolvedor) / Jone Bandinelli(Desenvolvedor) / Daniel Kern(Revis�o)                
# 
#     Este programa � um software livre; voc� pode redistribu�-lo e/ou 
#     modific�-lo sob os termos do GNU General Public License como 
#     publicado pela Free Software Foundation.
#     � importante lembrar que qualquer altera��o feita no programa 
#     deve ser informada e enviada para os criadores, atrav�s de e-mail 
#     ou da p�gina de onde foi baixado o c�digo.
#
#  //-------------------------------------------------------------------------------------
#  // LEIA COM ATEN��O: O software VirtuaStore 1.2 deve conter as frases
#  // "Powered by VirtuaStore 1.2" ou "Software derivado de VirtuaStore 1.2" e 
#  // o link para o site http://www.virtuastore.com.br no cr�ditos da 
#  // sua loja virtual para ser utilizado gratuitamente. Se o link e/ou uma das 
#  // frases n�o estiver presentes ou visiveis este software deixar� de ser
#  // considerado Open-source(gratuito) e o uso sem autoriza��o ter� 
#  // penalidades judiciais de acordo com as leis de pirataria de software.
#  //--------------------------------------------------------------------------------------
#      
#     Este programa � distribu�do com a esperan�a de que lhe seja �til,
#     por�m SEM NENHUMA GARANTIA. Veja a GNU General Public License
#     abaixo (GNU Licen�a P�blica Geral) para mais detalhes.
# 
#     Voc� deve receber a c�pia da Licen�a GNU com este programa, 
#     caso contr�rio escreva para
#     Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
#     Boston, MA  02111-1307  USA
# 
#     Para enviar suas d�vidas, sugest�es e/ou contratar a VirtuaWorks 
#     Internet Design entre em contato atrav�s do e-mail 
#     contato@virtuaworks.com.br ou pelo endere�o abaixo: 
#     Rua Ven�ncio Aires, 1001 - Niter�i - Canoas - RS - Brasil. Cep 92110-000.
#
#     Para ajuda e suporte acesse: http://www.virtuastore.com.br
#
#     BOM PROVEITO!          
#     Equipe VirtuaStore
#     []'s
#
#########################################################################################
#----------------------------------------------------------------------------------------
#########################################################################################


# Estrutura da tabela 'admin'
CREATE TABLE `admin` (
  `data` text,
  `hora` text,
  `ip` text,
  `host` text
) TYPE=MyISAM;


# Estrutura da tabela 'clientes'
CREATE TABLE `clientes` (
  `clienteid` int(10) unsigned zerofill NOT NULL auto_increment,
  `datacad` longtext,
  `nome` longtext,
  `email` longtext,
  `senha` longtext,
  `cpf` longtext,
  `rg` longtext,
  `nascimento` longtext,
  `endereco` longtext,
  `bairro` longtext,
  `cidade` longtext,
  `estado` longtext,
  `cep` longtext,
  `pais` longtext,
  `tel` longtext,
  `status` longtext,
  KEY `clienteid` (`clienteid`)
) TYPE=MyISAM;


# Estrutura da tabela 'compras'
CREATE TABLE `compras` (
  `pedido` int(10) unsigned NOT NULL auto_increment,
  `idcompra` int(250) default NULL,
  `datacompra` text,
  `clienteid` longtext,
  `frete` text,
  `totalcompra` text,
  `dataentrega` text,
  `endentrega` longtext,
  `bairroentrega` longtext,
  `cidadeentrega` longtext,
  `estadoentrega` longtext,
  `cepentrega` longtext,
  `paisentrega` longtext,
  `telentrega` longtext,
  `pagamentovia` longtext,
  `status` longtext,
  `presente` text,
  `msgpresente` longtext,
  `numero` text,
  `vencimento` text,
  `titular` longtext,
  PRIMARY KEY  (`pedido`),
  KEY `pedido` (`pedido`)
) TYPE=MyISAM;


# Estrutura da tabela 'email'
CREATE TABLE `email` (
  `email` longtext
) TYPE=MyISAM;


# Estrutura da tabela 'fretes'
CREATE TABLE `fretes` (
  `localidade` longtext,
  `re0` longtext,
  `re1` longtext,
  `re2` longtext,
  `re3` longtext,
  `re4` longtext,
  `re5` longtext,
  `re6` longtext,
  `re7` longtext,
  `re8` longtext,
  `re9` longtext
) TYPE=MyISAM;

# Dados da tabela  'fretes'
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES("capital", "6,10", "9,10", "12,60", "15,30", "16,60", "18,70", "21,40", "24,50", "25,80", "27,70");
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES("interior", "6,10", "13,90", "16,40", "19,80", "20,40", "22,40", "25,30", "28,00", "29,40", "31,50");
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES("pesocapital", "0,80", "2,10", "3,50", "4,40", "4,90", "5,60", "6,80", "7,80", "8,20", "8,90");
INSERT INTO fretes (localidade, re0, re1, re2, re3, re4, re5, re6, re7, re8, re9) VALUES("pesointerior", "0,80", "4,00", "4,90", "6,00", "6,30", "7,00", "8,20", "9,20", "9,50", "10,20");


# Estrutura da tabela 'newsletter'
CREATE TABLE `newsletter` (
  `datacad` text,
  `email` longtext
) TYPE=MyISAM;

# Estrutura da tabela 'boleto'
CREATE TABLE `boleto` (
  `nosso` text) TYPE=MyISAM;


# Estrutura da tabela 'pedidos'
CREATE TABLE `pedidos` (
  `idcompra` int(250) default NULL,
  `idprod` smallint(250) default NULL,
  `quantidade` smallint(250) default NULL
) TYPE=MyISAM;


# Estrutura da tabela 'produtos'
CREATE TABLE `produtos` (
  `idprod` smallint(5) unsigned NOT NULL auto_increment,
  `nome` longtext,
  `fabricante` text,
  `detalhe` longtext,
  `preco` text,
  `precovelho` text NOT NULL,
  `parcela` text,
  `juro` text,
  `aomes` text,
  `estoque` text,
  `idsessao` longtext,
  `data` text,
  `peso` text,
  `imgra` text,
  `impeq` text,
  `status` text,
  `contador` int(10) unsigned default NULL,
  PRIMARY KEY  (`idprod`),
  UNIQUE KEY `idprod` (`idprod`),
  KEY `idprod_2` (`idprod`)
) TYPE=MyISAM;

# Dados da tabela  'produtos'
INSERT INTO produtos (idprod, nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES("127", "iPAQ Pocket PC H3760", "Compaq", "Mantenha-se conectado ao que � mais importante para voc� - em qualquer momento e lugar.\r\nCom o iPAQ Pocket PC 3760, apresentando Microsoft� Pocket PC 2002, voc� ter� o poder da Internet em suas m�os.\r\nPotente e delgado\r\nUm design elegante com tela TFT mais brilhante e o processador mais r�pido do mercado\r\n\r\n[b]Expans�vel e vers�til[/b]\r\nOs cart�es de expans�o iPAQ Expansion Packs prov�em uma extraordin�ria gama de funcionalidades\r\n\r\n[b]Velocidade impressionante[/b]\r\nLeia rapidamente suas mensagens de correio eletr�nico, programas, arquivos MP3 e fotografias digitais gra�as ao potente processador Intel de 206 MHz.\r\n\r\n[b]Impulso para o futuro[/b]\r\nO iPAQ Pocket PC com Microsoft Pocket PC 2002 marca o ritmo do progresso.\r\n\r\n[linha]\r\n\r\n[i][b]Caracter�sticas T�cnicas:[/b][/i]  \r\nProcessador: Intel StrongArm 206 MHz\r\nSistema Operacional: Windows� Pocket PC\r\nMem�ria: 64 MB\r\nMem�ria Rom: 16 MB\r\nTipo de tela: LCD, TFT com 4,096 cores, Tela sens�vel ao tato\r\nResolu��o: 240 x 320 p�xels\r\nTamanho de Pixel: 0,24 mm\r\nDimens�es de imagem vis�vel: 5,7 x 7,7 cm\r\nM�todo de entrada de dados: Reconhecimento de escrita, teclado program�vel, grava��o de voz, escrita gr�fica.\r\nPorta de comunica��es: Interface Serial\r\nSlots para cart�es: Slot de expans�o opcional\r\nPorta infravermelha: com taxa de transfer�ncia de 115 Kbps\r\n�udio: Com capacidade para gravar e ouvir �udio em formato MP3 e programas na Internet, Gravador de voz, Microfone, alto-falante\r\nBateria: L�tio-pol�mero de 950 mAh\r\nSoftwares Inclusos: ActiveSync 3.5, Calend�rio, Pocket PC Word, Excel e Internet Explorer, Windows Media Player, Calculadora, Solitario, Inbox (e-mail), MS Reader, MSN Messenger.\r\nDisplay: TFT Colorido, 240 x 320 pixels\r\nGarantia: 1 ano\r\nPeso (Kg): 0,178\r\nProcessador: StrongArm 206 MHz\r\nDimens�es (LxAxP) mm: 83 x 130 x 16\r\nAlimenta��o: Bateria recarreg�vel de Pol�mero L�tio de 950 mAh\r\nExpans�o de Mem�ria: Opcional Cart�es CompactFlash (via jaqueta)\r\nAcesso � Internet: Via Modem (vendido separadamente)\r\nMem�ria (MB): 64\r\nSistema Operacional: Pocket PC 2002\r\nPorta Infravermelha\r\nTipo de Conex�o: Serial\r\nCradlle Incluso: Serial\r\n\r\n[linha]\r\n\r\n[b][i]Dados T�cnicos:[/i][/b] \r\nGarantia: 12 Meses\r\nDimens�es: 83 x 130 x 16 mm \r\nPeso: 0,178 Kg", "1759", "2000", "v", "", "mes", "n", "1", "30/09/2002", "0.2", "g_168007.jpg", "p_168007.jpg", "nao", "0");
INSERT INTO produtos (idprod, nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES("128", "Placa Aceleradora Gr�fica de V�deo GeForce2 MX200 64MB PCI", "Pixel View", "Obtenha uma performance, velocidade e qualidade nunca antes vistas em seus aplicativos gr�ficos, projetos ou em jogos 3D (terceira dimens�o) !!!\r\n\r\n[linha]\r\n\r\n[b][i]Caracter�sticas T�cnicas:[/i][/b]  \r\nG2 MX200 c/ sa�da para TV\r\nChip Gr�fico Nvidia �GeForce2 MX200\r\nUnidade Processamento Grafico de 256 bits\r\n64 MB mem�ria onboard\r\nTaxa de processamento de 700 Mtexels\r\nConfigur�vel em at� 20 M tri�ngulos/segundo\r\nTecnologia QuadEnging nVIDIA\r\n350 MHz de Processamento Interno\r\nOptimizada para DirectX 7.0 e Open GL\r\nSa�da de TV: NTSC/PAL com Filtro anti-flicker\r\nConfigur�vel p/: 8, 15,16,24 ou 32 bits/pixel\r\nCursor de Hardware True Color\r\nMulti-prote��o (duas, tr�s, quatro prote��es) para anima��o plana e video playback\r\nG2 MX200 de 64 bits\r\n\r\n[linha]\r\n\r\n[b][i]Video Playback[/i][/b]\r\nProcessador de alta defini��o\r\nCompensa��o de Movimento Avan�ado de v�deo playback full screen para todas as resolu��es de DVD/HDVD\r\nAcelera��o de v�deo para DirectShow, MPEG-1, MPEG-2 e Indeo\r\n8:1 escala abaixo / escala acima\r\n\r\n[linha]\r\n \r\n[b][i]Dados T�cnicos:[/b][/i] \r\nGarantia: 6 Meses\r\nDimens�es: 198 x 290 x 62 mm \r\nPeso: 0,374 Kg", "300", "350", "3", "2", "mes", "s", "1", "30/09/2002", "0.1", "g_157345.jpg", "p_157345.jpg", "ok", "3");
INSERT INTO produtos (idprod, nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES("130", "Notebook Evo N160 W2000 Pentium III 1,2 GHz", "Compaq", "Um notebook poderoso, leve, delgado e com um pre�o competitivo!&nbsp;<br>&nbsp;<br><b>Sistema Operacional: MS Windows 2000</b>&nbsp;<br>&nbsp;<br>- Processador Intel� Pentium�III-M de 1.2GHz - Tecnologia de Intel�&nbsp;<br>- Speedstep - 512 KB de cache L2 integrado&nbsp;<br>- Monitor TFT de 14,1\"&nbsp;<br>- 256 MB SyncDRAM de mem�ria expans�vel at� 1GB - um compartimento dispon�vel&nbsp;<br>- Disco R�gido UltraDMA de 20.0 GB&nbsp;<br>- Unidade de DVD/CD-RW Combina��o&nbsp;<br>- Porta de v�deo digital IEEE 1394&nbsp;<br>- Porta Ethernet de 10/100 MB/s Integrado&nbsp;<br>- Modem de 56K ITU V.92&nbsp;<br>- Gr�ficos de 4X AGP Mobility Radeon 3D&nbsp;<br>- 8 MB de mem�ria dedicada para v�deo&nbsp;<br>- Alto-falantes de JBL Pro Audio com \"Bass Reflex\"&nbsp;<br>- Bateria de Li-ION de Alta-Capacidade&nbsp;<br>- Unidade de Disquete de 3,5\" de 1,44 MB&nbsp;<br>- S-Video TV-Out&nbsp;<br>&nbsp;<br><b>Interfaces de E/S:</b>&nbsp;<br>-Dois (2) conectores USB&nbsp;<br>-Porta de v�deo digital IEEE 1394&nbsp;<br>-Interface paralela padr�o EPP/ECP compat�vel com a norma Centronics (DB25 conector)&nbsp;<br>-Conector para modem RJ11&nbsp;<br>-Conector para ethernet RJ45&nbsp;<br>-Sa�da para TV S-Video&nbsp;<br>-Duas interfaces para �udio (sa�da para fone de ouvido e alto-falantes; entrada para microfone)&nbsp;<br>-Conector para monitor VGA&nbsp;<br>-Conex�o para Quickdock.&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados T�cnicos</i></b>&nbsp;<br>Bateria: Li-Ion de Alta Capacidade&nbsp;<br>Bus de Sistema: 133MHz&nbsp;<br>Expans�o de Mem�ria RAM: at� 1 GB&nbsp;<br>Garantia: 1 ano&nbsp;<br>Peso (Kg): 2,540&nbsp;<br>Cor: Grafite&nbsp;<br>Dimens�es do Produto (LxAxP) mm: 325 x 33 x 263&nbsp;<br>Dimens�es da Embalagem (LxAxP) mm: 177 x 355 x 412&nbsp;<br>", "7499", "8000", "24", "", "mes", "s", "1", "30/09/2002", "2.5", "g_168229.jpg", "p_168229.jpg", "ok", "0");
INSERT INTO produtos (idprod, nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES("129", "Impressora Jato de Tinta DJ 3420", "HP", "A impressora jato de tinta em cores HP Deskjet 3420, oferece qualidade fotogr�fica excepcional, com rapidez e facilidade, de at� 2400 ppp em cores com os cartuchos inclu�dos, al�m de rendimento de 10 p�ginas por minuto em preto profundo e 8 p�ginas por minuto em cores. Seu desenho compacto economiza espa�o valioso no seu escrit�rio. O indicador de n�vel de tinta na tela e o bot�o de cancelamento de impress�o economizam tempo e dinheiro. Imprima documentos duradouros usando tintas e pap�is especialmente desenvolvidos pela HP. Porta USB compat�vel com PC e Mac.&nbsp;<br>Interface com o usu�rio simplificada, opera��o da impressora com um �nico bot�o, bandeja dobr�vel de papel, novo design compacto&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Caracter�sticas T�cnicas</i></b>&nbsp;<br>Emiss�es de Energia Ac�stica: 5,8 B(A)&nbsp;<br>Emiss�es de Press�o Ac�stica: 47 dB(A)&nbsp;<br>Conectividade do Hardware: padr�o, USB&nbsp;<br>Cabo in Box: N�o&nbsp;<br>Mem�ria: 768 KB&nbsp;<br>Consumo de Energia: 23 watts, em m�dia&nbsp;<br>Voltagem de entrada: 100 a 240 VAC (+/- 10%), 50-60 Hz (+/- 3Hz)&nbsp;<br>Tipo de Alimenta��o: Externa&nbsp;<br>Cartuchos de Impress�o: padr�o - 2 (1 preto, 1 tricolor)&nbsp;<br>Cores do Cartucho da Impressora: Preto, ciano, magenta, amarelo&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Velocidade de Impress�o</b></i>&nbsp;<br>em cores, qualidade normal - at� 1 ppm&nbsp;<br>fotografia em cores, qualidade perfeita - at� 1 ppm&nbsp;<br>fotografia em cores, qualidade normal - N/D&nbsp;<br>em preto - at� 10 ppm&nbsp;<br>em preto (qualidade de rascunho) - at� 10 ppm&nbsp;<br>em cores - at� 8 ppm&nbsp;<br>em cores, qualidade de rascunho - at� 8 ppm&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados T�cnicos</i></b>&nbsp;<br>Cartuchos Inclusos: P&B/ Color&nbsp;<br>Compatibilidade: Pc e Mac&nbsp;<br>Garantia: 1 ano&nbsp;<br>M�todo de Impress�o: Jato de Tinta&nbsp;<br>Resolu��o M�xima (dpi): 2400 x 1200 ppp&nbsp;<br>Tamanho do Papel: Carta, Of�cio, Executivo, A4, A5 e B5&nbsp;<br>Interface: USB&nbsp;<br>Dimens�es (LxAxP) mm: 422 x 182 x 142 mm&nbsp;<br>Garantia: 12 Meses&nbsp;<br>Dimens�es: 422 x 182 x 142 mm &nbsp;<br>Peso: 2,000 Kg &nbsp;<br>", "349", "410", "12", "", "mes", "s", "1", "30/09/2002", "2", "g_174214.jpg", "p_174214.jpg", "ok", "1");
INSERT INTO produtos (idprod, nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES("131", "Microcomputador Presario 7EL193 Pentium III 933 MHz", "Compaq", "Os novos modelos em minitorres possibilitam aos propriet�rios dos computadores Presario v�rias op��es para acesso r�pido � Internet. Quer seja com um modem de 56K V.90, uma porta Ethernet 10Mbps para conex�o � Internet via modem a cabo, ou atrav�s de uma porta USB para antena parab�lica, os modelos em minitorre s�o o que h� de mais moderno em termos de Internet. E ficou ainda mais f�cil desfrutar dessa rapidez com o novo teclado aprimorado de acesso imediato que permite acessar e explorar a Internet com apenas um toque de bot�o. O novo mouse Internet Scroll facilita ainda mais a rolagem das p�ginas da Internet. Os novos modelos em minitorres est�o equipados para o futuro, com o design compat�vel com os requisitos do Ano 2000 padr�o do setor. Apresentam 4 ou 6 slots de expans�o, 6 compartimentos para unidades, 4 portas USB e 2 portas digitais IEEE 1394. Para garantir sua satisfa��o durante muitos anos com seu novo micro de Internet, o Presario S�rie 7000 � extremamente f�cil de manter em condi��es de opera��o otimizada. Gra�as ao novo chassis totalmente remodelado, o usu�rio pode atualizar e dar manuten��o ao micro sem o uso de ferramentas!&nbsp;<br>&nbsp;<br>N�o deixe de ler o manual do fabricante. Voc� fica por dentro de todos os recursos dos equipamentos, aprende a instal�-los corretamente e evita danos&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Caracter�sticas T�cnicas</i></b>&nbsp;<br>Bus de Sistema: 133 MHz&nbsp;<br>Disco R�gido HD: 20 Gb&nbsp;<br>Expans�o de Mem�ria RAM: at� 768 MHz&nbsp;<br>Garantia: 1 ano&nbsp;<br>Mem�ria Cache: L2 256 kb integrado&nbsp;<br>Mem�ria RAM: 128 Mb&nbsp;<br>Monitor: 15\" Compaq com Alto-falantes JBL Pro&nbsp;<br>Multim�dia: JBL Pro B540&nbsp;<br>Peso (Kg): 13,600&nbsp;<br>Placa V�deo: TNT2 M64 PRO 16 Mb&nbsp;<br>Placa de Som: Sound Blaster� 128 PCI Creative Labs&nbsp;<br>Placa de Fax/Modem: 56Kbps ITU V.90&nbsp;<br>Processador: Pentium III 933 MHz&nbsp;<br>Rede: Ethernet de 10/100 Mbps&nbsp;<br>Softwares em CD: MS� Encarta 2000 Enciclop�dia Adaptec Easy cd Crea&nbsp;<br>Softwares Pr�-Instalados: MS� Windows� 98 Second Edition/MS� Works 2000&nbsp;<br>Unidade de Disquete 3.5\": inclusa&nbsp;<br>Unidade Leitora/Gravadora de CD-ROM: Gravador CD-RW 24x 4x 4x&nbsp;<br>Unidade Leitora DVD-ROM: DVD ROM de 8X&nbsp;<br>Web-Cam: Logitech QuickCam Express&nbsp;<br>Cor: Branco&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados T�cnicos</i></b>&nbsp;<br>Dimens�es do Produto (LxAxP) mm: 241 x 488 x 477&nbsp;<br>Dimens�es da Embalagem (LxAxP) mm: 380 x 610 x 600&nbsp;<br>Garantia: 12 Meses&nbsp;<br>Dimens�es: 241 x 488 x 477 mm &nbsp;<br>Peso: 27,300 Kg", "4299", "5000", "24", "", "mes", "s", "1", "30/09/2002", "27.3", "g_166767.jpg", "p_166767.jpg", "ok", "0");
INSERT INTO produtos (idprod, nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES("132", "Microcomputador OZ 10D", "Gradiente", "Agora voc� poder� navegar na Internet, assistir TV, ver um filme em DVD, ou ainda escutar seu CD favorito num �nico equipamento que j� vem com controle remoto e sistema de �udio com SubWoofer! E, o que � melhor, tudo isso e muito mais pode ser feito insntanteneamente com o exclusivo Menu de F�cil Acesso desenvolvido para o OZ.\r\n\r\n[b]Controle Remoto Multim�dia[/b] - Permite que se utilizem as principais fun��es multim�dia do OZ a dist�ncia, com muito mais liberdadee praticidade para o usu�rio.\r\n\r\n[b]Menu de F�cil Acesso[/b] - Desenvolvido com exclusividade pela Gradiente, este menu possibilita o acesso a todos os recursos do OZ atrav�s do controle remoto, teclado multim�dia ou mouse. Este menu possui duas telas: a primeira traz �cones de TV, FM, CD, Internet, entre outros; a segunda traz outros aplicativos, como gerenciador de arquivos, jogos, etc.\r\n\r\n[b]TV[/b] - Possibilita o uso do equipamento como se fosse uma TV comum. Se voc� desejar, � poss�vel utilizar dois recursos simultaneamente, como por exemplo, assistir � TV enquanto navega na Internet.\r\n\r\n[b]CD Player[/b] - Funciona como um aut�ntico aparelho de som, com o reconhecido padr�o de qualidade Gradiente.\r\n\r\n[b]DVD[/b] - Permite assistir a filmes de DVD com recursos como m�ltiplas op��es de legendas, idiomas, v�rios �ngulos de cenas e muito mais. Tudo isso com qualidade de imagem e som digitais.\r\n\r\n[b]R�dio FM[/b] - Permite ouvir emissoras de FM, utilizando ainda o recursode programa��o das favoritas.\r\n\r\n[b]MP3 Player[/b] - Permite entrar na Internet e ouvir emissoras de r�dio do mundo todo, fazer download de m�sicas, ouvir arquivos MP3 etc.\r\n\r\n[b]Subwoofer Ativo (Sistema de Som Amplificado 2.1)[/b] - Reproduz os sons graves: muito mais impacto e fidelidade para TV, jogos e m�sicas.<\r\n\r\n[b]Teclado Multim�dia[/b] - Com ele, o usu�rio acessa a Internet, abre o programa de e-mail, controla volume e muito mais, com apenas um toque de tecla.\r\n\r\n[b]Internet[/b] - Assinando o provedor Marte, o usu�rio ganha 3 meses de Internet. \r\n", "4399", "4690", "10", "", "mes", "s", "1", "30/09/2002", "20.6", "g_171043.jpg", "p_171043.jpg", "nao", "0");
INSERT INTO produtos (idprod, nome, fabricante, detalhe, preco, precovelho, parcela, juro, aomes, estoque, idsessao, data, peso, imgra, impeq, status, contador) VALUES("133", "Windows XP Professional", "Microsoft", "O sistema operacional Microsoft Windows XP Professional � o novo sistema operacional de laptop e desktop para empresas de qualquer tamanho que ajuda os usu�rios a trabalhar de forma mais inteligente, oferecendo ainda mais produtividade e conectividade que a comprovada base de c�digo do Windows 2000. O Windows XP Professional oferece todas as vantagens de um sistema operacional com a simplicidade e flexibilidade da Home Edition.&nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Caracter�sticas T�cnicas</b></i>&nbsp;<br><u>Requisitos do sistema</u>&nbsp;<br>- PC com processador de 300 MHz ou superior recomendado [233 MHz � o m�nimo necess�rio, (sistema com um ou dois processadores)&nbsp;<br>-128 MB de RAM ou superior recomendados (m�nimo de 64 MB, com poss�vel limita��o do desempenho e de alguns recursos)&nbsp;<br>- 1,5 GB de espa�o dispon�vel em disco &nbsp;<br>- Adaptador de v�deo e monitor Super VGA (800 x 600) ou de resolu��o superior &nbsp;<br>- Unidade de CD-ROM ou DVD &nbsp;<br>- Teclado e Microsoft Mouse ou dispositivo apontador compat�vel &nbsp;<br>- Itens ou servi�os adicionais necess�rios para a utiliza��o de alguns recursos do Windows XP &nbsp;<br>&nbsp;<br><u>Para acesso � Internet</u>&nbsp;<br>Alguns recursos da Internet podem exigir acesso � Internet, conta no Microsoft .NET Passport e pagamento de uma taxa separada a um provedor de servi�os, al�m de tarifas telef�nicas locais e/ou interurbanas&nbsp;<br>Modem de 14,4 Kbps ou superior &nbsp;<br>&nbsp;<br><u>Para rede</u>&nbsp;<br>Adaptador de rede apropriado para o tipo de rede ao qual voc� deseja se conectar (local, de longa dist�ncia, sem fio ou dom�stica) e acesso a uma infra-estrutura de rede adequada; o acesso a redes de terceiros pode exigir o pagamento de taxas &nbsp;<br>&nbsp;<br><hr size=1 color=cccccc>&nbsp;<br>&nbsp;<br><b><i>Dados T�cnicos</i></b>&nbsp;<br>Garantia: 3 Meses&nbsp;<br>Peso: 0,900 Kg", "950", "1200", "12", "", "mes", "s", "1", "30/09/2002", "0.9", "g_161168.jpg", "p_161168.jpg", "nao", "5");


# Estrutura da tabela 'sessoes'
CREATE TABLE `sessoes` (
  `id` tinyint(5) unsigned zerofill NOT NULL auto_increment,
  `data` text,
  `nome` longtext,
  `descr` longtext,
  `ver` text,
  KEY `id` (`id`)
) TYPE=MyISAM;


# Dados da tabela 'sessoes'
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00001", "12/07/2002", "Computadores", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00002", "12/07/2002", "Acess�rios", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00003", "12/07/2002", "Games", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00004", "12/07/2002", "Softwares", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00005", "12/07/2002", "Hardware", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00006", "12/07/2002", "Internet", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00007", "12/07/2002", "Livros", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00008", "12/07/2002", "Celurares", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00009", "12/07/2002", "Palmtops", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00010", "12/07/2002", "Notebooks", "-", "s");
INSERT INTO sessoes (id, data, nome, descr, ver) VALUES("00011", "12/07/2002", "Diversos", "-", "s");
