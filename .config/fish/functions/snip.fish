function snip -d "Search code snippets"
  commandline (ag -l (tail (fd . '/Users/ptolemy/deck/code-snippets') | fzf --border --query="# " --preview='ag -l {} /Users/ptolemy/deck/code-snippets | xargs tail -n +2') /Users/ptolemy/deck/code-snippets | xargs tail -n +2)
end
