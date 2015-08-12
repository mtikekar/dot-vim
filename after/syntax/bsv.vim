syntax keyword bsvFunction t2 t3
syntax keyword bsvDatatype T2 T3 V V2 V3

highlight link bsvFunction Keyword
highlight! link Number Normal
highlight! link Boolean Normal
highlight link bsvSystemTask Normal
highlight link bsvInterface Normal
highlight link bsvKeyword Ignore
highlight link bsvDatatype Normal
highlight link bsvSemicolon Ignore
highlight link bsvScopeClose Ignore

syntax match bsvSubmodule '\v\zs\w+\ze\s+\<\-\s+mk'
syntax match bsvRegister '\v<\w+_r>'
syntax match bsvRegister '\v<\w+_f>'
highlight link bsvRegister Identifier
highlight link bsvSubmodule Identifier
