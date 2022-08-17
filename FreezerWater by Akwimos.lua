--[[ Require By: Nettoork#0000 ]]--
do local a={}local b={}local c={}local d={}local e={"eventChatCommand ","eventChatMessage","eventEmotePlayed","eventFileLoaded","eventFileSaved","eventKeyboard","eventMouse","eventLoop","eventNewGame","eventNewPlayer","eventPlayerDataLoaded","eventPlayerDied","eventPlayerGetCheese","eventPlayerLeft","eventPlayerVampire","eventPlayerWon","eventPlayerRespawn","eventPlayerMeep","eventPopupAnswer","eventSummoningStart","eventSummoningCancel","eventSummoningEnd","eventTextAreaCallback","eventColorPicked"}local f;f={['perfomance']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(g,h,i)local j=0;for v=1,g do local k=os.time()for l=1,h do i(h)end;j=j+os.time()-k end;return'Estimated Time: '..j/g..' ms.'end},['button']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(...)local m={...}local n=-543212345+m[1]*3;local o=m[9]and'0x2A424B'or'0x314e57'ui.addTextArea(n,'',m[4],m[5]-1,m[6]-1,m[7],m[8],0x7a8d93,0x7a8d93,1,true)ui.addTextArea(n-1,'',m[4],m[5]+1,m[6]+1,m[7],m[8],0x0e1619,0x0e1619,1,true)ui.addTextArea(n-2,'<p align="center"><a href="event:'..m[3]..'">'..m[2]..'</a></p>',m[4],m[5],m[6],m[7],m[8],o,o,1,true)end,['remove']=function(n,p)for l=0,2 do ui.removeTextArea(-543212345+n*3-l,p)end end},['ui-design']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(...)local m={...}if m[6]<0 or m[7]and m[7]<0 then return elseif not m[7]then m[7]=m[6]/2 end;local n=543212345+m[1]*8;ui.addTextArea(n,'',m[3],m[4],m[5],m[6]+100,m[7]+70,0x78462b,0x78462b,1,true)ui.addTextArea(n+1,'',m[3],m[4],m[5]+(m[7]+140)/4,m[6]+100,m[7]/2,0x9d7043,0x9d7043,1,true)ui.addTextArea(n+2,'',m[3],m[4]+(m[6]+180)/4,m[5],(m[6]+10)/2,m[7]+70,0x9d7043,0x9d7043,1,true)ui.addTextArea(n+3,'',m[3],m[4],m[5],20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+4,'',m[3],m[4]+m[6]+80,m[5],20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+5,'',m[3],m[4],m[5]+m[7]+50,20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+6,'',m[3],m[4]+m[6]+80,m[5]+m[7]+50,20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+7,m[2],m[3],m[4]+3,m[5]+3,m[6]+94,m[7]+64,0x1c3a3e,0x232a35,1,true)end,['remove']=function(n,p)for l=0,7 do ui.removeTextArea(543212345+n*8+l,p)end end},['text-area-custom']={AUTHOR='Nettoork#0000',_VERSION='2.0',dependencies={},['add']=function(...)local q={...}if type(q[1])=='table'then for l,v in next,q do if type(v)=='table'then if not v[3]then v[3]='nil'end;addTextArea(table.unpack(v))end end else if not q[3]then q[3]='nil'end;b[q[3]..'_'..q[1]]={...}ui.addTextArea(...)end end,['update']=function(n,r,p)if not p then p='nil'end;if not b[p..'_'..n]then return elseif type(r)=='string'then ui.updateTextArea(n,r,p)b[p..'_'..n][2]=r;return end;local s={text=2,x=4,y=5,w=6,h=7,background=8,border=9,alpha=10,fixed=11}for l,v in next,r do if s[l]then b[p..'_'..n][s[l]]=v end end;local t=b[p..'_'..n]ui.addTextArea(t[1],t[2],t[3],t[4],t[5],t[6],t[7],t[8],t[9],t[10],t[11])end,['remove']=function(n,p)if not p then p='nil'end;if b[p..'_'..n]then b[p..'_'..n]=nil end;ui.removeTextArea(n,p)end},['string-to-boolean']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['parse']=function(u)local w={}for l,v in next,u do w[v]=true end;return w end},['database']={AUTHOR='Nettoork#0000',_VERSION='1.1',dependencies={},['create']=function(x,y)if not c[x]then c[x]=y end end,['delete']=function(x)c[x]=nil end,['get']=function(x,...)local z,A={},{...}if not A[1]then return c[x]else for l,v in next,A do if c[x][v]then z[#z+1]=c[x][v]end end;return table.unpack(z)end end,['set']=function(x,...)local B=v;for l,v in next,{...}do if not B then B=v else c[x][B]=v;B=false end end end},['encryption']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['encrypt']=function(u,C,D)if not u or not C or not D or type(u)~='table'or C==''or D==''then return end;local E,F,G,H='','','',''for l in C:gmatch('.')do E=E..l:byte()end;for l in D:gmatch('.')do H=H..l:byte()end;math.randomseed(E)otherSeed=math.random(1000000)local I=pcall(function()for l,v in next,u do if type(v)=='string'or type(v)=='number'then if type(v)=='string'then v="'"..v.."'"end;G=G..' '..v..' '..l:upper()else return end end;G=G..' '..H;for l in G:gmatch('.')do local J=l:byte()+68+math.random(5)otherSeed=otherSeed+l:byte()math.randomseed(otherSeed)if J>=65 and J<=122 and not(J>=91 and J<=96)then J=string.char(J)end;F=F..J end end)math.randomseed(os.time())if not I then return else return F end end,['decrypt']=function(K,C,D)if not K or not C or not D or type(K)~='string'or C==''or D==''then return end;local E,F,L,H='','','',''for l in C:gmatch('.')do E=E..l:byte()end;for l in D:gmatch('.')do H=H..l:byte()end;math.randomseed(E)otherSeed=math.random(1000000)local I=pcall(function()for l in K:gmatch('.')do if l:byte()>=65 and l:byte()<=122 then local J=l:byte()-68-math.random(5)otherSeed=otherSeed+J;math.randomseed(otherSeed)F=F..string.char(J)else L=L..l;if L:len()>=3 then local J=tonumber(L)-68-math.random(5)otherSeed=otherSeed+J;math.randomseed(otherSeed)F=F..string.char(J)L=''end end end end)math.randomseed(os.time())if not I then return else local w,M,N,O,P={},0,0;for l,v in string.gmatch(F,'[^%s]+')do N=N+1 end;for l,v in string.gmatch(F,'[^%s]+')do M=M+1;if M==N and l~=H then return elseif O then if O:sub(-1)=="'"then w[l:lower()]=O:gsub("'",'')O=nil else O=O..' '..l end elseif P then w[l:lower()]=P;P=nil elseif l:sub(1,1)=="'"then O=l else P=l end end;return w end end},['sleep']={AUTHOR='Nettoork#0000',_VERSION='1.1',dependencies={},['loop']=function()local Q={}for l,v in next,a do if not v[2]or v[2]<os.time()then if coroutine.status(v[1])=='dead'then Q[#Q+1]=l else local R,S=coroutine.resume(v[1])v[2]=S end end end;if Q[1]then for l,v in next,Q do a[v]=nil end end end,['run']=function(T,U)if not U then U=500 end;a[#a+1]={coroutine.create(function()local V=function(W)coroutine.yield(os.time()+math.floor(W/U)*U)end;T(V)end),timeValue=nil}end},['wait-time']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['check']=function(X,Y,Z,_)if X and Y then if not d[X]then d[X]={}end;if not d[X][Y]then _=0;d[X][Y]=os.time()+(Z or 1000)end;if d[X][Y]<=os.time()or _ and _==0 then d[X][Y]=os.time()+(Z or 1000)return true else return false end end end},['json']={AUTHOR='https://github.com/rxi',_VERSION='0.1.1',dependencies={},['encode']=function(a0)local a1;local a2={["\\"]="\\\\",["\""]="\\\"",["\b"]="\\b",["\f"]="\\f",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t"}local a3={["\\/"]="/"}for a4,v in pairs(a2)do a3[v]=a4 end;local function a5(a6)return a2[a6]or string.format("\\u%04x",a6:byte())end;local function a7(a0)return"null"end;local function a8(a0,a9)local aa={}a9=a9 or{}if a9[a0]then error("circular reference")end;a9[a0]=true;if a0[1]~=nil or next(a0)==nil then local W=0;for a4 in pairs(a0)do if type(a4)~="number"then error("invalid table: mixed or invalid key types")end;W=W+1 end;if W~=#a0 then error("invalid table: sparse array")end;for l,v in ipairs(a0)do table.insert(aa,a1(v,a9))end;a9[a0]=nil;return"["..table.concat(aa,",").."]"else for a4,v in pairs(a0)do if type(a4)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(aa,a1(a4,a9)..":"..a1(v,a9))end;a9[a0]=nil;return"{"..table.concat(aa,",").."}"end end;local function ab(a0)return'"'..a0:gsub('[%z\1-\31\\"]',a5)..'"'end;local function ac(a0)if a0~=a0 or a0<=-math.huge or a0>=math.huge then error("unexpected number value '"..tostring(a0).."'")end;return a0 end;local ad={["nil"]=a7,["table"]=a8,["string"]=ab,["number"]=ac,["boolean"]=tostring}a1=function(a0,a9)local ae=type(a0)local T=ad[ae]if T then return T(a0,a9)end;error("unexpected type '"..ae.."'")end;return a1(a0)end,['decode']=function(af)local ag;local a3={["\\/"]="/"}local function ah(...)local aa={}for l=1,select("#",...)do aa[select(l,...)]=true end;return aa end;local ai=ah(" ","\t","\r","\n")local aj=ah(" ","\t","\r","\n","]","}",",")local ak=ah("\\","/",'"',"b","f","n","r","t","u")local al=ah("true","false","null")local am={["true"]=true,["false"]=false,["null"]=nil}local function an(af,ao,ap,aq)for l=ao,#af do if ap[af:sub(l,l)]~=aq then return l end end;return#af+1 end;local function ar(af,ao,as)local at=1;local au=1;for l=1,ao-1 do au=au+1;if af:

sub(l,l)=="\n"then at=at+1;au=1 end end;error(string.format("%s at line %d col %d",as,at,au))end;local function av(W)local T=math.floor;if W<=0x7f then return string.char(W)elseif W<=0x7ff then return string.char(T(W/64)+192,W%64+128)elseif W<=0xffff then return string.char(T(W/4096)+224,T(W%4096/64)+128,W%64+128)elseif W<=0x10ffff then return string.char(T(W/262144)+240,T(W%262144/4096)+128,T(W%4096/64)+128,W%64+128)end;error(string.format("invalid unicode codepoint '%x'",W))end;local function aw(R)local ax=tonumber(R:sub(3,6),16)local ay=tonumber(R:sub(9,12),16)if ay then return av((ax-0xd800)*0x400+ay-0xdc00+0x10000)else return av(ax)end end;local function az(af,l)local aA=false;local aB=false;local aC=false;local aD;for aE=l+1,#af do local aF=af:byte(aE)if aF<32 then ar(af,aE,"control character in string")end;if aD==92 then if aF==117 then local aG=af:sub(aE+1,aE+5)if not aG:find("%x%x%x%x")then ar(af,aE,"invalid unicode escape in string")end;if aG:find("^[dD][89aAbB]")then aB=true else aA=true end else local a6=string.char(aF)if not ak[a6]then ar(af,aE,"invalid escape char '"..a6 .."' in string")end;aC=true end;aD=nil elseif aF==34 then local R=af:sub(l+1,aE-1)if aB then R=R:gsub("\\u[dD][89aAbB]..\\u....",aw)end;if aA then R=R:gsub("\\u....",aw)end;if aC then R=R:gsub("\\.",a3)end;return R,aE+1 else aD=aF end end;ar(af,l,"expected closing quote for string")end;local function aH(af,l)local aF=an(af,l,aj)local R=af:sub(l,aF-1)local W=tonumber(R)if not W then ar(af,l,"invalid number '"..R.."'")end;return W,aF end;local function aI(af,l)local aF=an(af,l,aj)local aJ=af:sub(l,aF-1)if not al[aJ]then ar(af,l,"invalid literal '"..aJ.."'")end;return am[aJ],aF end;local function aK(af,l)local aa={}local W=1;l=l+1;while 1 do local aF;l=an(af,l,ai,true)if af:sub(l,l)=="]"then l=l+1;break end;aF,l=ag(af,l)aa[W]=aF;W=W+1;l=an(af,l,ai,true)local aL=af:sub(l,l)l=l+1;if aL=="]"then break end;if aL~=","then ar(af,l,"expected ']' or ','")end end;return aa,l end;local function aM(af,l)local aa={}l=l+1;while 1 do local H,a0;l=an(af,l,ai,true)if af:sub(l,l)=="}"then l=l+1;break end;if af:sub(l,l)~='"'then ar(af,l,"expected string for key")end;H,l=ag(af,l)l=an(af,l,ai,true)if af:sub(l,l)~=":"then ar(af,l,"expected ':' after key")end;l=an(af,l+1,ai,true)a0,l=ag(af,l)aa[H]=a0;l=an(af,l,ai,true)local aL=af:sub(l,l)l=l+1;if aL=="}"then break end;if aL~=","then ar(af,l,"expected '}' or ','")end end;return aa,l end;local aN={['"']=az,["0"]=aH,["1"]=aH,["2"]=aH,["3"]=aH,["4"]=aH,["5"]=aH,["6"]=aH,["7"]=aH,["8"]=aH,["9"]=aH,["-"]=aH,["t"]=aI,["f"]=aI,["n"]=aI,["["]=aK,["{"]=aM}ag=function(af,ao)local aL=af:sub(ao,ao)local T=aN[aL]if T then return T(af,ao)end;ar(af,ao,"unexpected character '"..aL.."'")end;if type(af)~="string"then error("expected argument of type string, got "..type(af))end;local aa,ao=ag(af,an(af,1,ai,true))ao=an(af,ao,ai,true)if ao<=#af then ar(af,ao,"trailing garbage")end;return aa end},['runtime-analyze']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['run']=function(...)local aO=0;local aP=0;local aQ=0;local aR={}local aS={...}local aT={}local aU={"#83FFA4","#30FF67","#00FF44","#E9FF82","#EEFF24","#F5F604","#FF524F","#FF302D","#E60400","#C70502"}for l=1,10 do aT[l]=string.rep("\226\150\136",l)end;if tfm.get.room.name:find("^\42\03")~=nil then aQ=40 else aQ=60 end;local aV=function()local aW=""for l,v in next,aR do local aX=math.floor(v.timeLoaded/(aQ/10))*(5-math.floor(aO/2))aX=aX>10 and 10 or aX;local aY=(aX==0 and""or"<font color='"..aU[aX].."'>")..(aX==0 and""or aT[aX])aW=aW..string.format("<PT>[%s]</PT>\n%dms %s",l,v.timeLoaded,aY)..'</font>\n'end;local aX=math.floor(aP/(aQ/10))*(5-math.floor(aO/2))aX=aX>10 and 10 or aX;local aY=(aX==0 and""or"<font color='"..aU[aX].."'>")..(aX==0 and""or aT[aX])aW=aW..string.format("<D>Global Runtime:</D>\n%dms %s",aP,aY)..'</font> '..aQ..'ms\n'if aS[1]then for l,v in next,aS do ui.addTextArea(3102301909,aW,v,5,26,0,0,1,1,0.5,true)end else ui.addTextArea(3102301909,aW,nil,5,26,0,0,1,1,0.5,true)end end;local aZ={['eventLoop']=function()aO=aO+1;if aO>8 then aP=0;aO=0;for l,v in next,aR do aR[l]={call=0,timeLoaded=0}end end;aV()end}for l,v in next,e do if _G[v]and type(_G[v])=="function"then local a_=_G[v]if not aR[v]then aR[v]={call=0,timeLoaded=0}end;_G[v]=function(...)aR[v].call=aR[v].call+1;if aZ[v]then aZ[v](table.unpack({...}))end;local b0=os.time()a_(table.unpack({...}))local b1=os.time()-b0;aP=aP-aR[v].timeLoaded;aR[v].timeLoaded=aR[v].timeLoaded+b1+b1*0.15;aP=aP+aR[v].timeLoaded end else if aZ[v]then _G[v]=aZ[v]end end end end},['parse-xml']={AUTHOR='http://lua-users.org/wiki/LuaXml',_VERSION='1.0',dependencies={},['parse']=function(b2)local a9={}local b3={}table.insert(a9,b3)local b4,a6,b5,b6,b7;local l,aE=1,1;while true do b4,aE,a6,b5,b6,b7=string.find(b2,"<(%/?)([%w:]+)(.-)(%/?)>",l)if not b4 then break end;local b8=string.sub(b2,l,b4-1)if not string.find(b8,"^%s*$")then table.insert(b3,b8)end;local m={}string.gsub(b6,"([%-%w]+)=([\"'])(.-)%2",function(b9,ba,bb)m[b9]=bb end)if b7=="/"then table.insert(b3,{label=b5,xarg=m,empty=1})elseif a6==""then b3={label=b5,xarg=m}table.insert(a9,b3)else local bc=table.remove(a9)b3=a9[#a9]if#a9<1 then error("nothing to close with "..b5)end;if bc.label~=b5 then error("trying to close "..bc.label.." with "..b5)end;table.insert(b3,bc)end;l=aE+1 end;local b8=string.sub(b2,l)if not string.find(b8,"^%s*$")then table.insert(a9[#a9],b8)end;if#a9>1 then error("unclosed "..a9[#a9].label)end;return a9[1]end},['foreach-index']={AUTHOR='https://stackoverflow.com/users/68204/rberteig',_VERSION='1.0',dependencies={},['run']=function(ae,T,bd)local be={}for a4,ba in next,ae do be[#be+1]=a4 end;table.sort(be,bd)for ba,a4 in ipairs(be)do T(a4,ae[a4])end end}}local bf=1547917483395+2628*10^6;require=function(bg)if bg=='hide-warning'then bf=false else if bf and os.time()>bf then bf=false;print("<R>Warning! You may be using an outdated version of require, check in <i>pastebin.com/u/KananGamer</i> if this has a better version, otherwise you can disable this warning with require('hide-warning').</R>")end;if f[bg]then if f[bg]['INIT_SCRIPT']and type(f[bg]['INIT_SCRIPT'])=='function'then f[bg]['INIT_SCRIPT']()f[bg]['INIT_SCRIPT']=nil end;return f[bg]else print('Library "'..bg..'" not found! <i>Require Version: 1.3.0 | Author: Nettoork#0000</i>')return false end end end end

--[[ Current Version: 1.3.0 ]]--
--[[ Aviso: Esta é uma versão não-oficial do module #freezertag, adaptada com o sistema de afogamento do modo #watercatch. ]]--
--[[ Adaptação feita por Akwimos#1937. Mapa feito por Spectra_phantom#6089 e Morganadxana#0000. ]]--

require("hide-warning")

local stable = require("string-to-boolean").parse
local wait = require("wait-time").check
local sleep = require("sleep")

local admins = {"Nettoork#0000", "Star#8558", "Maarrieh#0000", "Akwimos#1937", "Spectra_phantom#6089"}
admins = stable(admins)

system.disableChatCommandDisplay();

local translations = {
["br"] = {
welcome = "<VP>Seja bem-vindo(a) ao #freezertag!</VP>";
freezed = "<BV>Uuuii, que frio... Parece que você foi congelado!</BV>";
unfreezed = "<BV>Oba! %s descongelou você!</BV>";
freezedLife = "Caso seja descongelado, você só terá mais <R>%d vida(s)</R>!";
unfreezedsomeone = "<BV>Você descongelou %s!</BV>";
noLife = "Você perdeu todas as suas vidas e portanto não pode mais ser descongelado.";
freezerswon = "<D>Os congeladores vivos venceram!</D>";
unfreezerswon = "<D>Os jogadores vivos venceram!</D>";
are_freezer = "Você é um <R>congelador</R>! Pressione <R>ESPAÇO</R> nos jogadores para congela-los.";
are_unfreezer = "Fuja do(s) ratinho(s) com a cor do nome <BV>azul</BV>! Pressione <BV>ESPAÇO</BV> nos jogadores para descongela-los. Você só pode ser descongelado <B>%d vezes</B>!<br>Descongele ratinhos para conseguir mais vidas!";
playerWithoutLife = "<VP>Me parece que esse jogador já virou picolé...</VP>";
gotHp = "<VP>Você teve a sorte de ganhar <R>+1 vida</R> por ter descongelado %s!</VP>";
nowPopsicle = "<VP>%s virou picolé!</VP>";
chance = "<font color='#E9E654'>Chance de ser congelador(a): <B><R>%s</font>";
player_banned = "<R>O(a) jogador(a) <VP>%s</VP> foi proibido(a) de jogar na sala.</R>";
player_unbanned = "<R>Agora <VP>%s</VP> pode jogar novamente.</R>";
player_drowned = "<VP>%s</VP> morreu afogado dentro do rio!</R>";
}
}

translations.en = translations.br

local config = {
freezer_radius = 50;
unfreezer_radius = 50;
start_hp = 3;
hp_chance = 30;
players_per_freezers = 8;
freezer_delay = 2000;
unfreezer_delay = 15000;
game_time = 240;
max_players = 50;
object_start_id = 100000;
select_freezers_time = 10000;
end_game_time = 30000;
min_moving_players = 5;
room_language = translations[tfm.get.room.community] and tfm.get.room.community or 'en';
}


local maps = {7913565, 7913602, 7913605}

local cache = {}
local db = {}
local game = {}
local banned_players = {}

tfm.exec.setRoomMaxPlayers(config.max_players)

local function reset_game()
game = {
players = {};
freezers = {};
freezed = {};
unfreezer_alive = 0;
freezer_alive = 0;
ending = false;
started = false;
potencial_players = {};
give_cheese = false;
set_freezers = false;
}
end

local split = function(t, s)
local a={}
for i in string.gmatch(t, "[^" .. (s or "%s") .. "]+") do
a[#a + 1] = i
end
return a
end

local function translate(message)
return translations[config.room_language] and translations[config.room_language][message] or translations[config.room_language][message]
end

local function freeze(freezer_name)
for name, data in next, tfm.get.room.playerList do
local freezer = tfm.get.room.playerList[freezer_name]

if math.abs(data.x - freezer.x) <= config.freezer_radius and math.abs(data.y - freezer.y) <= config.freezer_radius then
if not game.freezers[name] and not data.isDead then
if wait("player_freeze", freezer_name, config.freezer_delay, false) then
tfm.exec.killPlayer(name)
game.freezed[name] = tfm.exec.addShamanObject(54, data.x, data.y, 0, 0, 0, false)

tfm.exec.chatMessage(translate("freezed"), name)
tfm.exec.playSound("/transformice/son/gel.mp3", 75, nil, nil, name)

if game.players[name].hp > 0 then
updateLife(name, -1)
end

if game.players[name].hp < 1 then
tfm.exec.chatMessage(translate("noLife"), name)
tfm.exec.chatMessage(translate("nowPopsicle"):format(name))
else
tfm.exec.chatMessage(translate("freezedLife"):format(game.players[name].hp), name)
end
tfm.exec.setNameColor(freezer_name, 0x009DFF)
end
break
end
end
end
end

local function unfreeze(unfreezer_name)
local noLife

for name, id in next, game.freezed do
local object = tfm.get.room.objectList[id]
local unfreezer = tfm.get.room.playerList[unfreezer_name]

if math.abs(object.x - unfreezer.x) <= config.unfreezer_radius and math.abs(object.y - unfreezer.y) <= config.unfreezer_radius then
if game.players[name].hp > 0 then
if wait("player_freeze", unfreezer_name, config.unfreezer_delay, false) then
game.players[name].x = object.x
game.players[name].y = object.y

tfm.exec.removeObject(id)
ui.removeTextArea(config.object_start_id + id)

tfm.exec.respawnPlayer(name)
tfm.exec.chatMessage(translate("unfreezed"):format(unfreezer_name), name)
tfm.exec.playSound("/transformice/son/depart.mp3", 75, nil, nil, name)
db[name].chance = db[name].chance + 1

local lucky = math.random(100)
if lucky <= 15 then
tfm.exec.chatMessage(translate("gotHp"):format(name), unfreezer_name)
updateLife(unfreezer_name, 1)
else
tfm.exec.chatMessage(translate("unfreezedsomeone"):format(name), unfreezer_name)
end

game.freezed[name] = nil
end
else
noLife = true
end
break
end
end

if noLife then
tfm.exec.chatMessage(translate("playerWithoutLife"), unfreezer_name)
end
end

function change_map()
if #cache == 0 then
for index, map in next, maps do
cache[#cache + 1] = map
end
end
tfm.exec.newGame(table.remove(cache, math.random(#cache)), math.random(1, 5) == 1 and true or false)
end

function updateLife(name, to_inc)
if to_inc then
game.players[name].hp = game.players[name].hp + to_inc
end

local hp = game.players[name].hp
tfm.exec.setPlayerScore(name, hp, false)

for i, v in next, game.players[name].lifes do
tfm.exec.removeImage(v)
end

if hp > 0 then
for i = 1, hp do
game.players[name].lifes[#game.players[name].lifes + 1] = tfm.exec.addImage('1674802a592.png', ':1', 5 + (28 * (i - 1)), 23, name)
end
end
end

function eventNewGame()
ui.setMapName("<N><b>#Freezer</b><font color='#0080ff'><b>Water</b> <VP>- por <b>Akwimos#1937</b>")
tfm.exec.setGameTime(config.game_time)

if game and game.freezed then
for i, id in next, game.freezed do
ui.removeTextArea(config.object_start_id + id)
end
end

reset_game()
ui.removeTextArea(1)

for name, data in next, tfm.get.room.playerList do
game.players[name] = {
hp = 3;
lifes = {};
o = 100;
}

tfm.exec.setPlayerScore(name, game.players[name].hp, false)
tfm.exec.setNameColor(name, 0xB5B5B5)
showWater(name)
game.unfreezer_alive = game.unfreezer_alive + 1

if banned_players[name] then
tfm.exec.killPlayer(name)
updateLife(name, game.players[name].hp * -1)
else
updateLife(name)
end
end
end

function updateChance(name, chance)
local c = ("%.2d"):format(chance)
c = tonumber(c:find("0") == 1 and c:sub(2) or c)

if c < 0 then
c = 0
end

ui.addTextArea(1, translate("chance"):format(tostring(c)).."%", name, 10, 340, 0, 0, 1, 1, 0, true)
end

function showWater(name)
	if tfm.get.room.currentMap == "@7913565" then
		tfm.exec.addImage("17df24985c5.png","?1",40,330,name)
		tfm.exec.addImage("17def3df6c5.jpg","?1",-300,347,name,1,1.1)
		tfm.exec.addImage("17def3e4466.png","!1",-300,306,name,12,1.7,0,0.95)
		tfm.exec.addImage("17def3da8f8.png","!1",-225,337,name,1,1,0,0.7125)
	elseif tfm.get.room.currentMap == "@7913602" then
		tfm.exec.addImage("181f9cf5fc5.png", "?1", -800, 332, name, 1.0, 1.0, 0, 1.0)
		tfm.exec.addImage("181f9cf5fc5.png", "!1", -800, 332, name, 1.0, 1.0, 0, 0.7)
		tfm.exec.addImage("181f9cfac65.png", "!1", -800, 390, name, 10, 6, 0, 1.0)
		for c=0,3 do
			tfm.exec.addImage("181f9cff961.jpg","?1",-800+(c*1795),376,name)
		end
	elseif tfm.get.room.currentMap == "@7913605" then
		tfm.exec.addImage("18200689108.png", "?1", -800, 332, name, 1.0, 1.0, 0, 1.0)
		tfm.exec.addImage("18200689108.png", "!1", -800, 332, name, 1.0, 1.0, 0, 0.7)
		tfm.exec.addImage("1820068de62.png", "!1", -800, 390, name, 6, 4, 0, 1)
		tfm.exec.addImage("18200692b61.jpg","?1",-800,376,name,4,3)
	end
	tfm.exec.addImage("17a53e1f94c.png",":1",0,350,name)
	ui.addTextArea(11,"",name,8,390,790,3,0x101010,0x060606,1.0,true)
end

function eventLoop(s, r)
for name, data in next, tfm.get.room.playerList do
	if game.started and not data.isDead and game.players[name] then
		if tfm.get.room.playerList[name].y < 348 then
			if game.players[name].o < 99 then
				game.players[name].o=game.players[name].o+2
			end
		else
			tfm.exec.playSound("/transformice/son/bulle2.mp3", 20, nil, nil, name)
			game.players[name].o=game.players[name].o-1
		end
		if game.players[name].o <= 0 then
			game.players[name].hp=0
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage(translate("player_drowned"):format(name))
			tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 80, nil, nil, name)
		end
		if game.players[name].o > 30 then
			ui.addTextArea(10,"",name,8,390,(game.players[name].o*7.9),3,0xf0f0f0,0x808080,1.0,true)
		else
			tfm.exec.playSound("/transformice/son/bulle3.mp3", 30, nil, nil, name)
			ui.addTextArea(10,"",name,8,390,(game.players[name].o*7.9),3,0x801500,0xa01000,1.0,true)
		end
	end
end
if not game.set_freezers and s >= config.select_freezers_time and s <= config.select_freezers_time+2000 then
game.set_freezers = true
local total_chance, total_data = 0, 0

local pont = 0

for name, data in next, game.potencial_players do
pont = pont + 1
end

local isdead = {}

for name, data in next, tfm.get.room.playerList do
if pont >= config.min_moving_players and not game.potencial_players[name] and not data.isDead then
tfm.exec.killPlayer(name)
isdead[name] = true
else
total_data = total_data + 1
total_chance = total_chance + db[name].chance
end
end

local players = {}

for name, data in next, tfm.get.room.playerList do
if not data.isDead and not isdead[name] and not banned_players[name] then
players[#players + 1] = name
end
end

local p = math.floor(#players/config.players_per_freezers) + 1
for i = 1, p do
local rand = math.random() * total_chance

local found = false

while not found do
for id, name in next, players do
if rand < db[name].chance then
total_chance = total_chance - db[name].chance
game.freezers[#game.freezers + 1] = table.remove(players, id)
game.unfreezer_alive = game.unfreezer_alive - 1
game.freezer_alive = game.freezer_alive + 1
db[name].chance = 1
ui.removeTextArea(1, name)
found = true
break
else
rand = rand - db[name].chance
end
end
end
end

if #game.freezers <= 0 then
return change_map()
end

game.freezers = stable(game.freezers)

for name, data in next, tfm.get.room.playerList do
if not data.isDead then
if game.freezers[name] then
tfm.exec.chatMessage(translate("are_freezer"), name)
tfm.exec.setNameColor(name, 0x009DFF)
updateLife(name, game.players[name].hp * -1)
else
db[name].chance = db[name].chance + 1
total_chance = total_chance + 1
tfm.exec.chatMessage(translate("are_unfreezer"):format(config.start_hp), name)
end
end
end

for name, data in next, db do
if not game.freezers[name] then
updateChance(name, data.chance*100/total_chance)
end
end

game.started = true
elseif not game.give_cheese and r >= config.end_game_time and r <= config.end_game_time+2000 and game.unfreezer_alive > 0 then
game.give_cheese = true
end_game(false)
elseif game.freezer_alive and (r <= 0 or (game.freezer_alive <= 0 and game.unfreezer_alive <= 0)) then
change_map()
end

if game.ending then
for name in next, admins do
local p = tfm.get.room.playerList[name]
if p and not p.isDead and not game.freezers[name] then
tfm.exec.setNameColor(name, math.random(0x000000, 0xFFFFFF))
end
end
elseif not game.started then
for name, data in next, tfm.get.room.playerList do
if not data.isDead and (data.movingLeft or data.movingRight or data.isJumping) then
game.potencial_players[name] = data
end
end
end

if game.freezed then
for name, id in next, game.freezed do
local object = tfm.get.room.objectList[id]

if object and game.players[name].hp > 0 then
ui.addTextArea(config.object_start_id + id, "<B><font color='#000000'>" .. name .. "</font></B>\n<p align='center'><B><R>"..game.players[name].hp.." hp</R></B>", nil, object.x - (string.len(name) * 4), object.y - 10, 0, 0, 1, 1, 0, false)
else
game.freezed[name] = nil
ui.removeTextArea(config.object_start_id + id)
break
end
end
end
end

function end_game(freezers_won)
if not game.ending then
game.ending = true

if freezers_won then
for name, data in next, tfm.get.room.playerList do
if not data.isDead and game.freezers[name] then
tfm.exec.giveCheese(name)
tfm.exec.playSound("/deadmaze/niveau/gain_niveau.mp3", 68, nil, nil, name)
end
end
else
for name, data in next, tfm.get.room.playerList do
if not data.isDead and not game.freezers[name] then
tfm.exec.giveCheese(name)
tfm.exec.playSound("/deadmaze/niveau/gain_niveau.mp3", 68, nil, nil, name)
end
end
end

for name in next, game.players do
updateLife(name, game.players[name].hp * -1)
end

local ids = {}

for i, v in next, tfm.get.room.objectList do
ids[#ids + 1] = v.id
end
for i, v in next, ids do
tfm.exec.removeObject(v)
end

for i, id in next, game.freezed do
ui.removeTextArea(config.object_start_id + id)
end

game.freezed = {}
tfm.exec.setGameTime(30)
end
end

function check_players(name, died)
if not game.freezers[name] then
game.unfreezer_alive = game.unfreezer_alive + (died and -1 or 1)

if game.unfreezer_alive <= 0 then
return end_game(true)
end
else
game.freezer_alive = game.freezer_alive + (died and -1 or 1)
game.freezers[name] = nil

for _ in next, game.freezers do
return
end

return end_game()
end

if game.freezer_alive <= 0 and game.unfreezer_alive <= 0 then
return change_map()
end
end

function eventKeyboard(name, key, down, x, y)
if key == 32 then
if not tfm.get.room.playerList[name].isDead and not game.ending then
if wait("wait_keyboard", name, 1000, false) then
if game and game.freezers and game.freezers[name] then
freeze(name)
else
unfreeze(name)
end
end
end
end
end

function eventPlayerDied(name)
check_players(name, true)
end

function eventPlayerLeft(name)
if game.players[name] then
game.players[name].hp = 0
end
end

function eventPlayerWon(name)
check_players(name, true)
db[name].chance = db[name].chance + 5
end

function eventPlayerRespawn(name)
check_players(name)

if game.players[name].x then
tfm.exec.movePlayer(name, game.players[name].x, game.players[name].y)
end
end

function eventNewPlayer(name)
tfm.exec.bindKeyboard(name, 32, true, true)
tfm.exec.lowerSyncDelay(name)

db[name] = {
chance = 1;
}

tfm.exec.chatMessage(translate("welcome"), name)
ui.setMapName("<N><b>#Freezer</b><font color='#0080ff'><b>Water</b> <VP>- por <b>Akwimos#1937</b>")
end

function eventChatCommand(name, command)
local arg = split(command, " ")

if admins[name] then
if arg[1] == 'ban' and arg[2] then
if banned_players[arg[2]] then
tfm.exec.chatMessage('ERROR', name)
else
tfm.exec.chatMessage(translate("player_banned"):format(arg[2]))
banned_players[arg[2]] = true
tfm.exec.killPlayer(arg[2])
end
elseif arg[1] == 'unban' and arg[2] then
if banned_players[arg[2]] then
tfm.exec.chatMessage(translate("player_unbanned"):format(arg[2]))
banned_players[arg[2]] = nil
else
tfm.exec.chatMessage('ERROR', name)
end
elseif arg[1] == 'np' and arg[2] then
tfm.exec.newGame(arg[2])
elseif arg[1] == 'freeze' and arg[2] and tfm.get.room.playerList[arg[2]] then
freeze(arg[2])
elseif arg[1] == 'unfreeze' and arg[2] and tfm.get.room.playerList[arg[2]] then
unfreeze(arg[2])
end
end

end

table.foreach(tfm.get.room.playerList, eventNewPlayer)

for index, value in next, {'AutoShaman', 'AutoNewGame', 'AutoTimeLeft', 'AutoScore', 'PhysicalConsumables', 'DebugCommand', 'MinimalistMode'} do
tfm.exec['disable' .. value]()
end

change_map()
