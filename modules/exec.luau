local process = require("@lune/process")
local stdio = require("@lune/stdio")

local function fix_output(s: string): string
	local mostly_indented = string.gsub(
		s,
		"\n",
		"\n\t"
	)
	return "\t" .. mostly_indented .. "\n"
end

local function exec(program: string, params: {string}?, options: process.ExecOptions?): ()
	local params_string: string
	if params then
		params_string = " " .. table.concat(params, " ")
	else
		params_string = ""
	end

	print(`> {program}{params_string}`)
	local results = process.exec(program, params, options)
	
	stdio.write(fix_output(results.stdout))
	stdio.ewrite(fix_output(results.stderr))

	if not results.ok then
		error("Aborting.")
	end
end

return exec