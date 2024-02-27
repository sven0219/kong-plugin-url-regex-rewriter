local typedefs = require "kong.db.schema.typedefs"

return {
  name = "url-regex-rewriter",
  fields = {
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { replace = { type = "string",required = true} },
          { regex = { type = "string",required = true} },
        },
      },
    },
  },
}
