local exec = require("./exec")

local function syncback(syncback_file: string, build_name: string): ()
	exec("rojo-syncback", {"syncback", syncback_file, "--input", `./{build_name}.rbxl`}, {
		stdio = {
			stdin = "y"
		}
	})
end

return syncback