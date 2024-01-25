break
sleep(10000)

$VerifyUsers = @()
$VerifyUsers += Get-ADUser -Filter {(cn -like "* *")} -searchbase "OU=# Users,DC=ad,DC=fiu,DC=edu" -searchscope OneLevel -resultsetsize 1500 -properties * | Select-Object employeeid,displayName,name,givenname,surname,samaccountname,mail,enabled,fiuroles,fiustatus,fiustatusdesc,fiuterminationdate,whencreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname
$VerifyUsers += Get-ADUser -Filter {(cn -like "* *")} -searchbase "OU=#,OU=# Users,DC=ad,DC=fiu,DC=edu" -searchscope OneLevel -resultsetsize 1500 -properties * | Select-Object employeeid,displayName,name,givenname,surname,samaccountname,mail,enabled,fiuroles,fiustatus,fiustatusdesc,fiuterminationdate,whencreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname
$VerifyUsers += Get-ADUser -Filter {(cn -like "* *")} -searchbase "OU=#,OU=# Users,DC=ad,DC=fiu,DC=edu" -searchscope OneLevel -resultsetsize 1500 -properties * | Select-Object employeeid,displayName,name,givenname,surname,samaccountname,mail,enabled,fiuroles,fiustatus,fiustatusdesc,fiuterminationdate,whencreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname

wr#e-host "#Employe Accts w#h Underscores: " $VerifyUsers.count
$VerifyUsers | Sort-object -Property enabled,employeeid | out-gridview
$Verifyusers.count
# $VerifyUsers | Export-Csv "C:\Users\rualvara\OneDrive - #\Z_Current\VerifyUsers.txt" -NoTypeInformation

#------------------------------------------------------------------------#


$VerifyUsers = @()
$VerifyUsers += Get-ADUser -Filter {(cn -like "* *")} -SearchBase "OU=# Users,DC=ad,DC=fiu,DC=edu" -SearchScope OneLevel -ResultSetSize 2000 -Properties * | Select-Object employeeID,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,fiuroles,fiustatus,fiustatusdesc,fiuterminationdate,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname
$VerifyUsers += Get-ADUser -Filter {(cn -like "* *")} -SearchBase "OU=#,OU=# Users,DC=ad,DC=fiu,DC=edu" -SearchScope OneLevel -ResultSetSize 2000 -Properties * | Select-Object employeeID,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,fiuroles,fiustatus,fiustatusdesc,fiuterminationdate,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname
$VerifyUsers += Get-ADUser -Filter {(cn -like "* *")} -SearchBase "OU=#,OU=# Users,DC=ad,DC=fiu,DC=edu" -SearchScope OneLevel -ResultSetSize 2000 -Properties * | Select-Object employeeID,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,fiuroles,fiustatus,fiustatusdesc,fiuterminationdate,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname
Get-ADUser -Filter {(employeeID -like "6108693")}  

wr#e-host "#Employe Accts w#h Underscores: " $VerifyUsers.count
$VerifyUsers | Sort-object -Property enabled,employeeid | out-gridview
$Verifyusers.count

#Exports to CVS/Excel file
#$VerifyUsers | Export-Csv "C:\Users\rualvara\OneDrive - #\Z_Current\VerifyUsers.csv" -NoTypeInformation

#Exports to txt/notepad
$VerifyUsers | Export-Csv "C:\Users\rualvara\OneDrive - #\Z_Current\VerifyUsers.txt" -NoTypeInformation

#------------------------------------------------------------------------#


# User mailboxes that are still hosted on-premise 
$Onprem = @()
$Onprem += Get-ADUser -filter {homemdb -ne "$Null"} -server ad.fiu.edu -resultsetsize 500 -properties * -Searchbase "OU=# Users,DC=ad,DC=fiu,DC=edu" | Select-Object displayname,employeeid,mail,enabled,fiustatus,whencreated,@{name="fiuMailAlternateAddresses";expr={$_.fiuMailAlternateAddresses}},homemdb
$Onprem | Sort-object -property whencreated | ft -auto 
$Onprem.count 

sleep 15

# Dept mailboxes that are still hosted on-premise 
$OnpremDept = @()
$OnpremDept += Get-ADUser -filter {homemdb -ne "$Null"} -server ad.fiu.edu -resultsetsize 500 -properties * -Searchbase "OU=Resources,DC=ad,DC=fiu,DC=edu" | Select-Object displayname,employeeid,mail,enabled,fiustatus,whencreated,@{name="fiuMailAlternateAddresses";expr={$_.fiuMailAlternateAddresses}},homemdb
$OnpremDept | Sort-object -property whencreated | ft -auto
# $OnpremDept | Sort-object -property whencreated | Sort-Object -Property displayname | ft -auto
$OnpremDept.count


#------------------------------------------------------------------------#

$UsersToCheck = Import-Csv -Path "C:\data\input-pid.txt"
$UsersToCheck.count
wr#e-host
# $UsersToCheck | ft -auto
$Outfile1 = @()
$Outfile2 = @()

