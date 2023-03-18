-- Novo script do module TribeWar, chamado de TribeWar Renewed, desenvolvido por Dhanny_mheyran#6701.
-- Insira seu nickname com a #tag na linha 9 do código para fazê-lo funcionar.
-- Créditos originais para Lynezx#0000 e Nasus_assassin#1534.

-- New script of TribeWar module, called TribeWar Renewed, developed by Dhanny_mheyran#6701.
-- Insert your nickname with #tag at line 9 to make the code work.
-- Original credits to Lynezx#0000 and Nasus_assassin#1534.

admin="Dhanny_mheyran#6701" -- Insira seu nome aqui, FunCorp! / Insert your nickname here, FunCorp!

-- Comandos/Commands:
-- !start = Inicia uma nova partida. Você precisa estar na tela inicial para fazer isso.
-- !reset = Descarta a partida atual e retorna para a tela inicial.
-- !rounds [5-25] = Define o número de rodadas de cada partida. (padrão: 15)
-- !mapmode [0-3] = Escolhe o tipo de mapa que será executado.
-- No comando acima, insira 0 para RACING, 1 para BOOTCAMP, 2 para VANILLA e 3 para MIX. (padrão: racing)
-- !maptime [30-120] = Define o tempo, em segundos, no qual cada mapa será executado. (padrão: 60)
-- !kill [name#tag] = Mata o jogador selecionado.
-- !ban [name#tag] = Bane o jogador selecionado do module.
-- !ms [mensagem] ou !tc [mensagem] = Exibe uma mensagem na cor laranja.

-- !start = Start a new game. You need to stay into the lobby screen to do this.
-- !reset = Discard the current match and go back to the lobby screen.
-- !rounds [5-25] = Set the number of rounds for each match. (default: 15)
-- !mapmode [0-3] = Set the map category. (default: racing)
-- With the above command, insert 0 for RACING, 1 for BOOTCAMP, 2 for VANILLA and 3 for MIX.
-- !maptime [30-120] = Define the number of seconds that each map will run. (default: 60)
-- !kill [name#tag] = Kill the specified player.
-- !ban [name#tag] = Ban the specified player. This only has effect into the module.
-- !ms [text] or !tc [text] = Show a FunCorp orange message.

-- NÃO EDITE NADA A PARTIR DESTA LINHA!! // DON'T EDIT ANYTHING BELOW THIS LINE!!
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","PhysicalConsumables","AfkDeath","MortCommand","DebugCommand"} do
	tfm.exec["disable"..f]()
end
for _,g in next,{"start","reset","rounds","mapmode","maptime","kill","ban","ms","tc","help","ranking","cavalinho"} do
	system.disableChatCommandDisplay(g)
end
lang={}; data={}; rounds=15; mode="lobby"; maps="racing"; map_time=60; lobby_map="@6390711"; winner_map="@7928188"; round=-1; alives=0; position=1; remain_int=0;
tribes={}; final_ranking={};
mapas={1,2,8,11,12,14,19,22,26,27,28,30,31,33,35,40,41,44,45,49,53,55,57,58,59,62,63,64,65,67,69,70,71,73,74,78,79,80,81,86,89,92,96,100}
lang.br = {
	welcome = "<N><b>Bem-vindos ao module TribeWar Renewed!</b><br>Junte a sua tribo, conquiste pódios e represente-a com sucesso!<br><ROSE>Digite !help para ver a ajuda e digite !ranking para ver o ranking da partida.<br><br><J><b>Script gerenciado por Dhanny_mheyran#6701</b><br>Originalmente feito por Lynezx#0000 e Nasus_assassin#1534<br><br><R>Versão 2023.03.18.1-TW",
	tribelock1 = "<VP>Você está participando do jogo pela tribo </b>",
	tribelock2 = ".</b><br><N>Caso você troque de tribo, você poderá representá-la apenas no próximo jogo.",
	notribe = "<R>Você ainda pode participar deste jogo, caso seja convidado para alguma tribo. No entanto, você só pode representar uma tribo por jogo.",
	prepare = "<J><b>Prepare-se! O jogo vai começar em 15 segundos!</b>",
	map = "Mapa", version = "Versão", time = "Tempo", points = " pontos.",
	scoring1 = " acrescentou 6 pontos para a tribo ",
	scoring2 = " acrescentou 4 pontos para a tribo ",
	scoring3 = " acrescentou 2 pontos para a tribo ",
	scoring4 = ", que agora está com ",
	tempr = "<ROSE>Estas são as tribos com maior pontuação até o o momento!<br>",
	madeby = "feita por Dhanny_mheyran#6701",
	cong1 = "<N>Parabéns para a tribo <VP><b>",
	cong2 = "!</b><br><N>Ela fez <J><b>",
	cong3 = "</b> <N>pontos e se sagrou vencedora do jogo!",
	isbanned = "<R>Você foi banido deste module por um administrador da sala.",
	isunbanned = "Você foi desbanido deste module por um administrador da sala.",
	istatus = "teve seu status de banimento alterado.",
	prepares = "<J>Este é um round apenas para preparação. A partida começa para valer apenas no próximo round.",
	nowplay = "<VP>Agora é pra valer! Jogo iniciado!",
	help = "<p align='center'><N><b>Bem-vindo ao module TribeWar Renewed.</b><br><br><p align='left'>Neste module, os jogadores representam suas tribos em uma competição. Conseguir pódios garantirá pontos para a sua tribo.<br><br>Ao final de um determinado número de rounds, a tribo que conseguir pontuar mais vencerá o jogo.<br><br><VP>Pontuações do jogo:<br><BL>• <N>1º lugar = <VP>6 pontos<br><BL>• <N>2º lugar = <VP>4 pontos<br><BL>• <N>3º lugar = <VP>2 pontos<br><br><R>Caso você saia de uma tribo e vá para outra, você poderá representá-la somente no próximo jogo."
}
lang.en = {
	welcome = "<N><b>Welcome to TribeWar Renewed module!</b><br>Gather the players of your tribe, win matches and represent her with success!<br><ROSE>Type !help to see the game help and !ranking to see the ranking of the match.<br><br><J><b>Script developed by Dhanny_mheyran#6701</b><br>Originally made by Lynezx#0000 and Nasus_assassin#1534<br><br><R>Version 2023.03.18.1-TW",
	tribelock1 = "<VP>You are representing the following tribe: <b>",
	tribelock2 = ".</b><br><N>If you join another tribe, you only can represent her in the next game.",
	notribe = "<R>You still can play this game, if you are invited to join any tribe. However, you can only represent one tribe at time.",
	prepare = "<J><b>Get ready! The game will start in 15 seconds!</b>",
	map = "Map", version = "Version", time = "Time", points = " points.",
	scoring1 = " scored 6 points to the tribe ",
	scoring2 = " scored 4 points to the tribe ",
	scoring3 = " scored 2 points to the tribe ",
	scoring4 = ". It now have ",
	tempr = "<ROSE><b>Current leaders scoreboard:</b><br>",
	madeby = "made by Dhanny_mheyran#6701",
	cong1 = "<N>Congratulations to the tribe <VP><b>",
	cong2 = "!</b><br><N>It scored <J><b>",
	cong3 = "</b> <N>points and is the winner of TribeWar!",
	isbanned = "<R>You are banned of this module by a room administrator.",
	isunbanned = "You are unbanned of this module by a room administrator.",
	istatus = " ban status was changed.",
	prepares = "<J>This is only a preparing round. The game full starts on the next round.",
	nowplay = "<VP>The game is now fully started!",
	help = "<p align='center'><N><b>Welcome to the TribeWar Renewed module.</b><br><br><p align='left'>In this game, the players needs to represent your tribes in a very tight match. Reach the podium will give points to your tribe.<br><br>At the end of the match, the tribe that scored more will win the game.<br><br><VP>Scores by position:<br><BL>• <N>1st place = <VP>6 points<br><BL>• <N>2nd place = <VP>4 points<br><BL>• <N>3rd place = <VP>2 points<br><br><R>If you leave your tribe and join another, you only can represent your new tribe in the next match."
}

if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end

function findString(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
			return true
		end
	end
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-11,22,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function eventRanking(name)
	str=""
	for k,v in ipairs(tribes) do
		str=str.."<font size='12'><N><b>#"..k.."</b> - <VP>"..v[1].." - <J><b>"..v[2].."</b>"..text.points.."<br>"
	end
	showMenu(name,0xffffff,200,100,400,200,"Match Ranking",str)
end
function findID(object)
	for i=1,rawlen(tribes) do
		if tribes[i][1] == data[object].tribe then
			return i
		end
	end
end
function rankTribes()
	table.sort(tribes, function(a, b) return a[2] > b[2] end)
end
function genRanking()
	final_ranking={}
	if rawlen(tribes) == 2 then
		showMessage(text.tempr)
		for k,v in ipairs(tribes) do
			table.insert(final_ranking,{v[1],v[2]})
			showMessage("#"..k..": <VP>"..v[1].." - <J><b>"..v[2].."</b>"..text.points)
		end
	elseif rawlen(tribes) >= 3 then
		i=0
		showMessage(text.tempr)
		for k,v in ipairs(tribes) do
			i=i+1
			if i <= 3 then
				table.insert(final_ranking,{v[1],v[2]})
				showMessage("#"..i..": <VP>"..v[1].." - <J><b>"..v[2].."</b>"..text.points)
			end
		end
	end
end
function banPlayer(name)
	if data[name] then
		if data[name].banned == false then
			tfm.exec.killPlayer(name)
			showMessage(text.isbanned,name)
			data[name].banned=true
		else
			showMessage(text.isunbanned,name)
			data[name].banned=false
		end
		return true
	else
		return false
	end
end
function genFinalRanking()
	final_ranking={}
	if rawlen(tribes) >= 2 then
		i=0
		for k,v in ipairs(tribes) do
			i=i+1
			if i <= 3 then
				table.insert(final_ranking,{v[1],v[2]})
			end
			if i == 1 then
				for name,_ in next,tfm.get.room.playerList do
					if data[name] and data[name].tribe == v[1] then
						tfm.exec.movePlayer(name,math.random(255,545),225,false,0,0,false)
						tfm.exec.playEmote(name,0)
					end
				end
				showMessage(text.cong1..v[1]..text.cong2..v[2]..text.cong3)
				ui.addTextArea(1,"<font size='23'><p align='center'><font color='#101010'>"..v[1].."",nil,260,300,280,70,0,0,1.0,true)
				ui.addTextArea(4,"<font size='14'><p align='center'><font face='Consolas'><font color='#101010'><b>"..v[2].."</b> pts",nil,370,370,60,25,0,0,1.0,true)
			elseif i == 2 then
				for name,_ in next,tfm.get.room.playerList do
					if data[name] and data[name].tribe == v[1] then
						tfm.exec.movePlayer(name,math.random(5,245),285,false,0,0,false)
					end
				end
				ui.addTextArea(2,"<font size='16'><p align='center'><font color='#101010'>"..v[1].."",nil,10,340,230,40,0,0,1.0,true)
				ui.addTextArea(5,"<font size='14'><p align='center'><font face='Consolas'><font color='#101010'><b>"..v[2].."</b> pts",nil,95,376,60,25,0,0,1.0,true)
			elseif i == 3 then
				for name,_ in next,tfm.get.room.playerList do
					if data[name] and data[name].tribe == v[1] then
						tfm.exec.movePlayer(name,math.random(555,795),305,false,0,0,false)
					end
				end
				ui.addTextArea(3,"<font size='16'><p align='center'><font color='#101010'>"..v[1].."",nil,560,345,230,35,0,0,1.0,true)
				ui.addTextArea(6,"<font size='14'><p align='center'><font face='Consolas'><font color='#101010'><b>"..v[2].."</b> pts",nil,645,376,60,25,0,0,1.0,true)
			end
		end
	end
end
function lobby()
	tfm.exec.newGame(lobby_map)
	mode="lobby"; round=-1; alives=0; position=1; tribes={}; final_ranking={};
	for i=1,6 do
		ui.removeTextArea(i)
	end
end
function eventNewPlayer(name)
	if not data[name] then
		newData={
			["tribe"]="";
			["wins"]=0;
			["rankings"]=0;
			["banned"]=false;
			["opened"]=false;
			};
		data[name] = newData;
	end
	showMessage(text.welcome,name)
	if mode == "lobby" or mode == "waiting" then
		tfm.exec.respawnPlayer(name)
	end
	if mode == "game" then
		if data[name] then
			if string.len(data[name].tribe) <= 1 and string.len(tfm.get.room.playerList[name].tribeName) > 1 then
				data[name].tribe=tfm.get.room.playerList[name].tribeName;
				showMessage(text.tribelock1..tfm.get.room.playerList[name].tribeName..text.tribelock2)
				table.insert(tribes,{tfm.get.room.playerList[name].tribeName, 0})
			end
		end
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventTextAreaCallback(id,name,callback)
	for _,i in next,{1000,1001,1002,1003,1004} do
		ui.removeTextArea(i,name)
	end
	data[name].opened=false
end
function eventNewGame()
	if mode == "game" then
		if round == 0 then
			showMessage(text.prepares)
		elseif round == 1 then
			showMessage(text.nowplay)
		end
		rankTribes()
		if round >= 2 then
			genRanking()
		end
		position=1
		for name,_ in next,tfm.get.room.playerList do
			alives=alives+1
			if data[name] then
				if string.len(data[name].tribe) <= 1 and string.len(tfm.get.room.playerList[name].tribeName) > 1 then
					data[name].tribe=tfm.get.room.playerList[name].tribeName;
					showMessage(text.tribelock1..tfm.get.room.playerList[name].tribeName..text.tribelock2)
				end
			end					
			if not data[name] then
				tfm.exec.killPlayer(name)
			elseif data[name] and data[name].banned == true then
				tfm.exec.killPlayer(name); showMessage(text.isbanned);
			elseif data[name] and string.len(data[name].tribe) <= 1 then
				tfm.exec.killPlayer(name)
			elseif data[name] and string.len(tfm.get.room.playerList[name].tribeName) <= 1 then
				tfm.exec.killPlayer(name)
			elseif data[name] then
				if not tfm.get.room.playerList[name].tribeName == data[name].tribe then
					tfm.exec.killPlayer(name)
				end
			end
		end
	elseif mode == "end" then
		tfm.exec.setGameTime(60)
		rankTribes()
		genFinalRanking()
	else
		tfm.exec.setGameTime(36000)
	end
end
function eventPlayerWon(name)
	if mode == "game" and round >= 1 then
		if data[name] then
			alives=alives-1
			if data[name].tribe == tfm.get.room.playerList[name].tribeName then
				tribe_id=findID(name)
				if position == 1 then
					tribes[tribe_id][2]=tribes[tribe_id][2]+6
					showMessage("<VP>"..name.."<N>"..text.scoring1.."<VP><b>"..data[name].tribe.."</b><N>"..text.scoring4.."<J><b>"..tribes[tribe_id][2].."</b><N>"..text.points.."")
					if remain_int > 20 then
						tfm.exec.setGameTime(20)
					end
				elseif position == 2 then
					tribes[tribe_id][2]=tribes[tribe_id][2]+4
					showMessage("<VP>"..name.."<N>"..text.scoring2.."<VP><b>"..data[name].tribe.."</b><N>"..text.scoring4.."<J><b>"..tribes[tribe_id][2].."</b><N>"..text.points.."")
				elseif position == 3 then
					tribes[tribe_id][2]=tribes[tribe_id][2]+2
					showMessage("<VP>"..name.."<N>"..text.scoring3.."<VP><b>"..data[name].tribe.."</b><N>"..text.scoring4.."<J><b>"..tribes[tribe_id][2].."</b><N>"..text.points.."")
				end
				position=position+1
			end
			if alives <= 0 then
				tfm.exec.setGameTime(5)
			end
		end
	end
end
function eventPlayerDied(name)
	alives=alives-1
	local i=0
	local n
	for pname,player in next,tfm.get.room.playerList do
		if not player.isDead and not player.isShaman then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		changeMap();
	end
end
function lockTribes()
	for name,_ in next,tfm.get.room.playerList do
		if data[name] and string.len(tfm.get.room.playerList[name].tribeName) > 1 then
			data[name].tribe=tfm.get.room.playerList[name].tribeName;
			showMessage(text.tribelock1..tfm.get.room.playerList[name].tribeName..text.tribelock2,name)
		else
			showMessage(text.notribe,name)
		end
		if not findString(tfm.get.room.playerList[name].tribeName,tribes) then
			table.insert(tribes,{tfm.get.room.playerList[name].tribeName, 0})
		end
	end
	showMessage(text.prepare)
end
function changeMap()
	round=round+1
	if round <= rounds then
		if maps == "racing" then
			tfm.exec.newGame("#17")
		elseif maps == "bootcamp" then
			tfm.exec.newGame("#3")
		elseif maps == "vanilla" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		elseif maps == "mix" then
			number=math.random(1,3)
			if number == 1 then tfm.exec.newGame("#17"); elseif number == 2 then tfm.exec.newGame("#13"); elseif number == 3 then tfm.exec.newGame(mapas[math.random(#mapas)]); end
		end
		tfm.exec.setGameTime(map_time+4)
	else
		tfm.exec.newGame(winner_map)
		mode="end"
	end
end
function eventChatCommand(name,command)
	if name == admin then
		if command == "start" and mode == "lobby" then
			lockTribes(); mode="waiting";
			tfm.exec.setGameTime(15)
		end
		if command == "reset" then
			lobby()
		end
		if (command:sub(0,4) == "kill") and mode == "game" then
			tfm.exec.killPlayer(command:sub(6))
		end
		if (command:sub(0,3) == "ban") then
			if banPlayer(command:sub(5)) == true then
				showMessage(command:sub(5)..text.istatus)
			end
		end
		if (command:sub(0,6) == "rounds") and mode == "lobby" then
			tt={}; for i=5,25 do table.insert(tt,tostring(i)) end
			if findString(command:sub(8),tt) then rounds=tonumber(command:sub(8)); end
		end
		if (command:sub(0,7) == "mapmode") and mode == "lobby" then
			if command:sub(9) == "0" then maps="racing"; elseif command:sub(9) == "1" then maps="bootcamp"; elseif command:sub(9) == "2" then maps="vanilla"; elseif command:sub(9) == "3" then maps="mix"; end
		end
		if (command:sub(0,7) == "maptime") and mode == "lobby" then
			tt={}; for i=30,120 do table.insert(tt,tostring(i)) end
			if findString(command:sub(9),tt) then map_time=tonumber(command:sub(9)); end
		end
		if (command:sub(0,2) == "tc") or (command:sub(0,2) == "ms") then
			showMessage("<font color='#FF8547'>• [FunCorp - <b>"..name.."</b>] "..command:sub(4).."")
		end
	end
	if command == "help" then
		showMessage(text.help,name)
	end
	if command == "cavalinho" then
		showMessage("Essa mulher enlouqueceu<br>Ela quer montar em cima de mim<br>Ela pirou de vez<br>Tá pensando que eu sou seu cavalinho<br>E eu vou só dizendo assim<br>Vai, vai<br><br>E vai no cavalinho, vai, vai, vai, vai<br>E vai no cavalinho, vai, vai, vai, vai<br>Vai no cavalinho, vai, vai, vai, vai",name)
	end
	if command == "ranking" and mode == "game" then
		if data[name].opened == false then
			eventRanking(name)
		end
	end
end
function eventLoop(release,remain)
	remain_int=math.ceil(remain/1000)
	if mode == "lobby" or mode == "waiting" or mode == "end" then
		ui.setMapName("<J><b>TribeWar Renewed</b>   <G>|   <N>"..text.version.." 2023.03.18.1-TW "..text.madeby.."<")
	end
	if remain <= 1000 and mode == "waiting" then
		mode="game"; changeMap();
	end
	if mode == "game" then
		remaining=math.floor(remain/1000)
		ui.setMapName("<J><b>TribeWar Renewed</b>   <G>|   <N>"..text.map.." : <V>"..tfm.get.room.currentMap.."   <G>|   <N>"..text.time.." : <V>"..remaining.."s   <G>|   <N>Round : <V>"..round.."/"..rounds.."   <G>|   <R><b>"..text.version.." 2023.03.18.1-TW</b><")
		if remain <= 500 and round < rounds then
			changeMap();
		elseif remain <= 500 and round >= rounds then
			tfm.exec.newGame(winner_map)
			mode="end"
		end
	end
	if mode == "end" then
		if remain <= 100 then
			lobby()
		else
			particles={0,1,2,4,9,11,13,21,22,23,24}
			for i=1,10 do
				tfm.exec.displayParticle(particles[math.random(#particles)],math.random(40,760),math.random(70,380),0.6,0.6,0.1,0.1,nil)
			end
		end
	end
end
lobby()
