local M = {}

function M.run_if_enabled(plugin_name, callback)
	local status, lazy_config = pcall(require, 'lazy.core.config')
	if not status then
		return
	end

	local plugin = lazy_config.plugins[plugin_name]
	if plugin and plugin.enabled ~= false then
		callback()
	end
end

return M
