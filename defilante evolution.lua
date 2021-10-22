tfm.exec.disableAutoNewGame(true)
dados2={type = 12,width = 10,height = 3000,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0x6a7495,miceCollision = true,groundCollision = true,dynamic = false}
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.setRoomMaxPlayers(30)
loop=0
pos=0
first=""
objetivo=300
disparador=true
bonus=true
valendo=false
tempo=60
lvexp=0
mapas={3600369,3618133,3777799,3842712,3880734,3973560,4079653,6974226,4289602,4459045,5013105,5032380}
system.disableChatCommandDisplay("obj")
system.disableChatCommandDisplay("bonus")
system.disableChatCommandDisplay("new")
system.disableChatCommandDisplay("perfil")
system.disableChatCommandDisplay("p")
system.disableChatCommandDisplay("rank")
p={}
function eventNewPlayer(name)
	p[name] = {
		wins = 0,
		rodadas = 0,
		firsts = 0,
		pontos = 0
		}
	tfm.exec.chatMessage("<J>Module temporário: Defilante Evolution v0.9.85<br><N>Vá até o final do mapa e chegue antes de todo mundo!<br>Comandos: !help, !p e !rank.<br><ROSE>Module criado e traduzido por Fosfus7heads#0000.",name)
end
function split(t,s)
    	local a={}
    	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
 	return a
