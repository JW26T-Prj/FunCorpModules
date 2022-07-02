-- Mudanças na Versão 2.23.2:

-- Jogadores convidados (souris) não podem mais participar do jogo
-- Pequenas alterações de funcionamento
-- Adição do comando !reset

-- Script de Quiz de perguntas feito por Reksai_void2600#6638, versão 2.23.2
-- Por favor, edite a linha 24 a variável 'admin' pelo seu nome para ter acesso aos comandos.
-- Você pode selecionar o tema editando a linha 25, ou digitando !tema [número] conforme os números abaixo.

-- Temas:
-- 0 = transformice
-- 1 = conhecimentos gerais
-- 2 = música
-- 3 = league of legends
-- 4 = futebol

-- Esta é uma versão bloqueada. As perguntas não podem ser alteradas.
-- Para fazer um quiz utilizando suas próprias perguntas, utilize a versão desbloqueada:
-- https://github.com/JW26T-Prj/FunCorpModules/blob/master/QUIZ%20desbloqueado.lua

-- Para sugestões de perguntas ou correção de bugs contate Reksai_void2600#6638.

admin={"Reksai_void2600#6638"} -- FunCorps, insiram seus nomes aqui!
tema=0 -- Edite conforme mostrado acima!

piso={type = 6,width = 350,height = 40,foregound = 1,friction = 1.0,restitution = 0.0,angle = 0,color = 0,miceCollision = true,groundCollision = true,dynamic = false}
barreira={type = 12,width = 20,height = 100,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x000000,miceCollision = true,groundCollision = true,dynamic = false}
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"setq","limite","tema","get","tc","reset"} do
	system.disableChatCommandDisplay(g)
