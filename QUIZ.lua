-- Para adicionar novas perguntas, utilize a seguinte sintaxe na hora de inserir: "PERGUNTA","RESPOSTA 1","RESPOSTA 2",1 ou 2
-- Atualmente existem 135 perguntas nesse código. Para sugestões de perguntas contate Reksai_void2600#6638.
piso={type = 6,width = 350,height = 30,foregound = 1,friction = 1.0,restitution = 0.0,angle = 0,color = 0,miceCollision = true,groundCollision = true,dynamic = false}
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} do
	tfm.exec["disable"..f](true)
end
admin="Reksai_void2600#6638" -- COLOQUE SEU NOME!
system.disableChatCommandDisplay("random")
perguntas={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Em que ano o Transformice foi criado?","2009","2010",2,
"Qual dessas categorias de mapa representa um mapa excluído?","P43","P44",2,
"Qual destas tags é atribuída aos administradores do Transformice?","#0001","#0002",1,
"Quantos morangos são necessários para trocar de nickname no Transformice","1500","2500",1,
"Quantos queijos no perfil são necessários para rodar scripts LUA no cafofo?","100","1000",1,
"Se você digitar /cafe, o que acontece?","Abre o café","Faz aparecer cafés voadores",2,
"Quantos morangos custa o item mais caro da loja?","550","600",1,
"Funcorps fazem parte da Staff BR?","Sim","Não",2,
"Qual a categoria atribuída a mapas de Survivor?","P11","P12",1,
"O que acontece se você digitar /langue fr?","Muda a linguagem do jogo","Te leva para a sala fr",1,
"Qual destes jogos não foi feito pela Atelier 801?","Bombom","Fortoresse",1,
"Qual o limite máximo de amigos do Transformice?","500","1000",1,
"Há quantos emoticons no Transformice?","10","14",1,
"Há quantas ações de rato no Transformice?","10","14",2,
"Qual o nome do antigo modo do module #deathmatch?","Baffbotffa","Baffbot",1,
"O que acontece se você digitar /version?","Desconecta você do jogo","Abre a versão do jogo",2,
"Qual título é desbloqueado quando você consegue 40.000 firsts?","RELÂMPAGO","Mestre do Vento",1,
"Existem quantas habilidades de Shaman no Transformice?","75","65",1,
"O jogo Transformice foi desenvolvido em qual país?","EUA","França",2,
"Quem é o criador atual do module True or False?","Spectra_phantom#6089","Haxhhhhhhhhh#0000",1,
"Qual o nome da empresa que é responsável pelo Transformice?","Atelier 801","Riot Games",1,
"Qual destes pregos não pode ser utilizado no modo difícil?","Vermelho","Amarelo",1,
"Há quantas categorias de itens na loja?","16","17",2,
"Em que ano o Transformice atingiu seu número máximo de jogadores ativos?","2012","2013",1,
"Qual destes usuários é responsável pela sala #anvilwar?","Jessiewind26#2546","Spectra_phantom#6089",2,
"Qual destes usuários é responsável pelo module #batata?","Laagaadoo#0000","Ikke#0095",1,
"Qual destes comandos é utilizado para a inserção de um código especial da Japan Expo?","/lua","/code",2,
"A habilidade 'Meep!' faz parte de qual árvore de Habilidades?","Selvagem","Físico",1,
"Qual a categoria atribuída a mapas de Cafofo da Tribo?","P22","P20",1,
"O cargo de Modsent é atribuído a jogadores que são...","Moderadores e Funcorps","Moderadores e Sentinelas",2,
"Quem é o gerenciador atual do module #pictionary?","Shamousey#0095","Ork#0015",1,
"Qual o nome do cargo pré-definido do criador de uma tribo?","Shaman da Tribo","Líder Espiritual",2,
"Qual o nome da equipe que é responsável pela categorização de mapas do Transformice?","Module Team","Mapcrew",2,
"Quantas vezes você precisa completar um mapa bootcamp para ele ser contabilizado no perfil?","1","2",2,
"Usuários do servidor BR são proibidos de falar no servidor EN1.","Verdadeiro","Falso",2,
"Usuários do servidor BR são proibidos de falar no servidor EN2.","Verdadeiro","Falso",1,
"Quantos queijos são necessários para redistribuir as habilidades de shaman?","100 queijos","Depende do nível",2,
"Quantos ratos salvos são necessários para desbloquear o modo difícil?","1000","2000",1,
"O Transformice possui uma série animada de desenhos no YouTube.","Verdadeiro","Falso",1,
"Quantos ratos salvos são necessários para desbloquear o modo divino?","5000","10000",1,
"Japan Expo é o nome de um evento do Transformice que acontece em qual país?","Japão","França",2,
"Qual dessas tags é atribuída aos Funcorps do Transformice?","#0015","Não tem tag definida",2,
"Qual dessas tags é atribuída aos Mapcrews do Transformice?","#0020","Não tem tag definida",1,
"Qual destes comandos é utilizado para a inserção de um script LUA?","/lua","/code",1,
"Qual destes eventos não é mais utilizado no Transformice?","Carnaval","Natal",1,
"Se você ficar muito tempo dentro da água, você morre automaticamente.","Verdadeiro","Falso",2,
"É possível ganhar queijos na loja apenas jogando modules.","Verdadeiro","Falso",1,
"Qual categoria de mapas é atribuída aos mapas de Defilante?","P18","P19",1,
"Qual o nome da equipe que é responsável pelos modules do Transformice?","Module Team","Mapcrew",1,
"Qual categoria de mapas é atribuída aos mapas Racing?","P7","P17",2,
"A habilidade 'Espírito Ancestral' faz parte de qual árvore de Habilidades?","Guia Espiritual","Mestre do Vento",1,
"Quantos queijos custa a compra de um 2ª visual de roupas no Transformice?","100","1000",2,
"Quem é o criador do module #circuit?","Bolodefchoco#0000","Ninguem#0095",2,
"Quantos queijos custa a customização de uma roupa no Transformice?","2000","4000",1,
"Quantos queijos custa a customização de um item de shaman no Transformice?","2000","4000",2,
"Qual o nome da plataforma de execução que o Transformice utiliza?","Adobe Air","Adobe Flash Player",2,
"Em qual ano estreou o fórum em HTML5 do Atelier 801?","2015","2016",1,
"Qual a tribo do Tigrounette?","Lute como uma garota","Les Populaires",2,
"Qual título é desbloqueado quando você consegue 20.000 firsts?","RELÂMPAGO","Mestre do Vento",2,
"Qual título é desbloqueado quando você cria uma conta no Transformice?","Alpha & Ômega","Ratinho",2,
"Há quantos tipos de piso no Transformice?","15","16",1,
"Quantos pregos para o Shaman existem no Transformice?","3","5",2,
"Quantos tamanhos de tábua existem no Transformice?","4","3",1,
"Qual título é desbloqueado quando você consegue 1 bootcamp?","Principiante","Recruta",2,
"Qual foi a maior quantidade de pessoas logadas no Transformice, aproximadamente?","100000","85000",2,
"Qual o nick dos criadores do Transformice?","Melibellule e Tigrounette","Melibellule e Trigrounette",1,
"Quem é o criador atual do module Mestre Mandou?","Nasus_assassin#1534","Darakdarkus7#0000",1,
"Quem é o criador do module O Chão é Lava?","Miss_fortune#9548","Osicat#0000",2,
"Qual o limite de jogadores em uma tribo no Transformice?","2000","5000",2,
"Quem é o líder brasileiro da Module Team do Transformice?","Bolodefchoco#0000","Shun_kazami#7014",1,
"Em qual ano estreou o evento de Natal do Transformice?","2011","2010",2,
"Qual é o primeiro nome do Tigrounette?","Jean","Dean",1,
"Qual destes títulos é atribuído a quantidade de ratos salvos no modo difícil?","Virtuoso","Redentor",1,
"A partir de qual ano foi possível criar mapas com largura maior que a normal?","2012","2011",2,
"Em qual cidade francesa fica situada a sede da Atelier 801?","Lille","Paris",1,
"Quantos firsts são necessários para desbloquear o título 'O Mito'?","1100","1000",1,
"Qual a largura máxima que um mapa pode ter sem ter o modo defilante ativado?","1600","4800",1,
"Qual destes objetos não pode ser utilizado no modo difícil?","Sp","Seta",1,
"A seta é sempre o primeiro item do shaman.","Falso","Verdadeiro",1,
"Qual a idade mínima para virar moderador no Transformice?","18","16",1,
"Qual a idade mínima para virar FunCorp no Transformice?","16","Não tem idade mínima",2,
"Em teoria, qual a largura máxima que um mapa no Transformice pode ter?","4800","9830",2,
"Em teoria, qual a altura máxima que um mapa no Transformice pode ter?","800","9830",2,
"Quem é o criador atual do module #unotfm?","Ninguem#0095","Spectra_phantom#6089",1,
"Em qual ano foi introduzido o esquema de #tags nos nomes do Transformice?","2018","2019",1,
"Quantos bootcamps são necessários para desbloquear o título Recruta?","1","3",1,
"Qual é o nome do primeiro module do Transformice?","sharpie debuglua","batata",1,
"O dia de lançamento do Transformice é também um feriado nacional no Brasil. Qual é esse feriado?","Dia das Mães","Dia do Trabalho",2,
"Qual destes modules possui mais submódulos?","#parkour","#anvilwar",2,
"Quantos anos tem o Tigrounette?","33","35",2,
"Qual o limite de membros em uma tribo do Transformice?","5000","2000",1,
"Qual a tag atribuída aos administradores do Transformice?","#0000","#0001",2,
"No começo da vida do Defilante, quem ganhava as partidas recebia 2 firsts e quantos queijos?","0","2",1,
"Qual destas categorias de mapas é atribuída a mapas de Survivor Vampiro?","P12","P13",1,
"O module #freezertag antes era um submódulo de qual module?","#parkour","#circuit",1,
"Qual o nome do código que é usado para carregar mapas do Transformice?","Lua","XML",2,
"Qual destes usuários nunca se tornou Funcorp?","Patrick_mahomes#1795","Reksai_void2600#6638",1,
"Qual destes modules não foi feito pela Spectra Advanced Module Group?","Mestre Mandou","O Chão é Lava",2,
"Qual destas ratas morreu na vida real, dando origem a uma decoração do Transformice?","Elise","Papaille",1,
"Em qual mês do ano termina o evento de Natal?","Dezembro","Janeiro",2,
"Quem é o criador e gerenciador atual do module #shamousey?","Shamousey#0020","Marveldeath#0095",1,
"Quantos objetos de shaman podem ser utilizados no modo padrão?","13","14",2,
"Em qual país está situado o host de baixo ping disponível no Brasil?","Canadá","México",1,
"Qual categoria de mapas é atribuída aos mapas permanentes de modules?","P41","P43",1,
"Em qual ano surgiu o sistema de missões diárias no Transformice?","2018","2019",2,
"Qual a idade mínima para virar membro da Module Team no Transformice?","16","Não tem idade mínima",2,
"Qual destes comandos servem para ver informações ténicas do cliente e do sistema?","/info","/^^",2,
"Qual o último título desbloqueável de queijos do Transformice?","MEU QUEIJO!","Alpha & Omega",1,
"Para falar no café, você precisa de quantos queijos no perfil?","100","300",2,
"Qual destes modules foi dos mais acessados em 2014?","#pictionary","#minigolf",1,
"Qual era o nome da sala que, após uma sequência de comandos, dava morangos de graça?","286637850","286657250",1,
"Em qual ano foi lançado o primeiro servidor brasileiro do Transformice?","2010","2011",2,
"Em qual ano foi lançada a Plataforma Comunitária do Transformice?","2013","2014",1,
"O que acontece quando você digita /zimmer 5?","Te dá 5 queijos de graça","Leva você para a sala 5",2,
"Em qual mês do ano o Transformice foi criado?","Maio","Junho",1,
"Qual comando serve para ver a versão do Transformice?","/version","/transformice",1,
"Qual a tag atribuída a ex-membros da equipe do Transformice?","#0020","#0095",2,
"Tigrounette é homem ou mulher?","Homem","Mulher",1,
"É possível presentear outros ratos com itens da loja utilizando somente queijos.","Verdadeiro","Falso",2,
"Qual a função da habilidade de shaman 'Superstar'?","Todos os ratos ao redor dançam","Todos os ratos ao redor beijam",1,
"Qual o último título de ratos salvos pelo Shaman?","Virtuoso","Alpha & Ômega",2,
"Qual o nome do jogo de Zumbis lançado pela Atelier 801?","League of Legends","Dead Maze",2,
"Quantas medalhas comemorativas de aniversário existem no Transformice?","2","10",1,
"Em qual ano foi lançado o Poisson, antigo jogo que depois tornou o Transformice?","2010","2008",2,
"Por quantas horas você é banido por Hack no Transformice, por padrão?","360","168",2,
"Qual o nome do antigo jogo do Transformice para celular?","Dead Maze","Run For Cheese",2,
"Os donos da Atelier 801 e da Ubisoft já se encontraram pessoalmente.","Não","Sim",1,
"Em qual árvore de habilidades está presente a habilidade 'Volta da natureza'?","Físico","Selvagem",2,
"Qual o nome atual da ex-modsent Racola?","Alrly#0095","Keith#0095",1,
"Quantos ratos salvos são necessários para desbloquear o modo divino?","1000","5000",2,
"Quando você cria uma conta no Transformice, seu inventário vem vazio.","Verdadeiro","Falso",2,
"Qual o comando que desbloqueia um item de cabela de bolo?","/atelier801","/transformice",1,
"O capacete de 20 queijos é o único item que pode ser customizado sem gastar queijos/morangos.","Verdadeiro","Falso",1,
}
mapa='<C><P G="0,30" N="" /><Z><S><S c="4" L="3000" o="0" H="3000" X="400" Y="200" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,0.2,90,0,0,0" L="10" X="400" N="" Y="300" T="1" H="720" /><S L="10" H="330" X="760" Y="256" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" X="40" H="330" Y="255" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="800" X="400" H="20" Y="80" T="17" P="0,0,0.3,0.2,0,0,0,0" /><S L="800" H="30" X="400" Y="15" T="17" P="0,0,0.3,0.2,180,0,0,0" /><S L="40" H="40" X="20" Y="50" T="17" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="780" H="40" Y="50" T="17" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="400" H="30" Y="385" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="263" X="400" Y="221" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="40" X="20" H="340" Y="260" T="17" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" H="340" X="780" Y="260" T="17" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="56" X="400" /></D><O /></Z></C>'
modo="inicial" -- não mude
pergunta=0
rodada=0
actual_question={quest="",answer=nil}
function reset()
	rodada=0
	tfm.exec.newGame(mapa)
	tfm.exec.chatMessage("<VP>Se preparem! As perguntas começarão a ser realizadas em instantes!")
	tfm.exec.setGameTime(15)
	ui.removeTextArea(1)
	ui.removeTextArea(2)
	ui.removeTextArea(0)
