local http = require("resty.http",args)
--创建http客户端实例
local httpc = http.new()

local data ="{ 'sql':'select kv_column,kv_source,count(*) pv from GDM_SDK_APP_EVENT_KV_HOUR_VIEW  group by kv_column,kv_source  order by pv desc limit 10', 'offset':0, 'limit':5000, 'acceptPartial':true, 'project':'news' }"
local resp, err = httpc:request_uri("http://olap.service.163.org", {
    method = "POST",
    path = "/kylin/api/query",
    body = data,
    headers = {
        ["Authorization"] = "Basic ZGF0YWN1YmU6ZGF0YWN1YmU=",
        ["Content-Type"] = "application/json"
    }
})

--local resp, err = httpc:request_uri("http://s.taobao.com", {
--    method = "GET",
--    path = "/search?q=hello",
--    headers = {
--        ["User-Agent"] = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36"
--    }
--})

if not resp then
    ngx.say("request error :", err)
    return
end

--获取状态码  
ngx.status = resp.status

--获取响应头  
for k, v in pairs(resp.headers) do
    if k ~= "Transfer-Encoding" and k ~= "Connection" then
        ngx.header[k] = v
    end
end
--响应体  
ngx.say(resp.body)

httpc:close()
