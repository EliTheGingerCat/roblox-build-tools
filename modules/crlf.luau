local fs = require("@lune/fs")

local for_descendants = require("./for_descendants")

local function convert_newlines(s: string): string
	local result = string.gsub(
		s,
		"([^\r])\n",
		"%1\r\n"
	)
	return result
end

local text_extensions = {"luau", "json"}
for index, extension in text_extensions do
	text_extensions[index] = "." .. extension .. "$"
end
local function is_text(path: string): boolean
	for _, extension in text_extensions do
		if string.match(path, extension) ~= nil then
			return true
		end
	end
	return false
end

-- Recursive.
local function crlf(): ()
	for_descendants("./src", function(path)
		if is_text(path) then
			local source = fs.readFile(path)
			local fixed = convert_newlines(source)
			fs.writeFile(path, fixed)
		end
	end)
end

return crlf