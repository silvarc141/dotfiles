GlazeRun(command) => RunWait("glazewm command `\`"`"`"" command "`\`"`"`"", , "Hide")

#w::GlazeRun("close")
; #Enter:: GlazeRun("promote")
; #+Enter:: GlazeRun("unstack")
; #t:: GlazeRun("toggle-float")
; #+t:: GlazeRun("toggle-title-bars")
#v::GlazeRun("tiling direction toggle")
#+f:: GlazeRun("toggle maximized")
#+q:: GlazeRun("exit wm")
#+r:: GlazeRun("reload config")
; #+r:: GlazeRun("retile")
; #p:: GlazeRun("toggle-pause")
; #+[:: GlazeRun("cycle-focus previous")
; #+]:: GlazeRun("cycle-focus next")
; #[:: GlazeRun("cycle-stack previous")
; #]:: GlazeRun("cycle-stack next")
#Tab:: GlazeRun("focus workspace next")
#+Tab:: GlazeRun("focus workspace prev")
; #CapsLock:: GlazeRun("cycle-monitor next")
; #+CapsLock:: GlazeRun("cycle-monitor previous")
#h:: GlazeRun("focus left")
#j:: GlazeRun("focus down")
#k:: GlazeRun("focus up")
#l:: GlazeRun("focus right")
#+h:: GlazeRun("move left")
#+j:: GlazeRun("move down")
#+k:: GlazeRun("move up")
#+l:: GlazeRun("move right")
; #^h:: GlazeRun("stack left")
; #^j:: GlazeRun("stack down")
; #^k:: GlazeRun("stack up")
; #^l:: GlazeRun("stack right")
; #x:: GlazeRun("flip-layout horizontal")
; #y:: GlazeRun("flip-layout vertical")
#=:: GlazeRun("resize width +2%")
#-:: GlazeRun("resize width -2%")
#+=:: GlazeRun("resize height +2%")
#+-:: GlazeRun("resize height -2%")
#1:: GlazeRun("focus workspace 0")
#2:: GlazeRun("focus workspace 1")
#3:: GlazeRun("focus workspace 2")
#4:: GlazeRun("focus workspace 3")
#+1:: GlazeRun("move to workspace 0")
#+2:: GlazeRun("move to workspace 1")
#+3:: GlazeRun("move to workspace 2")
#+4:: GlazeRun("move to workspace 3")

; Mouse
F13:: GlazeRun("focus workspace next")
F14:: GlazeRun("focus workspace prev")
; F15:: GlazeRun("cycle-move-to-workspace next")
; F16:: GlazeRun("cycle-move-to-workspace previous")
F17:: GlazeRun("toggle maximized")
; F18:: GlazeRun("toggle-pause")
; F19:: GlazeRun("cycle-stack next")
; F20:: GlazeRun("cycle-stack previous")

; keybindings:
;   - command: "focus left"
;     bindings: ["F13", "Alt+Left"]
;   - command: "focus right"
;     bindings: ["F14", "Alt+Right"]
;   - command: "focus up"
;     bindings: ["F15", "Alt+Up"]
;   - command: "focus down"
;     bindings: ["F16", "Alt+Down"]
;   - command: "move left"
;     bindings: ["Shift+F13", "Alt+Shift+Left"]
;   - command: "move right"
;     bindings: ["Shift+F14", "Alt+Shift+Right"]
;   - command: "move up"
;     bindings: ["Shift+F15", "Alt+Shift+Up"]
;   - command: "move down"
;     bindings: ["Shift+F16", "Alt+Shift+Down"]
;   - command: "resize width -2%"
;     binding: "Alt+U"
;   - command: "resize width +2%"
;     binding: "Alt+P"
;   - command: "resize height +2%"
;     binding: "Alt+O"
;   - command: "resize height -2%"
;     binding: "Alt+I"
;   - command: "tiling direction toggle"
;     binding: "Alt+V"
;   - command: "focus mode toggle"
;     binding: "Alt+Space"
;   - command: "toggle floating"
;     binding: "Alt+Shift+Space"
;   - command: "toggle maximized"
;     binding: "Alt+X"
;   - command: "set minimized"
;     binding: "Alt+M"
;   - command: "close"
;     binding: "Alt+Shift+Q"
;   - command: "exit wm"
;     binding: "Alt+Shift+E"
;   - command: "reload config"
;     binding: "Alt+Shift+R"
;   - command: "exec cmd"
;     binding: "Alt+Enter"
;   - command: "focus workspace recent"
;     binding: "Alt+Y"
;   - command: "focus workspace next"
;     binding: "Alt+T"
;   - command: "focus workspace prev"
;     binding: "Alt+Shift+T"
;   - command: "focus workspace 1"
;     binding: "Alt+1"
;   - command: "focus workspace 2"
;     binding: "Alt+2"
;   - command: "focus workspace 3"
;     binding: "Alt+3"
;   - command: "focus workspace 4"
;     binding: "Alt+4"
;   - command: "focus workspace 5"
;     binding: "Alt+5"
;   - command: "focus workspace 6"
;     binding: "Alt+6"
;   - command: "focus workspace 7"
;     binding: "Alt+7"
;   - command: "focus workspace 8"
;     binding: "Alt+8"
;   - command: "focus workspace 9"
;     binding: "Alt+9"
;   - command: "move workspace left"
;     binding: "Alt+A"
;   - command: "move workspace right"
;     binding: "Alt+F"
;   - command: "move workspace up"
;     binding: "Alt+D"
;   - command: "move workspace down"
;     binding: "Alt+S"
;   - commands: ["move to workspace 1", "focus workspace 1"]
;     binding: "Alt+Shift+1"
;   - commands: ["move to workspace 2", "focus workspace 2"]
;     binding: "Alt+Shift+2"
;   - commands: ["move to workspace 3", "focus workspace 3"]
;     binding: "Alt+Shift+3"
;   - commands: ["move to workspace 4", "focus workspace 4"]
;     binding: "Alt+Shift+4"
;   - commands: ["move to workspace 5", "focus workspace 5"]
;     binding: "Alt+Shift+5"
;   - commands: ["move to workspace 6", "focus workspace 6"]
;     binding: "Alt+Shift+6"
;   - commands: ["move to workspace 7", "focus workspace 7"]
;     binding: "Alt+Shift+7"
;   - commands: ["move to workspace 8", "focus workspace 8"]
;     binding: "Alt+Shift+8"
;   - commands: ["move to workspace 9", "focus workspace 9"]
;     bindings: ["Alt+Shift+9"]
