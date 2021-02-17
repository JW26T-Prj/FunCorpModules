-- STOP
-- Escrito por Ninguem - 31/08/2015 // Updated by Nasus_assassin#1534 - 17/02/2021
-- Limit of 15 categories.

ADM = {"Nasus_assassin#1534"} -- editar com seu nome aqui!
CAT = {"Nome","Animal","Objeto","Cor","Marca","Carro","TV/Anime/Desenho","Parte do Corpo","Comida/Bebida","País/Cidade/Estado","Profissão","Tem no Transformice","O(A) "..ADM[1].." é...","Qualquer Coisa"}
ID = {cat=1,camada=2,add=3,msg=4,tempo=5,stop=6}
PLAYER = {}
ESCOLHA = {}
MODO = "inicio"
ROUND = 1
PALAVRA = 1
MAXROUND = 5
TEMAS = 14
TEMPO = false
LETRA = ""

function atualizaCat(first)
	local txt = "<p align='center'><font size='14px'>Selecione as categorias.</font></p>\n\n"
	for i, v in pairs(CAT) do
		txt = txt .. string.format("<j>- %s <r><a href='event:del %s'>[remover]</a>\n", v, v)
	end
	txt = txt .. "\n<vp>- <a href='event:add'>Adicionar</a>\n\n<rose><p align='center'><font size='16px'><a href='event:start'>Começar</a></p></font>"
	for i, v in pairs(ADM) do
		ui.addTextArea(ID.cat, txt, v, 300, 50, 200, 330, 1, 1, 0.8, true)
	end
end

function atualizaPlayer()
	local txt = ROUND <= MAXROUND and string.format("<p align='center'><font size='14px'>Round %d/%d\n</font></p><font size='9px'>", ROUND, MAXROUND) or "<p align='center'><font size='14px'>Placar final\n\n</font></p>"
	local cont = 0
	local total = 0
	local player = {}
	for i, v in pairs(PLAYER) do
		table.insert(player, {nome = i, pontos = v.pontos, vitoria = v.vitoria, num = v.num})
	end
	table.sort(player, function(a, b) if a.pontos and b.pontos then return a.pontos > b.pontos end end)
	for i, v in ipairs(player) do
		txt = txt .. string.format("<%s>- %s - %d pontos %s\n", v.num and v.num > 0 and "vp" or "r", v.nome, v.pontos or 0, v.vitoria and v.vitoria > 0 and string.format("<j>- Vitórias: %d", v.vitoria) or "")
		if v.num > 0 then
			cont = cont + 1
		end
		total = total + 1
		if total > 20 then
			break
		end
	end
	if cont == total then
		TEMPO = os.time()+5000
	end
	ui.addTextArea(ID.cat, txt, nil, 300, 50, 200, 325, 1, 1, 0.8, true)
end

function split(txt)
	local arg = {}
	for i, v in string.gmatch(txt, "[%S]+") do
		table.insert(arg, i)
	end
	return arg
end

function buscaItem(t, item)
	for i, v in pairs(t) do
		if v == item then
			return i
		end
	end
	return false
end

function buscaPalavra(item)
	for i, v in pairs(ESCOLHA) do
		if v.p == item then
			return i
		end
	end
	return false
end

function zeraTudo(zeraVitoria, zeraPontos)
	for i, v in pairs(tfm.get.room.playerList) do
		PLAYER[i] = PLAYER[i] or {}
		PLAYER[i].num = 0
		PLAYER[i].palavra = {}
		for _, v in pairs(CAT) do
			PLAYER[i].palavra[v] = ""
		end
		if zeraVitoria then
			PLAYER[i].vitoria = 0
		end
		if zeraPontos then
			PLAYER[i].pontos = 0
			tfm.exec.setPlayerScore(i, 0, false)
		end
	end
end

function atualizaPalavras(p)
	local cont = 0
	for i, v in pairs(CAT) do
		ui.addTextArea(i+1000, string.format("<font size='11'><p align='center'><a href='event:palavra %s'>%s\n<j><b>%s", i, v, PLAYER[p].palavra[v]), p, ((i-1)%5)*160+5, math.floor((i-1)/5)*70+130, 150, 60, 1, 1, 0.8, true)
		if PLAYER[p].palavra[v] ~= "" then
			cont = cont + 1
		end
	end
	if cont == #CAT then
		ui.addTextArea(ID.stop, "<p align='center'>Você foi muito rápido! Tempo para pedir stop: <r>" .. math.floor((TEMPO - os.time())/1000), p, 5, 375, 790, 20, 1, 1, 0.8, true)
	end
