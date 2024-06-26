function init {
	repo_identifier=$(echo "$PWD-$$" | md5sum | cut -d" " -f1)

	if [ -f Runfile ]; then
		if [ ! -f "/tmp/${repo_identifier}_rund" ]; then
			echo "PWD: $PWD, Shell Session: $$" >/tmp/"${repo_identifier}"_rund
			source Runfile
		fi
	fi
}

# chpwd is a zsh specific function called when the current working directory changes
chpwd() {
	init
}
