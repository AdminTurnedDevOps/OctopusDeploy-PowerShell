function Get-Projects {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0)]
        [string]$OctopusBaseURL
    )

    begin { }
    process {
        try {
            $octopusAPIKey = Read-Host 'Input API Key' -AsSecureString
            $headers = @{ "X-Octopus-ApiKey" = $octopusAPIKey }

            $header = @{ "X-Octopus-ApiKey" = $octopusAPIKey | ConvertFrom-SecureString -AsPlainText }

            $listProjects = $(Invoke-WebRequest -Method GET -Uri $OctopusBaseURL/projects -Headers $header).content
            $convert = $listProjects | ConvertFrom-Json
        }

        catch {
            Write-Warning 'An error has occurred. Please confirm your API key and Octopus Base URL is correct'
            $PSCmdlet.ThrowTerminatingError($_)
        }

        try {
            $obj = [pscustomobject] @{
                'ProjectName' = $convert.Items.Name
                'ID' = $convert.Items.id
                'Deployment_Process_ID'  = $convert.Items.DeploymentProcessId
            }

            $obj | fl
        }
        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
    end { }
}