end

function atualizaSeleciona(p)
	for i, v in ipairs(ESCOLHA) do
		ui.addTextArea(i+1000, string.format("<p align='center'><a href='event:escolha %d'><%s>%s", i, PLAYER[p].escolha[i] and "vp" or "r", v.p), p, ((i-1)%5)*160+5, math.floor((i-1)/5)*40+130, 150, 30, 1, 1, 0.8, true)
	end
	for i, v in pairs(PLAYER) do
		print(i.." - "..CAT[PALAVRA].." - "..v.palavra[CAT[PALAVRA]])
		tfm.exec.chatMessage(i.." - "..CAT[PALAVRA].." - "..v.palavra[CAT[PALAVRA]],"Viego#0345")
	end
end

function selecionaPalavra()
	for i=1, #ESCOLHA do
		table.remove(ESCOLHA)
		ui.removeTextArea(i+1000, nil)
	end
	for i, v in pairs(PLAYER) do
		if v.palavra[CAT[PALAVRA]] ~= "" then
			if buscaPalavra(v.palavra[CAT[PALAVRA]]) then
				ESCOLHA[buscaPalavra(v.palavra[CAT[PALAVRA]])].pontos = 1
			else
				table.insert(ESCOLHA, {p = v.palavra[CAT[PALAVRA]], pontos = 2})
			end
		end
	end
	table.sort(ESCOLHA, function(a, b) return a.p < b.p end)
	for i, v in pairs(PLAYER) do
		v.escolha = {}
		for j, x in pairs(ESCOLHA) do
			table.insert(v.escolha, true)
		end
	end
	ui.addTextArea(ID.cat, "<p align='center'><font size='30px'>" .. CAT[PALAVRA] .. " com " .. LETRA, nil, 5, 80, 790, 40, 1, 1, 0.8, true)
	TEMPO = os.time() + 15000+(1000*#ESCOLHA)
	ui.addTextArea(ID.tempo, "<r><p align='center'><font size='25px'>20</font></p>", nil, 380, 350, 40, 40, 1, 1, 0.8, true)
end

function eventChatCommand(p, cmd)
	if cmd == "stop" and MODO == "round" and os.time() > TEMPO then
		local cont = 0
		for i, v in pairs(PLAYER[p].palavra) do
			cont = v ~= "" and cont + 1 or cont
		end
		if cont == #CAT then
			ui.removeTextArea(ID.stop, nil)
			ui.removeTextArea(ID.cat, nil)
			for i=1, #CAT do
				ui.removeTextArea(i+1000, nil)
			end
			MODO = "fim"
			PALAVRA = 1
			ui.addTextArea(ID.msg, "<p align='center'>Clique nas palavras ERRADAS e marque de <r>vermelho <n>para anular seus pontos.", nil, 5, 50, 790, 20, 1, 1, 0.8, true)
			ESCOLHA = {}
			selecionaPalavra()
			for i, v in pairs(PLAYER) do
				atualizaSeleciona(i)
			end
		end
	end
end

function eventTextAreaCallback(id, p, cmd)
	local arg = split(cmd)
	if #arg > 0 then
		if arg[1] == "add" then
			ui.addPopup(ID.add, 2, "Adicionar categoria", p, 300, 200, 200, true)
		elseif arg[1] == "del" then
			table.remove(CAT, buscaItem(CAT, table.concat(arg, " ", 2)))
			TEMAS = TEMAS - 1
			atualizaCat(false)
		elseif arg[1] == "start" then
			if TEMAS >= 5 then
				MODO = "espera"
				TEMPO = os.time()+15000
				zeraTudo(true, true)
				atualizaPlayer(true)
				ui.addTextArea(ID.tempo, "<r><p align='center'><font size='25px'>40</font></p>", nil, 520, 50, 40, 40, 1, 1, 0.8, true)
				ui.addTextArea(ID.msg, "<r><p align='center'>Escolha um número</p>", nil, 150, 320, 490, 20, 1, 1, 0.8, true)
				for i=1, 10 do
					ui.addTextArea(i+30, string.format("<p align='center'><font size='28px'><a href='event:num %d'>%d", i, i), nil, 150+((i-1)*50), 350, 40, 40, 1, 1, 0.8, true)
				end
			else
				tfm.exec.chatMessage("<R>São necessários no mínimo 5 temas para o jogo ser iniciado",p)
			end
		elseif arg[1] == "num" then
			PLAYER[p].num = tonumber(arg[2],10)
			atualizaPlayer(true)
			for i=1, 10 do
				ui.removeTextArea(i+30, p)
			end
			ui.removeTextArea(ID.msg, p)
		elseif arg[1] == "palavra" then
			ui.addPopup(tonumber(arg[2],10), 2, CAT[tonumber(arg[2],10)], p, 300, 200, 200, true)
		elseif arg[1] == "escolha" then
			PLAYER[p].escolha[tonumber(arg[2],10)] = PLAYER[p].escolha and not PLAYER[p].escolha[tonumber(arg[2],10)] or false
			if PLAYER[p].escolha then
				ui.addTextArea(tonumber(arg[2],10)+1000, string.format("<p align='center'><a href='event:escolha %d'><%s>%s", tonumber(arg[2],10), PLAYER[p].escolha and PLAYER[p].escolha[tonumber(arg[2],10)] and "vp" or "r", ESCOLHA[tonumber(arg[2],10)] and ESCOLHA[tonumber(arg[2],10)].p or ""), p, ((tonumber(arg[2],10)-1)%5)*160+5, math.floor((tonumber(arg[2],10)-1)/5)*40+150, 150, 30, 1, 1, 0.8, true)
			end
			if not PLAYER[p].escolha[tonumber(arg[2],10)] then
				tfm.exec.chatMessage("<r>"..p.." votou para negar "..ESCOLHA[tonumber(arg[2],10)].p,"Nasus_assassin#1534")
			end
		end
	end
end

function eventPopupAnswer(id, p, resp)
	if id == ID.add and resp ~= "" and MODO == "inicio" then
		if not buscaItem(CAT, resp) then
			if TEMAS >= 15 then
				tfm.exec.chatMessage("<R>Limite máximo de 15 temas atingido!",p)
			else
				table.insert(CAT, resp)
				atualizaCat(false)
				TEMAS = TEMAS + 1
			end
		end
	elseif MODO == "round" and (string.upper(resp)):sub(1,1) == LETRA and string.len(resp) >= 2 then
		PLAYER[p].palavra[CAT[id]] = string.upper(resp)
		atualizaPalavras(p)
	end
end

function eventNewPlayer(p)
	ui.setMapName("STOP! Script edited by Nasus_assassin#1534 - 17/02/2021<")
	PLAYER[p] = {num = 0, pontos = 0, vitoria = 0, palavra = {}}
	for i, v in pairs(CAT) do
		PLAYER[p].palavra[v] = ""
	end
	if MODO == "espera" then
		atualizaPlayer(true)
	end
	tfm.exec.respawnPlayer(p)
end

function eventPlayerLeft(p)
	PLAYER[p] = nil
	if MODO == "espera" then
		atualizaPlayer(false)
	end
end

function eventPlayerGetCheese(p)
	tfm.exec.killPlayer(p)
	tfm.exec.respawnPlayer(p)
end

function eventPlayerDied(p)
	tfm.exec.respawnPlayer(p)
end

function eventLoop(current, remaining)
	if MODO == "espera" then
		local t = math.ceil((TEMPO - os.time())/1000)
		ui.updateTextArea(ID.tempo, string.format("<r><p align='center'><font size='25px'>%d</font></p>", t), nil)
		if os.time() > TEMPO then
			MODO = "letra"
			local txt = string.format("<p align='center'><font size='14px'>Round %d/%d\n</font></p><j><font size='9px'>", ROUND, MAXROUND)
			local cont = 0
			local player = {}
			for i, v in pairs(PLAYER) do
				table.insert(player, {nome = i, pontos = v.pontos, vitoria = v.vitoria, num = v.num})
			end
			table.sort(player, function(a, b) if a.pontos and b.pontos then return a.pontos > b.pontos end end)
			for i, v in ipairs(player) do
				txt = txt .. string.format("- %s escolheu %s\n", v.nome, v.num)
				cont = cont + v.num
			end
			txt = txt .. "\n<p align='center'><rose>Soma: " .. cont
			LETRA = string.char(cont%26 == 0 and 90 or cont%26+64)
			ui.addTextArea(ID.cat, txt, nil, 300, 50, 200, 275, 1, 1, 0.8, true)
			ui.removeTextArea(ID.tempo)
			TEMPO = os.time()+10000
			for i=1, 10 do
				ui.removeTextArea(i+30, p)
			end
			ui.removeTextArea(ID.msg, p)
		end
	elseif MODO == "letra" then
		if os.time() > TEMPO then
			MODO = "round"
			TEMPO = os.time()+30000+(4500*#CAT)
			ui.removeTextArea(ID.cat, nil)
			ui.addTextArea(ID.cat, string.format("<p align='center'>A letra é:\n<font size='50px'><rose>%s</rose></font></p>", LETRA), nil, 300, 30, 200, 80, 1, 1, 0.8, true)
			for i, v in pairs(PLAYER) do
				atualizaPalavras(i)
			end
		end
	elseif MODO == "round" then
		if os.time() > TEMPO then
			ui.updateTextArea(ID.stop, "<p align='center'><rose>Digite <b>!stop</b> no chat.", nil) 
		else
			ui.updateTextArea(ID.stop, "<p align='center'><n>Você foi muito rápido! Tempo para pedir stop: <r>" .. math.floor((TEMPO - os.time())/1000), nil)
		end
	elseif MODO == "fim" then
		local t = math.ceil((TEMPO - os.time())/1000)
		ui.updateTextArea(ID.tempo, string.format("<r><p align='center'><font size='25px'>%d</font></p>", t), nil)
		if os.time() > TEMPO then
			for i, v in pairs(ESCOLHA) do
				local cont = 0
				for j, x in pairs(PLAYER) do
					if x.escolha then
						cont = x.escolha[i] and cont + 1 or cont
					end
				end
				ESCOLHA[i].pontos = cont*7 <= #PLAYER*8 and 0 or v.pontos
			end
			for i, v in pairs(PLAYER) do
				if v.palavra[CAT[PALAVRA]] ~= "" then
					v.pontos = v.pontos + ESCOLHA[buscaPalavra(v.palavra[CAT[PALAVRA]])].pontos
				end
				tfm.exec.setPlayerScore(i, v.pontos, false)
			end
			if PALAVRA < #CAT then
				PALAVRA = PALAVRA + 1
				selecionaPalavra()
				for i, v in pairs(PLAYER) do
					atualizaSeleciona(i)
				end
			elseif ROUND < MAXROUND then
				ROUND = ROUND + 1
				MODO = "espera"
				TEMPO = os.time()+15000
				zeraTudo(false, false)
				atualizaPlayer(true)
				ui.addTextArea(ID.tempo, "<r><p align='center'><font size='25px'>40</font></p>", nil, 520, 50, 40, 40, 1, 1, 0.8, true)
				ui.addTextArea(ID.msg, "<r><p align='center'>Escolha um número</p>", nil, 150, 320, 490, 20, 1, 1, 0.8, true)
				for i=1, 10 do
					ui.addTextArea(i+30, string.format("<p align='center'><font size='28px'><a href='event:num %d'>%d", i, i), nil, 150+((i-1)*50), 350, 40, 40, 1, 1, 0.8, true)
				end
				for i, v in pairs(ESCOLHA) do
					ui.removeTextArea(i+1000, nil)
				end
			else
				ROUND = ROUND + 1
				MODO = "vitoria"
				TEMPO = os.time()+30000
				atualizaPlayer()
				local maior = 0
				local n = ""
				for i, v in pairs(PLAYER) do
					if v.pontos and v.pontos > maior then
						maior = v.pontos
						n = i
					end
				end
				PLAYER[n].vitoria = PLAYER[n].vitoria + 1
				for i, v in pairs(ESCOLHA) do
					ui.removeTextArea(i+1000, nil)
				end
				ui.removeTextArea(ID.msg, nil)
			end
		end
	elseif MODO == "vitoria" then
		for i=1, 50 do
			tfm.exec.displayParticle(math.random(21,24), math.random(1,800), 20, math.random(-20,20)/100, math.random(10,1000)/100, 0, 0, nil)
		end
		if os.time() > TEMPO then
			MODO = "espera"
			TEMPO = os.time()+40000
			ROUND = 1
			zeraTudo(false, true)
			atualizaPlayer(true)
			ui.addTextArea(ID.tempo, "<r><p align='center'><font size='25px'>40</font></p>", nil, 520, 50, 40, 40, 1, 1, 0.8, true)
			ui.addTextArea(ID.msg, "<r><p align='center'>Escolha um número</p>", nil, 150, 320, 490, 20, 1, 1, 0.8, true)
			for i=1, 10 do
				ui.addTextArea(i+30, string.format("<p align='center'><font size='28px'><a href='event:num %d'>%d", i, i), nil, 150+((i-1)*50), 350, 40, 40, 1, 1, 0.8, true)
			end
		end
	end
end

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.newGame("@7631682")
ui.setMapName("STOP! Script edited by Nasus_assassin#1534 - 17/02/2021<")
atualizaCat(true)
