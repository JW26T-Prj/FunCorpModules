-- Se estiver rodando este código em uma sala FunCorp, insira os nicknames dos membros abaixo.
admin={""} -- Insira os nomes aqui! // Insert the nicknames here!
-- If you are running this code into a FunCorp room, insert the FunCorp names above.

-- Comandos / Commands:
-- !reset - Inicia um novo jogo. // Starts a new match.

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA! // DOESN'T EDIT NOTHING BELOW THIS LINE!!
------------------------------------------------------------------------------------------
for _,f in next,{"PhysicalConsumables","AutoShaman","AfkDeath","MortCommand","AutoNewGame","AutoTimeLeft","AllShamanSkills","AutoScore","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"reset","change"} do
	system.disableChatCommandDisplay(f)
end
modo="inicial"; lang={}; map="@7938991"; ratos=0; vivos=0; round=0; level=0; imgs={}; data={}; current_max=0; symbol={"⇦","⇧","⇨","⇩"}; symbol_l={"&lt;","^",">","v"}; keys={}; unlocked=false;
lang.br = {
	welcome = "<ROSE><b>Bem-vindo ao module #arrows!</b>\n<N>O objetivo deste module é ser rápido e preciso, usando o teclado para responder a sequência de setas que aparecerá na sua tela!\n\n<BL><b>Versão 1.8.1</b>",
	starting = "<J>Atenção! O jogo será iniciado em 5 segundos!",
	wrong = "<R>Você errou!",
	accept = "<VP>Parabéns! Você conseguiu avançar desta fase!",
	notime = "<R>Tempo esgotado!", difficulty = "Dificuldade", mices = "Ratos", 
	increase = "<J>O grau de dificuldade agora está maior!",
	end1 = "<VP><b>Fim de jogo! </b>", end2 = " ratos sobreviveram! Iniciando nova partida...",
	nowinners = "Não houveram vencedores! Iniciando nova partida...",
	winners = "A partir de agora, caso sobre somente um rato, este será declarado o vencedor!",
	iswinner = " é o grande vencedor!",
	legacy = "<J>Caso não esteja conseguindo ver as setas corretamente, digite !change. Este comando mudará a forma como as setas são exibidas na tela.",
}
lang.en = {
	welcome = "<ROSE><b>Welcome to the #arrows module!</b>\n<N>The goal of this module is to use your keyboard to follow the sequence of arrows that will show on your screen! You need to be fast!\n\n<b>Version 1.8.1</b>",
	starting = "<J>The game will be started in 5 seconds!",
	wrong = "<R>Oh no! Wrong key!",
	accept = "<VP>Congratulations! You passed this round!",
	notime = "<R>Time is up!", difficulty = "Difficulty", mices = "Mice",
	increase = "<J>The difficulty level was increased!",
	end1 = "<VP><b>Game over! </b>", end2 = " mices survived! Starting new match...",
	nowinners = "No winners! Starting new round...",
	winners = "From now on, if only one mice survive, (s)he will be declared as winner!",
	iswinner = " won the game!",
	legacy = "<J>If you are not seeing the arrows correctly, type !change. This will change the way that the arrows will be displayed.",
}
lang.es = {
	welcome = "<ROSE><b>¡Bienvenidos al módulo #arrows!</b>\n<N>¡El objetivo de este módulo es usar su teclado para seguir la secuencia de flechas que se mostrarán en su pantalla! ¡Tienes que ser rápido!\n\n<b>Versión 1.8.1</b>",
	starting = "<J>¡El juego comenzará en 5 segundos!",
	wrong = "<R>Oh no! Wrong key!",
	accept = "<VP>¡Oh, no! ¡Tecla incorrecta!",
	notime = "<R>El tiempo ha terminado!", difficulty = "Dificuldade", mices = "Ratón",
	increase = "<J>¡El nivel de dificultad aumentó!",
	end1 = "<VP><b>¡Juego terminado! </b>", end2 = " ratones sobrevivieron! Empezando nuevo partido...",
	nowinners = "¡Sin ganadores! Empezando nueva ronda...",
	winners = "De ahora en adelante, si solo sobrevive un ratón, ¡será declarado ganador!",
	iswinner = " ganó el juego.",
	legacy = "<J>Si no ve las flechas correctamente, escriba !change. Esto cambiará la forma en que se mostrarán las flechas.",
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
elseif tfm.get.room.community == "es" then
	text = lang.es
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
			print("<ROSE>[Test Mode] : \n<BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : \n<BL>"..temp_text.."")
		end
	end
end
function reset()
	tfm.exec.newGame(map)
	ui.setBackgroundColor("#111111")
	tfm.exec.setGameTime(15)
	modo="inicial"; round=0; level=0;
end
function countVivos()
	vivos=0; ratos=0;
	for name,player in next,tfm.get.room.playerList do
		ratos=ratos+1
		if tfm.get.room.playerList[name].isDead == false then
			vivos=vivos+1
		end
	end
end
function updateTimeBar()
	ui.addTextArea(100,"",nil,10,145,10+((remain-10)/current_max)*780,6,0x770777,0x990999,0.88,true);
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
			for name,player in next,tfm.get.room.playerList do
				if data[name].legacy == false then
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",name,75+(i*100),150,100,110,0,0,1,true)
				else
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol_l[direction+1].."",name,75+(i*100),150,110,110,0,0,1,true)
				end
			end
		end
	elseif level >= 3 and level <= 4 then
		for i=1,10 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			for name,player in next,tfm.get.room.playerList do
				if data[name].legacy == false then
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",name,-35+(i*75),150,100,110,0,0,1,true)
				else
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol_l[direction+1].."",name,-35+(i*75),150,110,110,0,0,1,true)
				end
			end
		end
	elseif level >= 5 and level <= 6 then
		for i=1,10 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			for name,player in next,tfm.get.room.playerList do
				if data[name].legacy == false then
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",name,-35+(i*75),120,100,110,0,0,1,true)
				else
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol_l[direction+1].."",name,-35+(i*75),120,110,110,0,0,1,true)
				end
			end
		end
		for i=11,15 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			for name,player in next,tfm.get.room.playerList do
				if data[name].legacy == false then
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",name,75+((-10+i)*100),190,100,110,0,0,1,true)
				else
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol_l[direction+1].."",name,75+((-10+i)*100),190,110,110,0,0,1,true)
				end
			end
		end
	elseif level >= 7 then
		for i=1,10 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			for name,player in next,tfm.get.room.playerList do
				if data[name].legacy == false then
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",name,-35+(i*75),120,100,110,0,0,1,true)
				else
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol_l[direction+1].."",name,-35+(i*75),120,110,110,0,0,1,true)
				end
			end
		end
		for i=11,20 do
			direction=math.random(0,3)
			table.insert(keys,tonumber(direction))
			for name,player in next,tfm.get.room.playerList do
				if data[name].legacy == false then
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol[direction+1].."",name,-35+((-10+i)*75),190,100,110,0,0,1,true)
				else
					ui.addTextArea(i,"<font size='90'><font color='#ffffff'><font face='Segoe UI Emoji,Segoe UI Symbol'>"..symbol_l[direction+1].."",name,-35+((-10+i)*75),190,110,110,0,0,1,true)
				end
			end
		end
	end
	if level == 1 then tfm.exec.setGameTime(10); current_max=10;
	elseif level == 2 then tfm.exec.setGameTime(9); current_max=9;
	elseif level == 3 then tfm.exec.setGameTime(11); current_max=11;
	elseif level == 4 then tfm.exec.setGameTime(10); current_max=10;
	elseif level == 5 then tfm.exec.setGameTime(12); current_max=12;
	elseif level == 6 then tfm.exec.setGameTime(11); current_max=11;
	elseif level == 7 then tfm.exec.setGameTime(14); current_max=14;
	elseif level == 8 then tfm.exec.setGameTime(12); current_max=12; end
