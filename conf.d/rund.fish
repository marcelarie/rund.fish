function init --on-event fish_prompt
    if test -f .rundir
        set parsed_pwd (string replace "/" "_" $PWD)
        if not test -f /tmp/$parsed_pwd"allow_rund"
            echo 'rund: error .rundir is blocked by default.'
            echo 'Run `rund allow` to approve its content'
            return
        end

        set repo_identifier (echo "$PWD-$fish_pid" | md5sum | cut -d" " -f1)

        if not test -f /tmp/$repo_identifier"_rund"
            touch /tmp/$repo_identifier"_rund"
            source .rundir
        end
    end
end

init
