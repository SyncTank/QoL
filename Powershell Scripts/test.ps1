#import know area & exchange numbers
$PhonebookID = Import-Csv "C:\Data\PhoneBookExt.csv" # DataBlock / phone area & exchange stored
Import-Csv "C:\Data\list_of_users.csv"
# Loop that gets the above datablock and puts them in a array for comparasions 
$Exten = @();
foreach ( $ID in $PhonebookID ){
 $IDBlock = $ID.area+"-"+$ID.Exchange+"-";
 $Exten += $IDBlock;
}  

# Remove Duplicates from PhoneBook ID and initializes them into a array
$PIDArea = $PhonebookID.area | select -Unique
$PIDExch = $PhonebookID.Exchange | select -Unique

#Used in where-object in Get AD-user ((($_.telephoneNumber).Split('-')).count-1) gets number of this char in string
#Get-ADUser -Filter {(telephonenumber -notlike "* *")-and(employeeID -notlike "* *")-and(employeeID -notlike "*OTH*")} -SearchBase "OU=# AD Users,DC=ad,DC=#,DC=edu" -Properties samaccountname, telephoneNumber, OfficePhone, ipPhone, employeeid | Select-Object samaccountname, telephoneNumber, OfficePhone, ipPhone, employeeid, @{Name="Dash_Count";E={(($_.telephoneNumber).Split('-')).count-1 }},@{Name="Space_Count";E={(($_.telephoneNumber).Split(' ')).count-1 }} | Where-Object {(($_.Dash_Count -lt 2)-or($_.Space_Count -gt 0))-and($_.telephoneNumber -ne $null)} | Out-GridView
$WPhone = Get-ADUser -Filter {(employeeID -notlike "* *")-and(employeeID -notlike "*OTH*")} -SearchBase "OU=# AD Users,DC=ad,DC=#,DC=edu" -Properties employeeID, displayname,samaccountname, mail, enabled, #, telephoneNumber, ipPhone, whencreated, department | Select-Object employeeID, displayname,samaccountname, mail, enabled, #, telephoneNumber, ipPhone, whencreated, department, @{Name="Dash_Count";E={(($_.telephoneNumber).Split('-')).count-1 }},@{Name="Space_Count";E={(($_.telephoneNumber).Split(' ')).count-1 }} | Where-Object {(($_.Dash_Count -lt 2)-or($_.Space_Count -gt 0))-and($_.telephoneNumber -ne $null)} 

# Gets a user from the Search
 $key = @();
 foreach ( $user in $WPhone ){
 $newphone = $null; #Used for new phone creation
 # $user.telephoneNumber What number it is on
 $lop = $null # used to check if new string assignment is empty 

 # Loop through the user number collecting only digits and place them into an array as string
 # Assign $newphone to a number
 for ($i=0; $i -le ($user.telephoneNumber).Length; $i++){
    if ($user.telephoneNumber[$i] -match ".*\d+.*"){ $newphone += $user.telephoneNumber[$i];}}

 # Looks to see if user has an ipphone with no number assigned
 # And that it matchs with 7
 if ( ($user.ipPhone -ne $null)-and($lop -eq $null)){
  if($user.ipPhone[0] -eq '7'){ # Remakes phone string 
   $NP=$null;
   for($i=1;$i -lt ($user.ipPhone).length;$i++){$NP += $user.ipPhone[$i];}
   $lop = "305-348-"+$NP;
   $key += $lop;
  }}

 # if number hasn't been assigned & Checks string length for 13;
 # (4407903143562) convert (44-0790-314-3562)
 if ( (($newphone).Length -eq "13")-and($lop -eq $null)){
   $lop = $newphone; 
   for ( $i = 0; $lop.Length -lt 16; $i++){
    if ( ($i -eq 2) -or ( $i -eq 7) -or ( $i -eq 11) ){$lop = $lop.Insert($i,'-');}
    }
   $key += $lop;
   }
 
 # if number hasn't been assigned & Checks string length for 10;
 # (3053482896) convert (305-348-2896)
 if ((($newphone).Length -eq "10")-and($lop -eq $null)){
  $lop = $newphone;
  for( $i=0; $lop.Length -lt 12; $i++){
   if( ($i -eq 3) -or ( $i -eq 7) ){$lop = $lop.Insert($i,'-');}
  }
  $key += $lop;
 }

     # Check if new phone was assign, if not to assign old number
 if ( $lop -eq $null){$key += $newphone}

 # Get-ADUser $user.samaccountname | select samaccountname, ipphone

 }