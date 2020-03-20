" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! go#lsp#message#Initialize(wd) abort
  return {
          \ 'notification': 0,
          \ 'method': 'initialize',
          \ 'params': {
            \ 'processId': getpid(),
            \ 'rootUri': go#path#ToURI(a:wd),
            \ 'capabilities': {
              \ 'workspace': {
                \ 'workspaceFolders': v:true,
<<<<<<< HEAD
<<<<<<< HEAD
=======
                \ 'didChangeConfiguration': {
                  \ 'dynamicRegistration': v:true,
                \ },
                \ 'configuration': v:true,
>>>>>>> 3aefdbd21a18d5b83e42eaf4dc722b0c5918f6f2
=======
>>>>>>> master
              \ },
              \ 'textDocument': {
                \ 'hover': {
                  \ 'contentFormat': ['plaintext'],
                \ },
              \ }
            \ }
          \ }
       \ }
endfunction

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> master
function! go#lsp#message#workspaceFolders(dirs) abort
  return map(copy(a:dirs), function('s:workspaceFolderToURI', []))
endfunction

function s:workspaceFolderToURI(key, val) abort
  return go#path#ToURI(a:val)
<<<<<<< HEAD
=======
function! go#lsp#message#Initialized() abort
  return {
          \ 'notification': 1,
          \ 'method': 'initialized',
          \ 'params': {},
       \ }
endfunction

function! go#lsp#message#Shutdown() abort
  return {
          \ 'notification': 0,
          \ 'method': 'shutdown',
       \ }
endfunction

function! go#lsp#message#Exit() abort
  return {
          \ 'notification': 1,
          \ 'method': 'exit',
       \ }
endfunction

function! go#lsp#message#WorkspaceFoldersResult(dirs) abort
  return map(copy(a:dirs), function('s:workspaceFolder', []))
>>>>>>> 3aefdbd21a18d5b83e42eaf4dc722b0c5918f6f2
=======
>>>>>>> master
endfunction

function! go#lsp#message#Definition(file, line, col) abort
  return {
          \ 'notification': 0,
          \ 'method': 'textDocument/definition',
          \ 'params': {
          \   'textDocument': {
          \       'uri': go#path#ToURI(a:file)
          \   },
          \   'position': s:position(a:line, a:col)
          \ }
       \ }
endfunction

function! go#lsp#message#TypeDefinition(file, line, col) abort
  return {
          \ 'notification': 0,
          \ 'method': 'textDocument/typeDefinition',
          \ 'params': {
          \   'textDocument': {
          \       'uri': go#path#ToURI(a:file)
          \   },
          \   'position': s:position(a:line, a:col)
          \ }
       \ }
endfunction

function! go#lsp#message#DidOpen(file, content) abort
  return {
          \ 'notification': 1,
          \ 'method': 'textDocument/didOpen',
          \ 'params': {
          \     'textDocument': {
          \         'uri': go#path#ToURI(a:file),
          \         'languageId': 'go',
          \         'text': a:content,
          \     }
          \ }
       \ }
endfunction

function! go#lsp#message#DidChange(file, content) abort
  return {
          \ 'notification': 1,
          \ 'method': 'textDocument/didChange',
          \ 'params': {
          \     'textDocument': {
          \         'uri': go#path#ToURI(a:file),
          \     },
          \     'contentChanges': [
          \       {
          \         'text': a:content,
          \       }
          \     ]
          \ }
       \ }
endfunction

function! go#lsp#message#DidClose(file) abort
  return {
          \ 'notification': 1,
          \ 'method': 'textDocument/didClose',
          \ 'params': {
          \     'textDocument': {
          \         'uri': go#path#ToURI(a:file),
          \     }
          \ }
       \ }
endfunction

function! go#lsp#message#Completion(file, line, col) abort
  return {
          \ 'notification': 0,
          \ 'method': 'textDocument/completion',
          \ 'params': {
          \   'textDocument': {
          \       'uri': go#path#ToURI(a:file)
          \   },
          \   'position': s:position(a:line, a:col),
          \ }
       \ }
endfunction

function! go#lsp#message#Hover(file, line, col) abort
  return {
          \ 'notification': 0,
          \ 'method': 'textDocument/hover',
          \ 'params': {
          \   'textDocument': {
          \       'uri': go#path#ToURI(a:file)
          \   },
          \   'position': s:position(a:line, a:col),
          \ }
       \ }
endfunction

<<<<<<< HEAD
<<<<<<< HEAD
function! go#lsp#message#AddWorkspaces(dirs) abort
  let l:dirs = map(copy(a:dirs), function('s:workspaceFodlerToAddURI', []))
=======
function! go#lsp#message#ChangeWorkspaceFolders(add, remove) abort
  let l:addDirs = map(copy(a:add), function('s:workspaceFolder', []))
  let l:removeDirs = map(copy(a:add), function('s:workspaceFolder', []))
>>>>>>> 3aefdbd21a18d5b83e42eaf4dc722b0c5918f6f2
=======
function! go#lsp#message#AddWorkspaces(dirs) abort
  let l:dirs = map(copy(a:dirs), function('s:workspaceFodlerToAddURI', []))
>>>>>>> master

  return {
          \ 'notification': 1,
          \ 'method': 'workspace/didChangeWorkspaceFolders',
          \ 'params': {
          \   'event': {
<<<<<<< HEAD
<<<<<<< HEAD
          \     'added': l:dirs,
=======
          \     'removed': l:removeDirs,
          \     'added': l:addDirs,
>>>>>>> 3aefdbd21a18d5b83e42eaf4dc722b0c5918f6f2
=======
          \     'added': l:dirs,
>>>>>>> master
          \     },
          \ }
       \ }

endfunction

<<<<<<< HEAD
<<<<<<< HEAD
function s:workspaceFolderToAddURI(key, val) abort
=======
function! go#lsp#message#ConfigurationResult(items) abort
  let l:result = []

  " results must be in the same order as the items
  for l:item in a:items
    let l:config = {
          \ 'buildFlags': [],
          \ 'hoverKind': 'NoDocumentation',
          \ }
    let l:buildtags = go#config#BuildTags()
    if buildtags isnot ''
      let l:config.buildFlags = extend(l:config.buildFlags, ['-tags', go#config#BuildTags()])
    endif

    let l:result = add(l:result, l:config)
  endfor

  return l:result
endfunction

function s:workspaceFolder(key, val) abort
>>>>>>> 3aefdbd21a18d5b83e42eaf4dc722b0c5918f6f2
=======
function s:workspaceFolderToAddURI(key, val) abort
>>>>>>> master
  return {'uri': go#path#ToURI(a:val), 'name': a:val}
endfunction

function! s:position(line, col) abort
  return {'line': a:line - 1, 'character': a:col-1}
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
