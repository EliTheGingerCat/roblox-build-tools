local exec = require("./exec")

local function syncback(build_name: string, syncback_file: string?): ()
	exec("rojo", {"syncback", syncback_file or "", "--input", `./{build_name}.rbxl`}, {
		stdio = {
			stdin = "y"
		}
	})
end

return syncback