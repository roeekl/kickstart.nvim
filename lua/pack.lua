local M = {}

local function get_pack_path(name)
  return vim.fn.stdpath('data') .. '/site/pack/deps/' .. name .. '/' .. name
end

function M.ensure(repo, name, opts)
  opts = opts or {}
  local install_path = get_pack_path(name or repo:match('[^/]+$'))

  if not vim.uv.fs_stat(install_path) then
    vim.notify('Installing ' .. repo, vim.log.levels.INFO)
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      '--single-branch',
      opts.branch and '--branch=' .. opts.branch or nil,
      'https://github.com/' .. repo,
      install_path,
    })
    return true
  end
  return false
end

function M.setup(plugins)
  local packpath = vim.fn.stdpath('data') .. '/site'
  vim.opt.packpath:prepend(packpath)

  for _, plugin in ipairs(plugins) do
    local repo = plugin[1] or plugin.repo
    local name = plugin.name or repo:match('[^/]+$')
    local opts = plugin.opts or {}

    M.ensure(repo, name, { branch = plugin.branch })

    if plugin.config then
      plugin.config()
    end
  end

  vim.cmd('packloadall')
end

return M
