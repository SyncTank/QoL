break
Start-sleep(10000)

#Attention need # only checking for the whole listing
# use lastlogonTimestamp, lastlogon pwdlastset as a filter criteria to 1600 for arma listing 

 Get-ADUser -Filter {(cn -like "* *")} -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-gridview

 #------------------------------------------------------------------------#
 # Search AN true and false
 #Grid
 Get-ADUser -Filter {(# -like "*")  -and ( Enabled -eq $true )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-GridView -Title "Enable Users"

 Get-ADUser -Filter {(# -like "*")  -and ( Enabled -eq $False )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-GridView -Title "Disable Users"

 #active accounts that do not have anything in mail att
 Get-ADUser -Filter {( Enabled -eq $true ) -and (mail -notlike "*") -and (targetAddress -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,targetAddress,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-GridView -Title "Active Users with no mail box or targetAddress" 

 Get-ADUser -Filter {( Enabled -eq $true ) -and (mail -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-GridView -Title "Active Users with no mail box"

 #Not sending email anywhere
 Get-ADUser -Filter {( Enabled -eq $true ) -and (targetAddress -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,targetAddress,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-GridView -Title "No email address"

 #counter
 $f = Get-ADUser -Filter {( Enabled -eq $False )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# 

 $t = Get-ADUser -Filter {( Enabled -eq $true )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# 

 $no = Get-ADUser -Filter {( Enabled -eq $true ) -and (mail -notlike "*") -and (targetAddress -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,targetAddress,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# 

 $m = Get-ADUser -Filter {( Enabled -eq $true ) -and (mail -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# 
 
 $p = Get-ADUser -Filter {( Enabled -eq $true ) -and (targetAddress -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,targetAddress,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,#  

 $p.count
 $f.count
 $t.count
 $no.count
 $m.count


 Get-ADUser -Filter {( Enabled -eq $true ) -and (targetAddress -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,targetAddress,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-GridView


 #------------------------------------------------------------------------#

 #Exporting the above list
 Get-ADUser -Filter {( Enabled -eq $true )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | Export-Csv "C:\Users\#\OneDrive - #\Z_Current\Active_Accounts.csv"

 Get-ADUser -Filter {( Enabled -eq $true ) -and (mail -notlike "*") -and (targetAddress -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,targetAddress,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | Export-Csv "C:\Users\#\OneDrive - #\Z_Current\No_Mail.csv"

 Get-ADUser -Filter {( Enabled -eq $true ) -and (mail -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | Export-Csv "C:\Users\#\OneDrive - #\Z_Current\Active_No_MailAttribute.csv"

 Get-ADUser -Filter {( Enabled -eq $False )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | Export-Csv "C:\Users\#\OneDrive - #\Z_Current\Inactive_accounts.csv"

 Get-ADUser -Filter {( Enabled -eq $true ) -and (targetAddress -notlike "*")}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,samaccountname,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,mail,targetAddress,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | Export-Csv "C:\Users\#\OneDrive - #\Z_Current\Active_Users_No_TargetAddress.csv"

 Get-ADUser -Filter {( Enabled -eq $False )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | Export-Csv "C:\Users\#\OneDrive - #\Z_Current\Inactive_accounts.csv"
 
 Get-ADUser -Filter {( Enabled -eq $False )}  -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | Export-Csv "C:\Users\#\OneDrive - #\Z_Current\Inactive_accounts.csv"

Get-ADUser -Filter * -SearchBase "#=Inactive_Users_Student,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,#  | Export-Csv "C:\Users\#\OneDrive - #\Rudy_Code_+_Userslist\Inactive_accounts_Students.csv"

Get-ADUser -Filter * -SearchBase "#=#-WL,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -Properties * |  Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,#  | Export-Csv "C:\Users\#\OneDrive - #\Rudy_Code_+_Userslist\#-WL.csv"


#------------------------------------------------------------------------#

#Calculate total number of AD accounts
Get-ADUser -Filter {SamAccountName -like "*"} | Measure-Object

#Calculate total number of accounts in AN
Get-ADUser -Filter {SamAccountName -like "*"} -SearchBase # -SearchScope subtree | Measure-Object

#------------------------------------------------------------------------#

#list of all active AD accounts
Get-ADUser -Filter {Enable -eq "True"} | Select-Object SamAccountName, Name, Surname, GivenName | Format-Table

#------------------------------------------------------------------------#

#list of the accounts with expired password
Get-ADUser -Filter {Enabled -eq $True} -Properties passwordExpired | Where-Object {$_.PasswordExpired} | #-gridview

#------------------------------------------------------------------------#

#users who havn't changed their passwords in the last 90 days
$90_Days = (Get-Date).AddDays(-90) 
Get-ADUser -Filter {(passwordlastset -le $90_Days)} | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-GridView

#------------------------------------------------------------------------#

#get list of AD groups of the speicific user
Get-ADUser # -Properties memberof | Select-Object memberof -expandproperty memberof

#------------------------------------------------------------------------#
#checks for all accounts \ dup ID

Get-ADUser -Filter {(# -like "*")-and(Enabled -eq $true)-or(Enabled -eq $false)} -property # | Group-Object # | Where-Object {$_.Count -ge 2} | Select-Object -ExpandProperty group | 
Select-Object Enabled, ObjectClass, Name, UserPrincipalName, SamAccountName, # | Export-Csv C:\Users\#\Desktop\#_is_duplicate.csv
w2

#checks for all accounts \ dup ID 

$users = Get-ADUser -Filter { Enabled -eq $true } -Properties #  | Where-Object { ($_.# -notlike "*9999999*") -and ($_.Name -notlike "*Student*") -and ($_.# -notlike "*7777777*") -and ($_.distinguishedname -notlike "*#=ProfStudents*")}
$ids = @{}; $users | ForEach-Object { if($_.#) { $ids[$_.#] += 1 } }
$filteredUsers = $users | Where-Object { if($_.#) { $ids[$_.#] -gt 1 } }
$filteredUsers | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-gridview

#------------------------------------------------------------------------#

#checking the whole AD sub tree

Get-ADUser -Filter {(# -like "*C*")} -SearchBase "DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 500 -Properties * | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-gridview

#------------------------------------------------------------------------#

Get-ADUser -Filter {(cn -like "* *")} -SearchBase "#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-gridview
Get-ADUser -Filter {(cn -like "* *")} -SearchBase "#=Disabled Users,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-gridview
Get-ADUser -Filter {(cn -like "* *")} -SearchBase # -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# | #-gridview

 #------------------------------------------------------------------------#

 $test = Get-ADUser # -Properties * | Select-Object pwdlastset
 Write-# $test

#Move ADUsers in the AN who have an ID and are active. to Active_Users #
Get-ADUser -Filter {(# -like "*")  -and ( Enabled -eq $true )}  -SearchBase # -SearchScope subtree -Properties * | Move-ADObject -TargetPath '#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu' 

 #------------------------------------------------------------------------#
<#
Get-ADUser -Filter {(cn -like "*")} -SearchBase "#=#, #=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 10 -Properties * | Select-Object -Property cn,#,enabled | Sort-Object cn | #-GridView -Title test

if($_num -match "^[0-9]*$"){
"is int"
}

$person = Get-ADUser -Filter {(Enabled -eq $false)} -SearchBase # -searchscope OneLevel -ResultSetSize 5000 -Properties * | Select-Object cn,distinguishedName, enabled
$person -match "\d" 

$person2 = Get-ADUser -Filter {(Enabled -eq $false)} -SearchBase "#=Inactive_Users_Student,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -searchscope OneLevel -ResultSetSize 5000 -Properties * | Select-Object cn,distinguishedName, enabled
$person2 -match "\d" 

Looks for account that contains 00

$userswtich = $person -match "\d" 
$userswtich2 = $person.cn -like "*00*"

$userswtich = $person2 -match "\d" 
$userswtich2 = $person2.cn -like "*0*"  
$user3 = $userswtich2 | Get-ADUser -Properties * | Select-Object #,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,# 
$user3 | Export-csv "C:\Users\#\OneDrive - #\Rudy_Code_+_Userslist\list3.csv"

$userswtich | Export-csv "C:\Users\#\OneDrive - #\Z_Current\list.csv"

$userswtich2 | Export-csv "C:\Users\#\OneDrive - #\Z_Current\list2.csv"

$TargetOU = "#=Inactive_Users_Numbers,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" 
Import-CSV "C:\Users\#\OneDrive - #\Z_Current\list.csv" |
ForEach-Object { $UserDN = (Get-ADUser -Identity $_.cn) 

Move-ADObject -Identity $UserDN -targetpath $TargetOU


} #>




Get-ADUser -Filter * -SearchBase "#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #, samaccountname ,displayname, whencreated, TargetAddress,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}}, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount, userworkstations | #-GridView
$test = Get-ADUser -Filter * -SearchBase "#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #, samaccountname ,displayname, whencreated, TargetAddress,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}}, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount, userworkstations
$test | Export-Csv "C:\Data\Review_Aug052019.csv" -NoTypeInformation
$test.count



Get-ADUser -Filter * -SearchBase "#=#-WL,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #, samaccountname ,displayname, whencreated, TargetAddress,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}}, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount, userworkstations | #-GridView
Get-ADUser -Filter * -SearchBase "#=#-WL,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #, samaccountname ,displayname, whencreated, TargetAddress,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}}, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount, userworkstations | Where-Object {$_.TargetAddress -ne $null} | #-GridView
$test = Get-ADUser -Filter * -SearchBase "#=#-WL,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #, samaccountname ,displayname, whencreated, TargetAddress,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}}, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount, userworkstations | Where-Object {$_.TargetAddress -ne $null} 
$test | Export-Csv "C:\Data\Email.csv" -NoTypeInformation
$test.count



Get-ADUser -Filter * -SearchBase "#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #, samaccountname ,displayname, whencreated, TargetAddress,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}}, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount, userworkstations | #-GridView
$test = Get-ADUser -Filter * -SearchBase "#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object #, samaccountname , cn ,displayname, whencreated, TargetAddress,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}}, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount, userworkstations 
$test.count



ForEach ($user in $test){

    $newname = $user.samaccountname


}


#Read users into variable.
$users = Get-ADUser -Filter * -SearchBase "#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu"
  
#Process users.
Foreach ($user in $users) {
    $newDN = $user.surname + ", " + $user.GivenName + " ($sitecode)"
    #Change display name, and company name
    set-aduser $user -cn $newDN -company $company -server $server -ErrorAction SilentlyContinue
    #Change distinguished name
        Try {
            Rename-ADObject -identity $user -Newname $newDN -server $server
        }
        Catch {
            Write-Host "$user may already exist."
        }
    }


#Get AD user and rename object on AD
Get-ADUser -Filter {cn -like "rudytest111111"} -SearchBase "#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -Properties cn,samaccountname, displayname | %{$_ | Rename-ADObject -WhatIf -NewName $_.samaccountname}
# %{$_ | Rename-ADObject -whatif -NewName $_.samaccountname}

#changes all users/objects in active user # to display Samaccountname in name field
Get-ADUser -Filter * -SearchBase "#=Active_Users,#=#,#=# AD Users,DC=ad,DC=#,DC=edu" -Properties samaccountname | %{$_ | Rename-ADObject -WhatIf -NewName $_.samaccountname}
