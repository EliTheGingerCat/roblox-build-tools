--> Sync instances from the built Place into the filesystem.

local build_name = require("../build_name")
local syncback = require("@tools/syncback")

syncback("syncback.project.json", build_name)