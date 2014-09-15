# Get all environment variables for the current Process, as well as System and User environment variable values
# from:http://stackoverflow.com/questions/14381650/how-to-update-windows-powershell-session-environment-variables-from-registry

$processValues = [Environment]::GetEnvironmentVariables('Process')
$machineValues = [Environment]::GetEnvironmentVariables('Machine')
$userValues    = [Environment]::GetEnvironmentVariables('User')
# Identify the entire list of environment variable names first
$envVarNames = ($machineValues.Keys + $userValues.Keys + 'PSModulePath') | Sort-Object | Select-Object -Unique

# Now process all of those keys, updating what exists and adding what is new
foreach ($envVarName in $envVarNames) {
    if ($envVarName -eq 'PSModulePath') {
        $pieces = @()
        if ($PSVersionTable.PSVersion -ge [System.Version]'4.0') {
            $pieces += Join-Path -Path ${env:ProgramFiles} -ChildPath 'WindowsPowerShell\Modules'
        }
        if (-not $userValues.ContainsKey($envVarName)) {
            $pieces += Join-Path -Path ([Environment]::GetFolderPath('Documents')) -ChildPath 'WindowsPowerShell\Modules'
        } else {
            $pieces += $userValues[$envVarName] -split ';'
        }
        if ($machineValues.ContainsKey($envVarName)) {
            $pieces += $machineValues[$envVarName] -split ';'
        }
        [Environment]::SetEnvironmentVariable($envVarName,($pieces -join ';'),'Process')
    } elseif ($envVarName -match 'path') {
        $pieces = @()
        if ($userValues.ContainsKey($envVarName)) {
            $pieces += $userValues[$envVarName] -split ';'
        }
        if ($machineValues.ContainsKey($envVarName)) {
            $pieces += $machineValues[$envVarName] -split ';'
        }
        [Environment]::SetEnvironmentVariable($envVarName,($pieces -join ';'),'Process')
    } elseif ($userValues.ContainsKey($envVarName)) {
        [Environment]::SetEnvironmentVariable($envVarName,$userValues[$envVarName],'Process')
    } elseif ($machineValues.ContainsKey($envVarName)) {
        [Environment]::SetEnvironmentVariable($envVarName,$machineValues[$envVarName],'Process')
    }
}
<#
# Lastly remove the environment variables that no longer exist
foreach ($envVarName in $processValues.Keys | Where-Object {$envVarNames -notcontains $_}) {
    Remove-Item -LiteralPath "env:${envVarName}"
}
#>
