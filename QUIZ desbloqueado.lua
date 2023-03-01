-- Script de Quiz de perguntas feito por Reksai_void2600#6638, versão 2.31.0
-- Por favor, edite a linha 6 a variável 'admin' pelo seu nome para ter acesso aos comandos.
-- Para adicionar novas perguntas, utilize a seguinte sintaxe na hora de inserir: "PERGUNTA","RESPOSTA 1","RESPOSTA 2",1 ou 2
-- Caso você queira usar este código em um cafofo de tribo, altere a variável TRIBEHOUSE da linha 7 para 'true'.

admin={"Reksai_void2600#6638"} -- FunCorps, insiram seus nomes aqui!
tribehouse=false -- Altere para 'true' caso esteja rodando este código em um cafofo de tribo.
debug=false -- Não alterar. Uso exclusivo para depuração e diagnóstico.

piso={type = 6,width = 350,height = 40,foregound = 1,friction = 1.0,restitution = 0.0,angle = 0,color = 0,miceCollision = true,groundCollision = true,dynamic = false}
barreira={type = 12,width = 20,height = 100,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x000000,miceCollision = true,groundCollision = true,dynamic = false}
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"setq","limite","tema"} do
	system.disableChatCommandDisplay(g)
end
ratos=0; vivos=0; set_q=0; questions_list={}; modo="inicial"; pergunta=0; rodada=0; limite=20; count=0; fixed_cnt=0;
perguntas={
-- INSIRA AS PERGUNTAS AQUI!
}
mapa="@7786632"
actual_question={quest="",a1="",a2="",answer=nil}
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
	if tribehouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tribehouse == true then
		ui.addTextArea(0,"<p align='center'><font size='16'>"..message.."",name,10,22,780,48,0x000001,0x000001,1.0,true)
	end
end
function questionChanger(id,remove)
	if remove == true then
		table.remove(questions_list,id)
	end
end
function eventNewGame()
	vivos=0
	tfm.exec.setGameTime(15)
	for name,player in next,tfm.get.room.playerList do
		vivos=vivos+1
	end
	count=rawlen(perguntas)/4
	fixed_cnt=count
	if rawlen(questions_list) <= limite then
		showMessage("<J>Contando perguntas. Por favor, aguarde...<br>")
		for i=1,count do
			table.insert(questions_list,i)
		end
	end
	showMessage("Esta é uma versão modificada do Quiz de Perguntas.<br>Os temas das perguntas são definidos pelos gerenciadores da sala.<br><br><N><b>Quantidade de perguntas presentes: "..fixed_cnt.."</b><br><VP>O sistema inteligente de escolha de perguntas está ativo.")
end
function reset()
	rodada=0
	for i=0,3 do
		ui.removeTextArea(i)
	end
	modo="inicial"
	tfm.exec.newGame(mapa)
end
function eventChatCommand(name,message)
	if name == "Forzaldenon#0000" or name == "Reksai_void2600#6638" or name == "Akwimos#1937" or verifyAdmin(name) == true then
		if (message:sub(0,6) == "limite") then
			limite=tonumber(message:sub(8))
			showMessage("Limite de rodadas alterado para: "..message:sub(8).."")
			questions_list={}; count=0;
			reset()
		end
		if (message:sub(0,4) == "setq") then
			set_q=tonumber(message:sub(6))
		end
	end
end
function eventNewPlayer(name)
	ratos=ratos+1
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventPlayerLeft(name)
	ratos=ratos-1
