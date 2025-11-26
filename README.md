# How to install

```Powershell
New-Item -Path $profile -ItemType File -Force
Copy-Item -Path ".\Microsoft.PowerShell_profile.ps1" -Destination $profile
```

# Usage

```Powershell
some_command 2>&1 | ColorizeErrors
```
