require 'fileutils'
# Check that second git directory is set up correctly
if not Dir.exists?('.git_cs169')
    puts "got here"
    FileUtils.cp_r '.git', '.git_cs169'
end

# If no related file in config/initializers, then create that file


# Set right remote
git_repo_name = /([^\/]+).git$/.match(`git config --local remote.origin.url`)[1]
current_git_branch = `git rev-parse --abbrev-ref HEAD`.strip
current_git_repo_url = `git --git-dir .git_cs169 remote get-url origin`
if git_repo_name != "git@github.com:saasbook/#{git_repo_name}.git"
    `git --git-dir .git_cs169 remote set-url origin git@github.com:saasbook/#{git_repo_name}.git`
    `git --git-dir .git_cs169 fetch --all`
    `git --git-dir .git_cs169 reset --hard origin/#{current_git_branch}`
end