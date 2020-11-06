#script for delete data from c:\users\AnyUser data

#Feed the script what's the basic layout of a user's folder \ can be also loaded from a txt file.
$user_layout_folder = Get-ChildItem k:\Users\test1
$user_layout_folder = $user_layout_folder.Name
#$user_layout_folder

#Get all users that currently that exist in the users folder.
$users = Get-ChildItem k:\Users
$users = $users.Name
#$users

#Get-ChildItem -Path C:\Users\test1\Desktop -Include * -Recurse | ForEach-Object { $_.Delete()}

#Delete each sub-set of folders\data under main folder in user’s directory (such as documents\ music\ downloads etc.), and cycle through all users in the user’s folder doing so.
function remove-UDF_folderdata 
{param ($user_layout_folder, $user)
    
    foreach ($entity in $users)
    {
        if ($entity -ne "Public")
        {
            forEach ($item in $user_layout_folder)
            {
                #Get-ChildItem "k:\users\$entity\$item"
               Remove-Item k:\users\$entity\$item\* -Recurse -Force
            }
        }
    }

}

remove-UDF_folderdata $user_layout_folder $user