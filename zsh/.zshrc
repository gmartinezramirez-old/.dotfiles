### Added by Zplugin's installer
source '/home/gonzalo/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

## Plugins
#zplugin light tj/git-extras

zplugin ice wait'0' lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh

zplugin ice wait'0' lucid
zplugin snippet OMZ::lib/completion.zsh

zplugin ice wait'0' lucid
zplugin snippet OMZ::lib/key-bindings.zsh

zplugin ice wait'0' lucid
zplugin snippet OMZ::lib/history.zsh

zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# Load the pure theme, with zsh-async library that's bundled with it
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

ZSH_AUTOSUGGEST_USE_ASYNC=true
