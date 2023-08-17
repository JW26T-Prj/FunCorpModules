-- Module #arrows, versão v1.1, desenvolvido por Leblanc#5342.

-- Se estiver rodando este código em uma sala FunCorp, insira os nicknames dos membros abaixo.
admin={"Leblanc#5342"} -- Insira os nomes aqui! // Insert the nicknames here!
-- If you are running this code into a FunCorp room, insert the FunCorp names above.

-- Comandos / Commands:
-- !fc [text] - Exibe uma mensagem na cor laranja. USO EXCLUSIVO DE MEMBROS FUNCORP! // Show a message in orange. EXCLUSIVE USE OF FUNCORP MEMBERS!
-- !reset - Inicia um novo jogo. // Starts a new match.

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA! // DOESN'T EDIT NOTHING BELOW THIS LINE!!
for _,f in next,{"PhysicalConsumables","AutoShaman","AfkDeath","MortCommand","AutoNewGame","AutoTimeLeft","AllShamanSkills","AutoScore","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"fc","reset"} do
	system.disableChatCommandDisplay(f)
end
modo="inicial"; lang={}; map="@7938991"; ratos=0; vivos=0; round=0; level=0; imgs={}; data={}; symbol={"⇦","⇧","⇨","⇩"}; keys={};
lang.br = {
	welcome = "<ROSE><b>Bem-vindo ao module #arrows!</b><br><N>O objetivo deste module é ser rápido e preciso, usando o teclado para responder a sequência de setas que aparecerá na sua tela!<br><br><VP>Module criado por Leblanc#5342. Ideia original de Shun_kazami#7014.<br><BL><b>Versão 1.1</b>",
	starting = "<J>Atenção! O jogo será iniciado em 5 segundos!",
	wrong = "<R>Você errou!",
	accept = "<VP>Parabéns! Você conseguiu avançar desta fase!",
	notime = "<R>Tempo esgotado!", difficulty = "Dificuldade", mices = "Ratos", 
	increase = "<J>O grau de dificuldade agora está maior!",
	end1 = "<VP><b>Fim de jogo! </b>", end2 = " ratos sobreviveram! Iniciando nova partida..",
	nowinners = "Não houveram vencedores! Iniciando nova partida...",
	winners = "A partir de agora, caso sobre somente um rato, este será declarado o vencedor!",
	iswinner = " é o grande vencedor!",
}
lang.en = {
	welcome = "<ROSE><b>Welcome to the #arrows module!</b><br><N>The goal of this module is to use your keyboard to follow the sequence of arrows that will show on your screen! You need to be fast!<br><br><VP>Module developed by Leblanc#5342. Original idea from Shun_kazami#7014.<br><BL><b>Version 1.1</b>",
	starting = "<J>The game will be started in 5 seconds!",
	wrong = "<R>Oh no! Wrong key!",
	accept = "<VP>Congratulations! You passed this round!",
	notime = "<R>Time is up!", difficulty = "Difficulty", mices = "Mice",
	increase = "<J>The difficulty level was increased!",
	end1 = "<VP><b>Game over! </b>", end2 = " mices survived! Starting new match..",
	nowinners = "No winners! Starting new round...",
	winners = "From now on, if only one mice survive, (s)he will be declared as winner!",
	iswinner = " won the game!",
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end
function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
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
function reset()
	tfm.exec.newGame(map)
	ui.setBackgroundColor("#111111")
	tfm.exec.setGameTime(15)
	modo="inicial"; round=0;level=0;
end
function updateTimeBar()
	if level == 1 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*156,12,0xEDEDED,0xEDEDED,0.88,true);
	elseif level == 2 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*195,12,0xEDEDED,0xEDEDED,0.88,true);
	elseif level == 3 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*130,12,0xEDEDED,0xEDEDED,0.88,true);
	elseif level == 4 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*156,12,0xEDEDED,0xEDEDED,0.88,true);
	elseif level == 5 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*112,12,0xEDEDED,0xEDEDED,0.88,true);
	elseif level == 6 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*130,12,0xEDEDED,0xEDEDED,0.88,true);
	elseif level == 7 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*78,12,0xEDEDED,0xEDEDED,0.88,true);
	elseif level == 8 then ui.addTextArea(100,"",nil,10,125,10+(remain-11)*112,12,0xEDEDED,0xEDEDED,0.88,true); end
