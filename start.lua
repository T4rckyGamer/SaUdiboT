serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_Alex = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_Alex = function() 
local Create_Info = function(Token,Sudo,UserName)  
local Alex_Info_Sudo = io.open("sudo.lua", 'w')
Alex_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
Alex_Info_Sudo:close()
end  
if not database:get(Server_Alex.."Token_Alex") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_Alex.."Token_Alex",token)
end 
else
io.write('\n\27[1;31mThe Token was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
io.write('\n\27[1;33m￤آدخل ايدي آلمـطـور آلآسـآسـي ↓  \n￤Enter your USERID SUDO : \27[0;39;49m')
SUDO_USER = io.read():gsub(' ','')
if SUDO_USER == '' then
print('\n\27[1;31m￤ You Did not Enter USERID !\n￤ لم تقوم بآدخآل شـي , يرجى آلآنتبآهہ‏‏ وآدخل آلآن ايدي آلمطور آلآسـآسـي')
create_config(Token)
end 
if not SUDO_USER:match('(%d+)(%d+)(%d+)(%d+)(%d+)') then
print('\n\27[1;31m￤ This is Not USERID !\n￤هہ‏‏ذآ الايدي ليس موجود بل تلكرآم , عذرآ آدخل آلايدي آلصـحيح آلآن . ')
create_config(Token)
end 
print('('..SUDO_USER..')')
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchat?chat_id='..SUDO_USER)
GetUser = json:decode(url)
if res ~= 200 then
end
if GetUser.ok == false then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث خطـآ في آلآتصـآل بآلسـيرفر , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـكن مـن حل آلمـشـكلهہ‏‏ في آسـرع وقت مـمـكن . !')
create_config(Token)
end
GetUser.result.username = GetUser.result.username or GetUser.result.first_name
print('\n\27[1;36m￤تم آدخآل آيدي آلمـطـور بنجآح , سـوف يتم تشـغيل آلسـورس آلآن .\n￤Success Save USERID : \27[0;32m['..SUDO_USER..']\n\27[0;39;49m')
ws = Token:match("(%d+)")
redis:set(ws..":VERSION",1)
redis:set(ws..":SUDO_ID:",SUDO_USER)
redis:set(ws..":DataCenter:",'German')
redis:set(ws..":UserNameBot:",BOT_User)
redis:set(ws..":NameBot:",BOT_NAME)
redis:hset(ws..'username:'..SUDO_USER,'username','@'..GetUser.result.username:gsub('_',[[\_]]))
redis:set("TH3ws_INSTALL","Yes")
info = {} 
info.namebot = BOT_NAME
info.userbot = BOT_User
info.id = SUDO_USER
info.token = Token
info.join  = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
info.folder = io.popen("echo $(cd $(dirname $0); pwd)"):read('*all'):gsub(' ',''):gsub("\n",'')
Cr_file = io.open("./inc/Token.txt", "w")
Cr_file:write(Token)
Cr_file:close()
os.execute('lua start.lua')
end

local function Files_Alex_Info()
Create_Info(database:get(Server_Alex.."Token_Alex"),database:get(Server_Alex.."Id_Alex"),database:get(Server_Alex.."UserName_Alex"))   
local RunAlex = io.open("Alex", 'w')
RunAlex:write([[
#!/usr/bin/env bash
cd $HOME/SourceAlex
token="]]..database:get(Server_Alex.."Token_Alex")..[["
      
while(true) do
rm -fr ../.telegram-cli
./tg -s ./Alex.lua -p PROFILE --bot=$token
done
]])
RunAlex:close()
local RunTs = io.open("brok", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/SourceAlex
while(true) do
rm -fr ../.telegram-cli
screen -S Alex -X kill
screen -S Alex ./Alex
done
]])
RunTs:close()
end
Files_Alex_Info()
database:del(Server_Alex.."Token_Alex");database:del(Server_Alex.."Id_Alex");database:del(Server_Alex.."UserName_Alex")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_Alex()  
var = true
else   
f:close()  
database:del(Server_Alex.."Token_Alex");database:del(Server_Alex.."Id_Alex");database:del(Server_Alex.."UserName_Alex")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
