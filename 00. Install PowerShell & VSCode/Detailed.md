# Lab 00. Detailed - Install PowerShell & VSCode

- Install [PowerShell 7](http://aka.ms/pwsh)

- Install [Visual Studio Code](http://aka.ms/vscode)
  - Install PowerShell Extension for VSCode
  - *Optional*
    - Set PowerShell as default language
    - Set PowerShell 7 as default version

- Install [Git](https://git-scm.com/)
  - Make sure you check the **`Use the native Windows Secure Channel library`** during install!

- If you do not already have one, create a [GitHub](https://github.com/) account.

---

If you are running windows you can use the following command to install all software using winget

```PowerShell
'Microsoft.PowerShell','git.git','Microsoft.VisualStudioCode','Microsoft.WindowsTerminal' | Foreach-Object { winget install $_ }
```

---

## *More Reading*

- [PowerShell Overview](https://docs.microsoft.com/en-us/powershell/scripting/overview)
- [VS Code Keybindings](https://code.visualstudio.com/docs/getstarted/keybindings#_default-keyboard-shortcuts)