foreach ($i in $UsersToCheck)
{
# $Outfile += get-aduser -Ident#y $User.username  -properties name,mail,employeeid | Select-object name,employeeid,mail
    # $target = $i.emplid
    $target = $i.employeeid
    # $Outfile += get-aduser -filter {employeeid -eq $target} -SearchBase "OU=# Users,dc=ad,dc=fiu,dc=edu" -properties * | Select-object employeeid,displayname,mail,enabled,fiustatus,userprincipalname,department,@{name="ou";expr={$_.ou}},@{name="fiuemployeepayplan";expr={$_.fiuemployeepayplan}},distinguishedname
    $Outfile1 += get-aduser -filter {employeeid -eq $target} -SearchBase "OU=# Users,dc=ad,dc=fiu,dc=edu" -SearchScope onelevel -properties * | Select-object employeeid,displayname,mail,enabled,fiustatus,userprincipalname,department,ou,fiuemployeepayplan,whencreated,distinguishedname
    $Outfile2 += get-aduser -filter {employeeid -eq $target} -server panther.ad.fiu.edu -SearchBase "OU=FIU Panther Users,dc=panther,dc=ad,dc=fiu,dc=edu" -properties * | Select-object employeeid,displayname,mail,enabled,fiustatus,whencreated,distinguishedname
} 

wr#e-host "Outfile1: "$Outfile1.countget
wr#e-host "Outfile2: "$Outfile2.count

# $Outfile | ft -auto
$Outfile1 | out-gridview
$Outfile2 | out-gridview 
$Outfile1 | export-csv "C:\Users\rualvara\OneDrive - #\Z_Current\PIDs1.txt" -notypeinfo
$Outfile2 | export-csv "C:\Users\rualvara\OneDrive - #\Z_Current\PIDs2.txt" -notypeinfo

 #------------------------------------------------------------------------#

  #script for pass expire /  check the domain password policy to notify users via e-mail when their password is about to expire (7 days)
  # update the areas where "DOMAIN" is typed / e-mail address and enter in the IP address of your SMTP server

  import-module ActiveDirectory;

$maxPasswordAgeTimeSpan = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge
 
