--> Perform syncback for the sake of archiving old games.

local build_name = require("../build_name")
local syncback = require("@tools/syncback")

syncback("syncback-archive.project.json", build_name)