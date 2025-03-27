vim.opt.nu = true -- 라인 넘버
vim.opt.relativenumber = true -- 상대적 라인 넘버
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.list = true -- 스페이스 및 탭 문자 표기
vim.opt.ignorecase = true -- 검색 시 대소문자 구분 x
vim.opt.smartcase = true 
vim.opt.hlsearch = false -- 검색 결과 전체 하이라이팅 X
vim.opt.incsearch = true -- 점진적 하이라이팅
vim.opt.termguicolors = true  -- enable true color support
vim.opt.splitright = true

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.py",
    callback = function() 
      vim.opt.textwidth = 79
      vim.opt.colorcolumn = "79"
    end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.js", "*.ts", "*.css", "*.lua", "*.html"},
    callback = function() 
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = "*",
   callback = function() 
     if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
       vim.cmd("normal! g`\"")
   	end
   end
})
