----封装成函数
--local function read_files( fileName )
--    local f = assert(io.open(fileName,'r'))
--    local content = f:read("*all")
--    f:close()
--    return content
--end
--
--local rlt = read_files("/opt/openresty/nginx/workspace/test1/lua/query.json")
--print(rlt)
--ngx.say(rlt, "<br/>")

local iconv = require("iconv")
local togbk = iconv.new("gbk", "utf-8")
local str, err = togbk:iconv("中文")
ngx.say(str)
