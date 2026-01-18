if not nixCats('general') then
  return
end
-- NOTE: lsp setup via lspconfig

local servers = {}

-- Web
servers.html = {}
servers.jsonls = {}
servers.cssls = {}
servers.ts_ls = {}

servers.qmlls = {} -- Qt
servers.pylsp = {
  settings = {
    root_markers = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "pyrightconfig.json",
      ".git",
      "ruff.toml",
    },
    lsp = {
      filetypes = { "python" },
      settings = {
        pylsp = {
          signatue = {
            formatter = "ruff",
          },
          plugins = {
            ruff = {
              enabled = true, -- Enable the plugin
              cmd_env = { RUFF_TRACE = "messages" },
              init_options = {
                settings = {
                  logLevel = "info",
                  configurationPreference = "filesystemFirst",
                  lint = {
                    preview = true,
                  },
                  format = {
                    preview = true,
                  },
                  configuration = {
                    format = {
                      ["quote-style"] = "single",
                    },
                  },
                },
              },
              formatEnabled = true, -- Enable formatting using ruffs formatter
              executable = "ruff", -- Custom path to ruff
              preview = true, -- Whether to enable the preview style linting and formatting.
              targetVersion = "py313", -- The minimum python version to target (applies for both linting and formatting).
            },
            rope_autoimport = { enabled = false },
            pyflakes = { enabled = true },
            flake8 = { enabled = false },
            pylint = { enabled = false },
            mccabe = { enabled = false },
            autopep8 = { enabled = false },
            jedi = { enabled = false },
            preload = { enabled = false },
            pycodestyle = { enabled = false },
            yapf = { enabled = false },
          },
        },
      },
    },
  },
}
servers.pyright = {};

-- but you can provide some if you want to!
servers.lua_ls = {
  settings = {
    Lua = {
      formatters = {
        ignoreComments = true,
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { 'vim', 'nixCats' },
        disable = { 'missing-fields' },
      },
    }
  }
}
-- nixd requires some configuration.
-- luckily, the nixCats plugin is here to pass whatever we need!
-- for additional configuration options, refer to:
-- https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md
servers.nil_ls = {}
servers.nixd = {
  settings = {
    nixd = {
      nixpkgs = {
        -- in the extras set of your package definition:
        -- nixdExtras.nixpkgs = ''import ${pkgs.path} {}''
        expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
      },
      options = {
        -- If you integrated with your system flake,
        -- you should use inputs.self as the path to your system flake
        -- that way it will ALWAYS work, regardless
        -- of where your config actually was.
        nixos = {
          -- in this package definition's.extra set
          -- nixdExtras.nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.configname.options''
          expr = nixCats.extra("nixdExtras.nixos_options")
        },
        -- If you have your config as a separate flake, inputs.self would be referring to the wrong flake.
        -- You can override the correct one into your package definition on import in your main configuration,
        -- or just put an absolute path to where it usually is and accept the impurity.
        ["home-manager"] = {
          -- nixdExtras.home_manager_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").homeConfigurations.configname.options''
          expr = nixCats.extra("nixdExtras.home_manager_options")
        }
      },
      formatting = {
        command = { "nixfmt" }
      },
      diagnostic = {
        suppress = {
          "sema-escaping-with"
        }
      }
    }
  }
}

-- set up the servers to be loaded on the appropriate filetypes!
for server_name, cfg in pairs(servers) do
  vim.lsp.config(server_name, cfg)
  vim.lsp.enable(server_name)
end



