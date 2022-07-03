local fs = require('std.fs')

local texlab_build_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Cancelled = 3,
}

local texlab_forward_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Unconfigured = 3,
}

local function buf_build(bufnr)
  local texlab_client = vim.lsp.get_active_clients({bufnr=bufnr, name='texlab'})[1]
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
  }
  if texlab_client then
    texlab_client.request('textDocument/build', params, function(err, result)
      if err then
        error(tostring(err))
      end
      print('Build ' .. texlab_build_status[result.status])
    end, bufnr)
  else
    print 'method textDocument/build is not supported by any servers active on the current buffer'
  end
end

local function buf_search(bufnr)
  local texlab_client = vim.lsp.get_active_clients({bufnr=bufnr, name='texlab'})[1]
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
    position = { line = vim.fn.line '.' - 1, character = vim.fn.col '.' },
  }
  if texlab_client then
    texlab_client.request('textDocument/forwardSearch', params, function(err, result)
      if err then
        error(tostring(err))
      end
      print('Search ' .. texlab_forward_status[result.status])
    end, bufnr)
  else
    print 'method textDocument/forwardSearch is not supported by any servers active on the current buffer'
  end
end

vim.lsp.start({
    cmd = { 'texlab' },
    filetypes = { 'tex', 'bib' },
    root_dir = fs.dirname(unpack(vim.fs.find({ ".git", ".latexmkrc" }, {
      upward = true,
      path = fs.file_dir(),
    }))),
    single_file_support = true,
    settings = {
      texlab = {
        rootDirectory = nil,
        build = {
          executable = 'latexmk',
          args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
          onSave = false,
          forwardSearchAfter = false,
        },
        auxDirectory = '.',
        forwardSearch = {
          executable = nil,
          args = {},
        },
        chktex = {
          onOpenAndSave = false,
          onEdit = false,
        },
        diagnosticsDelay = 300,
        latexFormatter = 'latexindent',
        latexindent = {
          ['local'] = nil, -- local is a reserved keyword
          modifyLineBreaks = false,
        },
        bibtexFormatter = 'texlab',
        formatterLineLength = 80,
      },
    },
  })
