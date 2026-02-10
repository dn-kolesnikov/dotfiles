-- @param name module
local function safeRequire(module)
	local ok, loadedModule = pcall(require, module)
	if ok then
		return loadedModule
	end
	print("Error loading " .. module)
end

safeRequire("core.globals")
safeRequire("core.bootstrap")
safeRequire("core.options")
safeRequire("core.mappings")
safeRequire("core.autocmds")
