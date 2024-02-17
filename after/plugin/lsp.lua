local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",
    "eslint",
    "pyright",
    "gopls",
    "golangci_lint_ls",
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- function signature hints
require "lsp_signature".setup({
    hint_prefix = "",
    -- floating_window = false,
    hint_enable = false,
    max_height = 40,
})

-- select hint on Enter
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
  preselect = 'item', -- first item is automatically selected
  completion = {
      completeopt = 'menu,menuone,noinsert'
  },
  window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal",
        },
        documentation = {
            winhighlight = "Normal:CmpDocNormal",
        }
    }
})

-- emmet
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})
