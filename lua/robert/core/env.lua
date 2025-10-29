local M = {}

local function set_env_from_table(entries)
	for key, value in pairs(entries) do
		if type(key) == "string" and type(value) == "string" and value ~= "" and vim.env[key] == nil then
			vim.env[key] = value
		end
	end
end

function M.setup()
	local ok, secrets = pcall(require, "robert.env")
	if ok and type(secrets) == "table" then
		set_env_from_table(secrets)
	end
end

return M