Get-ADUser -filter * -properties PasswordLastSet, PasswordExpired, PasswordNeverExpires, mail, GivenName | foreach {
 
    $today=get-date
    $UserName=$_.GivenName
    $Email=$_.EmailAddress
 
    if (!$_.PasswordExpired -and !$_.PasswordNeverExpires) {
 
        $ExpiryDate=$_.PasswordLastSet + $maxPasswordAgeTimeSpan
        $DaysLeft=($ExpiryDate-$today).days
 
        if ($DaysLeft -lt 7 -and $DaysLeft -gt 0){
 
        $WarnMsg = "
<p style='font-family:calibri'>Hi $UserName,</p>
<p style='font-family:calibri'>Your Windows login password will expire in 2 days, please press CTRL-ALT-DEL and change your password.  As a reminder, you will have to enter your new password into your DOMAIN connected mobile device if prompted.</p>

<p style='font-family:calibri'>Requirements for the password are as follows:</p>
<ul style='font-family:calibri'>
<li>Must not contain the user's account name or parts of the user's full name that exceed two consecutive characters</li>
<li>Must not be one of your last 7 passwords</li>
<li>Contain characters from three of the following four categories:</li>
<li>English uppercase characters (A through Z)</li>
<li>English lowercase characters (a through z)</li>
<li>Base 10 dig#s (0 through 9)</li>
<li>Non-alphabetic characters (for example, !, $, #, %)</li>
</ul>
<p style='font-family:calibri'>For any assistance, vis# the <a href='#'>#</a></p>

<p style='font-family:calibri'>-Technology Services</p>
 
"
ForEach ($email in $_.EmailAddress) { 
send-mailmessage -to $email -from noreply@whatever.com -Subject "Password Reminder: Your password will expire in $DaysLeft days" -body $WarnMsg  -smtpserver SMTPSERVERIP -BodyAsHtml }

    	}
 
    }
}

#Get-Date -UFormat "%Y / %m / %d / %A / %Z"
#2006 / 06 / 13 / Tuesday / -07

#$a = Get-Date
#$a.IsDaylightSavingTime()
#True

Get-ADUser rualvara -filter * -properties PasswordLastSet, PasswordExpired, PasswordNeverExpires, EmailAddress, GivenName | Sort-Object GivenName | Out-GridView
#mail is email / givenname is the same just lowercase / passwordlastset is pwdlastset /


# 12 dec 2018  - 8 may 2019

#365 days in a year;  


[system.diagnostics.stopwatch]::startNew()

$n = Get-Date -UFormat "%Y"
$r = $n - 2005
Wr#e-Output $r

$y = Get-Date -UFormat "%Y"
$d = Get-Date -UFormat "%d"
$m = Get-Date -UFormat "%m"

(Get-Date -Year $y -Month $m -Day $d).DayOfYear

(Get-Date -Year 2019 -Month 6 -Day 8).DayOfYear


[system.diagnostics.stopwatch]::startNew()

$y = Get-Date -UFormat "%Y"
$d = Get-Date -UFormat "%d"
$m = Get-Date -UFormat "%m"

(Get-Date -Year $y -Month $m -Day $d).DayOfYear

(Get-Date -Year 2019 -Month 6 -Day 8).DayOfYear

#make a web alias
New-Alias -Name Web -Value mkdir
#change alias
Set-Alias -Name Web -Value Invoke-WebRequest

#function powershell sytnax
Function Get-Time {Get-Date -Format hh:mm}

#Alias for the function
New-Alias -Name Test -Value Get-Time

<#See policys  /  LocalMachine | RemoteSigned #scripts made locally run fine, 
but not from the internet unless they are dig#ally signed by a trusted publisher | PC is on AllSigned#>
Get-ExecutionPolicy -List

#for #
Get-# Get-ExecutionPolicy -online
#Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned

#Aliases and Functions are temporary. To add them premantly you need to add # into the profile

#Use to test if profile active
Test-Path $profile #if false there are none.

#makes profile
New-#em -Path $profile -Type File -Force
#You can then add functions or aliases in there and # will be saved.

#Modules are functions & Aliases already defined. 
Get-Module -ListAvailable #gets the current list available; there are not active
#Powershell Gallery has a bunch of functions, alias, scripts

#cmdlet to manage Azure
Install-Module -Name Azure -Repos#ory PSGallery -Force
#Get-Module shows active modules; to import get name,
Import-Mode AzureRM.profile
Import-Mode AzureRM.Storage
Import-Mode AzureRM.Azure
#install all depences

#to look at the attributes of a file
Get-Child#em | Get-Member

#shows modules loaded that are Azure 
Get-Module | Where-Object { $_.Name -Match "^Azure.*"}

#Remove all Azure modules
Get-Module | Where-Object { $_.Name -Match "^Azure.*"} | Remove-Module 

#Out-Host display on screen if output is made / Get-command | Out-Host -Paging
#Out-Null dumps output 
#Out-Printer sent to default printer
#Out-String can be used in a program or sub-roun#e
#Out-File / Get-command | Out-File ".\documents\commands.txt"

#The xml files are under should not be messed w#h.
# Function Out-Default { Wr#e-Host "This command ran completly" }
# ^ over runs cmdlets function

#You can copy and replace just make sure Fomart.ps1xml is included.

<# Start-Process notepad.exe
$NotepadProc = Get-Process -Name notepad
$NotepadProc.Wa#ForEx#()
Start-Process calc.exe #>

# $_ is the current pipline object
 Get-Process | Where-Object {$_.Name –eq “Teams”}

<#
Get-Command |
Where-Object {$_.CommandType -eq "Cmdlet"} |
Get-# | Out-File ".\Reference_cmd.txt"
Wr#e-Host "File out in C drive"

Get-Command |
Where-Object {$_.CommandType -eq "Alias"} |
Get-# | Out-File ".\Reference_Alias.txt"
Wr#e-Host "File out in C drive" 
#>

#Get-Command | Where-Object { $_.Name -match "Get" -and $_.Name -match "IP"}

Function IPnet{}

Function Last5{Get-history -Count 5}

#old
cls
Wr#e-Host " Current User:" $env:USERNAME,
`n,"Computer Name: " $env:COMPUTERNAME, 
 `n, "Operating System: " `n(Get-WmiObject Win32_OperatingSystem).Caption, 
 (Get-WmiObject Win32_OperatingSystem).Version, `n" IPAddress: "
 Get-NetIPAddress | ft InterfaceAlias, IPAddress
 Wr#e-Host "Last 5 Powershell Commands:"
 Get-history -Count 5


 #cleaner
 Wr#e-Host "Current User:" $env:USERNAME
 Wr#e-Host "Computer Name: " $env:COMPUTERNAME
 Wr#e-Host "Operating System: "
 (Get-WmiObject Win32_OperatingSystem).Caption
 Wr#e-Host " IPAddress: "
 Get-NetIPAddress | ft InterfaceAlias, IPAddress | Out-Host
 Wr#e-Host "Last 5 Powershell Commands:"
 Get-history -Count 5
 


Enable-RemoteMailbox -domaincontroller # -Ident#y $mail -Alias $target -PrimarySMTPAddress $mail -RemoteRoutingAddress $newroute
Set-RemoteMailbox -domaincontroller # -ident#y $target -EmailAddresses $newaliases
Set-RemoteMailbox -domaincontroller # -ident#y $target -EmailAddressPolicyEnabled $true


$User = read-host -Prompt "Enter User" 
$Groups = $(Get-ADUser $User -Properties memberOf).memberOf
$Groups

@($Groups) -match "Secur#y Groups" 
@($Groups) -match "OU=Distribution Groups" 

Foreach ($Group in $Groups) {
Get-ADGroup $Group | FT
}

