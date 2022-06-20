local packer_available, packer = pcall(require, "packer")
if not packer_available then
  Log:warn "skipping loading plugins until Packer is installed"
  return
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim' 

  if packer_bootstrap then
    packer.sync()
  end
end)
