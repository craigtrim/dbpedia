<#
    .SYNOPSIS
    Download all the items linked to a given dbPedia page.

    .DESCRIPTION
    Download all the items linked to a given dbPedia page.

    .INPUTS
    None. You cannot pipe objects to Add-Extension.

    .OUTPUTS
    A File

    .EXAMPLE
    PS> .\scripts\Run-Download-Links.ps1
#>

param(
    [Parameter(Mandatory = $True)] [System.String] $EntityType,
    [Parameter(Mandatory = $True)] [System.String] $EntityName,
    [Parameter(Mandatory = $True)] [System.String] $EntityLabel
)

$env:ENTITY_TYPE = $EntityType
$env:ENTITY_NAME = $EntityName
$env:ENTITY_LABEL = $EntityLabel

$env:LOG_PROFILE = "DEBUG"
$env:CACHE_NAME = 'mville'
$env:TOTAL_TERMS = 10
$env:AUTO_SUGGEST = $False
$env:PROJECT_BASE = (Get-Item .).FullName

poetry run python dbpedia/recipes/router.py

## ------------------------------------------------------------------------------------
## Purpose:         
## Sample Usage:    .\resources\scripts\Run-Download-Links.ps1 -EntityType "network" -EntityName "virtual_network" -EntityLabel "Virtual Network"
## ------------------------------------------------------------------------------------
