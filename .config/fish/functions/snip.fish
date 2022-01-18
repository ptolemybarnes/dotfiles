function snip -d "Search code snippets"
  ag -l (tail (fd --full-path '/Users/ptolemy/deck/code-snippets') | fzf --border --query="# " --preview='ag -l {} /Users/ptolemy/deck/code-snippets | xargs tail -n +2') /Users/ptolemy/deck/code-snippets | xargs tail -n +2 | fish
end
