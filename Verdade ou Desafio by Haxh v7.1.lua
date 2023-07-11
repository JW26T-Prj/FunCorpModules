-- Versão original do jogo Verdade ou Desafio, feita por Haxhhhhhhhhh no dia 27 de fevereiro de 2016 e posteriormente recriada como o module #mousetat.
-- Esta versão foi atualizada de acordo com as normas da equipe de verificação e pode ser utilizada em salas FunCorp.

admin="Shun_kazami#7014" -- insira seu nome aqui e digite !shaman para escolher um shaman.
-- Na sequência, o jogo insira passo a passo como o jogo é feito.

-- NÃO MUDE NADA A PARTIR DESTA LINHA!
for _,f in next,{"AutoNewGame","AutoShaman","AutoScore","AutoTimeLeft","AllShamanSkills","DebugCommand","AfkDeath","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
shaman=""; player=""; mapa="@3161057";
for _,f in next,{"shaman","escolher","reset","sim","não","new"} do
	system.disableChatCommandDisplay(f)
end
function eventKeyboard(name,code,down,x,y)
	if code == 17 then
		if x <= 825 then
			tfm.exec.movePlayer(name,860,350,false,1,1,false)
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.bindKeyboard(name,17,true,true)
	tfm.exec.respawnPlayer(name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
end
function eventChatCommand(name,message)
	if message == "shaman" then
		if name == admin then
			ui.addPopup(0,2,"Digite o shaman:",name,350,175,200,true)
		end
	end
	if message == "escolher" then
		if tfm.get.room.playerList[name].isShaman then
			ui.addPopup(1,2,"Digite o rato:",name,350,175,200,true)
		end
	end
	if message == "reset" then
		if tfm.get.room.playerList[name].isShaman or name == admin then
			ui.addPopup(2,1,"Reiniciar o jogo?",name,350,175,200,true)
		end
	end
	if message == "sim" then
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.newGame(mapa)
			tfm.exec.setShaman(player)
			shaman=player;
			player=""
			ui.addTextArea(0,"<font size='13'>Você agora é o shaman. Digite !escolher para escolher um rato para ser o seu prisioneiro.                              <a href='event:fecha'>Fechar</a>",shaman,0,100,800,30,0x009000,0x008000,1.0,true)
		end
	end
	if message == "não" then
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.movePlayer(player,800,440,false,1,1,false)
			ui.addTextArea(0,"<font size='13'>Você enviou o seu prisioneiro ao vazio! Agora novamente digite !escolher para ser o seu prisioneiro.                                                                                                                                                            <a href='event:fecha'>Fechar</a>",shaman,0,100,800,50,0x009000,0x008000,1.0,true)
		end
	end
end
function eventNewGame()
	tfm.exec.snow(0,0)
	tfm.exec.setUIMapName("<N>Verdade ou Desafio versão <VP>7.1")
	tfm.exec.setShaman(shaman)
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			ui.addTextArea(0,"<font size='13'>Você agora é o shaman. Digite !escolher para escolher um rato para ser o seu prisioneiro.                              <a href='event:fecha'>Fechar</a>",shaman,0,130,800,30,0x009000,0x008000,1.0,true)
		end end
end
function eventPopupAnswer(id,name,answer)
	if id == 0 then
		shaman=answer;
		ui.addTextArea(0,"<font size='13'>O shaman escolhido foi "..shaman.."                                                                                    <a href='event:fecha'>Fechar</a>",shaman,0,100,800,30,0x009000,0x008000,1.0,true)
		tfm.exec.newGame(mapa)
		ui.addTextArea(1,"<font size='13'>Você agora é o shaman. Digite !escolher para escolher um rato para ser o seu prisioneiro.                              <a href='event:fechr'>Fechar</a>",shaman,0,130,800,30,0x009000,0x008000,1.0,true)
	end
	if id == 1 then
		player=answer;
		tfm.exec.movePlayer(answer,260,160,false,1,1,false)
		ui.addTextArea(0,"<font size='13'>O rato escolhido foi "..player.."                                                                                      <a href='event:fecha'>Fechar</a>",shaman,0,130,800,30,0x009000,0x008000,1.0,true)
		ui.addTextArea(1,"<font size='13'>Você escolhe <b>Verdade</b> ou <b>Desafio</b>? Selecione a sua opção                    <a href='event:verd'>Verdade</a> | <a href='event:desa'>Desafio</a>",answer,0,100,800,30,0x009000,0x008000,1.0,true)
	end
	if id == 2 then
		if answer == "yes" then
			tfm.exec.newGame(mapa)
			shaman="Haxhhhhhhhhh"
			player=""
			eventChatCommand("shaman","Haxhhhhhhhhh")
		end
	end
end
function eventPlayerDied(name)
	tfm.exec.setPlayerScore(name,-1,true)
end
function eventTextAreaCallback(id,name,callback)
	if callback == "fecha" then
		ui.removeTextArea(0,name)
	end
	if callback == "fechr" then
		ui.removeTextArea(1,name)
	end
	if callback == "verd" then
		verdade()
	end
	if callback == "desa" then
		desafio()
	end
end
function verdade()
	ui.removeTextArea(1,nil)
	ui.addTextArea(1,"<font size='13'>"..player.." escolheu <b>verdade!                                                                                    <a href='event:fechr'>Fechar</a>",nil,0,130,800,30,0x009000,0x008000,1.0,true)
	ui.addPopup(500,0,"<font size='13'>O seu prisioneiro escolheu <b>Verdade</b>! Faça uma pergunta de verdade para ele.<br><br>Caso o ser humano acerte, digite !sim. Caso ele erre, digite !não.",shaman,300,175,400,true)
end
function desafio()
	ui.removeTextArea(1,nil)
	ui.addTextArea(1,"<font size='13'>"..player.." escolheu <b>desafio!                                                                                    <a href='event:fechr'>Fechar</a>",nil,0,130,800,30,0x009000,0x008000,1.0,true)
	ui.addPopup(500,0,"<font size='13'>O seu prisioneiro escolheu <b>Desafio</b>! Faça um desafio para ele.<br><br>Caso o ser humano faça o desafio e acerte, digite !sim. Caso contrário, digite !não.",shaman,300,175,400,true)
end