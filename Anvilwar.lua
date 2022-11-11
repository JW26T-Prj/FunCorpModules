--[[ #anvilwar 2022 Edition
Module authors : Morganadxana#0000
(C) 2017-2022 Spectra Advanced Module Group

Version : RTM 51021.204
Compilation date : 11/11/2022 22:43 UTC
Sending player : Morganadxana#0000

Number of maps : 179
Number of module special members : 12 ]]--

_VERSION = "Lua 5.4"
_AUTHOR = "Morganadxana#0000"

maps={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7804689","@7804694","@7804362","@6759094","@4431434","@7807504","@7808946","@7809120","@7811210","@7811555","@7816639","@7818453","@7823992","@4084781","@7825615","@7826036","@7826050","@7826892","@7497395","@7512948","@7555653","@7688028","@7655209","@7690671","@7845674","@7845680","@7845682","@7845738","@7859139","@7845709","@7844985","@7859144","@7860343","@7860623","@7860498","@7863972","@7803705","@7845724","@7866585","@7834953","@7866596","@7703547","@7795869","@7869247","@7844978","@7869610","@7654290","@7876838","@7879243","@7664077","@7760487","@7802869","@7808177","@7882449","@7882451","@7882453","@7882454","@7882456","@7882458","@7879251","@7748874","@7891576","@7891577","@7891578","@7892788","@7902610","@7904039","@7869352","@7869389","@7841404","@7852714","@7919510","@7919518","@7919522"}
map_names={"The Dual-Sided Fight Area","No Name","Inside the Castle","Hell and Water","A very simple waterfall","No Name","The Frozen Arena","The Golden Flying Arena","The Beach Test Map 1","Inside the Theasure Cave","A random fall map","No Name","The first #anvilwar map","The Beach Test Map 2","No Name","No Name","The Six Attributes","Inside the Ocean","No Name","No Name","No Name","No Name","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","No Name","No Name","On the Seabed","The Palace of Swords","The Castle of Fire","No Name","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","No Name","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","No Name","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v3)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","No Name","No Name","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge (v2)","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","No Name","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","No Name","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Artistical Ninjas","May the force Be with You","Don't Jump!","Autumn","Falling Walnuts","Ancient Egypt","Testing Acid Floors","Above the Earth Level","No Name","No Name","Do Not Hit The Anvil","Natural Landscape","Apocalypse","Look the Explosion!","The Beach Test Map 5","Love in Vain","Floating Acid","Moving Bridges","This is a Test","Only Two Grounds","Aim of Death","What The Hell","Discover of Seven Seas","Rotating Motors","Ultimate Acid Maze","The Anvils are Strange","Ghost Dimension","Animal Fury #1","Released Things","No Name","No Name","This is a Terror","No Name","No Name","Escape from Nyan Cat","Sharingan Eye","Zombie Attack","Destructed Zone","Eye of Black Hole","Reversed Ninja Degrees","No Name","No Name","The Beach Test Map 6","The Beach Test Map 7","Vexos Arena","Releasing Anvils","The Hug of Agony","Try a Little More","No Name","No Name","No Name","Land of Spirits","No Name","No Name","No Name","No Name","Tobi - Akatsuki","Water Backgrounds","Up and Down","Watcher","Stranger Things","The Beach Test Map 8","Circle Compression","Gradient Colors","Background Reflection","Locked Dimensions","Now I See","Legacy Mansion","Water Equilibrium","Terrific Alternative","No Name","The Frozen Witch","Animal Fury #2","The Beach Test Map 9","Object Alchemy","Falling Acids","Balanced Releases","Balancing Things","Uzumaki Boruto Eyes","Namikaze Minato","Dragon Eyes","Day and Night","Stone Overriding","The Beach Test Map 10","Extreme Stone Maze"}
players_red={}; alives_red={};
players_blue={}; alives_blue={};
lobby_map="@7884784"
current_map=""; actual_player="";
enabled=false; powerups=false; permafrost=false; night_mode=false; gravity=false; change=false;
mices=0; loop=0; turns=0; needs=0; turn=0; choose_time=20; time_passed=0; time_remain=0; current_red=0; current_blue=0; ping_check=2; sudden_death=false;
points_loop=0; pf_time=0; general_time=0; total_time=0; map_id=0; set_player=""; set_map="-1"; def_map=-1; red_cap=""; blue_cap=""; temp_name=""; bar_text="";
mode="lobby"
divider="　　　　　　　　　";
images_id={};
playersList={}; helpers={}; mods={
"Dinamarquers#0000",
"Flaysama#5935",
"Chavestomil#0000",
"Erickvinho#0000",
"Maramara4#0000",
"Spectra_phantom#6089"};
admins={"Ashearcher#0000",
"Morganadxana#0000"}
ninjas={"Viego#0345",
"Forzaldenon#0000",
"Akwimos#1937",
"Sett#6442"};
data={}

lang = {}
lang.br = {
	version = "Versão",
	mices_room = "Ratos : ",
	comp_date = "Data de compilação : ",
	uploaded = "Carregado por ",
	ending = "Fim de jogo! Retornando à tela principal em alguns segundos...",
	won = "Você ganhou ",
	manager = "Você é o gerenciador desta sala. Digite !commands para ver os comandos disponíveis.",
	p1 = "usou o powerup Disparo Duplo!",
	p2 = "usou o powerup Disparo Triplo!",
	p3 = "usou o powerup Olha a Explosão!",
	p4 = "usou o powerup Congelamento!",
	p5 = "usou o powerup Modo Noturno!",
	p6 = "usou o powerup Chuva de Bigornas!",
	p7 = "usou o powerup Anomalia Gravitacional!",
	p8 = "usou o powerup Bigorna Invisível!",
	p10 = "Você precisa ser capitão do seu time e possuir 30 pontos para reviver.<br>Além disso, não é possível reviver faltando menos de 30 segundos.",
	p0 = "Você não possui pontos e/ou níveis suficientes para usar este powerup.",
	ap = "Potência: ",
	ag = "Ângulo: ",
	suicide = "O seguinte jogador cometeu suicídio: ",
	rankw = "Aviso: Tenha em mente que os dados do Ranking e do Perfil são temporários e são redefinidos quando a sala esvazia.",
	tk1 = "Oh não! ",
	tk2 = " matou um companheiro de equipe: ",
	submission = "",
	pw = "Senha trocada para: ",
	pw0 = "Senha removida.",
	limit = "Limite de ratos na sala: ",
	load1 = "O seguinte mapa será carregado: ",
	load2 = "Certifique-se que há pelo menos 1 jogador em cada equipe.",
	load0 = "Você precisa estar na tela principal para testar um mapa. Digite !reset para fazer isso e tente novamente.",
	ac = "Você atualmente possui ",
	powerups = "<font size='11.5'><b>Tecla '1' - Disparo Duplo</b><br>Este powerup faz você atirar duas bigornas de uma vez.<br><b>Nível Mínimo:  1  /  Pontuação: 8pts</b><br><br><b>Tecla '2' - Disparo Triplo</b><br>Este powerup faz você atirar três bigornas de uma vez.<br><b>Nível Mínimo:  2  /  Pontuação: 12pts</b><br><br><b>Tecla '3' - Olha a Explosão</b><br>Este powerup permite a você criar uma explosão em um local do time inimigo.<br><b>Nível Mínimo:  3  /  Pontuação: 22pts</b><br><br><b>Tecla '4' - Congelamento</b><br>Este powerup congela todos os jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo:  3  /  Pontuação: 20pts</b><br><p align='right'><a href='event:pw2'>Ir à Página 2</a>",
	commands = "<font size='11.5'>Os comandos que começam com <b>*</b> podem ser utilizados apenas por administradores e o dono da sala (/room #anvilwar00seunome).<br>!commands (ou <b>B</b>) - Mostra esta caixa de texto.<br>!anvils - Mostra as bigornas disponíveis para compra<br>!help (ou <b>H</b>) - Mostra a ajuda do jogo.<br>!tc [mensagem] - Envia uma mensagem que aparece apenas para os jogadores do seu time.<br>!powerups (ou <b>U</b>) - Mostra os powerups disponíveis e seus respectivos custos.<br>!p [usuário] (ou <b>P</b>) - Mostra o perfil do usuário especificado. Digite apenas !p para ver o seu perfil.<br>!ranking (ou <b>R</b>) - Mostra o ranking dos jogadores na sala.<br>!sound (ou <b>M</b>) - Ativa ou desativa os efeitos sonoros do jogo.<br><R><b>*</b><N> !kill [usuário] - Mata o jogador selecionado.<br><R><b>*</b><N> !pw [senha] - Adiciona uma senha na sala. Digite apenas !pw para remover a senha.<br><R><b>*</b><N> !reset - Cancela a partida atual e retorna à tela inicial.<br><R><b>*</b><N> !limit [número] - Altera o limite de jogadores da sala.<br><R><b>*</b><N> !testmap [@código] - Testa um mapa. Isso pode ser útil para enviar o mapa para o #anvilwar.<br><R><b>*</b><N> !lc [0-3] - Altera a configuração do verificador de latência dos jogadores.",
	help = "<font size='12'><b>Bem-vindo ao #anvilwar!</b><br>O objetivo deste module é matar os jogadores do time adversário usando bigornas.<br><br>O jogo é simples de ser jogado. Quando for sua vez, use as teclas <b>Z e X</b> para mudar a potência do seu tiro e as teclas <b>C e V</b> para mudar o ângulo. Use a <b>BARRA DE ESPAÇO</b> para atirar.<br>O time que conseguir eliminar todos os jogadores do outro time vencerá o jogo!<br><br>Quando você joga ou ganha partidas, você vai receber <J><b>AnvilCoins</b><N>. Esta é a moeda do jogo. Ela pode ser usada para comprar novas bigornas.<br>Divirta-se e que vença o melhor time!<br><br><N><R><b>Administradora:</b><N> Morganadxana#0000<br><VP><b>Contribuidores:</b><N> Flaysama#5935, Chavestomil#0000, Dinamarquers#0000 e Spectra_phantom#6089<br><J><b>Tradutores:</b><N> Patrick_mahomes#1795 (BR)",
	seconds = " segundos.",
	leave = "Sair",
	join = "Entrar",
	getr = "Preparem-se! A partida vai começar em instantes!",
	powerups2 = "<font size='11.5'><b>Tecla '5' - Modo Noturno</b><br>Este powerup remove a visão dos jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo: 3  /  Pontuação: 15pts</b><br><br><b>Tecla '6' - Chuva de Bigornas</b><br>Este powerup vai fazer chover bigornas em áreas aleatórias do time inimigo.<br><b>Nível Mínimo: 3  /  Pontuação: 25pts</b><br><br><b>Tecla '7' - Anomalia Gravitacional</b><br>Este powerup vai aumentar consideravelmente a gravidade até o outro time atirar.<br><b>Nível Mínimo: 4  /  Pontuação: 14pts</b><br><br><b>Tecla '8' - Bigorna Invisível</b><br>Atira uma bigorna invisível.<br><b>Nível Mínimo: 3  /  Pontuação: 16pts</b><br><p align='right'><a href='event:pw1'>Voltar à Página 1</a>",
	using = "Bigorna sendo utilizada: ",
	ac0 = "Você não possui AnvilCoins suficientes para comprar esta bigorna :(",
	level = "avançou para o nível ",
	draw = "<b>Empate!</b><br>A tela principal será carregada em alguns instantes.",
	winblue = "<b>Vitória do time AZUL!</b><br>A tela principal será carregada em alguns instantes.",
	winred = "<b>Vitória do time VERMELHO!</b><br>A tela principal será carregada em alguns instantes.",
	as = "É a vez de: ",
	as1 = "<b>É a sua vez de atirar!</b><br><J>Use a BARRA DE ESPAÇO para atirar. Digite !help para mais informações.<br><br><N>Pontos para gastar com powerups: ",
	rm = "Sorteando mapa...",
	rm1 = "Mapa selecionado: ",
	t60s = "Faltam 60 segundos!",
	t30s = "Faltam 30 segundos!<br><br>A partir deste momento, não é mais possível reviver jogadores.",
	powerups_a = "Os powerups estão liberados!",
	time = "<b>Tempo esgotado!</b> O time adversário irá atirar agora.",
	cap_text = "foi escolhido para ser o líder do seu time.",
	cap = "<J><b>Você foi escolhido como o líder do time.</b><N><br>Digite !leader para saber as funcionalidades e os benefícios de ser o líder do seu time.",
	leader = "Os líderes dos times <b>são escolhidos aleatoriamente</b> e possui as seguintes vantagens em relação aos outros jogadores:<br><br>• Recebe 50% a mais de quantidade de pontos e AnvilCoins em relação aos outros jogadores<br>• Pode reviver jogadores mortos do seu time usando !rv [jogador]<br>• Pode transferir seus pontos para outro jogador do seu time usando !tp [jogador]<br>• Possui 50% a mais de tempo para atirar do que os outros jogadores.",
	legacy = "<br><N>Conheça todas as salas dentro do modo #anvilwar:<br><br><J><b>Fuja do tubarão (shaman) e sobreviva dentro do oceano!</b><br><VP>/sala #anvilwar00watercatch<br><br><J><b>Um mapa-script tipo village, porém de praia!</b><br><VP>/sala #anvilwar00beach<br><br><J><b>Um mapa-script para quem gosta de aventuras radicais e natureza!</b><br><VP>/sala #anvilwar00naturalpark<br><br><J><b>Teste suas habilidades de WJ escalando a montanha!</b><br><VP>/sala #anvilwar00mountain<br><br>",
	disabled = "Este comando foi desabilitado por um administrador.",
	gametime = "Tempo",
	timeup = "<ROSE>Tempo esgotado! Este será o último tiro!",
	red_team = "Time Vermelho",
	blue_team = "Time Azul",
	revived = "O seguinte jogador reviveu: ",
	sound = "Use o comando /music para ativar ou desativar os efeitos sonoros do jogo.",
	suddendeath = "<J><b>MORTE SÚBITA ATIVADA!</b><br><br>A partir de agora, a equipe que conseguir qualquer eliminação será declarada a vencedora!",
	latency = "Você não pode participar do jogo pois sua média de ping está muito alta.",
}
lang.en = {
	version = "Version",
	mices_room = "Mice : ",
	comp_date = "Compilation date : ",
	uploaded = "Uploaded by ",
	ending = "End of game! The lobby screen will be loaded in a few seconds.",
	won = "You won ",
	manager = "You are the manager of this room. Type !commands to see all available commands.",
	p1 = "used the powerup Double Shoot!",
	p2 = "used the powerup Triple Shoot!",
	p3 = "used the powerup Explosion!",
	p4 = "used the powerup Permafrost!",
	p5 = "used the powerup Night Mode!",
	p6 = "used the powerup Anvil Rain!",
	p7 = "used the powerup Gravity Anomaly!",
	p8 = "used the powerup Invisible Anvil!",
	p10 = "You must be the leader of your team and have at least 30 points to revive.<br>Also, isn't allowed to revive players on the last 30 seconds.",
	p0 = "You don't have level and score to use this powerup.",
	ap = "Power: ",
	ag = "Angle: ",
	suicide = "The following player commited suicide: ",
	rankw = "Keep in mind that the profile and ranking data is temporary and will be lost when the room is gone.",
	tk1 = "Oh no! ",
	tk2 = " has killed a player of her team: ",
	submission = "",
	pw = "Password changed to: ",
	pw0 = "Password cleared.",
	limit = "New room mice limit ",
	load1 = "The next map will be loaded: ",
	load2 = "The room needs to have a least 1 player into each team.",
	load0 = "You needs to stay into LOBBY mode to use this command. Use !reset command and try again.",
	ac = "You currently have ",
	powerups = "<font size='11.5'><b>Key '1' - Double Shoot</b><br>This powerup makes you shoot 2 anvils at once.<br><b>Required Level: 1  /  Required Score: 8pts</b><br><br><b>Key '2' - Triple Shoot</b><br>This powerup makes you shoot 3 anvils at once.<br><b>Required Level: 2  /  Required Score: 12pts</b><br><br><b>Key '3' - Explosion</b><br>This powerup allows you to create an explosion on the enemy team area.<br><b>Required Level: 3  /  Required Score: 22pts</b><br><br><b>Key '4' - Permafrost</b><br>This powerup freezes all enemy team players by a limited time.<br><b>Required Level: 3  /  Required Score: 20pts</b><br><p align='right'><a href='event:pw2'>Go to Page 2</a>",
	commands = "<font size='11.5'>The commands marked with <b>*</b> can be used only by Administrators and the room owner (/room #anvilwar00yourname).<br>!commands (or <b>B</b> key) - Display this message box.<br>!anvils - Show available #anvilwar anvils to buy.<br>!help (or <b>H</b> key) - Display the game help.<br>!tc [message] - Send a message that is visible only for players of your team.<br>!powerups (or <b>U</b> key) - Show all available powerups and their respective costs.<br>!p [username] (or <b>P</b> key) - Show the profile of the specified user. Type !p only to see your profile.<br>!ranking (or <b>R</b> key) - Show the room ranking.<br>!sound (or <b>M</b> key) - Enables or disables the sound effects.<br><R><b>*</b><N> !kill [username] - Kill the specified player.<br><R><b>*</b><N> !pw [password] - Locks the room with a password. Use only !pw to clear the password.<br><R><b>*</b><N> !reset - Cancel the current match and returns to the lobby screen.<br><R><b>*</b><N> !limit [number] - Change the limit of mices on the room.<br><R><b>*</b><N> !testmap [@code] - Test a map. This can use useful when you want to send your map to #anvilwar.<br><R><b>*</b><N> !lc [0-3] - Change the level of the player's latency checker.",
	help = "<font size='12'><b>Welcome to #anvilwar!</b><br>The objective of this module is kill all the players of other team using anvils.<br><br>The module is very easy to play. When reaches your turn, use <b>Z and X</b> keys to change the intensity of the anvil shoot and <b>C and V</b> keys to change the angle of the anvil. Use the <b>SPACEBAR</b> to shoot.<br>The team that kill all players of other team will win the game!<br><br>When you kill players or win matches, you will receive <J><b>AnvilCoins</b><N>. This is the money of #anvilwar module. It can be used to unlock custom anvils.<br>Enjoy the module and may the best team wins!<br><br><N><R><b>Administrator:</b><N> Morganadxana#0000<br><VP><b>Contributors:</b><N> Flaysama#5935, Chavestomil#0000, Dinamarquers#0000 and Spectra_phantom#6089<br><J><b>Translators:</b><N> Patrick_mahomes#1795 (BR)",
	seconds = " seconds.",
	leave = "Leave",
	join = "Join",
	getr = "Get Ready! The match will start in a few seconds!",
	powerups2 = "<font size='11.5'><b>Key '5' - Night Mode</b><br>This powerup remove the vision of players of enemy team.<br><b>Required Level: 3  /  Required Score: 15pts</b><br><br><b>Key '6' - Anvil Rain</b><br>This powerup will create a anvil rain on random enemy team areas.<br><b>Required Level: 3  /  Required Score: 25pts</b><br><br><b>Key '7' - Gravity Anomaly</b><br>This powerup will incrase the gravity of map by 200% until the next player shoots.<br><b>Required Level: 4  /  Required Score: 14pts</b><br><br><b>Key '8' - Invisible Anvil</b><br>Shoot an invisible anvil.<br><b>Required Level: 3  /  Required Score: 16pts</b><br><br><p align='right'><a href='event:pw1'>Return to Page 1</a>",
	using = "You are now using the ",
	ac0 = "You don't have AnvilCoins to buy this anvil.",
	level = "reached the level",
	draw = "<b>Draw!</b><br>The lobby screen will load shortly.",
	winblue = "<b>Victory of the BLUE team!</b><br>The lobby screen will load shortly.",
	winred = "<b>Victory of the RED team!</b><br>The lobby screen will load shortly.",
	as = "Actual shooter: ",
	as1 = "<b>It's your time to shoot.</b><br><J>Use the SPACEBAR to shoot. Type !help for more information.<br><br><N>Points available: ",
	rm = "Randomizing map...",
	rm1 = "Selected Map : ",
	t60s = "60 seconds remaining!",
	t30s = "30 seconds remaining!<br><br>After this warning, isn't possible to revive players.",
	powerups_a = "The powerups are now available!",
	time = "<b>Time is up!</b> The next team will play now.",
	cap_text = "was selected to be the leader of your team.",
	cap = "<J><b>You are now the team leader.</b><N><br>Type !leader to know all the functions and benefits of team leaders.",
	leader = "The team leaders <b>are randomly choosed</b> and have various advantages and benefits:<br><br>• Will receive 50% more points and AnvilCoins regarding to the other players<br>• Can revive dead team players using the !rv [player] command<br>• Can transfer your powerup score to other team players using the !tp [player] command<br>• Have 50% more shooting time.",
	legacy = "",
	disabled = "This command was disabled by an administrator.",
	gametime = "Game Time",
	timeup = "<ROSE>Time is up! This will be the last shoot!",
	red_team = "Red Team",
	blue_team = "Blue Team",
	revived = "The following player revived: ",
	sound = "Use the /music command to enable or disable the in-game sound effects.",
	suddendeath = "<J><b>SUDDEN DEATH ENABLED!</b><br><br>The team that gets any player killed will lose the game!",
	latency = "You cannot enter the game because your average latency is very high.",
}
if tfm.get.room.isTribeHouse == true then
	text = lang.en
else
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		text = lang.br
	else
		text = lang.en
	end
end

for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"reset","help","sync","pw","commands","powerups","p","kill","limit","ranking","tc","TC","Tc","tC","anvils","set","testmap","defmap","leader","rv","tp","changelog","get","sound"} do
	system.disableChatCommandDisplay(g)
