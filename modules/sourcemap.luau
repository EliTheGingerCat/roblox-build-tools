local exec = require("./exec")

local function sourcemap(): ()
	exec("rojo", {"sourcemap", "-o", "sourcemap.json", "--watch"})
end

return sourcemap