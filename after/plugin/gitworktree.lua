local ok, gitworktree = pcall(require, "git-worktree");

if not ok then return end

gitworktree.setup {}
