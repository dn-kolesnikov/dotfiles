local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- code action sources
-- local code_actions = null_ls.builtins.code_actions

-- -- diagnostic sources
-- local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
-- local hover = null_ls.builtins.hover

-- completion sources
-- local completion = null_ls.builtins.completion

local sources = {
	formatting.stylua,
	formatting.goimport,
}

-- local on_attach = function(client)
--
-- end

null_ls.setup({
	sources = sources,
	-- on_attach = on_attach,
})
