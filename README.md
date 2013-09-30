# vim-js2coffee
JavaScript to CoffeeScript and CoffeeScript to JavaScript from the comfort of your vim buffer.

## Demo
![vim-js2coffee-demo](https://f.cloud.github.com/assets/4416952/1234714/3cc31b68-2987-11e3-90e3-b6bccc89f7eb.gif)


## INSTALLATION

The recommended installation method is vundle <https://github.com/gmarik/vundle>.
installation should also work via pathogen <https://github.com/tpope/vim-pathogen>

REQUIREMENTS
============

You need a VIM version that was compiled with python support, which is typical
for most distributions on Linux/Mac.  You can check this by running
``vim --version | grep +python``
if you get a hit you are in business.

You will need to npm install `js2coffee` and `coffee-script` to preform the actual compilation

Usage
=====

The plugin provides four commands:

    JSBuffer2Coffee
    JSSelection2Coffee
    CoffeeBuffer2JS
    CoffeeSelection2JS

For ease of usage you can map the above actions to a shortcut. For example,
if you wanted leader mappings you could set something like the following in
your vimrc:

    nnoremap<Leader>bc :CoffeeBuffer2JS<CR>
    nnoremap<Leader>sc :CoffeeSelection2JS<CR>
    nnoremap<Leader>bj :JSBuffer2Coffee<CR>
    nnoremap<Leader>bs :JSSelection2Coffee<CR>
