command! JSBuffer2Coffee call vim_js2coffee#DoConversion("javascript", "buffer")
command! -range JSSelection2Coffee call vim_js2coffee#DoConversion("javascript", "selection")
command! CoffeeBuffer2JS call vim_js2coffee#DoConversion("coffee", "buffer")
command! -range CoffeeSelection2JS call vim_js2coffee#DoConversion("coffee", "selection")
