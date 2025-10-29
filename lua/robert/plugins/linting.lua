return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			-- svelte = { "eslint_d" },
			python = { "pylint" },
			-- php = { "ecs" },
			yaml = { "yamllint" },
			dockerfile = { "hadolint" },
			-- json = { "jsonlint", "cfn-lint" },
			json = { "jsonlint" },
			sql = { "sqlfluff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Enhanced linting function with error handling
		local function safe_lint()
			local success, err = pcall(function()
				lint.try_lint()
			end)
			if not success then
				-- Silently handle linting errors to avoid interrupting workflow
				-- You can uncomment the line below for debugging
				-- vim.notify("Linting error: " .. tostring(err), vim.log.levels.DEBUG)
			end
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = safe_lint,
		})

		vim.keymap.set("n", "<leader>l", function()
			safe_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
