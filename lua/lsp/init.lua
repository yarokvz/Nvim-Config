local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- require "lsp.lsp_installer"
-- require("lsp.handlers").setup()
require "lsp.handler"
require "lsp.mason"
require "lsp.null"
require("lsp.dap")
-- require "lsp.tabnine"
