<#
	.SCRIPT
	    Set-CASMailbox_EnableActive_exo.ps1

	.AUTHOR
	    Workato Customer Success

	.CHANGELOG
	    2021-04-17 - Created

	.DESCRIPTION
        This script uses EXO v2 to connect to Exchange Online

	.PARAMETERS
	    mailbox_name - Name or alias of the mailbox

    .USAGE

    .Config YAML entry
        set_casmailbox_enable_activesync_exo:
            name: Enable ActiveSync on Exchange Mailbox (EXO)
            command:
              - powershell
              - Start-Process powershell -verb runas -ArgumentList '-noexit -command \"C:\\Workato\\scripts\\exchange\\exo\\Set-CASMailbox_EnableActive_exo.ps1 -mailbox_name {{mailbox_name}} \"'
            parameters:
              - { name: mailbox_name }

  #>


param(
     [Parameter()]
     [string]$mailbox_name

 )


<# Uncomment this block to hard code expected values and test, make sure to comment the param block
$mailbox_name = "identity_access_management@brookfield.com" 

#>
$userPrincipalName = "sa_workato-integration-dev@brookfield.com" 
    
Connect-ExchangeOnline -UserPrincipalName $userPrincipalName

try {
     
  Set-CASMailbox -Identity $mailbox_name -ActiveSyncEnabled $true

}

catch {

    "Error: $($Error[0])"

}

Disconnect-ExchangeOnline