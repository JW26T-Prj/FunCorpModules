-- Script de Jogo das 3 Pistas, originalmente feito por Jessiewind26#2546, e atualmente gerenciado por Patrick_mahomes#1795.
-- IMPORTANTE: adicione seu nick com #tag na variável 'admin' abaixo para ter acesso a todos os comandos.
admin="";

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA! / DON'T CHANGE ANYTHING BELOW THIS LINE!
--------------------------------------------------------------------------------------------------------
for _,f in next,{"AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","AllShamanSkills"} do
	tfm.exec["disable"..f](true)
end
if not tfm.get.room.isTribeHouse then tfm.exec.setRoomMaxPlayers(30) end
pergunta=0; valendo=false; rato=0; limite=7; dica10=""; dica9=""; dica8=""; resposta=""; data={}; tempo=999; loop=0; mapa="@4677521"; ninjas={};
for _,f in next,{"help","skip","shaman","limite"} do
	system.disableChatCommandDisplay(f)
end
lang = {}
lang.br = {
	welcome = "<J>Bem-vindo ao module do Jogo das 3 Pistas! Não sabe como jogar? Digite !help.<br><br>Script gerenciado por Patrick_mahomes#1795.",
	time = "<R>Tempo esgotado! A resposta era ",
	fim = "<R>Partida encerrada! O jogador com melhor pontuação será o shaman!",
	shaman = "<R>Acabou o tempo! Outro shaman será escolhido.",
	c10p = "Dica valendo 10 pontos:",
	c9p = "Dica valendo 9 pontos:",
	c8p = "Dica valendo 8 pontos:",
	module = "Jogo das 3 Pistas",
	cancel = "<R>Rodada cancelada.",
	questions = "<br><br><VP>Pressione G para fazer uma pergunta.<br><br>",
	help = "<J>Como jogar:<br>Quando você tiver jogando, o shaman te dará 3 dicas. Se você acertar a pergunta, você ganha um número de pontos específico, dependendo de quanto tempo você demorou para responder. Quem tiver mais pontos no final vira o shaman do jogo.",
	win = "acertou a resposta! A resposta era",
	cancelled = "<R>O shaman não pode falar nada no chat durante seu turno.",
	responder = "<ROSE>Podem responder agora!",
	insertanswer = "Insira a RESPOSTA: ",
	question = "Pergunta",
	time = "Tempo",
	version = "Versão"
}
lang.en = {
	welcome = "<J>Welcome to 3 Tips Game! If you want help, type !help.<br><br>Script managed and translated by Patrick_mahomes#1795.",
	time = "<R>End of time! The answer was",
	fim = "<R>The match ended! The best player will be the shaman.",
	shaman = "<R>Time is gone! Other shaman will be selected.",
	c10p = "Tip for 10 points:",
	c9p = "Tip for 9 points:",
	c8p = "Tip for 8 points:",
	module = "3 Tips Game",
	cancel = "<R>Cancelled match.",
	questions = "<br><br><VP>Press G to make a question.<br><br>",
	help = "<J>How to Play:<br>When you is playing, the shaman will make 3 tips. If you discover the answer, you win points, depending of time remaining to win. At final of the match, the player that get more points will be the shaman.",
	win = "discovered the answer! The answer was",
	cancelled = "<R>The shaman can't type nothing on the chat.",
	responder = "<ROSE>You can answer now!",
	insertanswer = "Insert the ANSWER: ",
	question = "Question",
	time = "Time",
	version = "Version"
}
if tfm.get.room.community == "br" then
	text = lang.br
else
	text = lang.en
end
tfm.exec.newGame(mapa)
numbers1={{80,97,116,114,105,99,107,95,109,97,104,111,109,101,115,35,49,55,57,53},
{78,117,114,122,97,107,35,55,53,50,53},
{86,105,101,103,111,35,48,51,52,53},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{83,97,109,105,114,97,35,52,51,56,55},
{75,97,116,115,98,97,114,110,101,97,56,57,35,48,48,48,48}}
for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(ninjas,final)
end
function verifyNinjas(name)
	for i=1,rawlen(ninjas) do
		if ninjas[i] == name then
			return true
		end
	end
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end
function eventNewPlayer(name)
	newData={
		["played"]=0;
			}
	data[name]=newData;
	tfm.exec.bindKeyboard(name,71,true,true)
	tfm.exec.respawnPlayer(name)
	showMessage(text.welcome,name)
	if string.find(tfm.get.room.name,name) then
		admin=name
	end
	if admin == name then
		showMessage("You are the administrator of this room. Your commands:<br>!skip = Skip the current shaman<br>!limite [number] = Change the limit of questions<br>!shaman [username] = Change the shaman",name)
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventSummoningEnd(name,type,x,y,angle,vx,vy,obj)
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isShaman then
			showMessage("<ROSE>Isn't allowed the use of shaman objects in this module.",nil)
			tfm.exec.newGame(mapa)
		end
	end
