" -----------------------------
" Add our directory to the path
" -----------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))


" -----------------------------
"  Function
" -----------------------------
function! vim_js2coffee#DoConversion(type, selection_or_buffer)
python << endPython
from vim_js2coffee import *

def create_new_buffer(file_name, file_type, file_path):
    vim.command('rightbelow vsplit {0}'.format(file_name))
    vim.command('normal! ggdG')
    vim.command('setlocal filetype={0}'.format(file_type))
    vim.command('setlocal buftype=nowrite')
    vim.command('0read {0}'.format(file_path))

def get_visual_selection():
    buf = vim.current.buffer
    starting_line_num, col1 = buf.mark('<')
    ending_line_num, col2 = buf.mark('>')
    return vim.eval('getline({}, {})'.format(starting_line_num, ending_line_num))

def get_correct_buffer(buffer_type):
    if buffer_type == "buffer":
        return vim.current.buffer
    elif buffer_type == "selection":
        return get_visual_selection()

def js_to_coffee():
    buf = get_correct_buffer(vim.eval("a:selection_or_buffer"))
    get_coffee_from_js_buffer_contents(buf)
    create_new_buffer("coffee_script_equivalent", "coffee", "/tmp/file.coffee")

def coffee_to_js():
    buf = get_correct_buffer(vim.eval("a:selection_or_buffer"))
    get_js_from_coffee_buffer_contents(buf)
    create_new_buffer("javascript_equivalent", "javascript", "/tmp/file.js")

if vim.eval("a:type") == "javascript":
    js_to_coffee()
elif vim.eval("a:type") == "coffee":
    coffee_to_js()

endPython
endfunction