end
function eventChatCommand(name,message)
	local arg = split(message, " ")

	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end
		
		if tfm.get.room.playerList[nome] then
			ui.addTextArea(1,'<B><J><font size="17"><p align="center">'..nome,name,245,190,315,30,nil,0x2e424d,nil,true)
        		ui.addTextArea(2,"<font size='12'>Vitórias: "..p[nome].wins.."<br>Rodadas: "..p[nome].rodadas.."<br>Firsts: "..p[nome].firsts.."<br>Pontos: "..p[nome].pontos.."",name,255,230,290,70,0x0e232b,0x0e232b,nil,true)
        		ui.addTextArea(3,"<R><p align='center'><B><a href='event:fechar'>Fechar</a>",name,255,300,290,20,0x3c5063,0x3c5063,nil,true)
        	else
        		tfm.exec.chatMessage("<R>"..nome.." não se encontra em sala.</R>",name)
       		end
	end
	if arg[1] == "rank" then
       	 	eventRanking(name)
    	end
	if message == "new" then
		if name == "Fosfus7heads#0000" then
		if valendo == false then
			tempo=60
			disparador=true
		else
			tfm.exec.newGame(mapas[math.random(#mapas)])
			valendo=true
		end
		end
	end
	if(message:sub(1,3) == "obj") then
		if name == "Fosfus7heads#0000" then
			objetivo=tonumber(message:sub(5))
			tfm.exec.chatMessage("<J>Objetivo da partida alterado para: "..objetivo,nil)
		end
	end
	if message == "help" then
		ui.addPopup(0,0,"<font size='20'><p align='center'>Defilante Evolution<p align='left'><font size='13'><br><br>Neste minigame você deverá ir o mais rápido possível até o final do mapa para ir obtendo pontos. Quanto mais rápido você for, mais pontos você vai ganhar. <br>O primeiro que chegar a uma determinada pontuação ganha a partida.",name,140,180,580,true)
	end
end
function eventRanking(name)
    local sc = {}
    for name, player in pairs(tfm.get.room.playerList) do
        sc[#sc+1] = {n=name,s=p[name].pontos,f=p[name].firsts,w=p[name].wins}
    end
   
    table.sort(sc,function(a,b) return a.s>b.s end)
 
    str = ''
    for k,v in pairs(sc) do
        if k < 10 then
            if str ~= '' then
                str=str.."<br><J>"..k.."°</J>  |  <VP>"..v.n.."".."<N> "..v.s.." | "..v.f.." | "..v.w.." <J>"
            else
                str="<J>"..k.."°</J>  |  <VP>"..v.n.."".."<N> "..v.s.." | "..v.f.." | "..v.w.." <J>"
            end
        end
    end
             ui.addTextArea(1,'<B><J><font size="13"><p align="center">Ranking (pontos/firsts/wins)',name,255,150,360,30,nil,0x2e424d,nil,true)
           ui.addTextArea(2,"<B><font size='12'>"..str,name,255,185,360,150,0x0e232b,0x0e232b,nil,true)
       ui.addTextArea(-1,"<B><p align='center'><font size='15'><R><a href='event:close'>Fechar</a>",name,340,320,190,20,0x3c5063,0x3c5063,nil,true)
    return str
end
function eventLoop(p,f)
	if disparador == true then
		tempo=tempo-0.5
		ui.addTextArea(1242,"<font size='16'><b><font color='#0000FF'>Se prepare! A partida vai começar em "..math.floor(tempo).." segundos.",nil,200,30,480,50,0,0,0.9,true)
		ui.setMapName("Se prepare! A partida vai começar em "..math.floor(tempo).." segundos.<")
		if tempo < 0.5 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,0,false)
			end
			valendo=true
			disparador=false
			ui.removeTextArea(1242,nil)
		end
	end
	if valendo == true then
	for name,player in pairs(tfm.get.room.playerList) do
		ui.removeTextArea(4783,true)
		if tfm.get.room.playerList[name].score >= objetivo and pos == 1 then
			local winner=""
			winner=name
			valendo=false
			tfm.exec.newGame('@6973961')
			tfm.exec.chatMessage("<b>Parabéns!</b> <CH>"..winner.." <N>venceu a partida com "..tfm.get.room.playerList[winner].score.." pontos!                                                                  ")
			ui.addTextArea(4785,"<font color='#000001'><font size='48'><font face='Comic Sans MS'>Defilante Evolution",nil,170,50,680,100,0,0,1.0,true)
			ui.addTextArea(4784,"<font color='#000001'><font size='20'>Script feito por Fosfus7heads#0000",nil,240,120,420,100,0,0,1.0,true)
			if p > 10000 then
				ui.removeTextArea(100,nil)
				ui.removeTextArea(1244,nil)
				ui.removeTextArea(157979,nil)
				ui.removeTextArea(157978,nil)
				ui.removeTextArea(157960,nil)
				ui.removeTextArea(157961,nil)
			end
		end
	end
	if pos >= 1 then
		tempo=tempo-0.5
		if tempo < 0.5 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			ui.removeTextArea(1244,nil)
		end
	end
end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].x > 2400 then
	tfm.exec.respawnPlayer(name)
	tfm.exec.giveCheese(name)
	tfm.exec.playerVictory(name)
	end
end

function eventTextAreaCallback(id,name,link)
	if link == "fechar" then
		for id=0,3 do
			ui.removeTextArea(id,name)
		end
	end
	if link == "close" then
	for id=-1,2 do
		ui.removeTextArea(id,name)
		ui.removeTextArea(6969+id,name)
		ui.removeTextArea(7979+id,name)
	end
	end
end

function eventPlayerWon(name)
	p[name].wins = p[name].wins + 1
	p[name].pontos = p[name].pontos + 10
	pos=pos+1
	if pos == 1 then
		first=name
		p[name].firsts = p[name].firsts + 1
		tfm.exec.setPlayerScore(name,40,true)
		p[name].pontos = p[name].pontos + 40
	end
	if pos == 2 then
		tfm.exec.setPlayerScore(name,30,true)
		p[name].pontos = p[name].pontos + 30
	end
	if pos == 3 then
		tfm.exec.setPlayerScore(name,20,true)
		p[name].pontos = p[name].pontos + 20
	end
	if pos == 4 then
		tfm.exec.setPlayerScore(name,10,true)
		p[name].pontos = p[name].pontos + 10
	end
	tfm.exec.setPlayerScore(name,10,true)
end

function eventNewGame()
	tfm.exec.addPhysicObject(125,-110,-200,dados2)
	if valendo == true then
	tempo=20
	ui.removeTextArea(4785,nil)
	ui.removeTextArea(4784,nil)
	ui.removeTextArea(4783,nil)
	ui.removeTextArea(4782,nil)
end
	if valendo == false then
		tempo=60
		eventChatCommand("Fosfus7heads#0000","new")
	end
	pos=0
	for name,player in pairs(tfm.get.room.playerList) do
		p[name].rodadas = p[name].rodadas + 1
end
end

for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	p[name].rodadas = 0
end

tfm.exec.newGame('@6973961')
ui.addTextArea(4785,"<font color='#000001'><font size='48'><font face='Comic Sans MS'>Defilante Evolution",nil,170,50,680,100,0,0,1.0,true)
ui.addTextArea(4784,"<font color='#000001'><font size='20'>Script feito por Fosfus7heads#0000",nil,240,120,420,100,0,0,1.0,true)
