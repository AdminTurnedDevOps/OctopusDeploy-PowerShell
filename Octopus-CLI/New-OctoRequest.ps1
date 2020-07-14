function New-OctoRequest {
    [cmdletbinding()]
    param(
        [parameter(Mandatory,
            Position = 0,
            HelpMessage = 'Enter octo command. For example, list-projects')]
        [string]$command,

        [parameter(Mandatory,
            Position = 1,
            HelpMessage = 'Enter Octopus Deploy Server URL')]
        [string]$server
    )

    begin {
        $checkOcto = choco list --local-only
        if ($checkOcto -like "*OctopusTools*") {
            Write-Output 'Octopus Deploy CLI installed... moving on.'
        }

        else {
            Write-Warning 'Octopus Deploy CLI is not installed'
            $install = Read-Host 'Would you like to install the Octopus CLI using Chocolatey? 1 for yes 2 for no'

            switch ($install) {
                1 { choco install octopustools }
                2 { 
                    Write-Output 'Exiting...'
                    Pause
                    exit
                }
            }
        }
    }
    process {
        $apiKey = Read-Host -AsSecureString 'Enter Octopus Deploy API Key' | ConvertFrom-SecureString -AsPlainText

        try {
            octo $command --server $server --apiKey=$apiKey
        }
        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {

    }
}