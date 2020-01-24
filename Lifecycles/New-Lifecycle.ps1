function New-Lifecycle {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [alias('URL')]
        [string]$OctopusBaseURL,

        [parameter(Position = 1, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$lifecycleName
    )

    begin {
        $octopusAPIKey = Read-Host 'Input API Key' -AsSecureString
        $headers = @{ "X-Octopus-ApiKey" = $octopusAPIKey }

        $IDs = $(Invoke-WebRequest -Method GET -Uri $OctopusBaseURL/lifecycles -Headers $header).content
    }

    process {
        $body = @{
            Name = $lifecycleName
          }

        $header = @{ "X-Octopus-ApiKey" = $octopusAPIKey | ConvertFrom-SecureString -AsPlainText }

        $ErrorActionPreference = “silentlycontinue”
        Invoke-WebRequest $OctopusBaseURL/lifecycles -Method POST -Headers $header -Body ($body | ConvertTo-Json)
    }

    end { }
}