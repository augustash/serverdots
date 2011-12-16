# grc overides for ls
#   Made possible through contributions from generous benefactors
if $(gls &>/dev/null) then;
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -lh --color"
  alias la="gls -A --color"
else
  alias ls="ls -F --color"
  alias l="ls -lAh --color"
  alias ll="ls -lh --color"
  alias la="ls -A --color"
fi
