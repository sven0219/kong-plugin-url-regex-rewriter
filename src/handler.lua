local urlRegexRewriterHandler = {
  PRIORITY = 777,
  VERSION  = "0.2.0",
}

function urlRegexRewriterHandler:access(conf)
  local newstr, n, err = ngx.re.sub(ngx.escape_uri(ngx.var.uri, 0), conf.regex, conf.replace)
  if n > 0 then
      ngx.var.upstream_uri = newstr
      ngx.log(ngx.NOTICE, string.format("%s ---> %s", ngx.var.uri, ngx.var.upstream_uri))
  end
end

return urlRegexRewriterHandler
