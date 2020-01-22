$Lifecycles  = @( Get-ChildItem -Path $PSScriptRoot\Lifecycles\*.ps1 -ErrorAction SilentlyContinue )
$Projects = @( Get-ChildItem -Path $PSScriptRoot\Projects\*.ps1 -ErrorAction SilentlyContinue )
$Spaces = @( Get-ChildItem -Path $PSScriptRoot\Spaces\*.ps1 -ErrorAction SilentlyContinue )
$Users = @( Get-ChildItem -Path $PSScriptRoot\Users\*.ps1 -ErrorAction SilentlyContinue )

foreach($import in @($Lifecycles + $Projects + $Spaces + $Users))
{
    try
    {
        . $import.fullname
    }
    catch
    {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}

Export-ModuleMember -Function $Lifecycles.Basename
Export-ModuleMember -Function $Projects.Basename
Export-ModuleMember -Function $Spaces.Basename
Export-ModuleMember -Function $Users.Basename