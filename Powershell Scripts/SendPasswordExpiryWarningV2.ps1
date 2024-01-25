#Reference at the end

#Import Active Directory Powershell module in order to find users
Import-Module ActiveDirectory


# Import list of target OUs using their DNs
$OUs = Import-Csv "D:\Data\PasswordExpirationDN.csv" 


# Date is used in AD search object, when sending mail & to find range
$Date = Get-Date 
$expiringusers = @()

# Search each OU for accounts with expiring passwords that fall into a range from setup on their account.
foreach ($dn in $OUs) {
	$dn
    $users = Get-ADUser -Filter * -SearchBase $dn.DN -searchscope onelevel -Properties mail,Displayname,PasswordLastSet, msDS-UserPasswordExpiryTimeComputed | Select-Object mail,Displayname,PasswordLastSet,@{Name="DaysLeftTotal";E={((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")) - ($Date)).Days)}}, @{Name="limit";E={($Date).AddDays(-((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)))}}, @{Name="warning";E={($Date).AddDays(-((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)-14))}}, @{Name="PasswordPolicy";E={([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days}} | Where-Object {($_.PasswordLastSet -gt $_.limit) -and ($_.PasswordLastSet -lt $_.warning)} 
    if ($null -ne $users) {
        $expiringusers += $users
    }
}

<# 
# Count of users with expriring passwords
write-host
$expiringusers.count
write-host
#>

<#
# Used for manually testing 
$expiringusers | Export-csv "C:\Data\listusers.csv" -NoTypeInformation
$expiringusers | out-gridview
$expiringusers | ft -auto

# Used after creating a test input file
$expiringusers = Import-csv "D:\Data\listusers.csv" 
$expiringusers.count
$expiringusers | ft -auto
$expiringusers | Out-GridView

#>

# Conditions to check if how many different policy dates are there
# Where-Object { (($_.PasswordPolicy -ne 180)-and($_.PasswordPolicy -ne 90)-and($_.PasswordPolicy -ne 179))}


# Pull each user to than send mail too; different conditions for 179 & 180 to the 90 days groups
foreach ($user in $expiringusers)  
	{
        #Getting Attributes from user
        $UserPolicy = $user.PasswordPolicy
        $DaysLeft = $user.dayslefttotal
        $username = $user.mail
		$displayname = $user.DisplayName
		$ErrorActionPreference = "SilentlyContinue"
		
		if ( ($DaysLeft -gt 1)-and(($UserPolicy -eq 180)-or($UserPolicy -eq 179)) )
		{
			$smtpaddress = $username
			$SmtpClient = New-Object System.Net.Mail.smtpClient
			$SmtpServer = "#"
			$SmtpClient.host = $SmtpServer
			$SmtpClient.port = 25
			
			$From = "Password Expiration <do-not-reply@#.edu>"
			$To = $smtpaddress  #<address>
			$Title = "# / AD domain Password Expiration"
			$Body = $displayname + ", your AD domain password will expire in " + $DaysLeft + " days."  #<displayName & Expire Notice>
			$Body += "`n"
			$Body += "`n"
			$Body += "You can reset your password several different ways:"
			$Body += "`n"
			$Body += "1. If you log on to a computer joined to the AD domain, press Ctrl-Alt-Delete and click on Change Password."
			$Body += "`n"
			$Body += "2. Visit the # Login web site (#) and select Need Help? to reach the Forgot/Change Password menu."
			$Body += "`n"
            $Body += "`n"
            $Body += "The new password you choose must meet the following criteria:"
			$Body += "`n"
			$Body += "1. Length: At least 8 characters long"
			$Body += "`n"
			$Body += "2. Letters: At least 1 upper case and 1 lower case"
			$Body += "`n"
			$Body += "3. Numbers: At least 1 number"
			$Body += "`n"
			$Body += "4. Special characters: They are not required but the use of at least one is strongly recommended (e.g., $, !, #, %, etc.)"
			$Body += "`n"
			$Body += "5. Password history: The last 5 passwords are not allowed"
			$Body += "`n"
			$Body += "`n"
			$Body += ""
			$Body += "`n"
			$Body += "`n"
			$Body += "IMPORTANT:"
                        $Body += "`n"
			$Body += "`n"
			$Body += ""
			$Body += "`n"
			$Body += "`n"
                        $Body += " 2. Please remember to update your new password on all your mobile devices, including smartphones, tablets, and non-AD computers."
			$Body += "`n"
			$Body += "`n"
			$Body += "Thank you for your attention to this notification."
			$Body += "`n"
			$Body += "`n"
			$Body += ""

			$SmtpClient.Send($from,$to,$title,$body)
		}
		Elseif ( ($DaysLeft -le 1)-and(($UserPolicy -eq 180)-or($UserPolicy -eq 179)) )
		{
			$SmtpClient = New-Object System.Net.Mail.smtpClient
			$smtpaddress = $username
			$SmtpServer = "#"
			$SmtpClient.host = $SmtpServer
			$SmtpClient.port = 25
			
			$From = "Password Expiration <do-not-reply@#.edu>"
			$To = $smtpaddress #<address>
			$Title = "# / AD domain Password Expiration"
            $Body = $displayname + ", your AD domain password will expire today or has expired."
			$Body += "`n"
			$Body += "`n"
			$Body += "You can reset your password several different ways:"
			$Body += "`n"
			$Body += "1. If you log on to a computer joined to the AD domain, press Ctrl-Alt-Delete and click on Change Password."
			$Body += "`n"
			$Body += "2. Visit the # Login web site (#) and select Need Help? to reach the Forgot/Change Password menu."
			$Body += "`n"
			$Body += "`n"
			$Body += "The new password you choose must meet the following criteria:"
			$Body += "`n"
			$Body += "1. Length: At least 8 characters long"
			$Body += "`n"
			$Body += "2. Letters: At least 1 upper case and 1 lower case"
			$Body += "`n"
			$Body += "3. Numbers: At least 1 number"
			$Body += "`n"
			$Body += "4. Special characters: They are not required but the use of at least one is strongly recommended (e.g., $, !, #, %, etc.)"
			$Body += "`n"
			$Body += "5. Password history: The last 5 passwords are not allowed"
			$Body += "`n"
			$Body += "`n"
			$Body += "#"
			$Body += "`n"
			$Body += "`n"
			$Body += "IMPORTANT:"
                        $Body += "`n"
			$Body += "`n"
			$Body += " 1) # never ask you for confidential information (such as your birth date, password, or Social Security Number) via e-mail."
			$Body += "`n"
			$Body += "`n"
                        $Body += " 2) Please remember to update your new password on all your mobile devices, including smartphones, tablets, and non-AD computers."
			$Body += "`n"
			$Body += "`n"
			$Body += "Thank you for your attention to this notification."
			$Body += "`n"
			$Body += "`n"
			$Body += "#"

			$SmtpClient.Send($from,$to,$title,$body)
		}
        Elseif ( ($DaysLeft -gt 1)-and($UserPolicy -eq 90) )
		{
			$smtpaddress = $username
			$SmtpClient = New-Object System.Net.Mail.smtpClient
			$SmtpServer = "#"
			$SmtpClient.host = $SmtpServer
			$SmtpClient.port = 25
			
			$From = "Password Expiration <do-not-reply@#.edu>"
			$To = $smtpaddress  #<address>
			$Title = "# / AD domain Password Expiration"
			$Body = $displayname + ", your AD domain password will expire in " + $DaysLeft + " days."  #<displayName & Expire Notice>
			$Body += "`n"
			$Body += "`n"
			$Body += "You can reset your password several different ways:"
			$Body += "`n"
			$Body += "1. If you log on to a computer joined to the AD domain, press Ctrl-Alt-Delete and click on Change Password."
			$Body += "`n"
			$Body += "2. Visit the # Login web site (#) and select Need Help? to reach the Forgot/Change Password menu."
			$Body += "`n"
            $Body += "`n"
            $Body += "The new password you choose must meet the following criteria:"
			$Body += "`n"
			$Body += "1. Length: At least 8 characters long"
			$Body += "`n"
			$Body += "2. Letters: At least 1 upper case and 1 lower case"
			$Body += "`n"
			$Body += "3. Numbers: At least 1 number"
			$Body += "`n"
			$Body += "4. At least one Special character is required and  it is strongly recommended to use one of the following (e.g., $, !, #, %, etc.)"
			$Body += "`n"
			$Body += "5. Password history: The last 10 passwords are not allowed"
			$Body += "`n"
			$Body += "`n"
			$Body += "#"
			$Body += "`n"
			$Body += "`n"
			$Body += "IMPORTANT:"
                        $Body += "`n"
			$Body += "`n"
			$Body += " 1. # will never ask you for confidential information (such as your birth date, password, or Social Security Number) via e-mail."
			$Body += "`n"
			$Body += "`n"
                        $Body += " 2. Please remember to update your new password on all your mobile devices, including smartphones, tablets, and non-AD computers."
			$Body += "`n"
			$Body += "`n"
			$Body += "Thank you for your attention to this notification."
			$Body += "`n"
			$Body += "`n"
			$Body += "#"

			$SmtpClient.Send($from,$to,$title,$body)
		}
		Elseif ( ($DaysLeft -le 1)-and($UserPolicy -eq 90) )
		{
			$SmtpClient = New-Object System.Net.Mail.smtpClient
			$smtpaddress = $username
			$SmtpServer = "#"
			$SmtpClient.host = $SmtpServer
			$SmtpClient.port = 25
			
			$From = "Password Expiration <do-not-reply@#.edu>"
			$To = $smtpaddress #<address>
			$Title = "# / AD domain Password Expiration"
            $Body = $displayname + ", your AD domain password will expire today or has expired."
			$Body += "`n"
			$Body += "`n"
			$Body += "You can reset your password several different ways:"
			$Body += "`n"
			$Body += "1. If you log on to a computer joined to the AD domain, press Ctrl-Alt-Delete and click on Change Password."
			$Body += "`n"
			$Body += "2. Visit the # Login web site (#) and select Need Help? to reach the Forgot/Change Password menu."
			$Body += "`n"
			$Body += "`n"
			$Body += "The new password you choose must meet the following criteria:"
			$Body += "`n"
			$Body += "1. Length: At least 8 characters long"
			$Body += "`n"
			$Body += "2. Letters: At least 1 upper case and 1 lower case"
			$Body += "`n"
			$Body += "3. Numbers: At least 1 number"
			$Body += "`n"
			$Body += "4. At least one Special character is required and  it is strongly recommended to use one of the following (e.g., $, !, #, %, etc.)"
			$Body += "`n"
			$Body += "5. Password history: The last 10 passwords are not allowed"
			$Body += "`n"
			$Body += "`n"
			$Body += "#"
			$Body += "`n"
			$Body += "`n"
			$Body += "IMPORTANT:"
                        $Body += "`n"
			$Body += "`n"
			$Body += " 1) # will never ask you for confidential information (such as your birth date, password, or Social Security Number) via e-mail."
			$Body += "`n"
			$Body += "`n"
                        $Body += " 2) Please remember to update your new password on all your mobile devices, including smartphones, tablets, and non-AD computers."
			$Body += "`n"
			$Body += "`n"
			$Body += "Thank you for your attention to this notification."
			$Body += "`n"
			$Body += "`n"
			$Body += "Division of Information Technology"

			$SmtpClient.Send($from,$to,$title,$body)
		}
    }

#----------#----------#----------#----------#----------#----------#----------#----------#


#Reference Here


<# 

# Add/Import Powershell components
# Add-PSSnapIn Microsoft.Exchange.Management.PowerShell.E2010
Import-Module ActiveDirectory

# Define global variables
$dom = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$root = $dom.GetDirectoryEntry()
$search = [System.DirectoryServices.DirectorySearcher]$root
$search.Filter = "(objectclass=domainDNS)"
$result = $search.FindOne()

#Below is old tick method
$t = New-Object System.TimeSpan([System.Math]::ABS($result.properties["maxpwdage"][0]))
$d = ($t.Days)* -1
$d1 = $d +14

# Define time-related variables
$limit = (Get-Date).AddDays($d)
$warning = (Get-Date).AddDays($d1)

# Find AD accounts with expiring passwords ; only accounts for 180 day policy
$file1 = @() #changed from expiringusers
foreach ($dn in (Import-Csv "C:\Data\PasswordExpirationDN.csv")) {
   #$users = Get-ADUser -Filter {(samAccountName -notlike "vmail*")} -SearchBase $dn.DN -searchscope onelevel -Properties DisplayName,mail,#,PasswordLastSet,UserAccountControl | Where {($_.PasswordLastSet -gt $limit) -and ($_.PasswordLastSet -lt $warning)} | Select-Object employeeID,DisplayName,mail,#,PasswordLastSet,UserAccountControl
    $users = Get-ADUser -Filter {(samAccountName -notlike "vmail*")} -SearchBase $dn.DN -searchscope onelevel -Properties DisplayName,employeeID,name,mail,#,PasswordLastSet,UserAccountControl,msDS-UserPasswordExpiryTimeComputed | Where {($_.PasswordLastSet -gt $limit) -and ($_.PasswordLastSet -lt $warning)} | Select-object employeeID,displayName,samaccountname,mail,#,#,PasswordLastSet, @{Name="Today's Date";E={$Date}}, @{Name="PasswordExpiry";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}, @{Name="PasswordPolicy";E={([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days}}, @{Name="PasswordPolicyWarning";E={(([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)-14}}, @{Name="DaysLeftTotal";E={((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")) - ($Date)).Days)}}, @{Name="limit";E={($Date).AddDays(-((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)))}}, @{Name="warning";E={($Date).AddDays(-((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)-14))}}
     if ($users -ne $null) {
        $file1 += $users
    }
}

write-host
$file1.count
write-host

#----------#----------#----------#----------#----------#----------#----------#----------#

# RudyWare

$Date = Get-Date # Date is used in AD objected and when sending mail
$file2 = @()
 foreach ($dn in (Import-Csv "C:\Data\PasswordExpirationDN.csv")) {
	$users2 = Get-ADUser -Filter * -SearchBase $dn.DN -searchscope onelevel -Properties employeeID,displayName,samaccountname,mail,#,#,PasswordLastSet,msDS-UserPasswordExpiryTimeComputed |  Select-Object employeeID,displayName,samaccountname,mail,#,#,PasswordLastSet, @{Name="Today's Date";E={$Date}}, @{Name="PasswordExpiry";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}, @{Name="PasswordPolicy";E={([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days}}, @{Name="PasswordPolicyWarning";E={(([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)-14}}, @{Name="DaysLeftTotal";E={((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")) - ($Date)).Days)}}, @{Name="limit";E={($Date).AddDays(-((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)))}}, @{Name="warning";E={($Date).AddDays(-((([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") - $_.PasswordLastSet).Days)-14))}} | Where-Object {($_.PasswordLastSet -gt $_.limit) -and ($_.PasswordLastSet -lt $_.warning)} | Where-Object {$_.PasswordExpiry -ne "12/31/1600 7:00:00 PM"} |  Where-Object {$_.PasswordExpiry -ne $null}
	$dn # see progression 
    if ($null -ne $users2) {
        $file2 += $users2
    }
}

#counts to visual compare on prompt
write-host
$file2.count
write-host

#----------#----------#----------#----------#----------#----------#----------#----------#

# Compare results of both searches

$file1 | Export-Csv "C:\Data\TaggedUsers.csv" -NoTypeInformation
$file2 | Export-Csv "C:\Data\TaggedUsers2.csv" -NoTypeInformation

# Export the comparison of both file runs to see how close they match
Compare-Object $file1 $file2 -property "employeeID" | Export-Csv "C:\Data\compare.csv" -NoTypeInformation

# Get grid on compasion and both files
Compare-Object $file1 $file2 -property "employeeID" | Out-GridView -Title Compare
$file1 | Sort-Object dayslefttotal,employeeid | Out-GridView -Title Listing
$file2  | Sort-Object dayslefttotal,employeeid | Out-GridView -Title Listing2

#>
