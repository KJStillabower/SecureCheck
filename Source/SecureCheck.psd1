<#
Information: 
#>

function Test-SecurityConfig
{
    param(
        [Parameter(Mandatory=$false, ValueFromPipeline=$true, Position=1)][string]$FQDN="IMPLIED",
        [Parameter(Mandatory=$false,ValueFromPipeline=$false,Position=2)][pscredential]$DACred,
        [Parameter(Mandatory=$true,ValueFromPipeline=$false,Position=3)][string]$Target
        )

    # Test to see if our machine is part of a domain.  
    if ((! (Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain))
    {
        # Return if FQDN and DACred is not supplied
        if (
        $FQDN -ne "IMPLIED" && $null -ne $DACred)
        {
            #failed!
            Write-Warning "Not a member of a domain, you will need to supply FQDN and DACred explicitly"
            return
        }
        else {
            #testing FQDN and DACred
        }
    }
}