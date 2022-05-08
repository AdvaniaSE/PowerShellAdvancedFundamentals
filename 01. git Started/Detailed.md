# Lab 01. Detailed - git Started

---

- Fork the course repository on GitHub
  - Clone the forked repository to your computer

> - Use any browser and go to [AdvaniaSE on GitHub (https://github.com/AdvaniaSE/PowerShellAdvancedFundamentals)](https://github.com/AdvaniaSE/PowerShellAdvancedFundamentals)
>
> - Fork the course solution repository on GitHub by clicking the "fork" button in the top right.
>
>![fork](../Images/fork.png)
>
> - Verify you are now located in your own repository fork
>
>![forked repo](../Images/forkedRepo.png)
>
> - Click the "Code" button and select the "copy" icon to copy the clone URL to your reposiory
>
> ![clone from GitHub](../Images/clone.png)
>
> - In powershell, run the followin git command. This will create a subfolder with the same name as the repository and clone the contents to it.
>
> ```PowerShell
> git clone <your copied URL>
> ```

---

- Create a new repository on your GitHub account and clone this to your computer
  - Copy the contents from the `LabFiles` folder in the course repository to your newly created repository
  - Push the changes to the GitHub

> - Use any browser and go to the repositories tab of your github page, https://github.com/YourGithubPage?tab=repositories
>
>On the right hand side of the page, click the "new" button
>
>![New repository](../Images/newRepo.png)
>
> - Give the repository a meaningfull name, and click create.
>
> - Clone this repo in the same way you cloned your "PowerShellAdvancedFundamentals" fork.
>
> - Copy the contents from the "PowerShellAdvancedFundamentals\LabFiles" folder to your cloned repo
>
> ```PowerShell
> Copy-Item -Path .\PowerShellAdvancedFundamentals\LabFiles -Destination $yourNewRepoFolder
> ```
>
> - Add the files as "staged" in Git, commit them, and push to the GitHub remote
>
> ```PowerShell
> Set-Location $yourNewRepoFolder
> git add .
> git commit -m 'Initial creation of my files'
> git push
> ```

---

- Add a new file to your local repo on your computer named "Readme.md"
  - Open the "Readme.md" file in VSCode and add a short description of your project
  - Add the file to git, and push it to the remote GitHub repository

```PowerShell
Set-Location $yourNewRepoFolder
New-Item -name 'readme.md'

# You can of course add text using powershell directly as well.

$MyReadme = @'
# This is my lab repo.

I'm learning git!
'@
$MyReadme | Set-Content -Path .\readme.md

# note! since git is not a native powershell command we dont need to use the .\ path locator for a file in the same directory
git add readme.md

git commit -m 'added a readme file'

git push
```

## *More Reading*

- [Git cheat sheet by RebelLabs](../Images/GitCheatSheet.png)
- [git-scm](https://git-scm.com/docs/gittutorial)
- [.gitignore](https://git-scm.com/docs/gitignore)
- posh-git - A Git plugin for the PowerShell prompt. `Find-Module Posh-Git | Install-Module`
