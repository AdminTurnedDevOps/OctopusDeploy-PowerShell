function Get-Lifecycle {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$OctopusBaseURL
    )

    begin { }
    process {
        try {
            $octopusAPIKey = Read-Host 'Input API Key' -AsSecureString
            $headers = @{ "X-Octopus-ApiKey" = $octopusAPIKey }

            $header = @{ "X-Octopus-ApiKey" = $octopusAPIKey | ConvertFrom-SecureString -AsPlainText }

            $listLifecycles = $(Invoke-WebRequest -Method GET -Uri $OctopusBaseURL/lifecycles -Headers $header).content
            $convert = $listLifecycles | ConvertFrom-Json
        }

        catch {
            Write-Warning 'An error has occurred. Please confirm your API key and Octopus Base URL is correct'
            $PSCmdlet.ThrowTerminatingError($_)
        }

        try {
            $obj = [pscustomobject] @{
                'ProjectName'           = $convert.Items.Name
                'ID'                    = $convert.Items.id
            }

            $obj | fl
        }
        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
    end { }
}
