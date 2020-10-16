; Many thanks to Chris for helping me out with this script.

mirror_1 = 0
mirror_2 = 9
mirror_3 = 8
mirror_4 = 7
mirror_5 = 6
mirror_q = `;
mirror_w = y
mirror_f = u
mirror_p = l
mirror_g = j
mirror_a = o
mirror_r = i
mirror_s = e
mirror_t = n
mirror_d = h
mirror_z = /
mirror_x = .
mirror_c = , 
mirror_v = m
mirror_b = k
return


; This key may help, as the space-on-up may get annoying, especially if you type fast.
Control & Space::Suspend

; These keys are optional, but they may help if you are typing on the left-hand side.
CapsLock::Send, {BackSpace}
Space & CapsLock::Send, {Enter}

; If spacebar didn't modify anything, send a real space keystroke upon release.
space::
Send {space}
return

space & 1::
space & 2::
space & 3::
space & 4::
space & 5::
space & q::
space & w::
space & e::
space & r::
space & t::
space & a::
space & s::
space & d::
space & f::
space & g::
space & z::
space & x::
space & c::
space & v::
space & b::
space & `;::
space & ,::
space & .::
space & /::
space & 6::
space & 7::
space & 8::
space & 9::
space & 0::
space & y::
space & u::
space & i::
space & o::
space & p::
space & h::
space & j::
space & k::
space & l::
space & n::
space & m::
; Determine the mirror key, if there is one:
if A_ThisHotkey = space & `;
   MirrorKey = q
else if A_ThisHotkey = space & ,
   MirrorKey = c
else if A_ThisHotkey = space & .
   MirrorKey = x
else if A_ThisHotkey = space & /
   MirrorKey = z
else  ; To avoid runtime errors due to invalid var names, do this part last.
{
   StringRight, ThisKey, A_ThisHotkey, 1
   StringTrimRight, MirrorKey, mirror_%ThisKey%, 0  ; Retrieve "array" element.
   if MirrorKey =  ; No mirror, script probably needs adjustment.
      return
}

Modifiers =
GetKeyState, state1, LWin
GetKeyState, state2, RWin
state = %state1%%state2%
if state <> UU  ; At least one Windows key is down.
   Modifiers = %Modifiers%#
GetKeyState, state1, Control
if state1 = D
   Modifiers = %Modifiers%^
GetKeyState, state1, Alt
if state1 = D
   Modifiers = %Modifiers%!
GetKeyState, state1, Shift
if state1 = D
   Modifiers = %Modifiers%+
Send %Modifiers%{%MirrorKey%}
return