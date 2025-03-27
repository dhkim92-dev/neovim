-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- copilotchat 
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      view = {
        side = "right"
      },
      -- See Configuration section for options
      prompts = {
        Rename = {
          prompt = "Please rename the variable correctly in given section based on context",
          section = function(source) 
            local select = require('CopilotChat.select')
            return select.visual(source)
          end,
        },
      },
    },

  },

  --
    { "github/copilot.vim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" }},

    -- file tree
    { "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
	      "nvim-tree/nvim-web-devicons",
      },
      config = function()
	      require("nvim-tree").setup {}
      end,
    },
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
    { "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    },
    { "numToStr/Comment.nvim",
    	opts = {
        	-- add any options here
      }
    },
  -- nvim-cmp 플러그인
  { 'hrsh7th/nvim-cmp' },  -- 기본 자동 완성 플러그인
  { 'hrsh7th/cmp-nvim-lsp' },  -- LSP 자동 완성 소스
  { 'hrsh7th/cmp-buffer' },  -- 버퍼 자동 완성 소스
  { 'hrsh7th/cmp-path' },  -- 경로 자동 완성 소스
  { 'saadparwaiz1/cmp_luasnip' },  -- LuaSnip과 연동되는 자동 완성 소스
  { 'L3MON4D3/LuaSnip' },  -- Snippet 플러그인
  { 'onsails/lspkind-nvim' },  -- 아이콘 추가
  { 'neovim/nvim-lspconfig' }  -- LSP 서버 설정
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  -- LuaSnip 확장
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),  -- 이전 항목 선택
    ['<C-n>'] = cmp.mapping.select_next_item(),  -- 다음 항목 선택
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),  -- 문서 위로 스크롤
    ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- 문서 아래로 스크롤
    ['<C-Space>'] = cmp.mapping.complete(),  -- 자동완성 호출
    ['<C-e>'] = cmp.mapping.abort(),  -- 자동완성 종료
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- 선택된 항목 확정
  },
  sources = {
    { name = 'nvim_lsp' },  -- LSP에서 자동 완성
    { name = 'buffer' },  -- 버퍼에서 자동 완성
    { name = 'path' },  -- 파일 경로에서 자동 완성
    { name = 'luasnip' },  -- LuaSnip에서 자동 완성
  },
})

local luasnip = require('luasnip')

-- 스니펫 로딩 예시 (다양한 스니펫 추가 가능)
require('luasnip.loaders.from_vscode').load()


-- LSP 서버 설정
local lspconfig = require('lspconfig')


lspconfig.clangd.setup{}
lspconfig.jdtls.setup{}
lspconfig.kotlin_language_server.setup{}
lspconfig.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {},
  }
}
lspconfig.ts_ls.setup{}
lspconfig.pyright.setup{}
