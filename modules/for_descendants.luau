local fs = require("@lune/fs")

-- Only descendants which are files.
local function for_descendants(start_path: string, callback: (path: string) -> ()): ()
	local paths = {start_path}
	local paths_size = #paths

	for _, path in paths do
		if fs.isDir(path) then
			local children = fs.readDir(path)
			for index, child in children do
				paths[paths_size + index] = path .. "/" .. child
			end
			paths_size += #children
		elseif fs.isFile(path) then
			callback(path)
		end
	end
end

return for_descendants