$NewConfiguration = @{
    '$schema' = 'https://aka.ms/PowerShell/Crescendo/Schemas/2021-11'
    Commands  = @()
}
$parameters = @{
    Verb         = 'Show'
    Noun         = 'VSCIInstalledExtension'
    OriginalName = 'code-insiders'
}
$NewConfiguration.Commands += New-CrescendoCommand @parameters
$NewConfiguration | ConvertTo-Json -Depth 10 | Out-File .\vscodeinsiders.crescendo.config.json

# Always import the outputhandler files with dot sourcing before you build your module.
. .\OutputHandlers\parseExtension.ps1

$Parameters = @{
    ConfigurationFile = 'E:\GIT\Crescendo.VSCode\vscodeinsiders.crescendo.config.json'
    ModuleName        = 'Crescendo.VSCode'
    Force             = $true
}
Export-CrescendoModule @Parameters

Import-Module Crescendo.VSCode.psd1 -Force