end
function exibeSetas()
	round=round+1; modo="jogar"; keys={};
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isDead == false then
			data[name].c=1; data[name].s=0;
		end
	end
	if level <= 2 then
		for i=1,5 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",nil,75+(i*100),150,100,110,0,0,1.1,true)
		end
	elseif level >= 3 and level <= 4 then
		for i=1,10 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",nil,-35+(i*75),150,100,110,0,0,1.1,true)
		end
	elseif level >= 5 and level <= 6 then
		for i=1,10 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",nil,-35+(i*75),120,100,110,0,0,1.1,true)
		end
		for i=11,15 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",nil,75+((-10+i)*100),190,100,110,0,0,1.1,true)
		end
	elseif level >= 7 then
		for i=1,10 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",nil,-35+(i*75),120,100,110,0,0,1.1,true)
		end
		for i=11,20 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",nil,-35+((-10+i)*75),190,100,110,0,0,1.1,true)
		end
	end
	if level == 1 then tfm.exec.setGameTime(10);
	elseif level == 2 then tfm.exec.setGameTime(9);
	elseif level == 3 then tfm.exec.setGameTime(11);
	elseif level == 4 then tfm.exec.setGameTime(10);
	elseif level == 5 then tfm.exec.setGameTime(13);
	elseif level == 6 then tfm.exec.setGameTime(12);
	elseif level == 7 then tfm.exec.setGameTime(15);
	elseif level == 8 then tfm.exec.setGameTime(13); end
end
function eventChatCommand(name,message)
	if(message:sub(0,2) == "fc") and verifyAdmin(name) == true then
		showMessage("<font color='#FF8547'>• [FunCorp - <b>"..name.."</b>] "..message:sub(4).."")
	end
	if message == "reset" and verifyAdmin(name) == true then
		reset();
	end
end
function eventLoop(pass,rem)
	passed=math.floor(pass/500); remain=math.floor(rem/500);
	if passed == 20 then
		showMessage(text.starting)
	end
	if remain <= 10 and modo == "jogar" then
		for name,player in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[name].isDead == false then
				if data[name].c < rawlen(keys) then
					tfm.exec.killPlayer(name)
					showMessage(text.notime,name)
				end
			end
		end
		ui.removeTextArea(100,nil)
		modo="espera";
		tfm.exec.setGameTime(10-level)
		for i=1,20 do
			ui.removeTextArea(i,nil)
		end
	end
	if remain > 1 and modo == "jogar" then
		updateTimeBar();
	end
	if remain <= 1 then
		if modo == "espera" or modo == "inicial" then
			if round > 40 then
				showMessage(text.end1..vivos..text.end2)
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].isDead == false then
						tfm.exec.giveCheese(name)
						tfm.exec.playerVictory(name)
					end
				end
				modo="fim";
			end
			if vivos == 0 then
				modo="fim";
				showMessage(text.nowinners)
			elseif round > 10 and vivos == 1 and ratos > 1 then
				modo="fim";
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].isDead == false then
						showMessage("<VP><b>"..name..text.iswinner.."</b>")
						tfm.exec.giveCheese(name)
						tfm.exec.playerVictory(name)
					end
				end
			elseif vivos >= 1 and round <= 40 then
				if round % 5 == 0 then
					if level < 8 then
						if round == 10 then
							showMessage(text.winners)
						end
						tfm.exec.setGameTime(5)
						level=level+1;
						if level > 1 then showMessage(text.increase); end
					end
				end
				exibeSetas();
			else
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].isDead == false then
						tfm.exec.giveCheese(name)
						tfm.exec.playerVictory(name)
					end
				end
				modo="fim";
			end
		end
	end
	if remain <= 1 and modo == "fim" then
		reset();
	end
	ui.setMapName("<ROSE>#arrows - Leblanc#5342   <G>|   <N>Round : <V>"..round.."/40   <G>|   <N>Mice : <V>"..vivos.."/"..ratos.."   <G>|   <N>"..text.difficulty.." : <V>"..level.."   <G>|   <J>v1.1<")
end
function eventNewGame()
	ratos=0; vivos=0;
	for name,player in next,tfm.get.room.playerList do
		ratos=ratos+1; vivos=vivos+1;
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
		end
	end
end
function eventPlayerDied(name)
	vivos=vivos-1;
end
function eventPlayerLeft(name)
	vivos=vivos-1;
end
function eventNewPlayer(name)
	ratos=ratos+1;
	showMessage(text.welcome,name)
	newData={
		["c"]=1;
		["s"]=1;
	};
	data[name] = newData;
	for i=0,3 do
		system.bindKeyboard(name, i, false, true)
	end
	tfm.exec.setPlayerScore(name,0,false)
end
function eventKeyboard(name, key, down)
	if key <= 3 and modo == "jogar" and data[name].c <= rawlen(keys) and data[name].s == 0 then
		if key == keys[tonumber(data[name].c)] then
			ui.removeTextArea(data[name].c,name)
			if data[name].c == rawlen(keys) then
				data[name].s=1
				showMessage(text.accept,name)
				tfm.exec.setPlayerScore(name,level,true)
			end
			if data[name].c < rawlen(keys) then
				data[name].c=data[name].c+1
			end
		else
			if tfm.get.room.playerList[name].isDead == false then
				tfm.exec.killPlayer(name)
				showMessage(text.wrong,name)
			end
		end
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
reset()
