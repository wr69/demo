BOT_USER="github-actions[bot]"
BOT_EMAIL="test+github-actions[bot]@users.noreply.github.com"

sync() {
    action="$1"
    message="$2"

    # call windows git from wsl
    git=git
    command -v git.exe 1>/dev/null && git=git.exe

    $git config user.name "$BOT_USER"
    $git config user.email "$BOT_EMAIL"

    $git checkout --orphan latest_branch
    $git rm -rf --cached .
    $git add -A
    $git commit -m "$message"
#    $git branch -D master
#    $git branch -m master
#    $git push -f origin master
    $git branch -D main
    $git branch -m main
    $git push -f origin main
}
case $1 in
check_env | has_valid_cfg | register | invoke)
    $1
    ;;
pull | push)
    sync "$@"
    ;;
upg)
    sed -i \
        "s/\(version@\)[0-9]\+/\1$(env TZ=Asia/Shanghai date +%Y%m%d%H%M)/" \
        README.md
    sync push reset
    ;;
*)
    echo "Not supported"
    exit 1
    ;;
esac