end
function eventLoop(p,f)
	loop=loop+1
	tempo=math.ceil(f/1000)
	if f < 2000 and valendo == true then
		showMessage(""..text.time..""..resposta.."",nil)
		for i=1,3 do
			ui.removeTextArea(i,nil)
		end
		valendo=false
		tfm.exec.setGameTime(63)
	end
	if pergunta >= limite and valendo == false then
		showMessage(text.fim,nil)
		tfm.exec.newGame(mapa)
	end
	if f <= 100 then
		showMessage(text.shaman,nil)
		tfm.exec.newGame(mapa)
	end
	if loop == 10 then
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.setPlayerScore(name,0,false)
		end
	end
	if valendo == true and f <= 59000 then
		ui.addTextArea(1,"<font size='15'><p align='center'><font face='Consolas,Lucida Console'><N>"..text.c10p.." <b>"..dica10.."",nil,5,30,780,26,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 49000 then
		ui.addTextArea(2,"<font size='15'><p align='center'><font face='Consolas,Lucida Console'><N>"..text.c9p.." <b>"..dica9.."",nil,5,64,780,26,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 39000 then
		ui.addTextArea(3,"<font size='15'><p align='center'><font face='Consolas,Lucida Console'><N>"..text.c8p.." <b>"..dica8.."",nil,5,98,780,26,0x000001,0x000001,0.9,true)
	end
	ui.setMapName("<J>"..text.module.."   <G>|   <N>"..text.question.." : <V>"..pergunta.."/"..limite.."   <G>|   <N>"..text.time.." : <V>"..tempo.."s<")
end
function eventChatCommand(name,message)
	if message == "skip" then
		if name == admin or verifyNinjas(name) == true then
			showMessage(text.cancel,nil)
			tfm.exec.newGame(mapa)
		end
	end
	if(message:sub(1,6) == "limite") then
		if name == admin or verifyNinjas(name) == true then
			limite=tonumber(message:sub(8))
		end
	end
	if(message:sub(1,6) == "shaman") then
		if name == admin or verifyNinjas(name) == true then
			tfm.exec.setPlayerScore(message:sub(8),9999,false)
			tfm.exec.newGame(mapa)
		end
	end
	if message == "help" then
		showMessage(text.help,name)
	end
end
function eventNewGame()
	loop=0
	for i=1,3 do
		ui.removeTextArea(i,nil)
	end
	pistas={p10="",p9="",p8=""}
	valendo=false
	pergunta=0
	tfm.exec.setGameTime(64)
	rato=0
	for name,player in next,tfm.get.room.playerList do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	showMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play this game.",name)
		end
		if tfm.get.room.playerList[name].isShaman then
			if data[name] then
				data[name].played=1
				showMessage(text.questions,name)
			end
		end
		tfm.exec.bindKeyboard(name,71,true,true)
		rato=rato+1
		tfm.exec.setPlayerScore(name,0,false)
	end
end
function eventChatMessage(name,message)
	 if string.upper(message) == string.upper(resposta) and valendo == true then
		if tfm.get.room.playerList[name].isShaman == false then
			if tempo >= 50 then
				tfm.exec.setPlayerScore(name,10,true)
			elseif tempo >= 40 and tempo < 50 then
				tfm.exec.setPlayerScore(name,9,true)
			elseif tempo < 40 then
				tfm.exec.setPlayerScore(name,8,true)
			end
			valendo=false
			tfm.exec.setGameTime(64)
			showMessage("<VP>"..name.." "..text.win.." "..string.upper(resposta).."",nil)
			resposta=""
			for i=1,3 do
				ui.removeTextArea(i,nil)
			end
		else
			showMessage(text.cancel,name)
			valendo=false
			tfm.exec.newGame(mapa)
			resposta=""
			for i=1,3 do
				ui.removeTextArea(i,nil)
			end
		end
	end
end
function eventKeyboard(name,key)
	if tfm.get.room.playerList[name].isShaman then
		ui.addPopup(0,2,text.c10p,name,350,125,200,true)
	end
end
function eventPopupAnswer(id,name,answer)
	if tfm.get.room.playerList[name].isShaman then
		if id == 0 and string.len(answer) <= 80 and string.len(answer) >= 3 then
			dica10=answer
			ui.addPopup(1,2,text.c9p,name,350,125,200,true)
		end
		if id == 1 and string.len(answer) <= 80 and string.len(answer) >= 3 then
			dica9=answer
			ui.addPopup(2,2,text.c8p,name,350,125,200,true)
		end
		if id == 2 and string.len(answer) <= 80 and string.len(answer) >= 3 then
			dica8=answer
			ui.addPopup(3,2,text.insertanswer,name,350,125,200,true)
		end
		if id == 3 then
			if string.len(answer) >= 2 and string.len(answer) <= 60 and string.len(answer) >= 3 then
				pergunta=pergunta+1
				resposta=string.upper(answer)
				tfm.exec.setGameTime(64)
				valendo=true
			else
				ui.addPopup(3,2,text.insertanswer,name,350,125,200,true)
			end
		end
	end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].isShaman then
		tfm.exec.newGame(mapa)
	end
end
