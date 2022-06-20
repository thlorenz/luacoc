local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

---Get the full path to `$LCOC_CACHE_DIR`
---@return string
function _G.get_cache_dir()
  local lcoc_cache_dir = os.getenv "LCOC_CACHE_DIR"
  if not lcoc_cache_dir then
    return vim.call("stdpath", "cache")
  end
  return lcoc_cache_dir
end


require("lcoc.config"):init()
