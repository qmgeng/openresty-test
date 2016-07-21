--
-- Created by IntelliJ IDEA.
-- User: qmgeng
-- Date: 16/7/21
-- Time: 上午11:01
-- To change this template use File | Settings | File Templates.
--
local _M = {}

-- 对输入参数逐个进行校验，只要有一个不是数字类型，则返回 false
function _M.is_number(...)
    local arg = { ... }

    local num
    for _, v in ipairs(arg) do
        num = tonumber(v)
        if nil == num then
            return false
        end
    end

    return true
end

return _M