end
function eventChatCommand(name,message)
	if message == "reset" and verifyAdmin(name) == true then
		reset();
	end
	if message == "change" and data[name] then
		if data[name].legacy == false then data[name].legacy=true; else data[name].legacy=false; end
		showMessage(tostring(data[name].legacy),name)
	end
end
function eventLoop(pass,rem)
	passed=math.floor(pass/500); remain=math.floor(rem/500);
	if pass > 3500 and unlocked == false then
		unlocked=true
		reset()
	end
	if unlocked == true then
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
			tfm.exec.setGameTime(8-level)
			for i=1,20 do
				ui.removeTextArea(i,nil)
			end
		end
		if remain > 1 and modo == "jogar" then
			updateTimeBar();
		end
		if remain <= 1 then
			if modo == "espera" or modo == "inicial" then
				if round > 50 then
					showMessage(text.end1..vivos..text.end2)
					for name,player in next,tfm.get.room.playerList do
						if tfm.get.room.playerList[name].isDead == false then
							tfm.exec.giveCheese(name)
							tfm.exec.playerVictory(name)
						end
					end
					modo="fim";
				else
					if vivos <= 0 then
						modo="fim";
						showMessage(text.nowinners)
					elseif round > 5 and vivos == 1 and ratos >= 2 then
						modo="fim";
						for name,player in next,tfm.get.room.playerList do
							if tfm.get.room.playerList[name].isDead == false then
								showMessage("<VP><b>"..name..text.iswinner.."</b>")
								tfm.exec.giveCheese(name)
								tfm.exec.playerVictory(name)
							end
						end
					elseif vivos >= 1 then
						if round % 5 == 0 and level < 8 then
							if round == 5 then
								showMessage(text.winners)
							end
							tfm.exec.setGameTime(5)
							level=level+1;
							if level > 1 then showMessage(text.increase); end
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
		end
		if remain <= 1 and modo == "fim" then
			reset();
		end
		ui.setMapName("<ROSE>#arrows   <G>|   <N>Round : <V>"..round.."   <G>|   <N>"..text.mices.." : <V>"..vivos.."/"..ratos.."   <G>|   <N>"..text.difficulty.." : <V>"..level.."   <G>|   <J>v1.8.1<")
	end
end
function eventNewGame()
	ui.setBackgroundColor("#111111")
	for name,player in next,tfm.get.room.playerList do
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
		end
	end
	countVivos();
	showMessage(text.legacy)
end
function eventPlayerDied(name)
	countVivos();
end
function eventPlayerLeft(name)
	countVivos();
end
function eventNewPlayer(name)
	newData={
		["c"]=1;
		["s"]=1;
		["legacy"]=false;
	};
	data[name] = newData;
	for i=0,3 do
		system.bindKeyboard(name, i, false, true)
	end
	tfm.exec.setPlayerScore(name,0,false)
	ui.setBackgroundColor("#111111")
	countVivos();
end
function eventKeyboard(name, key, down)
	if key <= 3 and modo == "jogar" and data[name].c <= rawlen(keys) and data[name].s == 0 and tfm.get.room.playerList[name].isDead == false then
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