end
function eventChatCommand(name,message)
	if name == admin and message == "random" then
		randomQuests()
	end
end
function eventNewPlayer(name)
	tfm.exec.chatMessage("Aguarde a próxima rodada para jogar.",name)
	ui.setMapName("Quiz de Perguntas - por Reksai_void2600#6638")
end
function eventLoop(p,f)
	if f < 2000 and modo == "inicial" then
		modo="perguntar"
		randomQuests()
	end
	if f < 1000 and modo == "perguntar" then
		for name,player in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[name].x >= 395 and tfm.get.room.playerList[name].x <= 405 then
				tfm.exec.killPlayer(name)
			end
		end
		tfm.exec.setGameTime(5)
		if actual_question.answer == false then
			tfm.exec.removePhysicObject(1)
			ui.removeTextArea(2,nil)
			modo="intervalo"
		elseif actual_question.answer == true then
			tfm.exec.removePhysicObject(0)
			ui.removeTextArea(1,nil)
			modo="intervalo"
		end
	end
	if f < 1 and modo == "intervalo" then
		randomQuests()
	end
	if f < 250 and modo == "fim" then
		modo="inicial"
		reset()
	end
end
function randomQuests()
	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.movePlayer(name,400,355,false)
	end
	tfm.exec.setGameTime(12)
	tfm.exec.addPhysicObject(0, 225, 410, piso)
	tfm.exec.addPhysicObject(1, 575, 410, piso)
	modo="perguntar"
	rodada=rodada+1
	pergunta=math.random(#perguntas/4)
	actual_question.quest=perguntas[-3+(4*pergunta)]
	if perguntas[pergunta*4] == 2 then
		actual_question.answer=true
	elseif perguntas[pergunta*4] == 1 then
		actual_question.answer=false
	end
	ui.addTextArea(1,"<p align='center'><font size='16'>"..perguntas[-2+(4*pergunta)].."",nil,100,120,260,24,0,0,1.0,true)
	ui.addTextArea(2,"<p align='center'><font size='16'>"..perguntas[-1+(4*pergunta)].."",nil,440,120,260,24,0,0,1.0,true)
	ui.addTextArea(0,"<p align='center'><font size='14'>"..actual_question.quest.."",nil,10,22,780,48,0x000001,0x000001,1.0,true)
end
function eventPlayerDied(name)
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		modo="fim"
		tfm.exec.chatMessage("<R>Sem vencedores!")
	elseif i==1 then
		modo="fim"
	end
end
reset()
