# add ssh keys on login
if status is-login
    eval (ssh-agent -c)
    find ~/.ssh/ -type f -exec grep -l "PRIVATE" {} \; | xargs ssh-add &> /dev/null
end