end
if not tfm.get.room.isTribeHouse then tfm.exec.setRoomMaxPlayers(30) end

function tableSearch(table,element)
	for i=1,rawlen(table) do
		if element == table[i] then
			return true
		end
	end
end

function showNPCs(name)
	if data[name] then
		if data[name].team == 1 then
			tfm.exec.addNPC("Mayra Flowers",{title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 600,y = 196,female = true,lookLeft = true,lookAtPlayer = true,interactive = true},name)
		elseif data[name].team == 2 then
			tfm.exec.addNPC("Mayra Flowers",{title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 1000,y = 196,female = true,lookLeft = true,lookAtPlayer = true,interactive = true},name)
		end
	end
end

function eventTalkToNPC(name, npc)
	if npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)<font face='Verdana'>",name)
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

function showImage(name,link,x,y,scalex,scaley)
	image_id=tfm.exec.addImage(link,":1",x,y,name,scalex,scaley,0,0.95)
	table.insert(images_id,image_id)
end
	
function showImageBackground(name,link,x,y,scalex,scaley)
	image_id=tfm.exec.addImage(link,"?1",x,y,name,scalex,scaley,0,1)
	table.insert(images_id,image_id)
end

function showAvailableAnvils(name)
	i=0
	for _,link in next,{"1788f85d7e2.png","1788f85ef53.png","1788f8606c4.png","1788f861e33.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",63,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"1788f8635a6.png","1788f864d16.png","1788f866489.png","1789826a888.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",217,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"1789826bffa.png","1789826d76c.png","178982679a6.png","17898269116.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",389,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"179ec21b84d.png","179ec2171f9.png","179ec21896c.png","179ec21a0dd.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",561,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
end

function showTeams(name)
	ui.addTextArea(480,"<font size='18'><font color='#ff4500'><p align='center'><b><a href='event:enter_red'>"..text.join.."",name,320,140,150,25,0,0,0.9,true)
	ui.addTextArea(481,"<font size='18'><font color='#0045ff'><p align='center'><b><a href='event:enter_blue'>"..text.join.."",name,320,230,150,25,0,0,0.9,true)
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

function showLobbyText(name)
	ui.addTextArea(402,"<p align='center'><font size='13'><b><font face='Courier New'><i>"..text.version.." RTM 51021.204 - "..text.comp_date.."11/11/2022 22:43 UTC - "..text.uploaded.."Morganadxana#0000</i>",name,-10,380,820,36,0,0,1.0,true)
end

function setLeaders()
	if rawlen(alives_red) > 0 and rawlen(alives_blue) > 0 then
		red_cap=alives_red[math.random(#alives_red)]
		blue_cap=alives_blue[math.random(#alives_blue)]
		showMessage(""..red_cap.." "..text.cap_text.."")
		showMessage(""..blue_cap.." "..text.cap_text.."")
		showMessage(text.cap,red_cap)
		showMessage(text.cap,blue_cap)
		tfm.exec.setNameColor(red_cap,0x80f000)
		tfm.exec.setNameColor(blue_cap,0x80f000)
	else
		lobby();
	end
end

function eventRanking(name)
	local sc = {}
	for id,name in next,playersList do
		sc[#sc+1] = {n=name,s=data[name].kills,f=data[name].level,d=data[name].winrate,l=data[name].eff}
	end

	table.sort(sc,function(a,b) return a.s>b.s end)

	str1 = ''
	str2 = ''
	str3 = ''
	str4 = ''
	str5 = ''
	rk = ""
	for k,v in pairs(sc) do
		if k < 21 then
			if str ~= '' then
				if k < 10 then rk=tostring(0)..k; else rk=tostring(k) end
				str1=str1.."<br><N>"..rk.."° | <VP>"..v.n..""
				str2=str2.."<br><b><N>"..v.s.."</b>"
				str3=str3.."<br><N>"..v.f..""
				str4=str4.."<br><N>"..v.d..""
				str5=str5.."<br><N>"..v.l..""
			else
				str1="<J>"..k.."° | <VP>"..v.n..""
				str2="<J><b>"..v.s.."</b>"
				str3="<J>"..v.f..""
				str4="<J>"..v.d..""
				str5="<J>"..v.l..""
			end
		end
	end
	showMenu(name,0xffffff,200,35,400,340,""..tfm.get.room.name.." Ranking","<font size='12'># / Name                                            Kills  Level   Wins% Kills%")
	ui.addTextArea(1010,"<p align='left'><font size='12'><font face='Consolas'>"..str1,name,200,70,220,320,0,0,nil,true)
	ui.addTextArea(1011,"<p align='right'><font size='12'><font face='Consolas'>"..str2,name,420,70,40,320,0,0,nil,true)
	ui.addTextArea(1007,"<p align='right'><font size='12'><font face='Consolas'>"..str3,name,460,70,40,320,0,0,nil,true)
	ui.addTextArea(1008,"<p align='right'><font size='12'><font face='Consolas'>"..str4,name,500,70,50,320,0,0,nil,true)
	ui.addTextArea(1009,"<p align='right'><font size='12'><font face='Consolas'>"..str5,name,550,70,50,320,0,0,nil,true)
end

function giveRankings(name)
	if data[name] then
		if tableSearch(helpers,name) == true then
			data[name].ranking=1
			tfm.exec.setNameColor(name,0x00a9a9)
		elseif tableSearch(mods,name) == true then
			data[name].ranking=2
			tfm.exec.setNameColor(name,0xa9a900)
		elseif tableSearch(ninjas,name) == true then
			data[name].ranking=3
		elseif tableSearch(admins,name) == true then
			data[name].ranking=4
			tfm.exec.setNameColor(name,0xa90000)
		end
	end
end

function updateTextBar()
	if mode == "end" then
		ui.setMapName("<VP><b>"..text.ending.."</b>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
	else
		ui.setMapName("<N><b>#anvilwar</b>   <G>|   <VP>"..text.version.." <b>RTM 51021.204</b> <R>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
	end
end

function spawnAnvil(object,x,y,xp,yp,ghost)
	if data[actual_player].powerup < 8 then
		id=tfm.exec.addShamanObject(object,x,y,xp,yp,ghost)
		if data[actual_player].current_anvil == 1 then
			tfm.exec.addImage("1788f85ef53.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 2 then
			tfm.exec.addImage("1788f8606c4.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 3 then
			tfm.exec.addImage("1788f861e33.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 4 then
			tfm.exec.addImage("1788f8635a6.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 5 then
			tfm.exec.addImage("1788f864d16.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 6 then
			tfm.exec.addImage("1788f866489.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 7 then
			tfm.exec.addImage("1789826a888.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 8 then
			tfm.exec.addImage("1789826bffa.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 9 then
			tfm.exec.addImage("1789826d76c.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 10 then
			tfm.exec.addImage("178982679a6.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 11 then
			tfm.exec.addImage("17898269116.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 12 then
			tfm.exec.addImage("179ec21b84d.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 13 then
			tfm.exec.addImage("179ec2171f9.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 14 then
			tfm.exec.addImage("179ec21896c.png","#"..id.."",-20,-12)
		elseif data[actual_player].current_anvil == 15 then
			tfm.exec.addImage("179ec21a0dd.png","#"..id.."",-20,-12)
		end
	else
		id=tfm.exec.addShamanObject(1010,x,y,xp,yp,ghost)
	end
end

function calculateMatchTime()
	total_time=165+(mices*5)
	general_time=total_time
end

function calculatePoints(name)
	if data[name] then
		data[name].winrate=math.floor((data[name].wins/data[name].matches)*100)
		if data[name].current_coins > 0 then
			if name == red_cap or name == blue_cap then
				local gained=math.floor(data[name].current_coins*1.2)+data[name].score+turns
				data[name].coins=data[name].coins+gained
				showMessage("<VP>"..text.won.."<b>"..gained.."</b> AnvilCoins!",name)
			else
				local gained=math.floor(data[name].current_coins*0.8)+math.floor(data[name].score*0.5)+math.floor(turns*0.5)
				data[name].coins=data[name].coins+gained
				showMessage("<VP>"..text.won.."<b>"..gained.."</b> AnvilCoins!",name)
			end
			data[name].exp=data[name].exp+(data[name].current_coins*2)
			if data[name].exp >= data[name].maxp then
				advanceLevel(name)
			end
		end
		data[name].current_coins=0
		data[name].eff=math.floor((data[name].kills/data[name].killeds)*100)
	end
end

function suddenDeath()
	showMessage(text.suddendeath)
	sudden_death=true;
	general_time=60;
	setShooter()
end

function detectVictory()
	if turns == 1 then
		setLeaders()
	end
	if general_time > 0 then
		if rawlen(alives_red) == 0 and rawlen(alives_blue) == 0 then
			drawMatch()
		elseif rawlen(alives_red) == 0 then
			victoryBlue()
		elseif rawlen(alives_blue) == 0 then
			victoryRed()
		else
			setShooter()
		end
	else
		if rawlen(alives_red) == rawlen(alives_blue) then
			if (rawlen(alives_red)+rawlen(alives_blue)) >= 3 and sudden_death == false then
				suddenDeath()
			else
				drawMatch()
			end
		end
		if rawlen(alives_red) > rawlen(alives_blue) then
			victoryRed()
		end
		if rawlen(alives_red) < rawlen(alives_blue) then
			victoryBlue()
		end
	end
end

function updatePlayerList()
	text1=""; text2="";
	for id,name in next,players_red do
		text1="<font size='14.5'>"..text1.."<b> "..id.."</b> - "..name.."<br>"
	end
	for id,name in next,players_blue do
		text2="<font size='14.5'>"..text2.."<b> "..id.."</b> - "..name.."<br>"

	end
	if mode == "lobby" or mode == "map_sort" then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].opened == false then
				ui.addTextArea(-4,"<font color='#000001'><font face='Consolas,Lucida Console'><font size='9'>"..text2.."",name,501,125,260,270,0,0,1.0,true)
				ui.addTextArea(-3,"<BL><font face='Consolas,Lucida Console'><font size='9'>"..text2.."",name,500,124,260,270,0,0,1.0,true)
				ui.addTextArea(-1,"<font color='#000001'><font face='Consolas,Lucida Console'><font size='9'>"..text1.."",name,21,125,260,270,0,0,1.0,true)
				ui.addTextArea(-2,"<R><font face='Consolas,Lucida Console'><font size='9'>"..text1.."",name,20,124,260,270,0,0,1.0,true)
			end
		end
	end
end

function removeImagePlayers(name)
	if rawlen(data[name].active_imgs) > 0 then
		for _,id in next,data[name].active_imgs do
			tfm.exec.removeImage(id)
		end
		data[name].active_imgs={}
	end
end

function removeScoreboard(name)
	if data[name] then
		tfm.exec.removeImage(data[name].scoreboard_id,false)
		data[name].scoreboard_id=-1
	end
	for j=5651, 5658 do
		ui.removeTextArea(j,nil)
	end
end

function checkPing(name)
	if data[name] then
		if ping_check == 0 then
			return false
		elseif ping_check == 1 then
			if tfm.get.room.playerList[name].averageLatency >= 3000 then
				return true
			else
				return false
			end
		elseif ping_check == 2 then
			if tfm.get.room.playerList[name].averageLatency >= 2000 then
				return true
			else
				return false
			end
		elseif ping_check == 3 then
			if tfm.get.room.playerList[name].averageLatency >= 1000 then
				return true
			else
				return false
			end
		end
	end
end

function eventNewPlayer(name)
	mices=mices+1
	if not data[name] then
		data[name]={level=1,exp=0,maxp=100,score=0,kills=0,wins=0,matches=0,killeds=0,eff=0.0,winrate=0.0,coins=0,multikills=0,
		killed=false,team=0,ranking=0,angle=0,power=5,powerup=0,
		current_coins=0,opened=false,active_imgs={},anvils={0,0,0,0,0,0,0,0,0,0,0},current_anvil=0,position=198,test_time=0,scoreboard_id=-1}
		table.insert(playersList,name)
	end
	if name:sub(1,1) == "*" then
		data[name].ranking=-1
	end
	if string.find(tfm.get.room.name,name) then
		table.insert(mods,name)
		showMessage(text.manager,name)
		print(name)
	end
	for _,k in next,{32,48,49,50,51,52,53,54,55,56,57,66,67,72,77,80,82,85,86,88,90,112,113,114,115,116,117,118} do
		tfm.exec.bindKeyboard(name,k,true,true)
	end
	system.bindMouse(name,true)
	if mode == "lobby" then
		if data[name] then
			if data[name].ranking >= 0 then
				showImageBackground(name,"1835da9d15e.png",0,1,1.0,1.0)
				showTeams(name)
				showLobbyText(name)
				tfm.exec.respawnPlayer(name)
			end
		end
		updatePlayerList()
	end
	giveRankings(name)
	tfm.exec.setPlayerScore(name,0,false)
end

for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end

function permaFrost()
	if data[actual_player].team == 1 then
		for _,name in next,players_blue do
			tfm.exec.freezePlayer(name,true)
		end
	elseif data[actual_player].team == 2 then
		for _,name in next,players_red do
			tfm.exec.freezePlayer(name,true)
		end
	end
end

function anvilRain()
	if data[actual_player].team == 1 then
		for i=1,7 do
			spawnAnvil(10,math.random(850,1599),100,0,1,false)
		end
	elseif data[actual_player].team == 2 then
		for i=1,7 do
			spawnAnvil(10,math.random(1,750),100,0,1,false)
		end
	end
end

function showPowerMeter(name)
	bar_text=""
	for i=1,data[name].power do
		bar_text=bar_text.."▊▊"
	end
	ui.addTextArea(750,"<font size='15'>         Anvil Power: <b>"..data[name].power.."</b> "..bar_text.."",name,10,376,780,20,0x010101,0x010101,1.0,true)
end

function showAngleMeter(name)
	ag=math.ceil(data[name].angle/8)
	bar_text=""
	for i=1,ag do
		bar_text=bar_text.."▊▊▊"
	end
	ui.addTextArea(750,"<font size='15'>                   Anvil Angle: <b>"..data[name].angle.."°</b> "..bar_text.."",name,10,376,780,20,0x010101,0x010101,1.0,true)
end

function nightMode()
	if data[actual_player].team == 1 then
		ui.addTextArea(999,"",nil,800,-300,1200,1400,0x000001,0x000001,0.99,false)
	elseif data[actual_player].team == 2 then
		ui.addTextArea(999,"",nil,-400,-300,1200,1400,0x000001,0x000001,0.99,false)
	end
end

function setScores(name,points)
	if offset == false then
		data[name].score=points
	else
		data[name].score=data[name].score+points
	end
	tfm.exec.setPlayerScore(name,data[name].score,false)
end

function eventKeyboard(name,code,down,x,y)
	if mode == "shoot" and actual_player == name and enabled == true then
		if code == 32 then
			if data[name].team == 1 then
				spawnAnvil(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.2),-5-(data[name].power*0.3),false)
				if data[name].powerup == 1 then
					id=spawnAnvil(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.2),-5-(data[name].power*0.3),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						spawnAnvil(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*1.2),-5-(data[name].power*0.3),false)
					end
				end
				tfm.exec.playSound("bouboum/x_explosion_3.mp3", 90)
			elseif data[name].team == 2 then
				spawnAnvil(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.2)*-1,-5-(data[name].power*0.3),false)
				if data[name].powerup == 1 then
					spawnAnvil(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.2)*-1,-5-(data[name].power*0.3),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						spawnAnvil(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*1.2)*-1,-5-(data[name].power*0.3),false)
					end
				end
				tfm.exec.playSound("bouboum/x_explosion_3.mp3", 90)
			end
			mode="wait3"
			enabled=false
			tfm.exec.setGameTime(7)
			ui.removeTextArea(750,nil)
		end
		if powerups == true then
			if data[name].powerup == 0 then
				if code == 49 and data[name].score >= 8 and data[name].level >= 1 then
					showMessage("<VP><b>"..name.."</b> "..text.p1.."")
					data[name].powerup=1
					setScores(name,-8,true)
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 49 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 50 and data[name].score >= 12 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p2.."")
					data[name].powerup=2
					setScores(name,-12,true)
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 50 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 51 and data[name].score >= 22 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p3.."")
					setScores(name,-22,true)
					data[name].powerup=3
					mode="wait3"
					tfm.exec.setGameTime(10)
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 51 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 52 and data[name].score >= 20 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p4.."")
					setScores(name,-20,true)
					data[name].powerup=4
					permafrost=true
					permaFrost()
					tfm.exec.playSound("/bouboum/gel.mp3", 75)
				elseif code == 52 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 53 and data[name].score >= 15 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p5.."")
					setScores(name,-15,true)
					data[name].powerup=5
					night_mode=true
					nightMode()
					tfm.exec.playSound("/transformice/son/dash.mp3", 85)
				elseif code == 53 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 54 and data[name].score >= 24 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p6.."")
					setScores(name,-24,true)
					data[name].powerup=6
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
					anvilRain()
					tfm.exec.playSound("/deadmaze/combat/casse.mp3", 95)
				elseif code == 54 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 55 and data[name].score >= 14 and data[name].level >= 4 then
					showMessage("<VP><b>"..name.."</b> "..text.p7.."")
					setScores(name,-14,true)
					data[name].powerup=7
					tfm.exec.setWorldGravity(0,22)
					pf_time=-2
					gravity=false
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 55 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 56 and data[name].score >= 16 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p8.."")
					setScores(name,-16,true)
					data[name].powerup=8
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 56 then
					showMessage("<R>"..text.p0.."",name)
				end
				ui.removeTextArea(750,nil)
			end
		end
		if code == 90 then
			if data[name].power > 1 then
				data[name].power=data[name].power-1
			end
			showPowerMeter(name)
		end
		if code == 88 then
			if data[name].power < 20 then
				data[name].power=data[name].power+1
			end
			showPowerMeter(name)
		end
		if code == 67 then
			if data[name].angle > 0 then
				data[name].angle=data[name].angle-10
			end
			showAngleMeter(name)
		end
		if code == 86 then
			if data[name].angle < 90 then
				data[name].angle=data[name].angle+10
			end
			showAngleMeter(name)
		end
	end
	if code == 66 then
		eventChatCommand(name,"commands")
	end
	if code == 72 then
		eventChatCommand(name,"help")
	end
	if code == 77 then
		eventChatCommand(name,"sound")
	end
	if code == 82 then
		eventChatCommand(name,"ranking")
	end
	if code == 85 then
		eventChatCommand(name,"powerups")
	end
	if code == 80 then
		eventChatCommand(name,"p")
	end
end

function eventPlayerLeft(name)
	removeTeam(name)
	mices=mices-1
end

function eventPlayerDied(name)
	if mode == "lobby" and data[name].ranking >= 0 then
		tfm.exec.respawnPlayer(name)
	end
	if mode == "wait2" and time_passed < 20 or mode == "end" then
		data[name].position=data[name].position+3
		if data[name] and data[name].team == 1 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,data[name].position,false,0,0,false)
		end
		if data[name] and data[name].team == 2 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,data[name].position,false,0,0,false)
		end
	end
	if mode == "shoot" then
		if data[name].team > 0 then
			data[name].current_coins=math.floor(data[name].current_coins/2)
		end
		if name == actual_player then
			data[name].current_coins=math.floor(data[name].current_coins/2)
			showMessage(""..text.suicide..""..actual_player)
			setScores(name,0,false)
			mode="wait3"
			tfm.exec.setGameTime(6)
		end
		data[name].killeds=data[name].killeds+1
		setScores(name,0,false)
		if sudden_death == true then
			if data[name].team == 1 then
				victoryBlue()
			elseif data[name].team == 2 then
				victoryRed()
			end
		end
	end
	if mode == "wait3" then
		if data[actual_player].team == data[name].team then
			if actual_player == name then
				data[actual_player].current_coins=0
				setScores(actual_player,0,false)
				showMessage(""..text.suicide..""..actual_player)
			else
				data[actual_player].current_coins=data[actual_player].current_coins-5
				setScores(actual_player,-5,true)
				showMessage("<VP>"..text.tk1.."<b>"..actual_player.."</b>"..text.tk2..""..name..".")
			end
		else
			data[name].current_coins=math.floor(data[name].current_coins/3)
			setScores(name,math.floor(data[name].score/3),true)
		end
		data[name].killeds=data[name].killeds+1
		setScores(name,0,false)
		if sudden_death == true then
			if data[name].team == 1 then
				victoryBlue()
			elseif data[name].team == 2 then
				victoryRed()
			end
		end
		tfm.exec.playSound("/bouboum/x_mort.mp3", 77)
	end
end

function eventMouse(name,x,y)
	if actual_player == name and data[name].powerup == 3 and mode == "wait3" then
		if time_remain >= 2 then
			if data[name].team == 1 and x > 805 then
				tfm.exec.explosion(x,y,25,150,true)
				tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
			end
			if data[name].team == 2 and x < 795 then
				tfm.exec.explosion(x,y,25,150,true)
				tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
			end
			mode="wait2"
			tfm.exec.setGameTime(6)
		end
	end
end

function lobby()
	mode="lobby"; choose_time=30; powerups=false;
	tfm.exec.newGame(lobby_map)
	tfm.exec.setGameTime(36000)
	ui.removeTextArea(750,nil)
	players_red={};	players_blue={}; loop=0;
	for i=-8, -1 do
		ui.removeTextArea(i,nil)
	end
	for name,player in next,tfm.get.room.playerList do
		ui.removeTextArea(999,name)
		tfm.exec.freezePlayer(name,false)
		removeImagePlayers(name)
		showLobbyText(name)
		removeScoreboard(name)
		if data[name] then
			for i=1000,1011 do
				ui.removeTextArea(i,name)
			end
			data[name].opened=false
			if data[name].ranking >= 0 then
				showTeams(name)
				showImageBackground(name,"1835da9d15e.png",0,1,1.0,1.0)
				data[name].team=0
				data[name].current_coins=0
				setScores(name,0,false)
			else
				tfm.exec.killPlayer(name)
			end
		end
	end
	permafrost=false; night_mode=false;
	showMessage("<VP>"..text.legacy.."")
end

function eventNewGame()
	ui.setBackgroundColor("#000000")
	set_map="-1"; def_map=-1; turns=0;
	if mode == "wait1" then
		for i=400,403 do ui.removeTextArea(i,nil) end
		mode="wait2"
		tfm.exec.setGameTime(20)
		moveTeams()
		for name,player in next,tfm.get.room.playerList do
			data[name].scoreboard_id = tfm.exec.addImage("1835da984ec.png", ":1", 260, 15, name, 1.0, 1.0, 0, 1)
			tfm.exec.setNameColor(name,0xd7d7e6)
			data[name].score=0
			data[name].position=198
			if data[name].team > 0 then
				data[name].matches=data[name].matches+1
			else
				tfm.exec.setPlayerScore(name,0,false)
			end
		end
	end
	actual_shooter="-"
end

function split(t,s)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end

function eventChatCommand(name,command)
	local arg = split(command, " ")
	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end
		if tfm.get.room.playerList[nome] and data[nome].opened == false then
			showMenu(name,0x518394,250,120,300,225,nome,"<b>Level: "..data[nome].level.."</b><br><br>Experience: "..data[nome].exp.."/"..data[nome].maxp.."<br><br><br>Kills: "..data[nome].kills.."<br>Matches: "..data[nome].matches.."<br>Wins: "..data[nome].wins.."<br><br>Victory Rate: "..data[nome].winrate.."%<br>Kill Rate: "..data[nome].eff.."%")
			ui.addTextArea(1006,"",name,265,215,270,10,0x101010,0x161903,1.0,true)
			ui.addTextArea(1005,"",name,265,215,((data[nome].exp/data[nome].maxp)*260)+10,10,0x95a810,0x658704,1.0,true)
			showMessage("<R>"..text.rankw.."",name)
		else
			showMessage("<R>User not found",nome)
		end
	end

	if (command:sub(0,4) == "sync") and data[name].ranking >= 3 then
		tfm.exec.setPlayerSync(command:sub(6))
		showMessage("Sync: "..command:sub(6).."",name)
	end
	if command == "reset" and data[name].ranking >= 2 and time_passed >= 6 then
		lobby()
	end
	if (command:sub(0,2) == "pw") and data[name].ranking >= 2 then
		tfm.exec.setRoomPassword(tostring(command:sub(4)))
		if string.len(command:sub(4)) > 0 then
			showMessage(""..text.pw..""..command:sub(4).."",name)
		else
			showMessage(text.pw0,name)
		end
	end
	if (command:sub(0,2) == "lc") and data[name].ranking >= 2 then
		if tostring(command:sub(4)) == "0" or tostring(command:sub(4)) == "1" or tostring(command:sub(4)) == "2" or tostring(command:sub(4)) == "3" then
			level=tonumber(command:sub(4))
			if level == 0 then
				ping_check=0
				showMessage("The player's latency checker is now disabled.")
			elseif level == 1 then
				ping_check=1
				showMessage("The player's latency checker is now set to WEAK. Players with average latency greater than 3000 ms cannot enter into the teams.")
			elseif level == 2 then
				ping_check=2
				showMessage("The player's latency checker is now set to DEFAULT. Players with average latency greater than 2000 ms cannot enter into the teams.")
			elseif level == 3 then
				ping_check=3
				showMessage("The player's latency checker is now set to STRICT. Players with average latency greater than 1000 ms cannot enter into the teams.")
			end
		else
		
		end
	end
	if command == "changelog" then
		showMenu(name,0xa8f233,140,110,520,110,"#anvilwar Changelog - RTM 51021.204","• Added 3 new maps!<br>• Added a system to avoid players with high latency<br>• Some changes on the interface<br>• The return of the SUDDEN DEATH mode!")
	end
	if (command:sub(0,2) == "rv") then
		if name == actual_player and general_time >= 30 then
			if name == red_cap or name == blue_cap then
				temp_name=command:sub(4)
				print(temp_name)
				if data[temp_name] then
					if data[name].score >= 30 then
						if tfm.get.room.playerList[temp_name].isDead == true then
							tfm.exec.respawnPlayer(temp_name)
							if data[temp_name].team == 2 then
								tfm.exec.movePlayer(temp_name,1000,205,false,0,0,false)
								data[temp_name].killed=false
							end
							if data[temp_name].team == 1 then
								tfm.exec.movePlayer(temp_name,600,205,false,0,0,false)
								data[temp_name].killed=false
							end
							showMessage("<J>"..text.revived..""..temp_name.."")
							setScores(name,-30,true)
						end
					else
						showMessage(text.p10,name)
					end
				end
			end
		end
	end
	if (command:sub(0,2) == "tp") then
		if name == actual_player then
			if name == red_cap or name == blue_cap then
				temp_name=command:sub(4)
				if data[temp_name] then
					ui.addPopup(100,2,"Points",name,350,175,200,true)
				end
			end
		end
	end
	if (command:sub(0,5) == "limit") and data[name].ranking >= 2 then
		tfm.exec.setRoomMaxPlayers(tonumber(command:sub(7)))
		showMessage(""..text.limit..""..command:sub(7).."",name)
	end
	if (command:sub(0,5) == "score") and data[name].ranking >= 4 then
		temp_name=command:sub(4)
		if data[temp_name] then
			ui.addPopup(105,2,"Points",name,350,175,200,true)
		end
	end
	if (command:sub(0,3) == "set") and data[name].ranking >= 3 then
		if data[command:sub(5)] then
			set_player=command:sub(5)
		end
	end
 	if (command:sub(0,6) == "defmap") and data[name].ranking >= 3 then
		if mode == "lobby" then
			def_map=tonumber(command:sub(8))
			showMessage("Defined map: "..def_map.."",name)
		end
	end
	if (command:sub(0,4) == "kill") and data[name].ranking >= 2 then
		tfm.exec.killPlayer(command:sub(6))
	end
	if (command:sub(0,7) == "testmap") then
		if mode == "lobby" then
			if string.len(command:sub(9)) == 2 or string.len(command:sub(9)) == 8 then
				if data[name].ranking >= 2 then
					set_map=command:sub(9)
					showMessage(""..text.load1..""..command:sub(9)..". "..text.load2.."",name)
				end
			end
		else
			showMessage(text.load0,name)
		end
	end
	if (command:sub(0,3) == "get") and data[name].ranking >= 1 then
		if tonumber(command:sub(5)) <= rawlen(map_names) then
			showMessage(""..map_names[tonumber(command:sub(5))].." - "..maps[tonumber(command:sub(5))].."",name)
		end
	end
	if (command:sub(0,2) == "tc") or (command:sub(0,2) == "TC") or (command:sub(0,2) == "Tc") or (command:sub(0,2) == "tC") then
		if data[name] then
			if data[name].team == 1 then
				for _,p in next,players_red do
					showMessage("<VP>• <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			elseif data[name].team == 2 then
				for _,p in next,players_blue do
					showMessage("<VP>• <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			end
		end
	end
	if command == "ranking" then
		if data[name].opened == false then
			eventRanking(name)
		end
		showMessage("<R>"..text.rankw.."",name)
	end
	if command == "anvils" then
		if data[name].opened == false then
			showMessage("<J>"..text.ac.."<b>"..data[name].coins.."</b> AnvilCoins.",name)
			showMenu(name,0x999999,56,120,690,235,"#anvilwar Anvils","<font size='11.5'>"..divider.."<b>Default Anvil</b><br>"..divider.."Cost: 0 coins<br>"..divider.."<a href='event:a0'>Equip!</a><br><br>"..divider.."<b>Red Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a1'>Equip!</a><br><br>"..divider.."<b>Blue Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a2'>Equip!</a><br><br>"..divider.."<b>White Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a3'>Equip!</a>")
			ui.addTextArea(1005,"<i><font size='11.5'>"..divider.."<b>Rainbow Anvil</b><br>"..divider.."Cost: 250 coins<br>"..divider.."<a href='event:a4'>Equip!</a><br><br>"..divider.."<b>Sharingan Anvil</b><br>"..divider.."Cost: 500 coins<br>"..divider.."<a href='event:a5'>Equip!</a><br><br>"..divider.."<b>Black Hole Anvil</b><br>"..divider.."Cost: 500 coins<br>"..divider.."<a href='event:a6'>Equip!</a><br><br>"..divider.."<b>4K 1080p Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a7'>Equip!</a>",name,208,151,175,215,0,0,1.0,true)
			ui.addTextArea(1006,"<i><font size='11.5'>"..divider.."<b>Thug Life Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a8'>Equip!</a><br><br>"..divider.."<b>Water Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a9'>Equip!</a><br><br>"..divider.."<b>Grass Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a10'>Equip!</a><br><br>"..divider.."<b>RadWhite Anvil</b><br>"..divider.."Cost: 350 coins<br>"..divider.."<a href='event:a11'>Equip!</a>",name,380,151,175,215,0,0,1.0,true)
			ui.addTextArea(1007,"<i><font size='11.5'>"..divider.."<b>Stars Anvil</b><br>"..divider.."Cost: 400 coins<br>"..divider.."<a href='event:a12'>Equip!</a><br><br>"..divider.."<b>Asteroid Anvil</b><br>"..divider.."Cost: 350 coins<br>"..divider.."<a href='event:a13'>Equip!</a><br><br>"..divider.."<b>Expanded Anvil</b><br>"..divider.."Cost: 125 coins<br>"..divider.."<a href='event:a14'>Equip!</a><br><br>"..divider.."<b>Yellow Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a15'>Equip!</a>",name,552,151,175,215,0,0,1.0,true)
			showAvailableAnvils(name)
		end
	end
	if command == "powerups" then
		showMenu(name,0xc23517,140,90,520,260,"#anvilwar Powerups",text.powerups)
	end
	if command == "sound" then
		showMessage(text.sound,name)
	end
	if command == "leader" then
		showMenu(name,0x873469,140,90,520,200,"#anvilwar Team Leader Funcions",text.leader)
	end
	if command == "commands" then
		showMenu(name,0x125490,120,100,560,285,"#anvilwar Commands",text.commands)
	end
	if command == "help" then
		showMenu(name,0x457426,100,125,600,260,"Help",text.help)
	end
end
function eventPopupAnswer(id,name,message)
	if id == 100 then
		if data[temp_name] and actual_player == name then
			local sp=tonumber(message)
			if sp <= data[name].score then
				setScores(name,sp*-1,true)
				setScores(temp_name,sp,true)
			end
		end
	end
	if id == 105 then
		if data[temp_name] then
			setScores(temp_name,tonumber(message),true)
		end
	end
end
function enterRedTeam(name)
	if choose_time > 1 and data[name].team == 0 and rawlen(players_red) <= 12 then
		tfm.exec.respawnPlayer(name)
		table.insert(players_red,name)
		updatePlayerList()
		tfm.exec.movePlayer(name,200,280,false,0,0,false)
		data[name].team=1
		for i=479,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
		end
	end
end

function enterBlueTeam(name)
	if choose_time > 1 and data[name].team == 0 and rawlen(players_blue) <= 12 then
		tfm.exec.respawnPlayer(name)
		table.insert(players_blue,name)
		updatePlayerList()
		data[name].team=2
		tfm.exec.movePlayer(name,600,280,false,0,0,false)
		for i=479,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
		end
	end
end

function moveTeams()
	ui.setBackgroundColor("#6a7495")
	showMessage("<VP>"..text.getr.."")
	for _,id in next,images_id do
		tfm.exec.removeImage(id)
		images_id={}
	end
	if mode == "wait2" then
		for _,name in next,players_red do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,198,false,0,0,false)
		end
		for _,name in next,players_blue do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,198,false,0,0,false)
		end
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].team == 0 then
				tfm.exec.killPlayer(name)
			end
		end
	end
end

function removeTeam(name)
	length1=rawlen(players_red)
	length2=rawlen(players_blue)
	tfm.exec.killPlayer(name)
	for i=1,length1 do
		if players_red[i] == name then
			table.remove(players_red,i)
			updatePlayerList()
			showTeams(name)
			data[name].team=0
			ui.removeTextArea(482,name); break
		end
	end
	for i=1,length2 do
		if players_blue[i] == name then
			table.remove(players_blue,i)
			updatePlayerList()
			showTeams(name)
			data[name].team=0
			ui.removeTextArea(482,name); break
		end
	end
end

function eventTextAreaCallback(id,name,callback)
	if callback == "enter_red" then
		if checkPing(name) == false then
			enterRedTeam(name)
		else
			showMessage(text.latency,name)
		end
	end
	if callback == "enter_blue" then
		if checkPing(name) == false then
			enterBlueTeam(name)
		else
			showMessage(text.latency,name)
		end
	end
	if callback == "quit" then
		removeTeam(name)
	end
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
		removeImagePlayers(name)
		if mode == "lobby" or mode == "map_sort" then
			updatePlayerList()
		end
	end
	if callback == "pw1" then
		data[name].opened=false
		eventChatCommand(name,"powerups")
	end
	if callback == "pw2" then
		data[name].opened=false
		showMenu(name,0xc23517,140,90,520,260,"#anvilwar Powerups",text.powerups2)
	end
	if callback == "a0" then
		data[name].current_anvil=0
		showMessage(""..text.using.."<N><b>Default Anvil!</b>",name)
	end
	if callback == "a1" then
		if data[name].anvils[1] == 1 then
			data[name].current_anvil=1
			showMessage(""..text.using.."<N><b>Red Anvil!</b>",name)
		else
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
				data[name].anvils[1]=1
				data[name].current_anvil=1
				showMessage(""..text.using.."<N><b>Red Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a2" then
		if data[name].anvils[2] == 1 then
			data[name].current_anvil=2
			showMessage(""..text.using.."<N><b>Blue Anvil!</b>",name)
		else
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
				data[name].anvils[2]=1
				data[name].current_anvil=2
				showMessage(""..text.using.."<N><b>Blue Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a3" then
		if data[name].anvils[3] == 1 then
			data[name].current_anvil=3
			showMessage(""..text.using.."<N><b>White Anvil!</b>",name)
		else
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
				data[name].anvils[3]=1
				data[name].current_anvil=3
				showMessage(""..text.using.."<N><b>White Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a4" then
		if data[name].anvils[4] == 1 then
			data[name].current_anvil=4
			showMessage(""..text.using.."<N><b>Rainbow Anvil!</b>",name)
		else
			if data[name].coins >= 250 then
				data[name].coins=data[name].coins-250
				data[name].anvils[4]=1
				data[name].current_anvil=4
				showMessage(""..text.using.."<N><b>Rainbow Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a5" then
		if data[name].anvils[5] == 1 then
			data[name].current_anvil=5
			showMessage(""..text.using.."<N><b>Sharingan Anvil!</b>",name)
		else
			if data[name].coins >= 500 then
				data[name].coins=data[name].coins-500
				data[name].anvils[5]=1
				data[name].current_anvil=5
				showMessage(""..text.using.."<N><b>Sharingan Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a6" then
		if data[name].anvils[6] == 1 then
			data[name].current_anvil=6
			showMessage(""..text.using.."<N><b>Black Hole Anvil!</b>",name)
		else
			if data[name].coins >= 500 then
				data[name].coins=data[name].coins-500
				data[name].anvils[6]=1
				data[name].current_anvil=6
				showMessage(""..text.using.."<N><b>Black Hole Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a7" then
		if data[name].anvils[7] == 1 then
			data[name].current_anvil=7
			showMessage(""..text.using.."<N><b>4K 1080p Anvil!</b>",name)
		else
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
				data[name].anvils[7]=1
				data[name].current_anvil=7
				showMessage(""..text.using.."<N><b>4K 1080p Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a8" then
		if data[name].anvils[8] == 1 then
			data[name].current_anvil=8
			showMessage(""..text.using.."<N><b>Thug Life Anvil!</b>",name)
		else
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
				data[name].anvils[8]=1
				data[name].current_anvil=8
				showMessage(""..text.using.."<N><b>Thug Life Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a9" then
		if data[name].anvils[9] == 1 then
			data[name].current_anvil=9
			showMessage(""..text.using.."<N><b>Water Anvil!</b>",name)
		else
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
				data[name].anvils[9]=1
				data[name].current_anvil=9
				showMessage(""..text.using.."<N><b>Water Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a10" then
		if data[name].anvils[10] == 1 then
			data[name].current_anvil=10
			showMessage(""..text.using.."<N><b>Grass Anvil!</b>",name)
		else
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
				data[name].anvils[10]=1
				data[name].current_anvil=10
				showMessage(""..text.using.."<N><b>Grass Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a11" then
		if data[name].anvils[11] == 1 then
			data[name].current_anvil=11
			showMessage(""..text.using.."<N><b>RadWhite Anvil!</b>",name)
		else
			if data[name].coins >= 350 then
				data[name].coins=data[name].coins-350
				data[name].anvils[11]=1
				data[name].current_anvil=11
				showMessage(""..text.using.."<N><b>RadWhite Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a12" then
		if data[name].anvils[12] == 1 then
			data[name].current_anvil=12
			showMessage(""..text.using.."<N><b>Stars Anvil!</b>",name)
		else
			if data[name].coins >= 400 then
				data[name].coins=data[name].coins-400
				data[name].anvils[12]=1
				data[name].current_anvil=12
				showMessage(""..text.using.."<N><b>Stars Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a13" then
		if data[name].anvils[13] == 1 then
			data[name].current_anvil=13
			showMessage(""..text.using.."<N><b>Asteroid Anvil!</b>",name)
		else
			if data[name].coins >= 350 then
				data[name].coins=data[name].coins-350
				data[name].anvils[13]=1
				data[name].current_anvil=13
				showMessage(""..text.using.."<N><b>Asteroid Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a14" then
		if data[name].anvils[14] == 1 then
			data[name].current_anvil=14
			showMessage(""..text.using.."<N><b>Expanded Anvil!</b>",name)
		else
			if data[name].coins >= 125 then
				data[name].coins=data[name].coins-125
				data[name].anvils[14]=1
				data[name].current_anvil=14
				showMessage(""..text.using.."<N><b>Expanded Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a15" then
		if data[name].anvils[15] == 1 then
			data[name].current_anvil=15
			showMessage(""..text.using.."<N><b>Yellow Anvil!</b>",name)
		else
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
				data[name].anvils[15]=1
				data[name].current_anvil=15
				showMessage(""..text.using.."<N><b>Yellow Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
end

function advanceLevel(name)
	data[name].level=data[name].level+1
	data[name].exp=data[name].exp-data[name].maxp
	data[name].maxp=data[name].maxp+50
	showMessage("<VP><b>"..name.."</b> "..text.level.."<b>"..data[name].level.."</b>!",name)
end

function drawMatch()
	mode="end"
	sudden_death=false
	tfm.exec.setGameTime(15)
	showMessage("<J>"..text.draw.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
	ui.removeTextArea(750,nil)
	for name,_ in next,tfm.get.room.playerList do
		if data[name] then
			removeScoreboard(name)
		end
	end
end

function victoryBlue()
	mode="end"
	sudden_death=false
	for _,name in next,players_blue do
		data[name].current_coins=data[name].current_coins+20
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(900,1200),198,false,0,0,false)
		tfm.exec.playEmote(name,0)
		data[name].wins=data[name].wins+1
		showNPCs(name)
	end
	tfm.exec.setGameTime(15)
	showMessage("<BL>"..text.winblue.."")
	for _,name in next,players_red do
		calculatePoints(name)
		tfm.exec.playEmote(name,2)
		tfm.exec.playSound("/fortoresse/x_defaite.mp3",63,nil,nil,name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
		tfm.exec.playSound("/fortoresse/x_victoire.mp3",78,nil,nil,name)
	end
	ui.removeTextArea(750,nil)
	for name,_ in next,tfm.get.room.playerList do
		if data[name] then
			removeScoreboard(name)
		end
	end
end

function victoryRed()
	mode="end"
	sudden_death=false
	for _,name in next,players_red do
		data[name].current_coins=data[name].current_coins+20
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(400,700),198,false,0,0,false)
		tfm.exec.playEmote(name,0)
		data[name].wins=data[name].wins+1
		showNPCs(name)
	end
	tfm.exec.setGameTime(20)
	showMessage("<R>"..text.winred.."")
	for _,name in next,players_red do
		calculatePoints(name)
		tfm.exec.playSound("/fortoresse/x_victoire.mp3",78,nil,nil,name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
		tfm.exec.playEmote(name,2)
		tfm.exec.playSound("/fortoresse/x_defaite.mp3",63,nil,nil,name)
	end
	ui.removeTextArea(750,nil)
	for name,_ in next,tfm.get.room.playerList do
		if data[name] then
			removeScoreboard(name)
		end
	end
end

function setShooter()
	if set_player == "" then
		if turn == 0 then
			turn=1
			actual_player=alives_blue[math.random(#alives_blue)]
			tfm.exec.setGameTime(15)
			if actual_player == blue_cap then
				tfm.exec.setGameTime(22)
			end
		elseif turn == 1 then
			turn=0
			actual_player=alives_red[math.random(#alives_red)]
			tfm.exec.setGameTime(15)
			if actual_player == red_cap then
				tfm.exec.setGameTime(22)
			end
		end
	else
		if turn == 0 then
			turn=1
		elseif turn == 1 then
			turn=0
		end
		actual_player=set_player
		tfm.exec.setGameTime(15)
	end
	set_player=""
	tfm.exec.addShamanObject(0, tfm.get.room.playerList[actual_player].x, tfm.get.room.playerList[actual_player].y-55, 0, 0, 0, false)
	ui.addTextArea(750,"<i><font size='15'><p align='center'>"..text.as.." <b>"..actual_player.."</b>",nil,110,352,580,22,0x010101,0x323232,0.6,true)
	showMessage("<VP>"..text.as1..""..data[actual_player].score.."",actual_player)
	tfm.exec.playSound("/tfmadv/xp.mp3",100,nil,nil,actual_player)
	enabled=true
	mode="shoot"
end

function getAlivePlayers()
	tfm.exec.setWorldGravity(0,10)
	current_red=rawlen(alives_red); current_blue=rawlen(alives_blue); pf_time=0;
	alives_red={}
	alives_blue={}
	turns=turns+1
	for _,name in next,players_red do
		data[name].powerup=0
		if tfm.get.room.playerList[name].isDead == false then
			data[name].killed=false
			table.insert(alives_red,name)
		else
			data[name].killed=true
			setScores(name,0,false)
		end
	end
	for _,name in next,players_blue do
		data[name].powerup=0
		if tfm.get.room.playerList[name].isDead == false then
			data[name].killed=false
			table.insert(alives_blue,name)
		else
			data[name].killed=true
			setScores(name,0,false)
		end
	end
	if mode == "wait3" then
		if data[actual_player].team == 1 then
			killsc=current_blue-rawlen(alives_blue)
			data[actual_player].kills=data[actual_player].kills+killsc
			data[actual_player].current_coins=data[actual_player].current_coins+2*killsc
			setScores(actual_player,killsc*3,true)
			if actual_player == red_cap or actual_player == blue_cap then
				setScores(actual_player,killsc*2,true)
			end
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				showMessage("<J>Double Kill of <b>"..actual_player.."</b>!")
			elseif killsc >= 3 then
				showMessage("<J>Multi Kill! "..killsc.." kills of <b>"..actual_player.."</b>!")
			end
		elseif data[actual_player].team == 2 then
			killsc=current_red-rawlen(alives_red)
			data[actual_player].kills=data[actual_player].kills+killsc
			data[actual_player].current_coins=data[actual_player].current_coins+2*killsc
			setScores(actual_player,killsc*3,true)
			if actual_player == red_cap or actual_player == blue_cap then
				setScores(actual_player,killsc*2,true)
			end
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				showMessage("<J>Double Kill of <b>"..actual_player.."</b>!")
			elseif killsc >= 3 then
				showMessage("<J>Multi Kill! "..killsc.." kills of <b>"..actual_player.."</b>!")
			end
		end
	end
	detectVictory()
end

function eventLoop(passed,remain)
	time_passed=math.floor(passed/1000)
	time_remain=math.floor(remain/1000)
	updateTextBar()
	for name,player in next,tfm.get.room.playerList do
		if data[name] and data[name].test_time > 0 then
			data[name].test_time=data[name].test_time-0.5
		end
	end
	if mode == "lobby" then
		if choose_time > 0 then
			choose_time=choose_time-0.5
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].opened == false then
					ui.addTextArea(483,"<font size='55'><p align='center'><font color='#000001'>"..math.ceil(choose_time).."",name,357,162,80,60,0,0,0.97,true)
					ui.addTextArea(484,"<font size='55'><p align='center'>"..math.ceil(choose_time).."",name,355,160,80,60,0,0,0.97,true)
				end
			end
		end
		if choose_time == 0 then
			if rawlen(players_red) > 0 and rawlen(players_blue) > 0 then
				if rawlen(players_red) - rawlen(players_blue) <= 1 and rawlen(players_red) - rawlen(players_blue) >= -1 then
					for i=478,484 do ui.removeTextArea(i,nil) end
					mode="map_sort"
				else
					choose_time=15
				end
			else
				choose_time=30
			end
		end
	end
	if mode == "map_sort" then
		if set_map == "-1" then
			if loop < 12 then
				loop=loop+1
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm.."",nil,102,97,600,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><i>"..text.rm.."",nil,100,95,600,45,0,0,1.0,true)
				map_id=math.random(1,rawlen(maps))
				tfm.exec.playSound("/bouboum/x_pose_bombe.mp3",65)
			elseif loop == 12 then
				if def_map > 0 then
					map_id=def_map
				end
				current_map=maps[map_id]
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,2,97,800,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,0,95,800,45,0,0,1.0,true)
				mode="wait1"
				tfm.exec.setGameTime(10)
				tfm.exec.playSound("/bouboum/x_bonus_alea.mp3",75)
			end
		else
			current_map=set_map
			ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1..""..set_map.."",nil,2,95,800,45,0,0,1.0,true)
			ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..text.rm1..""..set_map.."",nil,0,95,800,45,0,0,1.0,true)
			mode="wait1"
			tfm.exec.setGameTime(10)
			tfm.exec.playSound("/bouboum/x_bonus_alea.mp3",75)
		end
		if rawlen(players_red) == 0 or rawlen(players_blue) == 0 then
			lobby()
		end
	end
	if mode == "wait1" and time_remain > 1 then
		if rawlen(players_red) == 0 or rawlen(players_blue) == 0 then
			lobby()
		end
	end
	if mode == "wait2" or mode == "wait3" or mode == "shoot" then
		local m=math.floor(general_time/60)
		local s=math.floor(general_time-(m*60))
		if sudden_death == false then
			if s >= 10 then
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":"..s.."",nil,347,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b>"..m..":"..s.."",nil,345,22,100,40,0,0,1.0,true)
			else
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":0"..s.."",nil,347,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b>"..m..":0"..s.."",nil,345,22,100,40,0,0,1.0,true)
			end
		elseif sudden_death == true then
			if s >= 10 then
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":"..s.."",nil,347,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b><J>"..m..":"..s.."",nil,345,22,100,40,0,0,1.0,true)
			else
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":0"..s.."",nil,347,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b><J>"..m..":0"..s.."",nil,345,22,100,40,0,0,1.0,true)
			end
		end
		ui.addTextArea(5654,"<font size='28'><p align='center'><font color='#050505'><b>"..rawlen(alives_red).."",nil,242,24,100,40,0,0,1.0,true)
		ui.addTextArea(5653,"<font size='28'><p align='center'><b><R>"..rawlen(alives_red).."",nil,240,22,100,40,0,0,1.0,true)
		ui.addTextArea(5656,"<font size='28'><p align='center'><font color='#050505'><b>"..rawlen(alives_blue).."",nil,452,24,100,40,0,0,1.0,true)
		ui.addTextArea(5655,"<font size='28'><p align='center'><b><BL>"..rawlen(alives_blue).."",nil,450,22,100,40,0,0,1.0,true)
		ui.addTextArea(5658,"<font size='24'><p align='center'><font color='#050505'><b>"..time_remain.."",nil,347,70,100,40,0,0,1.0,true)
		ui.addTextArea(5657,"<font size='24'><p align='center'><VP><b>"..time_remain.."",nil,345,68,100,40,0,0,1.0,true)
		if general_time > 0 then
			general_time=general_time-0.5
			if sudden_death == false then
				if general_time == 60 then
					showMessage("<ROSE>"..text.t60s.."")
					tfm.exec.playSound("/tfmadv/parade1.mp3",58)
				end
				if general_time == 30 then
					showMessage("<ROSE>"..text.t30s.."")
					tfm.exec.playSound("/tfmadv/parade1.mp3",58)
				end
			end
			if mode == "shoot" and general_time == 0.5 then
				showMessage("<ROSE>"..text.timeup.."")
				tfm.exec.playSound("/tfmadv/soins7.mp3",66)
			end
		end
		if time_passed == 60 and powerups == false then
			powerups=true
			showMessage(text.powerups_a)
		end
		if time_passed % 27 == 0 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].team > 0 then
					if data[name].killed == false then
						data[name].current_coins=data[name].current_coins+1
					end
				end
			end
		end
		if time_passed % 18 == 0 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].team > 0 then
					if data[name].killed == false then
						setScores(name,1,true)
						if name == red_cap or name == blue_cap then
							setScores(name,1,true)
						end
					end
				end
			end
		end
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].team == 1 then
				if tfm.get.room.playerList[name].x > 800 then
					tfm.exec.killPlayer(name)
				end
			end
			if data[name] and data[name].team == 2 then
				if tfm.get.room.playerList[name].x < 800 then
					tfm.exec.killPlayer(name)
				end
			end
		end
	end
	if mode == "wait3" and time_remain <= 1 then
		getAlivePlayers()
	end
	if mode == "shoot" and time_remain == 0 then
		mode="wait2"
		tfm.exec.setGameTime(6)
		enabled=false
		showMessage("<R>"..text.time.."")
	end
	if mode == "wait2" and time_remain <= -1 then
		mode="shoot"
		getAlivePlayers()
	end
	if mode == "wait1" and time_remain == 1 then
		for i=-8, -1 do
			ui.removeTextArea(i,nil)
		end
		tfm.exec.newGame(current_map)
		calculateMatchTime()
	end
	if mode == "end" and time_remain <= 0 then
		lobby()
	end
	if permafrost == true or night_mode == true or gravity == true then
		pf_time=pf_time+1
		if pf_time == 7 then
			permafrost=false
			night_mode=false
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.freezePlayer(name,false)
			end
			ui.removeTextArea(999,nil)
		end
	end
end
lobby()
