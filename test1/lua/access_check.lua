--
-- Created by IntelliJ IDEA.
-- User: qmgeng
-- Date: 16/7/21
-- Time: 上午10:42
-- To change this template use File | Settings | File Templates.
--
local param = require("utils.param")
local args = ngx.req.get_uri_args()

if not param.is_number(args.a, args.b) then
    ngx.say("params error")
    ngx.exit(ngx.HTTP_BAD_REQUEST)
    return
end

