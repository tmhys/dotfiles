; 1つ目のファイルの内容
sc07B::Send,{sc07B}                 ;無変換は無変換として使用する
sc079::Send,{sc079}                 ;変換は変換として使用する
sc079 & h::Send, {Blind}{Left}
sc079 & j::Send, {Blind}{Down}
sc079 & k::Send, {Blind}{Up}
sc079 & l::Send, {Blind}{Right}
sc07B & h::Send, {Blind}{Left}
sc07B & j::Send, {Blind}{Down}
sc07B & k::Send, {Blind}{Up}
sc07B & l::Send, {Blind}{Right}

; 2つ目のファイルの内容（v1形式に変換）
; vk1D::Send,{vk1D}
; vk1C::Send,{vk1C}
sc07B & -::Send, {F11}
sc07B & 0::Send, {F10}
sc07B & 1::Send, {F1}
sc07B & 2::Send, {F2}
sc07B & 3::Send, {F3}
sc07B & 4::Send, {F4}
sc07B & 5::Send, {F5}
sc07B & 6::Send, {F6}
sc07B & 7::Send, {F7}
sc07B & 8::Send, {F8}
sc07B & 9::Send, {F9}
sc07B & ^::Send, {F12}
; sc07B & h::Send, {Left}
; sc07B & j::Send, {Down}
; sc07B & k::Send, {Up}
; sc07B & l::Send, {Right}
sc079 & -::Send, {F11}
sc079 & 0::Send, {F10}
sc079 & 1::Send, {F1}
sc079 & 2::Send, {F2}
sc079 & 3::Send, {F3}
sc079 & 4::Send, {F4}
sc079 & 5::Send, {F5}
sc079 & 6::Send, {F6}
sc079 & 7::Send, {F7}
sc079 & 8::Send, {F8}
sc079 & 9::Send, {F9}
sc079 & ^::Send, {F12}
; sc079 & h::Send, {Home}
; sc079 & j::Send, {PgDn}
; sc079 & k::Send, {PgUp}
; sc079 & l::Send, {End}