end
function eventLoop(p,f)
	ui.setMapName("<N>Quiz de Perguntas <VP><b>v2.31.0</b> <N>por <ROSE>Reksai_void2600#6638   <BL>|   <N>Ratos vivos : <V>"..vivos.."/<J>"..ratos.."   <BL>|   <N>Round : <V>"..rodada.."/<R>"..limite.."<")
	if f < 2000 and modo == "inicial" then
		modo="perguntar"
		randomQuests()
	end
	if f < 1250 and modo == "perguntar" then
		for name,player in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[name].x >= 390 and tfm.get.room.playerList[name].x <= 410 then
				tfm.exec.killPlayer(name)
			end
		end
		tfm.exec.setGameTime(6)
		tfm.exec.addPhysicObject(4, 390, 140, barreira)
		tfm.exec.addPhysicObject(5, 410, 140, barreira)
		if actual_question.answer == false then
			tfm.exec.removePhysicObject(1)
			ui.addTextArea(2,"<p align='center'><font color='#181818'><font size='18'>"..actual_question.a2.."",nil,440,145,260,81,0,0,0.1,true)
			ui.addTextArea(1,"<p align='center'><VP><font size='18'>"..actual_question.a1.."",nil,100,145,260,81,0,0,1.0,true)
			modo="intervalo"
		elseif actual_question.answer == true then
			tfm.exec.removePhysicObject(0)
			ui.addTextArea(1,"<p align='center'><font color='#181818'><font size='18'>"..actual_question.a1.."",nil,100,145,260,81,0,0,0.1,true)
			ui.addTextArea(2,"<p align='center'><VP><font size='18'>"..actual_question.a2.."",nil,440,145,260,81,0,0,1.0,true)
			modo="intervalo"
		end
	end
	if modo == "intervalo" then
		if f > 2000 and f <= 3000 then
			if actual_question.answer == false then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].x >= 410 then
						tfm.exec.killPlayer(name)
					end
				end
			elseif actual_question.answer == true then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].x <= 390 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
	end
	if f < 1 and modo == "intervalo" then
		if rodada < limite then
			randomQuests()
		else
			tfm.exec.setGameTime(5)
			showMessage("<R>Sem vencedores!")
			modo="fim"
		end
	end
	if modo == "perguntar" and f >= 1 then
		ui.addTextArea(3,"<p align='center'><font size='45'>"..math.ceil((f/1000)-1).."",nil,360,235,80,60,0x000001,0x494949,1.0,true)
	else
		ui.removeTextArea(3,nil)
	end
	if f <= 3000 and vivos == 1 and modo == "fim" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				showMessage("<VP><b>"..name.."</b> venceu a partida!")
				modo="fim2"
			end
		end
	end
	if f < 250 then
		if modo == "fim" or modo == "fim2" then
			modo="inicial"
			reset()
		end
	end
	if f > 13000 and f < 14000 then
		for i=2,3 do
			tfm.exec.removePhysicObject(i)
		end
	end
	if f > 10500 and f < 11500 then
		for i=2,3 do
			tfm.exec.removePhysicObject(i)
		end
	end
end
function randomQuests()
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.movePlayer(name,400,145,false)
	end
	tfm.exec.setGameTime(24)
	if rodada >= 13 then
		tfm.exec.setGameTime(12)
	end
	tfm.exec.removePhysicObject(4)
	tfm.exec.removePhysicObject(5)
	tfm.exec.addPhysicObject(2, 385, 140, barreira)
	tfm.exec.addPhysicObject(3, 415, 140, barreira)
	tfm.exec.addPhysicObject(0, 220, 380, piso)
	tfm.exec.addPhysicObject(1, 580, 380, piso)
	modo="perguntar"
	rodada=rodada+1
	if set_q == 0 then
		local q=math.random(#questions_list)
		pergunta=q
		questionChanger(q,true)
		if debug == true then
			print(rawlen(questions_list))
		end
	else
		pergunta=set_q
	end
	actual_question.quest=perguntas[-3+(4*pergunta)]
	if perguntas[pergunta*4] == 2 then
		actual_question.answer=true
	elseif perguntas[pergunta*4] == 1 then
		actual_question.answer=false
	end
	actual_question.a1=perguntas[-2+(4*pergunta)]
	actual_question.a2=perguntas[-1+(4*pergunta)]
	set_q=0
	ui.addTextArea(1,"<p align='center'><font size='18'>"..actual_question.a1.."",nil,100,145,260,81,0,0,1.0,true)
	ui.addTextArea(2,"<p align='center'><font size='18'>"..actual_question.a2.."",nil,440,145,260,81,0,0,1.0,true)
	ui.addTextArea(0,"<p align='center'><font size='16'>"..actual_question.quest.."",nil,10,22,780,48,0x000001,0x000001,1.0,true)
end
function eventPlayerDied(name)
	local i=0
	local n
	vivos=vivos-1
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		modo="fim"
		showMessage("<R>Sem vencedores!")
	elseif i==1 then
		modo="fim"
	end
end
for name,player in next,tfm.get.room.playerList do
	tfm.exec.setPlayerScore(name,0,false)
end
reset()
