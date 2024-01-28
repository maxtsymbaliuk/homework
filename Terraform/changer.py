#!/usr/bin/python3
from git import Repo
from pathlib import Path
import fileinput
#import subprocess

home_dir = Path.home()

#Clone GitHun Repos

#def clone_repo():
#	subprocess.run(["git", "clone", "git@github.com:maxtsymbaliuk/homework.git"])

#clone_repo()
#--------------Copy repo via bash :)----------------------


def clone_repo():
	repo_url = "git@github.com:maxtsymbaliuk/homework.git"
	local_path = home_dir

	try:
		Repo.clone_from(repo_url, local_path)
		print(f"Git repository cloned succcesfully in {localpath}")
	except Exception as e:
		print (f"Error with cloning repo: {e}")

clone_repo()

