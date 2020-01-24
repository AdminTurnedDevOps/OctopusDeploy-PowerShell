function New-Project {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [alias('URL')]
        [string]$OctopusBaseURL,

        [parameter(Position = 1, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$projectName
    )

    begin {
        $octopusAPIKey = Read-Host 'Input API Key' -AsSecureString
        $headers = @{ "X-Octopus-ApiKey" = $octopusAPIKey }

        Write-Output 'Please pick a ProjectGroupId and LifecycleID from the output below for your new project.'

        $IDs = $(Invoke-WebRequest -Method GET -Uri $OctopusBaseURL/projects/all -Headers $header).content
        $IDs | ConvertFrom-Json | Select ProjectGroupID,LifecycleId | fl

        $projectGroupId = Read-Host 'Please enter Project Group ID'
        $lifecycleID = Read-Host 'Please enter Lifecycle ID'
    }
    process {
        $body = @{
            ProjectGroupID = $projectGroupId
            Name = $projectName
            LifecycleId = $lifecycleID
          }

        $headers = @{ "X-Octopus-ApiKey" = $octopusAPIKey }
        $header = @{ "X-Octopus-ApiKey" = $octopusAPIKey | ConvertFrom-SecureString -AsPlainText }

        Invoke-WebRequest $OctopusBaseURL/projects/ -Method POST -Headers $header -Body ($body | ConvertTo-Json)
    }

    end { }
}