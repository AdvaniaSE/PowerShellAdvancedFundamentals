# Lab 01. Detailed - git Started

- Create a local git repository

```ps1
# Set location for a directory to work in
Set-Location 'C:\Temp'

# Start by creating a folder for Lab 01
New-Item -Name 'Lab01' -FileType Directory

# Move to the newly created folder
Set-Location '.\Lab01'

# Initialize a new git repository
git init
```

- Create a text file \<YourName\>.txt

```ps1
$MyName = Read-Host 'What is your name?'
New-Item -Name "$MyName.txt"
```

- Commit the text file to the git repository

```ps1
# First we need to stage the changes in our repository for our next commit
git add --all
```

*Tip:* You can also use `git add .` to add all content in a directory recursively. In this case `git add <YourName>.txt` would have worked to add the single file.

*Tip:* You can create a file called `.gitignore` to exclude certain files or directories from being included in your repository.

```ps1
# Then commit the changes with a message indicating why the change was made
git commit -m 'Added new file for lab 01'
```

- Add some text to the text file

```ps1
Set-Content -Value 'My file content' -Path "$MyName.txt"
```

- Commit the new changes

```ps1
# Once again we need to stage our changes before committing them
git add --all

git commit -m 'Added text to file in lab 01'
```

---

- Create a GitHub account if you don't have one

Go to [GitHub](https://github.com/) and sign up for a free account.

- Fork the course solution repository on GitHub

  - Go to the specified course solution repository. If you're unsure which repository this is, please ask the course leader(s).
  - Click the ![fork](..\Images\fork.png) button.

- Clone the forked repository to your computer
  - Click the ![clone](..\Images\clone.png) button and copy the link.

```ps1
Set-Location 'C:\Temp'

git clone <your link>
```

- Add the text file with your name to the folder "Lab 01"

```ps1
# Change path to where you created your text file
Copy-Item -Path "C:\Temp\Lab01\$MyName.txt" -Destination '.\PSSolutions\Lab01'
```

- Commit the changes to the repository

```ps1
# First stage changes to the repository before committing
git add --all

git commit -m 'Added text file to Lab01 solutions'
```

- Push the changes to the forked repository on GitHub

```ps1
# You may have to login to GitHub to validate your credentials upon pushing to your repository
git push
```

- Create a pull request to the course solution repository on GitHub
  
  - Go to the forked repository on Github, click ![pr](..\Images\pr.png) and create the pull request to the course solution repository.

---

## *More Reading*

- [PowerShell Overview](https://docs.microsoft.com/en-us/powershell/scripting/overview)
- [Cascadia Code Font](https://github.com/microsoft/cascadia-code)
- [git-scm](https://git-scm.com/docs/gittutorial)
- [.gitignore](https://git-scm.com/docs/gitignore)
