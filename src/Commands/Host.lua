local plugin = script:FindFirstAncestorWhichIsA("Plugin")
local require = require(plugin:FindFirstChild("Lighter", true))

local Outlet = require("Outlet")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StudioService = game:GetService("StudioService")

local Command = {}
Command.Alias = {}
Command.Params = {}
Command.Info = {
	"Read your user profile",
}

function Command:Execute(args: table): boolean
	print("Host:")

	local user = StudioService:GetUserId()
	do
		print("- User:", (user == 0 and "Offline" or user))
	end

	local name = user ~= 0 and Players:GetNameFromUserIdAsync(user)
	if name then
		print("- Name:", name)
	end

	local git = Outlet:Get("Register")
	if git then
		print("- GitHub:", git)
	end

	return true
end

return Command