end
ratos=0; vivos=0; set_q=0; questions_list={}; modo="inicial"; pergunta=0; rodada=0; limite=20; count=0; fixed_cnt=0;
perguntas={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Em que ano o Transformice foi criado?","2009","2010",2,
"Qual dessas categorias de mapa representa um mapa excluído?","P43","P44",2,
"Qual destas tags é atribuída aos administradores do Transformice?","#0000","#0001",2,
"Quantos morangos são necessários para trocar de nickname no Transformice","1500","2500",1,
"Quantos queijos no perfil são necessários para rodar scripts LUA no cafofo?","100","1000",1,
"Se você digitar /cafe, o que acontece?","Abre o café","Faz aparecer cafés voadores",2,
"Quantos morangos custa o item mais caro da loja?","550","600",1,
"FunCorps fazem parte da Staff BR/PT.","Verdadeiro","Falso",2,
"Qual a categoria atribuída a mapas de Survivor?","P10","P12",1,
"Qual a função do comando /langue?","Muda a linguagem do jogo","Muda você de sala",1,
"Qual destes jogos não foi feito pela Atelier 801?","Bombom","Fortoresse",1,
"Qual o limite máximo de amigos do Transformice?","500","1000",1,
"Há quantos emoticons no Transformice?","10","14",1,
"Há quantas ações de rato no Transformice?","10","14",2,
"Qual o nome do antigo modo do module #deathmatch?","Baffbotffa","Baffbot",1,
"A partir de qual nível todas as árvores de habilidades de shaman são exibidas?","20","30",1,
"O que acontece se você digitar /version?","Mostra informações do jogo","Abre a versão do jogo",2,
"Qual título é desbloqueado quando você consegue 40.000 firsts?","RELÂMPAGO","Mestre do Vento",1,
"Existem quantas habilidades de Shaman no Transformice?","75","65",1,
"O jogo Transformice foi desenvolvido em qual país?","Estados Unidos","França",2,
"Qual destas tags é atribuída aos Modsents do Transformice?","#0010","#0015",2,
"Qual o nome da Deusa Shaman do Transformice?","Elise","Elisah",2,
"Qual destes modules foi desenvolvido por Sharpiepoops, pioneiro nos modules do Transformice?","#keyhunt","#campal",1,
"Originalmente no Transformice era possível criar mapas com quantos tipos de pisos?","5","8",1,
"Quem é o criador atual do module True or False?","Spectra_phantom#6089","Haxhhhhhhhhh#0000",1,
"Qual o nome da empresa que é responsável pelo Transformice?","Atelier 801","Riot Games",1,
"Qual destes pregos não pode ser utilizado no modo difícil?","Vermelho","Amarelo",1,
"Há quantas categorias de itens na loja?","16","17",2,
"Em que ano o Transformice atingiu seu número máximo de jogadores ativos?","2012","2013",1,
"Quantos queijos custa a exportação de um mapa como cafofo da tribo?","5","40",1,
"Quantos jogos a Atelier 801 tem atualmente?","5","6",2,
"Qual é a fricção e a restituição, respectivamente, de um piso de chocolate?","20 e 0","0 e 20",1,
"Qual destes usuários é responsável pelo module #anvilwar?","Jessiewind26#2546","Spectra_phantom#6089",2,
"Qual destes usuários é responsável pelo module #batata?","Laagaadoo#0000","Ikke#0095",1,
"Qual destes comandos é utilizado para a inserção de um código especial da Japan Expo?","/lua","/code",2,
"A habilidade 'Meep!' faz parte de qual árvore de Habilidades?","Selvagem","Físico",1,
"Qual a categoria atribuída a mapas de Cafofo da Tribo?","P22","P20",1,
"FunCorps são capazes de rodar scripts LUA em salas que não são de modules.","Verdadeiro","Falso",1,
"O cargo de Modsent é atribuído a jogadores que são...","Moderadores e FunCorps","Moderadores e Sentinelas",2,
"Quem é o gerenciador atual do module #pictionary?","Shamousey#0015","Ork#0015",1,
"Quantas árvores de habilidades de shaman existem no Transformice?","3","5",2,
"Qual o nome do cargo pré-definido do criador de uma tribo?","Shaman da Tribo","Líder Espiritual",2,
"Qual o nome do título que a Melibellule usa?","La Belette","Fromadmin",2,
"Qual a sigla dada ao 'banimento' permanente de uma conta do servidor?","BoS","Permaban",1,
"Em qual module você precisa se esconder atrás das decorações do mapa?","#prophunt","#hidenseek",2,
"Qual o nome da equipe que é responsável pela categorização de mapas do Transformice?","Module Team","MapCrew",2,
"Quantas vezes você precisa completar um mapa bootcamp para ele ser contabilizado no perfil, quando você acaba de entrar na sala?","1","2",2,
"Usuários do servidor BR/PT eram proibidos de falar no antigo servidor EN1.","Verdadeiro","Falso",2,
"Usuários do servidor BR/PT eram proibidos de falar no antigo servidor EN2.","Verdadeiro","Falso",1,
"O Transformice já fez, em 2019, um evento baseado em anime.","Verdadeiro","Falso",2,
"No Transformice, os ratos que tocarem em um piso ácido...","Ficam presos nele","Morrem instantaneamente",2,
"Qual o nome do criador do module que estamos jogando agora?","Reksai_void2600#6638","Patrick_mahomes#1795",1,
"A habilidade 'Reparadora' faz parte de qual árvore de Habilidades?","Mecânico","Físico",2,
"A mensagem de reinício do servidor do Transformice aparece em qual cor?","Rosa","Roxo",1,
"Quantos queijos custa o pelo mais caro da loja?","10000","15000",2,
"Quantos ratos salvos são necessários para desbloquear o modo difícil?","1000","2000",1,
"O Transformice possui uma série animada de desenhos no YouTube.","Verdadeiro","Falso",1,
"A técnica chamada 'time deviation' ou 'clock drift' pode deixar seu rato mais rápido ou lento sem uso de hack.","Verdadeiro","Falso",1,
"A habilidade 'Anjo' faz parte de qual árvore de Habilidades?","Mecânico","Mestre do Vento",2,
"Vanilla, Survivor e Defilante são modules do Transformice.","Verdadeiro","Falso",2,
"Quantos ratos salvos são necessários para desbloquear o modo divino?","5000","10000",1,
"Os membros da Staff podem entrar nos cafofos das tribos, mesmo não sendo membro delas.","Verdadeiro","Falso",1,
"Japan Expo é o nome de um evento do Transformice que acontece em qual país?","Japão","França",2,
"Qual dessas tags é atribuída aos FunCorps do Transformice?","#0015","Não tem tag definida",2,
"Qual dessas tags é atribuída aos MapCrews do Transformice?","#0020","Não tem tag definida",1,
"Qual destes comandos é utilizado para a inserção de um script LUA?","/lua","/code",1,
"Qual destes eventos não é mais utilizado no Transformice?","Carnaval","Natal",1,
"A habilidade 'Superstar' faz parte de qual árvore de Habilidades?","Selvagem","Guia Espiritual",2,
"Qual destes usuários nunca se tornou FunCorp?","Shamousey#0015","Bolodefchoco#0095",1,
"Se você ficar muito tempo dentro da água no Transformice, você morre automaticamente.","Verdadeiro","Falso",2,
"É possível ganhar queijos na loja apenas jogando modules.","Verdadeiro","Falso",1,
"Qual categoria de mapas é atribuída aos mapas de Defilante?","P18","P19",1,
"Qual o nome da equipe que é responsável pelos modules do Transformice?","Module Team","MapCrew",1,
"Qual categoria de mapas é atribuída aos mapas Racing?","P7","P17",2,
"Qual destes modules foi feito por um brasileiro?","#football","#parkour",2,
"Qual o nome do título que o Tigrounette usa?","La Belette","Les Populaires",1,
"A habilidade 'Espírito Ancestral' faz parte de qual árvore de Habilidades?","Guia Espiritual","Mestre do Vento",1,
"Quantos queijos custa a compra de um 2ª visual de roupas no Transformice?","100","1000",2,
"Qual o nome do antigo comando utilizado para alterar a taxa de quadros máxima operável pelo Transformice?","/fps36","/fps60",2,
"Quantos queijos custa a customização de uma roupa no Transformice?","2000","4000",1,
"Em qual ano estreou o sistema de missões no Transformice?","2019","2020",1,
"Em qual ano estreou o evento de Pesca do Transformice?","2011","2012",2,
"Quem foi o primeiro gerenciador do module Mestre Mandou?","Haxhhhhhhhhh#0000","Jessiewind26#2546",2,
"Quantos queijos custa a customização de um item de shaman no Transformice?","2000","4000",2,
"Qual o nome da plataforma de execução que o Transformice utiliza?","Adobe Air","Adobe Flash Player",2,
"Qual é o limite de taxa de quadros que o Transformice pode operar?","60 fps","Depende do cliente",1,
"É possível ganhar queijos no perfil apenas jogando modules.","Verdadeiro","Falso",2,
"É possível coletar estatísticas no perfil jogando quais modos oficiais?","Survivor, Racing e Vanilla","Survivor, Racing e Defilante",2,
"É possível comprar morangos pelo celular no Brasil.","Verdadeiro","Falso",2,
"Usuários do servidor BR/PT podem falar apenas no servidor brasileiro.","Verdadeiro","Falso",2,
"A habilidade 'Olho de Águia' faz parte de qual árvore de Habilidades?","Mecânico","Mestre do Vento",1,
"Em qual ano estreou o module #batata?","2014","2016",2,
"Em qual ano estreou o modo Defilante?","2014","2015",1,
"Qual modo do Transformice foi desativado devido a limitação dos vídeos no Transformice?","Music","Nekodancer",1,
"Em qual ano estreou o fórum em HTML5 do Atelier 801?","2015","2016",1,
"Usuários comuns não podem criar mapas nos quais os shamans possam usar portais.","Verdadeiro","Falso",2,
"Qual é a fricção e a restituição, respectivamente, de um piso de lava?","20 e 0","0 e 20",2,
"Apenas membros da Staff do Transformice podem criar mapas no modo Noite.","Verdadeiro","Falso",2,
"Qual a tribo do Tigrounette?","Lute como uma garota","Les Populaires",2,
"É necessário vincular uma conta de e-mail quando você cria novas contas no Transformice.","Verdadeiro","Falso",1,
"Qual título é desbloqueado quando você consegue 20.000 firsts?","RELÂMPAGO","Mestre do Vento",2,
"Qual título é desbloqueado quando você cria uma conta no Transformice?","Alpha & Ômega","Ratinho",2,
"É possível ganhar uma medalha exclusiva quando você entra no Transformice pela Steam.","Verdadeiro","Falso",1,
"Há quantos tipos de piso no Transformice?","16","18",2,
"Quantos pregos para o Shaman existem no Transformice?","3","5",2,
"Qual desses objetos de shaman é maior em altura?","Tábua gigante","Caixa grande",2,
"Quantos tamanhos de tábua existem no Transformice?","2","4",2,
"Em qual ano estreou o evento de Halloween do Transformice?","2011","2010",2,
"Para se usar o comando /lua no cafofo da tribo, você precisa ter a permissão de...","Usar o /np no cafofo","Mudar o cafofo da tribo",1,
"É possível deixar os pisos invisíveis no Transformice.","Verdadeiro","Falso",1,
"Qual a idade mínima para virar MapCrew no Transformice?","18","Não tem idade mínima",2,
"Qual título é desbloqueado quando você consegue 1 bootcamp?","Principiante","Recruta",2,
"Qual foi a maior quantidade de pessoas logadas no Transformice, aproximadamente?","100000","85000",2,
"Qual os nicks dos criadores do Transformice?","Melibellule e Tigrounette","Mellibellule e Galaktine",1,
"Quem é o gerenciador atual do module Mestre Mandou?","Rakan_raster#0000","Xayah_raster#0000",1,
"Quem é o criador do module O Chão é Lava?","Sett#6442","Osicat#0000",2,
"Qual o limite de consumíveis que podem ser armazenados no inventário?","80","200",1,
"Qual o nome do fun-site no qual você pode acessar um Ranking dos ratos?","Cheese For Mice","Viprin Drawing Editor",1,
"Qual o limite de jogadores em uma tribo no Transformice?","2000","5000",2,
"Qual o comando que serve para ver as combinações de roupa do jogo?","/dressing","/shop",1,
"O dono de uma tribo pode exibir mensagens no chat utilizando o comando /lua no cafofo da tribo.","Verdadeiro","Falso",2,
"Em qual ano estreou o evento de Natal do Transformice?","2011","2010",2,
"Qual é o primeiro nome do Tigrounette?","Jean","Dean",1,
"Qual destes eventos estreou primeiro no Transformice?","Halloween","Natal",1,
"Qual destes títulos é atribuído a quantidade de ratos salvos no modo difícil?","Virtuoso","Redentor",1,
"A partir de qual ano foi possível criar mapas com largura maior que a normal?","2012","2011",2,
"Em qual cidade fica situada a sede da Atelier 801?","Lille","Paris",1,
"Qual desses foi o primeiro desenvolvedor do module #perguntas?","Brenower#0000","Dhanny_mheyran#6701",2,
"Quantos firsts são necessários para desbloquear o título 'O Mito'?","1000","1100",2,
"Qual a largura máxima que um mapa pode ter sem ter o modo defilante ativado?","1600","4800",1,
"Qual destes objetos não pode ser utilizado no modo difícil?","Sp","Seta",1,
"A seta é sempre o primeiro item do shaman.","Falso","Verdadeiro",1,
"É possível se casar com mais de um jogador no Transformice em determinados servidores.","Verdadeiro","Falso",2,
"Qual a idade mínima para virar moderador no Transformice?","18","Não tem idade mínima",1,
"Qual foi a última versão do Flash Player que o Transformice deu suporte?","32.0","33.0",1,
"Qual a idade mínima para virar FunCorp no Transformice?","16","Não tem idade mínima",2,
"Quantos tamanhos de tela de cinema existem no Transformice?","2","3",1,
"É possível mudar a cor da água do Transformice utilizando somente o Editor de Mapas.","Verdadeiro","Falso",2,
"É possível carregar imagens nos mapas utilizando apenas no Editor de Mapas.","Verdadeiro","Falso",1,
"Em teoria, qual a largura máxima que um mapa no Transformice pode ter?","9830","Não há limite teórico",2,
"Em teoria, qual a altura máxima que um mapa no Transformice pode ter?","9830","Não há limite teórico",2,
"Quem é o criador atual do module #unotfm?","Ninguem#0095","Spectra_phantom#6089",1,
"Em qual ano foi introduzido o esquema de #tags nos nomes do Transformice?","2018","2019",1,
"Quantos bootcamps são necessários para desbloquear o título Recruta?","1","3",1,
"Quantos firsts são necessários para desbloquear o título 'Rato Pirata'?","100","200",1,
"Usuários podem adicionar imagens no cafofo da tribo utilizando o comando /lua.","Verdadeiro","Falso",1,
"Quando um rato morre no Transformice, começa a sair...","Bolhas","Sangue",1,
"Qual é o nome do primeiro module do Transformice?","sharpie debuglua","batata",1,
"Quantos ratos salvos são necessários para desbloquear o título 'Shaman'?","1000","2000",1,
"Qual destes comandos servem para ver informações do mapa atual?","/map","/info",2,
"Para usar o café, você precisa estar com quantos dias jogados de conta?","10","30",2,
"Em qual dia do ano o Transformice foi criado?","1","2",1,
"Qual o limite de queijos que podem ser armazenados no inventário?","200","250",2,
"Quantos anos tem o Tigrounette?","33","35",2,
"Qual o nome da única mulher que criou um module semi-oficial no Transformice?","Morganadxana#0000","Lanadelrey#4862",1,
"Ainda é possível colocar músicas no cafofo da tribo do Transformice, mesmo sem o plug-in do YouTube.","Verdadeiro","Falso",1,
"Qual o nome de um module de testes extinto em que todos viravam Pikachu e tinham que descer a ladeira?","#surble","#surbler",1,
"No começo da vida do Defilante, quem ganhava as partidas recebia 2 firsts e quantos queijos?","0","2",1,
"Qual destas categorias de mapas é atribuída a mapas de Survivor Vampiro?","P11","P13",1,
"O module #freezertag antes era um submódulo de qual module?","#parkour","#circuit",1,
"Qual o nome do código que é usado para carregar mapas do Transformice?","Lua","XML",2,
"Qual destes usuários nunca se tornou FunCorp?","Patrick_mahomes#1795","Pamots#0095",1,
"Qual destes modules não foi feito por um brasileiro?","#anvilwar","#freezertag",1,
"Qual destas ratas morreu na vida real, dando origem a uma decoração do Transformice?","Elise","Papaille",1,
"Em qual mês do ano geralmente termina o evento de Natal?","Dezembro","Janeiro",2,
"Em qual ano foram introduzidos os modules no Transformice?","2014","2013",2,
"Qual destes comandos servem para ver os seus mapas criados?","/maps","/lsmap",2,
"Quem é o criador e gerenciador atual do module #shamousey?","Shamousey#0015","Ninguem#0095",1,
"Quantos queijos são necessários para exportar um mapa como cafofo da tribo?","5","40",1,
"Quantos objetos de shaman podem ser utilizados no modo padrão?","13","14",2,
"Em qual ano houve o desban de todas as contas banidas permanentes no Transformice?","2012","2013",2,
"Em qual país está situado o host de baixo ping disponível no Brasil?","Canadá","México",1,
"Qual categoria de mapas é atribuída aos mapas permanentes de modules?","P41","P43",1,
"Em qual ano surgiu o sistema de missões diárias no Transformice?","2018","2019",2,
"Qual a idade mínima para virar membro da Module Team no Transformice?","16","Não tem idade mínima",2,
"Qual destes comandos servem para ver informações ténicas do cliente e do sistema?","/info","/^^",2,
"Qual o último título desbloqueável de queijos do Transformice?","MEU QUEIJO!","Alpha & Omega",1,
"Para falar no café, você precisa de quantos queijos no perfil?","100","1000",2,
"Qual destes modules não existe mais?","#madchess","#minigolf",1,
"Qual comando é utilizado para ver a árvore de funções e eventos LUA do Transformice?","/luahelp","/luatree",1,
"Qual era o nome da sala que, após uma sequência de comandos, dava morangos de graça?","286637850","286657250",1,
"Em qual ano foi lançado o primeiro servidor brasileiro do Transformice?","2010","2011",2,
"Em qual ano foi lançada a Plataforma Comunitária do Transformice?","2013","2014",1,
"O que acontece quando você digita /zimmer 5?","Te dá 5 queijos de graça","Leva você para a sala 5",2,
"Em qual mês do ano o Transformice foi criado?","Maio","Junho",1,
"Qual comando serve para ver a versão do Transformice?","/version","/transformice",1,
"Qual a tag atribuída a ex-membros da equipe do Transformice?","#0020","#0095",2,
"Tigrounette é homem ou mulher?","Homem","Mulher",1,
"É possível presentear outros ratos com itens da loja utilizando somente queijos.","Verdadeiro","Falso",2,
"Qual a função da habilidade de shaman 'Superstar'?","Os ratos ao redor dançam","Os ratos ao redor beijam",1,
"Qual o último título de ratos salvos pelo Shaman?","Virtuoso","Alpha & Ômega",2,
"Qual o nome do jogo de Zumbis lançado pela Atelier 801?","League of Legends","Dead Maze",2,
"Quantas medalhas comemorativas de aniversário existem no Transformice?","2","10",1,
"Em qual árvore de habilidades está presente a habilidade 'Desintegração controlada'?","Físico","Mecânico",1,
"Em qual ano foi lançado o Poisson, antigo jogo que depois tornou o Transformice?","2010","2008",2,
"Por quantas horas você é banido por Hack no Transformice, por padrão?","360","168",1,
"Qual o nome do antigo jogo do Transformice para celular?","Dead Maze","Run For Cheese",2,
"Os donos da Atelier 801 e da Ubisoft já se encontraram pessoalmente.","Não","Sim",1,
"Em qual árvore de habilidades está presente a habilidade 'Volta da natureza'?","Físico","Selvagem",2,
"Qual o nome atual da ex-modsent Racola?","Alriy#0095","Keith#0095",1,
"Quantos ratos salvos são necessários para desbloquear o modo normal?","0","1000",1,
"Quando você cria uma conta no Transformice, seu inventário vem vazio.","Verdadeiro","Falso",2,
"Qual o comando que desbloqueia um item de cabeça de bolo?","/atelier801","/transformice",1,
"O capacete de 20 queijos é a única roupa que pode ser customizado sem gastar queijos/morangos.","Verdadeiro","Falso",1,
"A partir de 2021, só será possível jogar Transformice através da Steam.","Verdadeiro","Falso",2,
"Qual o último título de ratos salvos em modo difícil pelo Shaman?","Virtuoso","Alpha & Ômega",1,
"É possível mudar a gravidade do mapa no Transformice utilizando código LUA.","Verdadeiro","Falso",1,
"Apenas membros da Module Team podem carregar modules nas salas do Transformice.","Verdadeiro","Falso",2,
"Quantos servidores host da Atelier801 existem no Brasil?","0","1",1,
"Qual é a margem máxima offscreen de largura e altura no qual os ratos podem permanecer vivos?","400px por lado","800px por lado",1,
"Quantos modules oficiais existem no Transformice?","37","43",2,
"Qual é a resolução de tela padrão na qual o Transformice funciona?","800x600","1024x768",1,
"Qual a função da habilidade de shaman 'Arquiteto'?","Remover um objeto invocado","Alterar a transparência de um objeto invocado",2,
"Quanto tempo dura um mapa normal no Transformice, sem o uso de powerups?","2 minutos","2 minutos e 30 segundos",1,
"A primeira compra de um visual no Transformice é gratuita.","Verdadeiro","Falso",2,
"É possível esconder todos os pregos em um mapa do Transformice.","Verdadeiro","Falso",1,
"Quais são os valores padrões de vento e gravidade no Transformice, respectivamente?","0 e 1","0 e 10",2,
"Quantos queijos no perfil são necessários para entrar no Editor de Mapas?","0","1000",1,
"Qual é a tribo oficial da equipe de Funcorp BR/PT?","Alaranjados","Funcrepe",1,
"É possível criar NPCs interativos em scripts LUA no Transformice.","Verdadeiro","Falso",1,
"Quantas missões diárias você precisa completar para ganhar a recompensa de 20 morangos?","15","20",2,
"Qual destes modules foi criado primeiro?","#batata","#keyhunt",2,
"Qual destes usuários nunca se tornou FunCorp?","Spectra_phantom#6089","Reksai_void2600#6638",1,
"O comando /ban já serviu para banir jogadores do Transformice por 1 hora por voto popular.","Verdadeiro","Falso",1,
}
perguntas1={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Qual a fórmula da água?","H20","H2O",2,
"Em que ano foi derrubado o Muro de Berlim?","1989","1991",1,
"Qual o nome da figura de linguagem que representa sons de animais e objetos, por exemplo?","Onomatopeia","Personificação",1,
"Qual o nome do vírus transmissor da Dengue, Chikungunya e Zica?","Aedes Aegypti","Tripanossoma Cruzi",1,
"Segundo a Mitologia Grega, qual o nome dado ao lugar localizado no Submundo?","Inferno","Tártaro",2,
"Quantos rios conseguem cortar o Deserto do Saara sem secar?","1","Nenhum",1,
"Quantas camadas possui a atmosfera da Terra?","4","5",2,
"A quantos graus °C a água ferve aproximadamente, no topo do Monte Everest?","100","71",2,
"O clima Subtropical é o predominante na região Nordeste do Brasil.","Verdadeiro","Falso",2,
"Qual foi o Presidente eleito nas eleições brasileiras de 1998?","Fernando Henrique Cardoso","Lula",1,
"Fernando Collor de Mello foi o primeiro e único presidente a sofrer Impeachment no Brasil.","Verdadeiro","Falso",2,
"Qual era o Presidente dos Estados Unidos no ano do ataque às Torres Gêmeas?","J.F. Kennedy","George W. Bush",2,
"Na matemática, qual o nome da sequência onde o resultado é a soma dos dois números anteriores?","Fibonacci","Pascal",1,
"A cidade do Rio de Janeiro foi capital do Brasil até que ano?","1889","1960",2,
"A área de um círculo pode ser calculada utilizando qual fórmula?","2.πr","π.r²",2,
"Quantos anos possui Silvio Santos?","89","91",2,
"Qual destes mares possui maior concentração de sal por litro de água?","Mar Morto","Mar Mediterrâneo",1,
"A Rodovia Presidente Dutra, que liga os estados do RJ e SP, foi construída em qual governo Brasileiro?","Getúlio Vargas","Eurico Gaspar Dutra",2,
"Qual é a unidade utilizada para medir a altura de sons?","decibéis","watts",1,
"O ponto de maior altitude do Brasil fica localizado a quantos metros, aproximadamente?","2500","3000",2,
"Qual é a fórmula para converter graus °C em graus °K?","K = C + 273","K = -40 + ((18 * C) - 40)",1,
"Qual é o nome da fórmula utilizada para calcular equações do segundo grau?","Fórmula de Bhaskara","Teorema de Pitágoras",1,
"Quantos planetas existem no Sistema Solar?","8","9",1,
"Qual cidade do Rio de Janeiro é conhecida como 'Cidade Imperial'?","Petrópolis","Angra dos Reis",1,
"Quantas usinas nucleares o Brasil possui funcionando?","2","5",1,
"Qual foi o nome da pandemia que matou milhões de pessoas ao redor mundo no começo do século XX?","Covid-19","Gripe Espanhola",2,
"Qual o oceano da Terra que possui a maior profundidade média?","Oceano Pacífico","Oceano Atlântico",1,
"As nuvens são feitas de quê?","Vapor de água","Algodão",1,
"Qual o estado da água quando ela passa diretamente do estado sólido para o gasoso, ou vice-versa?","Condensação","Sublimação",2,
"A chegada da Família Real Portuguesa ao Brasil ocorreu em qual ano?","1808","1822",1,
"Qual destes é o maior deserto da Terra?","Deserto do Saara","Antártida",2,
"Quantos anos durou o Regime Militar no Brasil?","21","25",1,
"Qual dessas emissoras de televisão foi a primeira da América Latina?","Rede Tupi","Rede Manchete",1,
"Uma polegada equivale a quantos centímetros, aproximadamente?","2.5 cm","3.3 cm",1,
"Em qual ano ocorreu o último Censo do IBGE?","2010","2020",1,
"O Arco do Triunfo, localizado na França, é uma homenagem a...","Napoleão Bonaparte","George Washington",1,
"Na matemática, qual o nome do triângulo em que a soma dos números centrais é igual à soma das coeficientes binomiais?","Triângulo de Newton","Triângulo de Pascal",2,
"Quais os povos que dominaram a região da Islândia no século IX?","Bárbaros","Vikings",2,
"Qual o nome da região de relevo localizada na região Nordeste do Brasil, sendo responsável pelo clima da região?","Planalto da Borborema","Pico das Agulhas Negras",1,
"Em qual continente fica localizado o monte Everest?","Europa","Ásia",2,
"De onde é a invenção do chuveiro elétrico?","França","Brasil",2,
"Qual destes pontos turísticos brasileiros fica localizado no estado da Bahia?","Casa de Santos Dumont","Elevador Lacerda",2,
"Quantos elementos químicos a tabela periódica possui?","113","118",2,
"Qual a montanha mais alta do Brasil?","Pico da Neblina","Pico da Bandeira",1,
"Qual destes reinos de seres vivos é considerado o Reino das Bactérias?","Monera","Protista",1,
"Quantos presidentes tivemos no Brasil desde a Redemocraticação, em 1985?","7","8",2,
"O que significa a sigla CPF?","Cadastro de Pessoa Física","Crédito de Pessoa Física",1,
"Quantos livros possui a Bíblia Sagrada?","62","66",2,
"Qual foi o primeiro homem a descobrir o Brasil?","Pedro Álvares Cabral","Duarte Pacheco Pereira",2,
"Qual destes equipamentos foi o grande carro-chefe da Primeira Revolução Industrial?","Máquina a vapor","Engrenagem",1,
"Em qual ano ocorreu a missão da Apollo 8?","1968","1969",1,
"Segundo a Mitologia Grega, qual destes seres teve suas asas destruídas ao chegar perto do Sol?","Afrodite","Ícaro",2,
"Qual destas unidades de medida é utilizada para medir a resistência de um objeto?","Ohm","Coulomb",1,
"Em qual oceano da Terra está localizada a Fossa das Marianas?","Oceano Pacífico","Oceano Índico",1,
"Qual foi o último período da Terra em que os dinossauros viveram?","Jurássico","Cretáceo",2,
"Em qual cidade ocorreu a primeira edição dos Jogos Olímpicos?","Atenas","Paris",1,
"O Rio Nilo é o maior e mais caudaloso rio da Terra.","Verdadeiro","Falso",2,
"O Rio Amazonas é formado pelo encontro de quais rios?","Negro e Tapajós","Negro e Solimões",2,
"A Floresta Amazônica é o lugar natural com maior geração de oxigênio do mundo.","Verdadeiro","Falso",2,
"De quem é a famosa frase 'Penso, logo existo'?","Aristóteles","René Descartes",2,
"Qual é o nome dado para as bactérias que precisam de oxigênio para se reproduzirem?","Aeróbicas","Anaeróbias",1,
"Qual o nome da operação inversa da raiz quadrada?","Potenciação","Subtração",1,
"Quantas estrelas existem no Sistema Solar?","1","O número é tão grande que nem cabe",1,
"Quando uma estrela com 10 ou menos massas solares chega no final do seu tempo de vida, ela vira um(a)...","Buraco Negro","Anã Branca",2,
"Quantos anos durou a Guerra dos Cem Anos?","100","116",2,
"Existem milhares de jacarés e capivaras no fundo do Rio Amazonas.","Verdadeiro","Falso",2,
"Qual a raiz quadrada de -16?","-4","Não existe",2,
"Qual é o nome da maior estrela já conhecida no Universo?","Canis Majoris","UY Scuti",2,
"Em qual ano foi lançado o primeiro Windows?","1985","1995",1,
"Qual destes elementos químicos é utilizado para produzir equipamentos eletrônicos?","Silício","Rambônio",1,
"Qual destes elementos químicos fica líquido na temperatura ambiente?","Água","Mercúrio",2,
"Qual destas categorias é necessária na carteira de habilitação para dirigir motos?","Categoria A","Categoria B",1,
"O ano-luz é uma unidade de medida de...","Tempo","Distância",2,
"Qual foi o cineasta que chegou no fundo da Fossa das Marianas, lugar mais profundo do oceano?","James Cameron","Jacques Piccard",1,
"Qual é o nome dado para as bactérias que não precisam de oxigênio para se reproduzirem?","Aeróbicas","Anaeróbias",2,
"Qual destes tipos de clima é encontrado no Brasil?","Semiárido","Mediterrâneo",1,
"Quantas capitais a África do Sul possui?","2","3",2,
"Quem é o Deus da mitologia Nórdica?","Zeus","Odin",2,
"Em 1889, qual destas cidades foi a capital do Brasil?","Rio de Janeiro","Petrópolis",2,
"Por quantos anos durou a Era Vargas, primeiro período no qual Getúlio Vargas foi presidente do Brasil?","8","15",2,
"Qual é o nome oficial da Ponte Rio-Niterói?","Ponte Presidente Costa e Silva","Ponte Presidente Mário Andreazza",1,
"Por qual nome também é conhecido o Rio São Francisco?","Velho Chico","Três Corações",1,
"Em qual cidade estão situadas as únicas usinas nucleares em funcionamento no Brasil?","Angra dos Reis","Cabo Frio",1,
"Qual foi o último ano em que tivemos vulcões em erupção no Brasil?","65 milhões de anos A.C","3 milhões de anos A.C",1,
"Qual o nome da cidade que fica localizada entre os rios Tigre e Eufrates?","Jerusalém","Mesopotâmia",2,
"A partir de qual ano passou a ser utilizado o Novo Padrão Ortográfico no Brasil?","2009","2010",1,
"Qual destes municípios faz parte da chamada Região dos Lagos do estado do Rio de Janeiro?","Angra dos Reis","Armação dos Búzios",2,
"Quantos quilômetros a luz percorre no vácuo durante 1 mês?","777062051136000","777600000000000",1,
"Copacabana é um bairro ou uma cidade?","Bairro","Cidade",1,
"Qual o nome do cartunista que fez a Turma da Mônica?","Maurício de Sousa","Maurício de Souza",1,
"Qual o nome do cartunista que fez o Menino Maluquinho?","Ziraldo","Monteiro Lobato",1,
"Qual destes candidatos a Presidência da República em 2014 morreu em um acidente de avião?","Marina Silva","Eduardo Campos",2,
"Quantas Constituições o Brasil teve desde seu descobrimento?","5","7",2,
"Qual destes gases existe em maior quantidade na atmosfera da Terra?","Nitrogênio","Oxigênio",1,
"Quantos reinos de seres vivos existem na Terra?","5","7",1,
"Um microfone pode ser utilizado para geração de energia elétrica.","Verdadeiro","Falso",1,
"Na matemática, qual o nome da operação inversa da Derivação?","Integração","Generalização",1,
"Qual o nome dado a doença nos homens cujo possuem problemas onde o pênis não completa totalmente a glande?","Balanite","Fimose",2,
"Quanto tempo leva para a Terra dar uma volta completa em torno do Sol, aproximadamente?","365 dias","365 dias e 6 horas",2,
"Qual o nome dado para o espectro de luz que fica acima da luz visível?","Infravermelho","Ultravioleta",2,
"Qual o nome do empresário que foi responsável pela inauguração da Televisão no Brasil?","Silvio Santos","Assis Chateaubriand",2,
"Em qual ano foi promulgada a Constituição em vigor no Brasil?","1988","1978",1,
"O quilograma é uma unidade de medida usada para medir...","Peso","Massa",2,
"Qual destes lugares é maior em questão de área?","Distrito Federal","Vaticano",1,
"Qual é a fórmula do Cloreto de Sódio, também conhecido como sal de cozinha?","NaCl","NaCO₂",1,
"Qual destas espécies de tubarão pode viver também na água doce?","Tubarão-touro","Tubarão-baleia",1,
"Qual o nome dado a linguagem utilizada no Egito Antigo, com 'imagens' ao invés de letras?","Ideografias","Hieróglifos",2,
"Qual o nome do livro sagrado que é utilizado no Islamismo?","Alcorão","Tripitaka",1,
"Dos tipos de ondas a seguir, qual possui mais chance de causar câncer ao corpo humano?","Raios X","Raios Gama",2,
"Qual o nome dado aos seres que vivos que possuem apenas 1 célula?","Unicelulares","Pluricelulares",1,
"Qual o nome do supercontinente que existia na Terra antes deles serem divididos?","Pangeia","Pantalassa",1,
"A Bolívia é o único país da América do Sul localizado próximo da Cordilheira dos Andes.","Verdadeiro","Falso",2,
"Em média, quantos metros de profundidade você precisa descer para chegar a uma pressão atmosférica de 2 atm?","10 metros","20 metros",1,
"No geral, Terremotos e maremotos acontecem quando duas ou mais placas tectônicas...","Se separam uma da outra","Colidem uma com outra",2,
"Qual o nome da tecnologia que era utilizada na maioria dos equipamentos eletrônicos, do início do século XX até o anos 70?","Válvula","Transformador",1,
"Em qual ano terminou a Segunda Guerra Mundial?","1942","1945",2,
"Em qual ano ocorreu a Quebra da Bolsa de Nova York?","1929","1930",1,
"Qual destes gases geralmente é presente dentro dos túneis de trânsito, e que podem causar problemas ao sistema respiratório?","CO","CO₂",1,
"De 1994 a 2016, dois partidos estiveram na presidência do Brasil. Quais são esses partidos?","PT e PSDB","PT e PMDB",1,
"Em que ano foi desenvolvido o Windows 2000?","1999","2000",1,
"Quantos anos têm a Rainha Elizabeth?","95","96",2,
"A partir de que ano Plutão deixou de ser considerado Planeta e foi considerado Planeta Anão?","2005","2006",2,
"O seriado Chaves foi produzido em qual país?","México","Argentina",1,
"A primeira emissora da Rede Globo foi lançado em qual estado do Brasil?","São Paulo","Rio de Janeiro",2,
"Quantos continentes tem o Planeta Terra?","5","6",2,
"É possível atirar com uma arma no espaço.","Verdadeiro","Falso",1,
"Qual o nome do lugar mais quente do Planeta Terra?","Rio de Janeiro","Núcleo",2,
"A partir de qual ano o Real passou a ser a moeda oficial do Brasil?","1994","1995",1,
"Em qual estado fica localizada a Casa da Moeda do Brasil?","Rio de Janeiro","Distrito Federal",1,
"Em que ano Lula foi eleito pela primeira vez presidente do Brasil?","2000","2002",2,
"Durante o período do Regime Militar, existiram basicamente dois partidos políticos. Quais eram eles?","ARENA e PT","ARENA e MDB",2,
"Nenhum elemento conhecido da tabela periódica consegue se manter sólido na superfície do Sol.","Verdadeiro","Falso",1,
"Qual foi a menor temperatura registrada no Planeta Terra, aproximadamente?","-88.5°C","-89.2°C",2,
"Qual é a capital da Austrália?","Sydney","Camberra",2,
"Em que ano foi inaugurada a Televisão no Brasil?","1950","1960",1,
"O Canguru é um animal nativo de qual país?","Madagascar","Austrália",2,
"Qual destas ilhas é banhada pelo Rio Amazonas?","Fernando de Noronha","Ilha de Marajó",2,
"Em que ano o YouTube foi inaugurado?","2005","2007",1,
"Os Estados Unidos são formados por quantos estados?","44","50",2,
"A atriz e humorista Dercy Gonçalves morreu com quantos anos?","94","101",2,
"Qual destes é o computador pessoal mais vendido de todos os tempos?","Commodore 64","Apple II",1,
"Qual destes pontos turísticos fica localizado na cidade de Lisboa, em Portugal?","Castelo de Itaipava","Castelo de São Jorge",2,
"Qual destas novelas da Globo não foi produzida no Brasil?","Salve Jorge","Terra Nostra",2,
"Qual o nome da linha imaginária onde é considerado o limite entre a atmosfera da Terra e o espaço?","Linha de Kárman","Linha de Rochê",1,
"A empresa Sony, famosa por diversos tipos de aparelhos musicais, foi fundada antes ou depois da Segunda Guerra Mundial?","Antes","Depois",2,
"Em que ano começou oficialmente a operação da Usina de Itaipu?","1984","1985",1,
"Em que ano começaram as transmissões de TV Digital no Brasil?","2007","2010",1,
"Qual é a língua mais falada no mundo atualmente?","Inglês","Mandarim",2,
"Qual o nome da extinta fabricante brasileira de carros?","Corcel","Gurgel",2,
"Quantos oceanos existem no Planeta Terra?","3","5",2,
"Em que data ocorreu a promulgação da Lei do Ventre Livre?","28 de Setembro","4 de Outubro",1,
"Em que data terminou a Batalha do Tuiuti, uma das mais importantes da Guerra do Paraguai?","24 de Maio","4 de Junho",1,
"Quais destas duas empresas fabricaram computadores pessoais no Brasil nos anos 80?","Prológica e Gradiente","Prológica e Microdigital",2,
"Em que ano a União Soviética foi extinta?","1990","1991",2,
"Qual destes browsers de Internet foi desenvolvido primeiro?","Mozilla Firefox","Google Chrome",1,
"A famosa obra de arte 'Monalisa', de Leonardo da Vinci, é encontrada em qual museu?","Museu do Louvre","Museu de Atenas",1,
"Em qual ano foi assinado o Tratado de Tordesilhas?","1494","1504",1,
"Qual foi o presidente do Brasil que durou mais tempo no poder?","Getúlio Vargas","Fernando Henrique Cardoso",1,
}
perguntas2={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Em que ano morreu Chester Bennington, ex-vocalista do Linkin Park?","2017","2019",1,
"Em qual ano ocorreu a primeira edição do Rock in Rio?","1985","1987",1,
"Qual o nome da embalagem que é utilizada para guardar CDs?","Jensen Case","Jewel Case",2,
"Qual é a duração média de um disco de vinil (LP)?","20 minutos por lado","30 minutos por lado",1,
"Qual é o material utilizado nos antigos discos de 78rpm, utilizados antes do surgimento do LP?","Silicone","Goma Laca",2,
"Qual é o nome da música utilizada na abertura do programa Big Brother Brasil?","Vida Real","A Cruz e a Espada",1,
"Qual é o nome da música utilizada na abertura da novela O Rei do Gado?","O Rei do Gado","Orquestra da Terra",1,
"De quem é a música 'Meu Mundo e Nada Mais'?","Antônio Fagundes","Guilherme Arantes",2,
"Qual é a música, que quando ouvida ao contrário, há referências satânicas?","Hotel Califórnia","Empty Spaces",1,
"Em qual ano foi introduzidos os CDs no Brasil?","1982","1984",2,
"A música 'Festa do Apê', do cantor Latino, é uma versão brasileira adaptada de qual música?","O-Zone","Dragostea Din Tei",2,
"Qual é o limite máximo de músicas que podem ser colocadas em um LP?","10","Não existe limite teórico",2,
"Qual destas músicas não foi cantada pela cantora Evanescence?","Bring Me To Life","Over and Under",2,
"Qual foi o álbum lançado pelo Nirvana que possui a famosa capa com um bebê debaixo d'água?","Nevermind","Bleach",1,
"A banda de rock cristão Katsbarnea é de qual país?","Ucrânia","Brasil",2,
"A banda de rock alternativo Egypt Central é de qual país?","Egito","Estados Unidos",2,
"Qual destas músicas do Tim Maia é muito semelhante a abertura da 6ª temporada de Jojo's Bizarre Adventures?","O Descobridor dos Sete Mares","Do Leme ao Pontal",1,
"Complete a música: Do Leme ao Pontal... [...] Sem contar com Calabouço, Flamengo, Botafogo, Urca, ...","Praia Vermelha","Praia de Ipanema",1,
"Qual destes gravou a música 'Pra não dizer que não falei das Flores', que retrata o período de censura do AI-5 do Regime Militar?","Geraldo Vandré","Vanusa",1,
"Qual destas músicas foi gravada no primeiro EP da banda Linkin Park, lançada em 1999?","In the End","Carousel",2,
"Complete a música: Rimas de ventos e velas, vida que vem e que vai, a solidão que fica e entra...","Me arremessando contra o cais","Me arremessando contra o vento",1,
"Qual destas cantoras morreu em 2021 em um acidente de avião em Minas Gerais?","Marília Mendonça","Pablo Vittar",1,
"A cantora Shirley Carvalhaes lançou seu primeiro álbum em qual ano?","1977","1987",1,
"O primeiro protótipo de disco de vinil foi apresentado no Brasil.","Verdadeiro","Falso",2,
"Em qual estado do Brasil nasceu a cantora Aline Barros?","São Paulo","Rio de Janeiro",2,
"De qual ano é a música 'Show das Poderosas', da cantora Anitta?","2012","2014",1,
"O álbum Toxicity, do System of a Down, foi lançado uma semana antes de qual grande evento acontecer?","Ataque às Torres Gêmeas","Morte de Osama Bin Laden",1,
"Qual destas músicas foi utilizada no filme 'Transformers: Revenge of the Fallen'?","You Make me Sick","New Divide",2,
"Qual destes políticos já gravou um álbum musical?","Marcelo Crivella","Bruno Covas",1,
"[...] Uma história de amor, de aventura e de magia...  Qual o nome desta música de Sandy e Júnior?","Uma História de Amor","Era uma Vez",2,
"O single da música Razões e Emoções, do NX Zero, foi lançada em qual ano?","2006","2007",2,
"Rádio Pirata foi o nome do primeiro álbum lançado pela banda RPM.","Verdadeiro","Falso",2,
"Qual destas músicas foi utilizada na novela Páginas da Vida?","Se Quiser","Páginas da Vida",1,
"Qual destes foi o primeiro vocalista da banda NX Zero?","Yuri Nishida","Di Ferrero",1,
"Complete a música: Ah, meu coração é um campo minado... Muito cuidado...","Ele pode explodir","Com a traição",1,
"A banda Charlie Brown Jr. foi formada na cidade de Santos.","Verdadeiro","Falso",1,
"Qual era o nome do equipamento que era utilizado para ouvir músicas por fita cassete e podia ser transportado facilmente?","Discman","Walkman",2,
"Quais foram as empresas que foram responsáveis pelo desenvolvimento dos CDs?","Sony e Pioneer","Sony e Philips",2,
"Qual destes funkeiros gravou a música 'Olha a Explosão'?","MC Livinho","MC Kevinho",2,
"O cantor Renato Russo, que era do Legião Urbana, morreu de consequências do(a)...","AIDS","Câncer",1,
"A cantora gospel Cassiane gravou seu primeiro álbum com quantos anos de idade?","8 anos","12 anos",1,
"O cantor e compositor Marcos Witt nasceu em qual país?","México","Estados Unidos",2,
"A música Copacabana, de Barry Manilow, fala majoritariamente sobre...","a Praia de Copacabana","um Bar americano chamado Copacabana",2,
"Qual destas bandas de black metal possui o mesmo nome de uma criatura mitológica da Bíblia Sagrada?","Anthrax","Behemoth",2,
"De quem é a música 'Ai se eu te Pego'?","Luan Santana","Michel Teló",2,
"Qual destas músicas foi utilizada como abertura da série Malhação, na temporada de 2004?","Te Levar","Vou Deixar",1,
"Qual é o tamanho de um disco de vinil do tipo Single, que armazenava no máximo 2 faixas por lado?","7 polegadas","10 polegadas",1,
"Qual destas músicas do Guilherme Arantes fala sobre a importância da água no Planeta Terra?","Planeta Água","Águas",1,
"Qual o nome do extinto programa de televisão que era focado em tocar Funk?","Estação Funk","Furacão 2000",2,
"Qual o nome do integrante do Roupa Nova que faleceu na metade de 2021?","Ricardo","Paulinho",2,
"Complete a música: I know you're somewhere out there...","Somewhere far away","I sit by myself",1,
"'Eu só quero é ser feliz, andar tranquilamente na favela onde eu nasci...' Qual o nome desta música?","Eu só Quero é Ser Feliz","Rap da Felicidade",2,
"A música Master of Puppets do Metallica foi gravada em que ano?","1985","1986",2,
"A partir de qual ano os discos de vinil (LP) pararam de ser fabricados no Brasil?","1997","2000",2,
"Em qual ano começaram as transmissões de rádio FM no Brasil?","1955","1962",1,
"A música Admirável Chip Novo, da cantora Pitty, faz referência a qual livro famoso?","Admirável Mundo Novo","Admirável Tempo Novo",1,
"De quem é a música 'Deixa a Vida me Levar'?","Zeca Pagodinho","Rodrigo Abrantes",1,
"Quantas sinfonias Beethoven compôs?","9","11",1,
"Complete a música: Cheiro de pneu queimado, carburador furado, o X9 foi...","Torrado","Morto",1,
"Bob Marley nasceu em qual país?","África do Sul","Jamaica",2,
"Qual o nome da música que foi utilizada no encerramento das programações diárias do SBT, da metade dos anos 80 até a metade dos anos 90?","The Fight","Over the Top",1,
"Em qual ano ocorreu o acidente aéreo que vitimou todos os integrantes da banda Mamonas Assasinas?","1996","1997",1,
"Bruno Mars nasceu em qual país?","Estados Unidos","Inglaterra",1,
"Qual o nome original da cantora Lana Del Rey?","Elizabeth Woolridge Grant","Elizabeth Cambridge Grant",1,
"A famosa música 'Faz Um Milagre em Mim' do cantor Régis Danese, foi lançada em qual ano?","2008","2009",1,
"A música 'Because of You' foi originalmente gravada por qual cantora em 2004?","Kelly Clarkson","Lana del Rey",1,
"A música 'Caneta Azul', que fez muito sucesso em 2019, foi gravada por quem?","Manoel Elias","Manoel Gomes",2,
"O CD foi o primeiro formato de mídia digital que existiu.","Verdadeiro","Falso",2,
"Quantos álbuns a cantora Vanusa gravou?","20","22",2,
"Antes de entrar na carreira solo, a cantora Ivete Sangalo fazia parte de qual grupo?","Banda Eva","Banda Canal",1,
"A nota 'Lá' representa uma frequência de quantos Hz, aproximadamente?","400 Hz","440 Hz",2,
"Qual destas músicas foi tema da novela Anjo Mau, na versão de 1976?","Meu Mundo e Nada Mais","Sonho de Ícaro",1,
"Complete a música: Quando a chuva passar, quando o tempo abrir... Abra a janela e...","Veja a luz do Sol","Veja, eu sou o Sol",2,
"Qual o nome da música do Mamonas Assassinas que é uma sátira a um grupo que vendia produtos diferenciados na década de 90?","1406","Consumismo",1,
"Celso Portiolli já chegou a gravar um álbum musical.","Verdadeiro","Falso",1,
"Em qual ano o cantor Cristiano Araújo morreu em um acidente aéreo?","2015","2016",1,
"A banda de pop rock Heróis do Mar é de qual país?","Brasil","Portugal",2,
"Em que país nasceu Bob Marley?","Estados Unidos","Jamaica",2,
"Qual destas músicas foi o primeiro sucesso do cantor Sidney Magal, lançada em 1977?","Sandra Rosa Madalena","O Meu Sangue ferve por Você",2,
"Qual o nome do vocalista do grupo Novo Som, que é um dos únicos remanescentes do grupo formado em 1988?","Alex Gonzaga","Ademílson Fernandes",1,
"Qual o nome do estilo musical muito utilizado em discotecas e que teve seu auge nos anos 90?","Eurodance","Europop",1,
"Qual o nome do vocalista do grupo U2?","Bono Vox","Serj Tankian",1,
"Complete a música: Meu amor! Quando palavras não conseguem expressar...","Veja o brilho em meu olhar","Veja o brilho em meu rosto",1,
"Qual destas músicas foi utilizada na novela Duas Caras, exibida pela Globo em 2007?","Recomeçar","O Poder do Teu Amor",1,
"O álbum 'As Quatro Estações', de Sandy e Júnior, é vendido tanto em CD quanto em LP.","Verdadeiro","Falso",1,
"Qual o nome do vocalista da banda Skank?","Samuel Rosa","Chico Amaral",1,
"A banda de rock The Beatles é de qual país?","Inglaterra","Estados Unidos",1,
"A banda de rock System of a Down é de qual país?","Inglaterra","Estados Unidos",2,
"O grupo de louvor evangélico Diante do Trono foi formado em qual estado do Brasil?","São Paulo","Minas Gerais",2,
"Complete a música: Entra na minha casa, entra na minha vida, mexe com minha estrutura...","Sara todas as feridas","Cura todas as feridas",1,
"Qual foi o primeiro álbum gravado pela banda NX Zero?","Diálogo?","Meu Coração Desconfia Que Ainda Há Mais do Que Meus Olhos Possam Ver",2,
"Qual foi o nome da banda que ficou famosa no início da década de 2010, principalmente pelo hit 'Levo Comigo'?","Restart","CPM 22",1,
"O grupo de rock brasileiro Blitz foi formado em qual cidade?","Saquarema","Rio de Janeiro",2,
"Complete a música: Because of you, I never stray too far from the...","Sidewalk","Weakness",1,
"Qual é o nome do vocalista do grupo Capital Inicial?","Dinho Ouro Preto","Dinho Olho Preto",1,
"Qual é o nome do primeiro single lançado pela banda Charlie Brown Jr.?","O Coro Vai Comê!","Tudo que Ela Gosta de Escutar",1,
"Qual destas músicas do Linkin Park foi a primeira a ser gravada com Chester Bennington no vocal?","Numb","And One",2,
"Em que ano foi lançada a famosa música Brincadeira de Criança, do grupo Molejo, junto com o álbum de mesmo nome?","1997","2000",1,
"A banda de power metal Angra foi formada em qual cidade?","Angra dos Reis","São Paulo",2,
"Qual o nome da rádio fundada por Assis Chateaubriand em 1935, empresário que depois seria responsável pela inauguração da TV no Brasil?","Rádio Jovem Pan","Super Rádio Tupi",2,
"A cantora Shakira nasceu em qual país?","Colômbia","Estados Unidos",1,
"Qual o nome do terceiro álbum lançado pela banda Oficina G3?","Indiferença","Além do Que os Olhos Podem Ver",1,
"O formato de música MP3 foi oficializado em qual ano?","1992","1998",1,
"Qual o nome da cantora que gravou a famosa música Wrecking Ball?","Miley Cyrus","Ariana Grande",1,
"Em que estado brasileiro surgiu o famoso grupo musical brasileiro Olodum?","Pernambuco","Bahia",2,
"Qual destes cantores é participante da banda brasileira CPM 22?","Paulo Sousa","Rodrigo Koala",2,
"Qual o nome da música do Noel Rosa que fez parte do encerramento das transmissões da TV Globo, de 1976 a 1981?","Até Amanhã","Meu Lugar",1,
"Qual destes músicos é integrante da banda Fruto Sagrado?","André Figueiredo","Sylas Jr.",2,
"Um álbum musical já foi gravado dentro da Estação Especial Internacional.","Verdadeiro","Falso",2,
"Em qual ano a última fábrica de discos de vinil (LP) foi desativada no Brasil?","1997","2000",2,
"'Eu sou a luz das estrelas, eu sou a cor do luar...' Qual o nome desta música famosa do cantor Raul Seixas?","Gita","Metamorfose Ambulante",1,
"Qual destas músicas foi gravada por Roberto Carlos?","Eu Nasci Há Dez Mil Anos Atrás","Como é Grande o Meu Amor Por Você",2,
}
perguntas3={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Quantos dragões elementares existem no League of Legends?","6","7",1,
"'A morte, é como o vento. Está sempre ao meu lado.'","Yasuo","Zed",1,
"Qual destes campeões teve seu braço cortado por Irelia durante a invasão Noxiana contra Ionia?","Jax","Swain",2,
"Qual destes, por muito tempo, foi dublador do personagem Ezreal?","Fábio Lucindo","Luciano Amaral",1,
"Qual destas dubladoras é responsável pelas vozes da personagem Lissandra?","Juliana Fernandes","Alessandra Araújo",2,
"Qual era a dupla famosa por fazer vários roubos em Águas de Sentina?","Graves e Twisted Fate","Graves e Pyke",1,
"Quantos campeões dragões existem no League of Legends?","1","2",1,
"Qual o nome do subcontinente localizado ao leste de Shurima, completo basicamente por florestas?","Ionia","Ixtal",2,
"Basicamente, do que é feita a tecnologia Hextec, utilizada no coração da Camille e no martelo do Jayce, por exemplo?","Magia Demaciana","Cristais Hextec",2,
"Quantos títulos do Campeonato Brasileiro de League of Legends a PaiN Gaming possui?","3","4",1,
"Qual destes campeões possui mais Skins? (excluindo cromas)","Darius","Blitzcrank",2,
"Qual o nome do jogo lançado para consoles cujo objetivo final é derrotar Viego?","The Ruined King","Arcane",1,
"'O ciclo da vida e da morte continua. Nós viveremos e eles morrerão.'","Karthus","Nasus",2,
"O Fizz é o único campeão do League of Legends que consegue sobreviver no mar.","Verdadeiro","Falso",2,
"Em qual ano foi lançada a campeã Jinx?","2013","2014",1,
"Nasus e Renekton, irmãos e protetores de Shurima, são formas de quais animais, respectivamente?","Cachorro e Cavalo","Cachorro e Jacaré",2,
"Qual destes é o menor campeão do League of Legends?","Shaco","Veigar",1,
"Qual destes é o maior campeão do League of Legends?","Aurelion Sol","Cho'Gath",1,
"Antes de ser tomada pela Névoa Negra, as Ilhas das Sombras antes se chamavam...","Ilhas das Guerras","Ilhas das Bênçãos",2,
"Qual o nome da região de League of Legends que está mais situada ao norte, e ao mesmo tempo é a mais gelada?","Demacia","Freljord",2,
"Qual o nome da família responsável pela guarda de Demacia?","Stemmaguarda","Vastaya",1,
"Twisted Fate nasceu de um povo com nome igual ao de um rio sitado ao noroeste do centro de Runeterra. Qual o nome desse rio?","Serpentina","Amazonas",1,
"Qual o nome do lugar localizado em Freljord onde acreditam que os Observadores estejam presos?","Institute of War","Howling Abyss",2,
"Qual o nome da habilidade Ultimate (R) do Malzahar?","Investida do Vazio","Aperto Infero",2,
"Qual o nome da habilidade Ultimate (R) da Miss Fortune?","Mandando Bala","Tapete Vermelho",1,
"Qual é a descrição do Kassadin?","O Monstro do Vazio","O Andarilho do Vazio",2,
"Qual o nome do ponto mais alto do Monte Targon?","Pico da Luz","Pico do Dragão",2,
"Quais os nomes das duas irmãs que representam a Lua e o Sol, respectivamente?","Diana e Aphelios","Diana e Leona",2,
"Qual o nome do modo alternativo do League of Legends no qual os 5 jogadores jogam com o mesmo campeão","URF","Todos por Um",2,
"Qual o nome da banda musical de League of Legends de K-Pop?","Pentakill","K/DA",2,
"O Mid Season Invitational de 2017 foi realizado em qual país?","China","Brasil",2,
"O Disco Solar localizado no centro de Shurima, foi feito com ajuda de qual povo targoniano?","Lunari","Solari",2,
"Uma das falas do Pantheon no jogo, faz referência a um comercial/meme famoso.","Panificadora Alfa","Churrasqueira Controle Remoto",1,
"Qual campeão do League of Legends é responsável pela proteção das chamadas Runas Globais?","Ryze","Irelia",1,
"'Regras foram feitas para serem quebradas. Igual prédios... Ou pessoas!'","Jinx","Katarina",1,
"Qual o nome de dois dos três semideuses localizado no topo dos montes de Freljord?","Ornn e Volibear","Ornn e Sejuani",1,
"Qual o nome do 'planeta' onde vivem todos os personagens de League of Legends?","Runeterra","Demacia",1,
"Quantos campeões existem no League of Legends?","159","160",2,
"O time do Cruzeiro já chegou a ter uma equipe competitiva de League of Legends.","Verdadeiro","Falso",1,
"Ashe e Tryndamere são casados.","Verdadeiro","Falso",1,
"Qual o nome da região onde majoritariamente ficam localizados os Vastayas?","Noxus","Ionia",2,
"Cassiopeia, Talon e Katarina fazem parte de uma família muito conhecida em Noxus. Qual o nome dela?","Stemmaguarda","Du Couteau",2,
"Qual o nome do sistema que automaticamente pune jogadores AFKs ou que 'quitam' de forma proposital no League of Legends?","Leaver Buster","Riot Forge",1,
"Qual o nome do jogo de estratégia e táticas presente dentro do League of Legends?","Legends of Runeterra","Teamfight Tactics",2,
"Qual o nome da escopeta usada por Graves?","Vingança","Destino",2,
"A campeã Akali já passou por quantos reworks desde seu lançamento?","2","3",1,
"Qual foi a única equipe do Ocidente a vencer o Campeonato Mundial de League of Legends?","FNATIC","Team Liquid",1,
"O time do Flamengo possui uma equipe no competivivo de League of Legends.","Verdadeiro","Falso",1,
"Qual foi a equipe brasileira que conseguiu a melhor campanha no Mundial de League of Legends, em 2015?","LOUD","INTZ",2,
"Qual foi o jogador que mais conquistou títulos do Campeonato Brasileiro de League of Legends?","BrTT","Revolta",1,
"Qual foi o(a) campeã(o) que salvou vários zaunitas após uma falha em um experimento?","Janna","Viktor",1,
"Quais são os nomes dos dois campeões que fazem parte dos chamados Sentinelas da Luz?","Lucian e Hecarim","Lucian e Senna",2,
"Qual dessas é a maior região de Runeterra?","Noxus","Shurima",2,
"Quantas regiões existem em Runeterra?","10","12",2,
"Qual o nome do javali no qual a campeã Sejuani sempre fica montada?","Bristle","Valor",1,
"'Tudo o que está quebrado pode ser reforjado.","Akali","Riven",2,
"Qual o nome da série de League of Legends lançada cujo foco é em Piltover e em Zaun?","Arcane","Forge",1,
"Qual o nome da região onde majoritamente vivem os Yordles?","Ionia","Bandópolis",2,
"Qual é a descrição da Shyvana?","A Fúria do Dragão","A Meia-Dragão",2,
"Quais destes monstros neutros pertencem ao Vazio?","Arauto do Vale e Barão Na'Shor","Arauto do Vale e Dragão Ancião",1,
"No evento de Arcane, Heimerdinger chega a mencionar uma frase durante o jogo.","Tá pegando fogo bicho!","Sempre pela ciência!",1,
"Qual destes personagens foi tirado de Demacia, subiu o monte Targon e virou o Escudo de Valoran?","Zoe","Taric",2,
"Águas de Sentina é um arquipélago localizado ao leste de Runeterra, onde basicamente só vivem...","Aspectos","Piratas",2,
"Qual a cor do cabelo da Katarina?","Preto","Vermelho",2,
"Nenhuma pessoa que foi capturada pela lanterna de Thresh conseguiu sair de lá.","Verdadeiro","Falso",2,
"Qual destes campeões não faz parte das Ilhas das Sombras?","Hecarim","Lucian",2,
"Qual o nome da matéria utilizada pelos Glacinatas para prender os Observadores dentro de Howling Abyss?","Gelo verdadeiro","Runas Globais",1,
"Qual o(a) campeã(o) que conseguiu derrotar e derrubar o navio de Gangplank?","Miss Fortune","Twisted Fate",1,
"Qual destas campeãs possui um coração Hextec?","Camille","Orianna",1,
"'Eu sou o terror de todos que se oponham contra mim.'","Morgana","Shyvana",2,
"Qual o nome da runa do League of Legends que dá dano e velocidade de movimento aprimoradas nas botas?","Predador","Ímpeto Gradual",1,
"Qual o nome de uma das moedas utilizada em Águas de Sentina?","Serpentes de Prata","Leão Submarino",1,
"A campeã Cassiopeia é um misto de uma mulher com uma...","Serpente","Víbora",1,
"Qual a fruta preferida da campeã Kai'Sa?","Pêra","Pêssego",2,
"Quais os nomes das três tribos que formam Freljord?","Avarosa, Garras do Inverno e Serylda","Avarosa, Garras do Inverno e Praeglacius",2,
"Qual o nome do modelo de governo utilizado em Noxus, onde basicamente há três comandantes?","Trifarix","Quinlon",1,
"Qual o nome da música tema do Campeonato Mundial de League of Legends de 2018?","Legends Never Die","Rise",2,
"O Monte Targon é a única montanha existente em Runeterra.","Verdadeiro","Falso",2,
"Quantos campeões do League of Legends conseguem voar por conta própria (sem ajuda de animais ou veículos adicionais)?","5","10",1,
"Quantos campeões do League of Legends conseguem viver no mar?","3","4",2,
"Quantas skins possui o campeão Yasuo? (excluindo cromas)","11","13",1,
"Qual o nome do local onde Zilean nasceu, e que posteriormente foi tomado pelo Vazio?","Bandópolis","Icathia",2,
"Basicamente, qual é a única fala do Rammus no jogo?","Ok","Falou",1,
"O campeão Ryze já passou por quantos Reworks desde seu lançamento?","2","3",1,
"Não existem campeões dentro do League of Legends que sejam maiores que a própria Runeterra.","Verdadeiro","Falso",2,
"Quantos continentes existem em Runeterra?","2","3",1,
"Qual o nome da música tema do Campeonato Mundial de League of Legends de 2020?","Warriors","Take Over",2,
"Quantos elos existem no League of Legends?","8","9",2,
"Katarina e Cassiopeia são irmãs.","Verdadeiro","Falso",1,
"Xayah e Rakan são da mesma raça.","Verdadeiro","Falso",1,
"O Campeonato Mundial de League of Legends já foi realizado no Brasil.","Verdadeiro","Falso",2,
"Em qual ano o campeão Zed foi lançado?","2014","2015",1,
"Quais destes três campeões são Darkins?","Aatrox, Varus e Ryze","Aatrox, Varus e Rhaast",2,
"A campeã Quinn consegue voar até o espaço.","Verdadeiro","Falso",2,
"Os seres da raça Vastaya são encontrados apenas em Ionia.","Verdadeiro","Falso",2,
"Qual o nome da taça dada aos campeões mundiais de League of Legends?","Taça do Invocador","Taça do Campeão",1,
"A campeã Fiora possui um sotaque de fala...","Francês","Alemão",1,
"Qual destes campeões não participa da série Arcane?","Jinx","Diana",2,
"Uma das falas do campeão Kha'Zix faz referência a uma música muito famosa de Raul Seixas. Qual é essa música?","Metamorfose Ambulante","Gita",1,
"A campeã Irelia já passou por quantos reworks visuais?","2","3",1,
"Não existem campeões do vazio que são humanos.","Verdadeiro","Falso",2,
"Qual o nome do torneio de meio de temporada do League of Legends?","Worlds","Mid-Season Invitacional",2,
"Quais os nomes das duas principals religiões existentes no Monte Targon?","Lunari e Solari","Lunari e Soraka",1,
}
perguntas4={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Quantas Copas do Mundo Pelé jogou?","3","4",2,
"Qual era o número da camisa de Cristiano Ronaldo na final da Eurocopa de 2004, contra a Grécia?","7","17",2,
"Qual foi a seleção que fez a melhor campanha nas eliminatórias sul-americanas para a Copa do Mundo?","Brasil","Argentina",2,
"O famoso gol 'La Mano de Dios' marcado por Diego Maradona, aconteceu na Copa do Mundo de qual ano?","1986","1990",1,
"Qual destes jogadores ficou famoso por errar o pênalti que eliminou a seleção Inglesa na Eurocopa de 1996?","Gareth Southgate","David Beckham",1,
"Quem marcou o gol do título do Flamengo na Copa União de 1987?","Renato Gaúcho","Bebeto",2,
"Qual foi o árbitro que ficou conhecido pelo episódio da Máfia do Apito, em 2005?","Edílson Pereira de Carvalho","Paulo César de Oliveira",1,
"Qual o nome dado a Liga de Futebol dos Estados Unidos?","Major League Soccer","Premier League",1,
"Quantos Mundiais de Clubes ganhou Neymar?","0","1",2,
"Quantas Libertadores possui o Boca Juniors?","4","6",2,
"Qual clube brasileiro venceu o primeiro Campeonato Brasileiro disputado 100% por pontos corridos?","Cruzeiro","Santos",1,
"Qual destes jogadores fez mais gols em Copas do Mundo?","Miroslav Klose","Ronaldo Fenômeno",1,
"Quantas pessoas morreram no acidente aéreo que matou quase toda a delegação da Chapecoense, em 2016?","64","71",2,
"Qual destes jogadores é, atualmente, o maior artilheiro dos Campeonatos Brasileiros por pontos corridos?","Fred","Diego Souza",1,
"Qual destes jogadores é, atualmente, o maior artilheiro dos Campeonatos Brasileiros até 2002?","Zico","Roberto Dinamite",2,
"Quantos jogadores do Atlético-MG foram expulsos no polêmico jogo da Semifinal da Libertadores de 1981 contra o Flamengo?","5","7",2,
"Em qual ano o Corinthians conquistou seu primeiro título do Campeonato Brasileiro?","1990","1995",1,
"Quem perdeu a última cobrança de pênalti na Semifinal da Libertadores de 2000, defendido pelo goleiro Marcos?","Marcelinho Carioca","Luisão",1,
"Quantas bolas de ouro Lionel Messi possui?","6","7",2,
"Qual destas Copas do Mundo foi a primeira a ter o uso do VAR?","2014, no Brasil","2018, na Rússia",2,
"Qual destes clubes foi Campeão Brasileiro em um ano e rebaixado no ano seguinte?","Vasco","Fluminense",2,
"Qual destes jogadores chegou a virar político?","Romário","Ronaldinho Gaúcho",1,
"Qual destes jogadores vestiu por mais vezes a camisa do São Paulo?","Rogério Ceni","Raí",1,
"Qual destes técnicos foi o responsável pelo tricampeonato brasileiro do São Paulo de 2006 a 2008?","Muricy Ramalho","Paulo Autuori",1,
"Qual o nome do estádio que o Palmeiras utilizou até a construção do Allianz Parque?","Pacaembu","Parque Antártica",2,
"Quantos times foram rebaixados no Campeonato Brasileiro de 1995?","2","4",1,
"O Fluminense perdeu a final da Libertadores de 2008 para qual time?","Boca Juniors","LDU",2,
"Qual destas cantoras NÃO cantou durante o show da abertura da Copa do Mundo de 2014?","Ivete Sangalo","Ariana Grande",2,
"Todas as edições da Copa América na qual o Brasil foi o país-sede, a Seleção Brasileira venceu.","Verdadeiro","Falso",2,
"Quem marcou o gol do título de Portugal na final da Eurocopa de 2016, contra a anfitriã França?","Cristiano Ronaldo","Éder",2,
"Quantas medalhas de ouro possui a seleção Argentina de futebol olímpica?","2","3",1,
"Qual foi o último time que colocou mais de 100 mil pessoas no Maracanã em 1999?","Botafogo","Flamengo",1,
"Qual time possui mais títulos da Copa Libertadores da América?","Independiente","Boca Juniors",1,
"Qual foi o único time do Nordeste a conquistar a Copa do Brasil?","Sport","Fortaleza",1,
"A final da Libertadores da América de 2018 foi disputada em qual estádio?","Defensores del Chaco","Santiago Bernabéu",2,
"Quem fez o único gol do título do Mundial Interclubes do Manchester United em 1999, contra o Palmeiras?","David Beckham","Roy Keane",2,
"Quais desses times conseguiu vencer o Boca Juniors jogando no estádio da Bombonera?","Palmeiras e Corinthians","Palmeiras e Paysandu",2,
"Qual é o jogador que mais marcou gols na história da Liga dos Campeões da Europa?","Cristiano Ronaldo","Ronaldo Fenômeno",1,
"Em que ano começou a ser disputada a Copa do Brasil?","1989","1990",1,
"Real Madrid e Milan são os clubes que mais venceram a Liga dos Campeões da Europa.","Verdadeiro","Falso",1,
"Qual foi o técnico do Flamengo na conquista do Mundial Interclubes em 1981?","Cláudio Coutinho","Paulo César Carpegiani",2,
"A seleção da Bolívia já chegou em uma final de Copa América.","Verdadeiro","Falso",1,
"Qual era a competição organizada pela FIFA que ocorria um ano antes da Copa do Mundo?","Copa das Confederações","Copa América",1,
"Qual desses times do interior de São Paulo já chegou em uma final de Libertadores?","Santo André","São Caetano",2,
"O time do Vasco já caiu quantas vezes para a série B?","3","4",2,
"Qual foi o nome do episódio de virada de mesa que ocasionou na realização da Copa João Havelange, em 2000?","Caso Sandro Hiroshi","Caso Milton Mendes",1,
"Qual foi o jogador que foi escalado irregularmente na última rodada no Brasileirão de 2013, causando o rebaixamento da Portuguesa?","Héverton","Éderson",1,
"Qual o nome do estádio conhecido como Engenhão?","Estádio João Havelange","Estádio Nilton Santos",2,
"Quantas vezes o time do Palmeiras venceu o Mundial de Clubes?","0","1",1,
"Qual o nome do jogador formado no Santos que foi condenado acusado de assédio sexual?","Robinho","Adriano",1,
"Qual o nome original de Pelé?","Édson Arantes do Nascimento","Robson Arantes do Nascimento",1,
"Qual foi o jogador que cobrou o último pênalti que deu ao Brasil sua primeira medalha de ouro olímpica?","Gabriel Jesus","Neymar",2,
"Qual foi a primeira Copa do Mundo que foi decidida na disputa de pênaltis?","1994, nos Estados Unidos","1998, na França",1,
"Qual foi o primeiro clube brasileiro a representar o Brasil na Copa Libertadores da América?","Bahia","Atlético-MG",1,
"O Palmeiras é o único clube brasileiro que venceu duas edições seguidas da Libertadores.","Verdadeiro","Falso",2,
"Qual foi o primeiro clube brasileiro a ser campeão da Copa Libertadores da América?","Santos","Botafogo",1,
"Qual destes funkeiros já chegou a virar jogador de futebol?","MC Livinho","MC Kevinho",1,
"Qual foi o jogador que errou o último pênalti na histórica final da Liga dos Campeões da Europa de 2004-2005?","Shevchenko","Maldini",1,
"A Copa do Mundo nunca foi realizada no continente africano.","Verdadeiro","Falso",2,
"Em qual cidade Pelé nasceu?","Santos","Três Corações",2,
"Em qual ano foi realizado o primeiro Mundial de Clubes organizado pela FIFA?","1960","2000",2,
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
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addTextArea(0,"<p align='center'><font size='15'>"..message.."",nil,40,32,720,48,0,0,1.0,true)
	end
end
function questionChanger(id,remove)
	table.remove(questions_list,id)
end
function eventNewGame()
	vivos=0
	tfm.exec.setGameTime(10)
	for name,player in next,tfm.get.room.playerList do
		vivos=vivos+1
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	showMessage("<R>Jogadores convidados (souris) não podem mais participar deste jogo. Faça login em uma conta para jogar.",name)
		end
	end
	if tema == 0 then
		count=rawlen(perguntas)/4
	elseif tema == 1 then
		count=rawlen(perguntas1)/4
	elseif tema == 2 then	
		count=rawlen(perguntas2)/4
	elseif tema == 3 then	
		count=rawlen(perguntas3)/4
	elseif tema == 4 then	
		count=rawlen(perguntas4)/4
	end
	fixed_cnt=count
	if rawlen(questions_list) <= limite then
		showMessage("<J>Contando perguntas. Por favor, aguarde...<br>")
		for i=1,count do
			table.insert(questions_list,i)
		end
	end
	showMessage("<N><b>Quantidade de perguntas presentes: "..fixed_cnt.."</b><br><VP>O sistema inteligente de escolha de perguntas está ativo.<br><br><G>Agora vocês podem sugerir temas e perguntas para este script! Entre em contato com Reksai_void2600#6638 por mensagem privada no fórum e envie suas perguntas.")
	if tema == 3 then
		showMessage("<J>As perguntas deste tema foram todas feitas por Spectra_phantom#6089.")
	elseif tema == 4 then
		showMessage("<J>As perguntas deste tema foram todas feitas por Lucianattack#0000.")
	end
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
	if name == "Forzaldenon#0000" or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" or name == "Morganadxana#0000" or verifyAdmin(name) == true then
		if (message:sub(0,6) == "limite") then
			limite=tonumber(message:sub(8))
			showMessage("Limite de rodadas alterado para: "..message:sub(8).."")
			questions_list={}; count=0;
			reset()
		end
		if (message:sub(0,4) == "setq") then
			set_q=tonumber(message:sub(6))
			local sn=((tonumber(message:sub(6))-1)*4)+1
			if tema == 0 then
				showMessage(perguntas[sn],name)
			elseif tema == 1 then
				showMessage(perguntas1[sn],name)
			elseif tema == 2 then
				showMessage(perguntas2[sn],name)
			elseif tema == 3 then
				showMessage(perguntas3[sn],name)
			elseif tema == 4 then
				showMessage(perguntas4[sn],name)
			end
		end
		if (message:sub(0,4) == "tema") then
			if message:sub(6) == "0" or message:sub(6) == "1" or message:sub(6) == "2" or message:sub(6) == "3" or message:sub(6) == "4" then
				tema=tonumber(message:sub(6))
				questions_list={}; count=0;
				reset()
			end
		end
		if (message:sub(0,2) == "tc") then
			if tfm.get.room.playerList[name].tribeName == "Alaranjados" then
				showMessage("<font color='#ff8000'>• [FunCorp - <b>"..name.."</b>] "..message:sub(4).."")
			end
		end
		if message == "reset" then
			questions_list={}; count=0;
			reset()
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
	ui.setMapName("<N>Quiz de Perguntas <VP><b>v2.23.1</b> <N>por <ROSE>Reksai_void2600#6638   <BL>|   <N>Ratos vivos : <V>"..vivos.."/<J>"..ratos.."   <BL>|   <N>Round : <V>"..rodada.."/<R>"..limite.."<")
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
			ui.addTextArea(2,"<p align='center'><font color='#181818'><font size='18'>"..actual_question.a2.."",nil,440,145,260,141,0,0,0.1,true)
			ui.addTextArea(1,"<p align='center'><VP><font size='18'>"..actual_question.a1.."",nil,100,145,260,141,0,0,1.0,true)
			modo="intervalo"
		elseif actual_question.answer == true then
			tfm.exec.removePhysicObject(0)
			ui.addTextArea(1,"<p align='center'><font color='#181818'><font size='18'>"..actual_question.a1.."",nil,100,145,260,141,0,0,0.1,true)
			ui.addTextArea(2,"<p align='center'><VP><font size='18'>"..actual_question.a2.."",nil,440,145,260,141,0,0,1.0,true)
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
			modo="fim2"
		end
	end
	if modo == "perguntar" and f >= 1 then
		ui.addTextArea(3,"<p align='center'><font size='45'>"..math.floor((f/1000)-1).."",nil,360,235,80,60,0x000001,0x494949,1.0,true)
	else
		ui.removeTextArea(3,nil)
	end
	if f <= 1500 and vivos == 1 and modo == "fim" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				showMessage("<VP><b>"..name.."</b> venceu a partida!")
				modo="fim2"
			end
		end
	end
	if f < 50 then
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
	tfm.exec.setGameTime(17)
	if rodada >= 13 then
		tfm.exec.setGameTime(13)
	end
	tfm.exec.removePhysicObject(4)
	tfm.exec.removePhysicObject(5)
	tfm.exec.addPhysicObject(2, 385, 140, barreira)
	tfm.exec.addPhysicObject(3, 415, 140, barreira)
	tfm.exec.addPhysicObject(0, 220, 380, piso)
	tfm.exec.addPhysicObject(1, 580, 380, piso)
	modo="perguntar"
	rodada=rodada+1
	if tema == 0 then
		if set_q == 0 then
			local q=math.random(#questions_list)
			pergunta=q
			questionChanger(q,true)
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
	end
	if tema == 1 then
		if set_q == 0 then
			local q=math.random(#questions_list)
			pergunta=q
			questionChanger(q,true)
		else
			pergunta=set_q
		end
		actual_question.quest=perguntas1[-3+(4*pergunta)]
		if perguntas1[pergunta*4] == 2 then
			actual_question.answer=true
		elseif perguntas1[pergunta*4] == 1 then
			actual_question.answer=false
		end
		actual_question.a1=perguntas1[-2+(4*pergunta)]
		actual_question.a2=perguntas1[-1+(4*pergunta)]
	end
	if tema == 2 then
		if set_q == 0 then
			local q=math.random(#questions_list)
			pergunta=q
			questionChanger(q,true)
		else
			pergunta=set_q
		end
		actual_question.quest=perguntas2[-3+(4*pergunta)]
		if perguntas2[pergunta*4] == 2 then
			actual_question.answer=true
		elseif perguntas2[pergunta*4] == 1 then
			actual_question.answer=false
		end
		actual_question.a1=perguntas2[-2+(4*pergunta)]
		actual_question.a2=perguntas2[-1+(4*pergunta)]
	end
	if tema == 3 then
		if set_q == 0 then
			local q=math.random(#questions_list)
			pergunta=q
			questionChanger(q,true)
		else
			pergunta=set_q
		end
		actual_question.quest=perguntas3[-3+(4*pergunta)]
		if perguntas3[pergunta*4] == 2 then
			actual_question.answer=true
		elseif perguntas3[pergunta*4] == 1 then
			actual_question.answer=false
		end
		actual_question.a1=perguntas3[-2+(4*pergunta)]
		actual_question.a2=perguntas3[-1+(4*pergunta)]
	end
	if tema == 4 then
		if set_q == 0 then
			local q=math.random(#questions_list)
			pergunta=q
			questionChanger(q,true)
		else
			pergunta=set_q
		end
		actual_question.quest=perguntas4[-3+(4*pergunta)]
		if perguntas4[pergunta*4] == 2 then
			actual_question.answer=true
		elseif perguntas4[pergunta*4] == 1 then
			actual_question.answer=false
		end
		actual_question.a1=perguntas4[-2+(4*pergunta)]
		actual_question.a2=perguntas4[-1+(4*pergunta)]
	end
	set_q=0
	ui.addTextArea(1,"<p align='center'><font size='18'>"..actual_question.a1.."",nil,100,145,260,141,0,0,1.0,true)
	ui.addTextArea(2,"<p align='center'><font size='18'>"..actual_question.a2.."",nil,440,145,260,141,0,0,1.0,true)
	ui.addTextArea(0,"<p align='center'><font size='15'>"..actual_question.quest.."",nil,40,32,720,48,0,0,1.0,true)
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
