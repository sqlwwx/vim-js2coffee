# vim-js2coffee
JavaScript to CoffeeScript and CoffeeScript to JavaScript from the comfort of your vim buffer.

## Demo
![vim-js2coffee-demo](https://f.cloud.github.com/assets/4416952/1234714/3cc31b68-2987-11e3-90e3-b6bccc89f7eb.gif)


## INSTALLATION

Use your plugin manager of choice.

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/JarrodCTaylor/vim-js2coffee ~/.vim/bundle/vim-js2coffee`
- [Vundle](https://github.com/gmarik/vundle)
  - Add `Bundle 'https://github.com/JarrodCTaylor/vim-js2coffee'` to .vimrc
  - Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - Add `NeoBundle 'https://github.com/JarrodCTaylor/vim-js2coffee'` to .vimrc
  - Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - Add `Plug 'https://github.com/JarrodCTaylor/vim-js2coffee'` to .vimrc
  - Run `:PlugInstall`

## REQUIREMENTS

You need a VIM version that was compiled with python support, which is typical
for most distributions on Linux/Mac.  You can check this by running
``vim --version | grep +python``
if you get a hit you are in business.

You will need to npm install `js2coffee` and `coffee-script` to preform the actual compilation. Make
sure that you have access to both `js2coffee` and `coffee` from your shell in order for this plugin
to be able to function.

### Note for OSX users
It seems that even after globaly npm installing js2coffee it will still not be on the path as a
default. Extending the PATH with `export PATH=/usr/local/share/npm/bin:$PATH` should get you started.


## Usage

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
