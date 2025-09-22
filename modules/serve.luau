local exec = require("./exec")

local function serve(project_file: string?): ()
	exec("rojo", {"serve", project_file or ""})
end

return serve