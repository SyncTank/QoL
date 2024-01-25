# Gets all groups that are set as groupscope global in ServiceNow Groups
Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object Name
$c = Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object Name
$c.count #265

# Different GroupScope setting 1 groups
#Get-ADGroup -Filter {(GroupScope -eq "Universal")} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object Name

# Different GroupScope setting 0 groups
#Get-ADGroup -Filter {(GroupScope -eq "Domainlocal")} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object Name


# Gets all groups that are set as groupscope global in ServiceNow Groups Test
Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object Name
$c = Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object Name
$c.count #28


# Properties of 1
Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 2 -Properties *

# SamAccountName ADMember pull on Group
Get-ADGroupMember -Identity Group
$c = Get-ADGroupMember -Identity Group
$c.Count
$users = $c.SamAccountName

$VerifyUsers = @()
Foreach ($user in $users){

$VerifyUsers += Get-ADUser -Filter {(name -like $user)} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 50 -Properties * | Select-Object *, @{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}}

}
$VerifyUsers | Out-GridView
# Above is Layer Testing










# Used in first run to get OUs under Servicenow Groups
$sbase = "OU=ServiceNow Server"

$ADunits = Get-ADOrganizationalUnit -Filter {(name -notlike "*groupname*")} -SearchBase $sbase -SearchScope OneLevel

# Makes a excel file for each group
Foreach ($unit in $ADunits){

# Make a path and folder to store data
$foldername = ("C:\Data\" + $unit.name)
New-Item -Path $foldername -ItemType Directory
$unit

# Get Groups under the first select OU
$Groups = Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase ($unit.DistinguishedName) -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object samaccountname
    
    # Grab a single group to pull members
    Foreach ($Group in $Groups){

    $Group
    $userslist = Get-ADGroupMember -Identity $Group.SamAccountName
    $users = $userslist.name
 
    $VerifyUsers = @()
     Foreach ( $user in $users){

     $user
     $VerifyUsers += Get-ADUser -Filter {(name -like $user)} -SearchBase "OU=ServiceNow Server" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object *,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}}

     }# End of user loop

    #$VerifyUsers | Out-GridView -Title ($Group.SamAccountName + " has " + $users.count + " users") 
    $VerifyUsers | Export-csv ($foldername+"\"+($Group.SamAccountName + " has " + $users.count + " users")+".csv") -notypeinfo

    }# End of Group loop



}# End of Unit loop



#--------------------------------------------------------------------------------------#

# Excel for all groups

$sbase = "OU=ServiceNow Server"

$ADunits = Get-ADOrganizationalUnit -Filter {(name -notlike "*groupname*")} -SearchBase $sbase -SearchScope OneLevel

$VerifyUsers = @()
Foreach ($unit in $ADunits){


New-Item -Path 'C:\Data\Total' -ItemType Directory
$unit

# Get Groups under the first select OU
$Groups = Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase ($unit.DistinguishedName) -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object samaccountname
    
    # Grab a single group to pull members
    Foreach ($Group in $Groups){

    $Group
    $userslist = Get-ADGroupMember -Identity $Group.SamAccountName
    $users = $userslist.name
 

     Foreach ( $user in $users){

     $user
     $VerifyUsers += Get-ADUser -Filter {(name -like $user)} -SearchBase "OU=ServiceNow" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object *,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}}

     }# End of user loop

    #$VerifyUsers | Out-GridView -Title ($Group.SamAccountName + " has " + $users.count + " users") 
    }# End of Group loop



}# End of Unit loop
$VerifyUsers | Export-csv ('C:\Data\Total\Total' + ' ' + $VerifyUsers.count + '.csv') -notypeinfo







#--------------------------------------------------------------------------------------#







# Search for Production OU
$sbase = OU=ServiceNow Groups

# Export Path
New-Item -Path 'C:\Data\Total_three' -ItemType Directory

# Groups in the Production OU
$Groups = Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase $sbase -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object samaccountname

$GroupList = @()
$GroupList2 = @()
$Globaldisable = @()
$Globallist = @()
$fulltime = @()
$parttime = @()
$# = @()
$NON# = @()
$groupcount = 0;

