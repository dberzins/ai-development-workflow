param(
    [string]$SourceDir = (Join-Path $PSScriptRoot "..\diagrams"),
    [string]$OutputFormat = "png",
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

function Get-MermaidCliCommand {
    $mmdcCommand = Get-Command "mmdc" -ErrorAction SilentlyContinue
    if ($mmdcCommand) {
        return @{
            Executable = $mmdcCommand.Source
            PrefixArgs = @()
        }
    }

    $npxCommand = Get-Command "npx" -ErrorAction SilentlyContinue
    if ($npxCommand) {
        return @{
            Executable = $npxCommand.Source
            PrefixArgs = @("--yes", "@mermaid-js/mermaid-cli")
        }
    }

    throw "Mermaid CLI is not available. Install 'mmdc' globally or install Node.js so the script can use 'npx --yes @mermaid-js/mermaid-cli'."
}

$resolvedSourceDir = Resolve-Path -Path $SourceDir -ErrorAction Stop
$diagramFiles = Get-ChildItem -Path $resolvedSourceDir -Filter "*.mmd" -File | Sort-Object Name

if (-not $diagramFiles) {
    throw "No Mermaid source files were found in '$resolvedSourceDir'."
}

$mermaidCli = Get-MermaidCliCommand

foreach ($diagramFile in $diagramFiles) {
    $outputPath = [System.IO.Path]::ChangeExtension($diagramFile.FullName, $OutputFormat)
    Write-Host "Exporting $($diagramFile.Name) -> $([System.IO.Path]::GetFileName($outputPath))"

    if ($DryRun) {
        continue
    }

    $arguments = @(
        $mermaidCli.PrefixArgs + @(
            "-i", $diagramFile.FullName,
            "-o", $outputPath
        )
    )

    & $mermaidCli.Executable @arguments

    if ($LASTEXITCODE -ne 0) {
        throw "Mermaid export failed for '$($diagramFile.Name)'."
    }
}

Write-Host "Finished exporting $($diagramFiles.Count) Mermaid diagram(s)."