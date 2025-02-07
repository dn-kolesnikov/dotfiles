-- @param name module
local function safeRequire(module)
	local ok, loadedModule = pcall(require, module)
	if ok then
		return loadedModule
	end
	print("Error loading " .. module)
end

safeRequire("core.options")
safeRequire("core.mappings")
safeRequire("core.autocmds")
safeRequire("core.bootstrap")