#spliting up groups
Foreach ($Group in $Groups){

 # Used to get a spec list of ITIL memebers
 $check = $Group.samaccountname -like "*Queue*"
  
 # Two list that have que in one and non que in name 
 if ( $check -eq $true){$GroupList += $Group}else{$GroupList2 += $Group}

}

# $Group is master list, $Grouplist contains Queue & $Grouplist is non Queues

# Master list of users with no dups
$VerifyUsers = @()
Foreach( $Group in $Groups){

 $Group

 $userslist = $null
 $userslist =  Get-ADGroupMember -Identity $Group.SamAccountName # Get-ADGroupMember -Identity "#" 
 $users = $userslist.name

 if( $userslist -ne $null ){ $groupcount++;}


    Foreach($user in $users){

     $CheckUser = Get-ADUser -Filter {(name -like $user)} -SearchBase "OU=ServiceNow" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object employeeID, displayName, enabled, #, #, #, #,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}}, logonCount, samaccountname
     
     if ( ($VerifyUsers.employeeID) -notcontains ($CheckUser.employeeID) ){$VerifyUsers += $CheckUser;}

    }

}



Foreach($Vu in $VerifyUsers){

 $check = $Vu.enabled -eq $true

 if ( $check -eq $false){$Globaldisable += $Vu}

} # $Globaldisable is the total number of users in the groups whom are disabled

Foreach ($ID in $VerifyUsers ){

 $check = $ID.# -like "*S*"

 if ( $check -eq $true){$parttime += $ID}else{$fulltime += $ID}


}

