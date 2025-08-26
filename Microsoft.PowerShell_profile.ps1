# ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 or $PROFILE

function Invoke-Environment {
    param
    (
        # Any cmd shell command, normally a configuration batch file.
        [Parameter(Mandatory=$true)]
        [string] $Command
    )

    $Command = "`"" + $Command + "`""

	cmd /c "$Command > nul 2>&1 && set" | . { process {
        if ($_ -match '^([^=]+)=(.*)') {
            [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2])
        }
    }}
}
  

function Invoke-Dev {
    Invoke-Environment 'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat'   
}

#----------------------------------------------------------------------------
# Convert-ErrorLine.ps1
#----------------------------------------------------------------------------
function ColorizeErrors {
    <#
    .SYNOPSIS
        Colours lines that contain the word "error" (case‑insensitive).

    .PARAMETER InputObject
        A single line of text taken from the pipeline.

    .OUTPUTS
        None – writes directly to the host (console).
    #>
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [string]$InputObject
    )

    process {
        if ($InputObject -match '(?i)error') {
            Write-Host $InputObject -ForegroundColor DarkRed
        } elseif ($InputObject -match '(?i)warning') {
            Write-Host $InputObject -ForegroundColor Red
        } else {
            Write-Host $InputObject
        }
    }
}

