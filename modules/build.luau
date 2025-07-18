local exec = require("./exec")

local function build(build_name: string): ()
	exec("rojo", {"build", "-o", `{build_name}.rbxl`})
end

return build