# Going through Group list 
Foreach ( $item in $GroupList){
 
 $item

 $userslist = Get-ADGroupMember -Identity $item.SamAccountName
 $users = $userslist.name

 Foreach ( $user in $users){

    $user

    $CheckUser = Get-ADUser -Filter {(name -like $user)} -SearchBase "OU=ServiceNow" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object employeeID, displayName, enabled, #, #, #, #,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}}, logonCount, samaccountname

    if ( ($#.employeeID) -notcontains ($CheckUser.employeeID) ){$# += $CheckUser;}

  }
}

Foreach ( $item2 in $GroupList2){
 
 $item2

 $userslist = Get-ADGroupMember -Identity $item2.SamAccountName
 $users = $userslist.name

 Foreach ( $user in $users){

    $user

    $CheckUser = Get-ADUser -Filter {(name -like $user)} -SearchBase "OU=ServiceNow" -SearchScope subtree -ResultSetSize 5000 -Properties * | Select-Object employeeID, displayName, enabled, #, #, #, #,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}}, logonCount, samaccountname

    if ( (($.employeeID) -notcontains ($CheckUser.employeeID)) -and (($.employeeID) -notcontains ($CheckUser.employeeID)) ){$ += $CheckUser;}

  }
}





<#

$ # Total number of #
$ # nonstudents
$parttime # students 
$Globaldisable # total disabled users
$Groups #total groups 
$NON# # total number of NON #


$.count 
$.count 
$fulltime.count 
$parttime.count 
$Globaldisable.count 
$Groups.count 
#>



$data = @(
    [pscustomobject]@{Item=''; Amount=($.count)}
    [pscustomobject]@{Item=''; Amount=($.count)}
    [pscustomobject]@{Item='fulltime'; Amount=($fulltime.count)}
    [pscustomobject]@{Item='part_time'; Amount=($parttime.count)}
    [pscustomobject]@{Item='Global disables'; Amount=($Globaldisable.count)}
    [pscustomobject]@{Item='Group Total'; Amount=($Groups.count)}
    [pscustomobject]@{Item='Groups with Users'; Amount=($groupcount)}
    [pscustomobject]@{Item='Total Users'; Amount=($VerifyUsers.count)}
)


$data | Export-csv ('C:\Data\Total_three\New_Total.csv') -notypeinfo


$VerifyUsers | Out-GridView


# $VerifyUsers | Export-csv ('C:\Data\Total_two\New_user_total.csv') -notypeinfo



#--------------------------------------------------------------------------------------------------------------------#



$string = $string -replace '12','' # this will remove 12




Get-ADGroup -Identity "#"

#New-ADGroup -Name "Test_GroupRudy" -SamAccountName Test_GroupRudy -GroupCategory Security -GroupScope Global -DisplayName "Test_GroupRudy" -Path $cbase -Description "Test"

Get-ADGroup -Identity "#" | #New-ADGroup -Name "Test_GroupRudy" -SamAccountName Test_GroupRudy -GroupCategory Security -GroupScope Global -DisplayName "Test_GroupRudy" -Path $cbase -Description "Test"

Get-ADGroup -Identity "Test_GroupRudy"


$newbase = "#"

$Groups = Get-ADGroup -Filter {(GroupScope -eq "Global")-and(samaccountname -notlike "*#*")} -SearchBase $newbase -SearchScope OneLevel -ResultSetSize 5000 -Properties * | Select-Object samaccountname

$# = @()
Foreach ( $Group in $Groups){

 $check = $Group.samaccountname -like "*#*"

 if ( $check -eq $true){$# += $Group;}

}


$cbase = "#"

$checklist = @()
Foreach ( $item in $#){


$new = Get-ADGroup -Identity $item.samaccountname

$newname = $new.samaccountname -replace '#',''

#$checklist += $newname

New-ADGroup -Name $newname -SamAccountName $newname -GroupCategory Security -GroupScope Global -DisplayName $newname -Path $cbase 

 Start-Sleep -s 2

}


#----------------------------------------------------------------------------------------------#

$newbase = "#"

$Groups = Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase $newbase -SearchScope OneLevel -ResultSetSize 5000 -Properties * | Select-Object samaccountname


$cbase = "#"

$Groups2 = Get-ADGroup -Filter {(GroupScope -eq "Global")} -SearchBase $cbase -SearchScope OneLevel -ResultSetSize 5000 -Properties * | Select-Object samaccountname


#----------------------------------------------------------------------------------------------#


$newbase = "#"

$Groups = Get-ADGroup -Filter {(GroupScope -eq "Global")-and(samaccountname -notlike "*#*")} -SearchBase $newbase -SearchScope OneLevel -ResultSetSize 5000 -Properties * | Select-Object samaccountname

$# = @()
Foreach ( $Group in $Groups){

 $# += $Group;

}

$cbase = "#"

$checklist = @()
Foreach( $item in $#){


$new = Get-ADGroup -Identity $item.samaccountname

$newname = $new.samaccountname.Insert(0,"#")

$checklist += $newname;

New-ADGroup -Name $newname -SamAccountName $newname -GroupCategory Security -GroupScope Global -DisplayName $newname -Path $cbase 

Start-Sleep -s 2

}

#----------------------------------------------------------------------------------------------#


$Groups = Get-ADGroup -filter {(name -like "*Queue*")} -properties * | Select-Object name,groupcategory

$Groups2 = Get-ADGroup -filter {(name -like "*mts*")} -properties * | Select-Object name,groupcategory

$usergroup = @()

$usergroup = Get-ADGroupMember -Identity "#" | Select-Object name, displayName, distinguishedName, objectClass, employeeID, enabled,givenName

$usergroup2 = @()

$usergroup2 = Get-ADGroupMember -Identity "#" -Recursive | Select-Object name, displayName, distinguishedName, objectClass, employeeID, enabled,givenName


Get-ADGroupMember -identity "#" | Get-ADUser -Filter{Name -like "*"} -Properties * | Select-Object Name,ObjectClass,DisplayName﻿

$usergroup2 = @()

$usergroup2 = Get-ADGroupMember -identity "#" | Get-ADUser -Properties * | Select-Object Name,DisplayName,Title

$usergroup2 = Get-ADGroupMember -identity "*media*" | Get-ADUser -Properties * | Select-Object Name,DisplayName,Title

$ts = Get-ADGroup -Filter {(name -like "*#*")-and(name -like "*Queue*")} | Get-ADGroupMember | Get-ADUser -Properties * | Select-Object $ts,Name,DisplayName,Title

$ts | Get-ADGroupMember | Get-ADUser -Properties * | Select-Object Group,Name,DisplayName,Title


Get-ADGroup -Filter {(name -like "*#*")-and(name -like "*Queue*")} | Get-ADGroupMember | Get-ADUser -Properties * | Select-Object Name,DisplayName,Title

$ts = Get-ADGroup -Filter {(name -like "*#*")-and(name -like "*Queue*")}

$userlist = @()
ForEach($group in $ts){

$group.name 

$userdata = Get-ADGroupMember -identity $group.name 


$userlist += $userdata

}

$userlist | Export-Csv "C:\Data\Cman\data.csv" -NoTypeInformation

#-----------------------------------------------------------------------------------------------#

Get-ADGroupMember -Identity '*#-#'

$Groups = Get-ADGroup -filter {(name -like "*#*")} -properties * | Select-Object name,groupcategory

$list = @()
Foreach( $group in $Groups){

    $list0 += Get-ADGroupMember -Identity $Group.name | Select-Object name, samaccountname, distinguishedName, objectClass, employeeID, enabled,#,#

    $Group.name
    $list.count


}


$unlist = $list0 | Select-Object name, samaccountname, distinguishedName, objectClass, employeeID, enabled,#,# | Sort-Object name | Get-Unique -AsString

$list3 = @()
foreach($user in $unlist){

    if($user.objectClass -like "*user*"){$list3 += $user}

}

$setlist = @()
foreach($user in $list3){
    $setlist += Get-ADUser -Filter {(samaccountname -like "*$user.samaccountname*" )}-SearchBase "OU=ServiceNow" -SearchScope OneLevel -Properties * | Select-Object *
    write-host $($list3.count - $setlist.Count)
}

$setlist | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid | Out-GridView

$setlist | Export-csv "C:\Data\board\setlist.csv" -NoTypeInformation


#step 0
Get-ADUser -Filter {(displayname -like "**")} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object employeeID,displayName,cn,givenname,@{N='lastLogonTimestamp'; E={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{N='lastLogon'; E={[DateTime]::FromFileTime($_.lastLogon)}},logonCount,samaccountname,mail,enabled,#,#,#,#,whenChanged,whenCreated,@{N='pwdLastSet'; E={[DateTime]::FromFileTime($_.pwdLastSet)}},passwordlastset,distinguishedname | Sort-object -Property enabled,employeeid

Get-ADUser -Filter {displayname -like "**"} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
Get-ADUser -Filter {# -like "*"} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
Get-ADUser -Filter {mail -like "**"} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid


Get-ADUser -Filter {# -like "*Rudiyer.Alvarado*"} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid

#step1
Get-ADUser -Filter {(name -like "*rualvara*")} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object employeeID, Displayname, cn, givenname, telephoneNumber, samaccountname, mail, department, enabled | Sort-object -Property enabled,employeeid

#step2
Get-ADUser -Filter {(cn -like "")} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
Get-ADUser -Filter {(cn -like "")} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
Get-ADUser -Filter {(cn -like "")} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
Get-ADUser -Filter {(cn -like "")} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
Get-ADUser -Filter {(Displayname -like "")} -SearchBase "OU=ServiceNow" -SearchScope subtree -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid

#step3
$#list = Get-ADUser -Filter {(department -like "*#*")-and(enabled -eq $true)} -SearchBase "OU=ServiceNow" -SearchScope OneLevel -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
$list2 = Get-ADUser -Filter {((department -like "**")-and(enabled -eq $true))} -SearchBase "OU=ServiceNow" -SearchScope OneLevel -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid
$board = Get-ADUser -Filter {(enabled -eq $true)-and(mail -like "*#*")} -SearchBase "#" -SearchScope OneLevel -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid

#step4
$viplist = Get-Content -Path "C:\Data\Board\list_of_users.txt"

$nlist = @()
ForEach($vp in $viplist){

    write-host $vp ($viplist.Count - $vp.ReadCount)
    $nlist += Get-ADUser -Filter {(displayname -like $vp)} -SearchBase "OU=ServiceNow" -SearchScope OneLevel -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid

}

$deanlist2 = Get-ADUser -Filter {((title -like "**")-and(enabled -eq $true))} -SearchBase "OU=ServiceNow" -SearchScope OneLevel -Properties * | Select-Object Displayname, department , mail ,employeeID ,telephoneNumber, samaccountname, enabled,title,o,distinguishedname | Sort-object -Property enabled,employeeid



$boardoft | Export-Csv "C:\Data\board\bot.csv" -NoTypeInformation

$deanlist | Export-Csv "C:\Data\board\dean.csv" -NoTypeInformation
$#list | Export-Csv "C:\Data\board\provo.csv" -NoTypeInformation

$nlist | Export-Csv "C:\Data\board\typeh.csv" -NoTypeInformation



