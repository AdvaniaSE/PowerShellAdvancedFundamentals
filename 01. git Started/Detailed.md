# Lab 01. Detailed - git Started

- Install [git](https://git-scm.com/downloads)
  - Set default editor to VS Code
  - git from Command Line and 3rd-party software
  - Choose native Windows Secure Channel Library

---

- Create a local git repository

```PowerShell
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

```PowerShell
$MyName = Read-Host 'What is your name?'
New-Item -Name "$MyName.txt"
```

- Commit the text file to the git repository

```PowerShell
# First we need to stage the changes in our repository for our next commit
git add --all
```

*Tip:* You can also use `git add .` to add all content in a directory recursively. In this case `git add <YourName>.txt` would have worked to add the single file.

*Tip:* You can create a file called `.gitignore` to exclude certain files or directories from being included in your repository.

```PowerShell
# Before running the commit, we need to configure git with a username and email so changes can be tracked to a user.
git config --global user.name "MyUsername"
git config --global user.email "My.EmailAddress@domain.com"
```

```PowerShell
# Then commit the changes with a message indicating why the change was made
git commit -m 'Added new file for lab 01'
```

- Add some text to the text file

```PowerShell
Set-Content -Value 'My file content' -Path "$MyName.txt"
```

- Commit the new changes

```PowerShell
# Once again we need to stage our changes before committing them
git add --all

git commit -m 'Added text to file in lab 01'
```

---

- Create a GitHub account if you don't have one

Go to [GitHub](https://github.com/) and sign up for a free account

- Fork the course solution repository on GitHub

  - Go to the specified course solution repository. If you're unsure which repository this is, please ask the course leader(s)
  - Click the ![fork](../Images/fork.png) button

- Clone the forked repository to your computer
  - Click the ![clone](../Images/clone.png) button and copy the link

```PowerShell
Set-Location 'C:\Temp'

git clone <your link>
```

- Add the text file with your name to the folder "Lab 01"

```PowerShell
# Change path to where you created your text file
Copy-Item -Path "C:\Temp\Lab01\$MyName.txt" -Destination '.\PSSolutions\Lab01'
```

- Commit the changes to the repository

```PowerShell
# First stage changes to the repository before committing
git add --all

git commit -m 'Added text file to Lab01 solutions'
```

- Push the changes to the forked repository on GitHub

```PowerShell
# You may have to login to GitHub to validate your credentials upon pushing to your repository
git push
```

- Create a pull request to the course solution repository on GitHub
  
  - Go to the forked repository on Github, click ![pr](../Images/pr.png) and create the pull request to the course solution repository.

---

## *More Reading*

- [git-scm](https://git-scm.com/docs/gittutorial)
- [.gitignore](https://git-scm.com/docs/gitignore)
- posh-git - A Git plugin for the PowerShell prompt. `Find-Module Posh-Git | Install-Module`
