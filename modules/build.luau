local exec = require("./exec")

local function build(build_name: string, project_file: string?): ()
	exec("rojo", {"build", project_file or "", "-o", `{build_name}.rbxl`})
end

return build