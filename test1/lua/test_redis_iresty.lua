--
-- Created by IntelliJ IDEA.
-- User: qmgeng
-- Date: 16/7/19
-- Time: 上午10:49
-- To change this template use File | Settings | File Templates.
--

local redis = require "utils.redis_iresty"
local red = redis:new()

--local ok, err = red:set("dog", "an animal")
--if not ok then
--    ngx.say("failed to set dog: ", err)
--    return
--end

--调用API获取数据
local resp, err = red:get("dog")
if not resp then
    ngx.say("get msg error : ", err)
    return
end
--得到的数据为空处理
if resp == ngx.null then
    resp = ''  --比如默认值
end
ngx.say("msg : ", resp)


