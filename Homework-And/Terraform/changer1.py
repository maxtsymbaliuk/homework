#!/usr/bin/python3

import os
from git import Repo
from pathlib import Path

home_dir = Path.home()
repo_url = "git@github.com:maxtsymbaliuk/homework.git"
repo_name = "homework"  # Назва репозиторію

def clone_repo():
    local_path = home_dir / repo_name  # Формуємо шлях до папки репозиторію

    try:
        Repo.clone_from(repo_url, local_path)
        print(f"Git repository cloned successfully in {local_path}")
    except Exception as e:
        print(f"Error with cloning repo: {e}")


path_to_file = "Homework/Terraform/variable.tf"
def update_ter_file():
    ter_path = home_dir / path_to_file
    region_variable_name = 'default = "us-east-1"'
    try:
        with fileinput.input(ter_path, inplace=True) as file:
            for line in file:
                print(line.replace(region_variable_name, 'default = "us-east-2"'), end='')

        print("file succesfully edited")
    except Exception as e:
        print("Error with edit {e}")


def change_param():
	with open("/home/maksym/Homework/Terraform/variable.tf", "r")as f:
		data = f.read()
	print("start replace something")

	data = data.replace("variable", "blabla")

	print("finish replacing")
	with open("/home/maksym/Homework/Terraform/variable.tf", "w")as f:
		f.write(data)
change_param()





