local H = HyprLua
local vars = H.vars

-- User programs. Other modules can reference these as $edit, $term, etc.
vars.edit = H.expand("${EDITOR:-nvim}")
vars.term = "kitty"
vars.files = "thunar"
vars.Search_Engine = "https://www.google.com/search?q={}"
