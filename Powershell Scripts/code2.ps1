## Collect telephonenumber attribute data from AD User and Department accounts. Note there are several variations of the search criteria.
## The input-firstchar.txt file has 26 letters and 10 numbers sorted in ascending order of the # of mailboxes starting with the letter or number.
## 

 

$starttime = get-date

 

$ADaccts = @()
$ADdepts = @()
$ADallTelephones = @()

 

$PhoneTarget = Import-Csv -Path "C:\data\input-firstchar.txt"
$PhoneTarget.count
write-host

 


foreach ($i in $PhoneTarget){
    $ADuserbyLetter = @()
    $ADdeptbyLetter = @()
    $FirstLetter = $i.firstchar+'*'
    $FLcount = "("+$i.count+")"
    write-host $FirstLetter $FLcount
<#
    $ADuserbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*")}  -Properties * -SearchBase "OU=# Users,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    write-host "#Users w/ "$FirstLetter":"  $ADuser $ADuserbyLetter.count

 

    $ADdeptbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*")}  -Properties * -SearchBase "OU=Resources,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    write-host "#Depts w/ "$FirstLetter":"  $ADuser $ADdeptbyLetter.count
#>

 

    $ADuserbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*/*")}  -Properties * -SearchBase "OU=# Users,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    $ADuserbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*.*")}  -Properties * -SearchBase "OU=# Users,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    $ADuserbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*+*")}  -Properties * -SearchBase "OU=# Users,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    $ADuserbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "* *")}  -Properties * -SearchBase "OU=# Users,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    write-host "#Users w/ "$FirstLetter":"  $ADuser $ADuserbyLetter.count

 

    $ADdeptbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*/*")}  -Properties * -SearchBase "OU=Resources,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    $ADdeptbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*.*")}  -Properties * -SearchBase "OU=Resources,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    $ADdeptbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "*+*")}  -Properties * -SearchBase "OU=Resources,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    $ADdeptbyLetter += Get-ADUser -filter {(samaccountname -like $Firstletter) -AND (telephonenumber -like "* *")}  -Properties * -SearchBase "OU=Resources,DC=ad,DC=#,DC=edu" | Select-Object employeeid,displayname,samaccountname,mail,enabled,#,telephonenumber,iPphone,whencreated
    write-host "#Depts w/ "$FirstLetter":"  $ADuser $ADdeptbyLetter.count

 

    $ADaccts += $ADuserbyLetter
    $ADdepts += $ADdeptbyLetter
    write-host
    write-host "Running total-Users: " $ADaccts.count
    write-host "Running total-Depts: " $ADadepts.count
    write-host
}

 

$ADallTelephones += $ADaccts
$ADallTelephones += $ADdepts

 

$endtime=get-date
write-host
write-host "Script started:" $starttime
write-host "Script ended:" $endtime
write-host

 

write-host "Grand Total: " $ADallTelephones.count
write-host
$ADallTelephones | Out-GridView
$ADallTelephones | export-csv c:\data\ADallTelephones.txt -NoTypeInfo

 

 

## Update telephonenumber attribute using info from input file.
<#

 

$NewPhones = import-csv -path c:\data\input-fixtelephones.txt
$NewPhones.count
write-host 

 

foreach ($i in $NewPhones){
    $target = $i.samaccountname
    $targetphone = $i.telephonenumber
    $ipphone=$i.iPphone
    $target
    $targetphone
    $ipphone
    Get-aduser $target | Set-ADUser -replace @{telephonenumber=$targetphone}  
    Get-aduser $target | Set-ADUser -Replace @{ipPhone=$ipphone} 
    # Get-aduser $target | Set-ADUser -clear telephonenumber -whatif
    # Get-aduser $target | Set-ADUser -Add @{ipPhone=$ipphone} 
}

 

#>