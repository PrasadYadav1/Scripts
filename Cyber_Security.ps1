#--------------User creation Script-----------------

write-Output "Enter Password for the new user"
$Password = Read-Host -AsSecureString
Write-Output "Enter Username"
$User_name = Read-Host
Write-Output "Enter Fullname"
$full_name = Read-Host
Write-Output " Enter the description"
$User_description = Read-Host
New-LocalUser $user_name -Password $Password -FullName $full_name -Description $user_description
Add-LocalGroupMember -Group "Guests" -Member $User_name
#Remove-LocalGroupMember -Group "Users" -Member "Prasad"



#-------------wallpaper change script---------------

write-Output "Technoidentity_Wallpaper_Setup"
$MyWallpaper="D:\Wallpaper2.jpg"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)

#--------------wallpaper disable script ----------------------

write-Output "Wallpaper Disabled"
reg  add  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v  NoChangingWallPaper /t  REG_DWORD /d  0

#--------------Disable USB in Laptop -------------------------

write-Output "USB Disabled"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR\" -Name "start" -Value 4

#-------------Download & Install Lark ------------------------

# Source URL
$url = "https://sf16-va.larksuitecdn.com/obj/lark-artifact-storage/92756a/Lark-win32_ia32-5.11.11-signed.exe"

# Destation file
$dest = "C:\Users\Technoidentity\Downloads\lark.exe"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $dest

#Install file
Start-Process -FilePath "C:\Users\Technoidentity\Downloads\lark.exe" -ArgumentList "/S /v/qn"

#-------------Download & Install Google Chrome------------------

Invoke-WebRequest -Uri "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B98D63CB1-C1B6-F841-9146-1C1A65ED5C13%7D%26lang%3Den%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26brand%3DYTUH%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe" -OutFile "C:\Users\Technoidentity\Downloads\chrome.exe"
Start-Process -FilePath "C:\Users\Technoidentity\Downloads\chrome.exe" -ArgumentList "/S /v/qn"

#-------------Download & Install VS Code------------------------

Invoke-WebRequest -Uri https://az764295.vo.msecnd.net/stable/30d9c6cd9483b2cc586687151bcbcd635f373630/VSCodeSetup-x64-1.68.1.exe -OutFile "$HOME\Downloads\vscode.exe"
Start-Process -FilePath "$HOME\Downloads\vscode.exe" -ArgumentList "/S /v/qn"

#------------Download & Install Openoffice----------------------

Invoke-WebRequest -Uri https://webwerks.dl.sourceforge.net/project/openofficeorg.mirror/4.1.12/binaries/en-US/Apache_OpenOffice_4.1.12_Win_x86_install_en-US.exe -OutFile "$HOME\Downloads\openoffice.exe"
Start-Process -FilePath "$HOME\Downloads\openoffice.exe" -ArgumentList "/S /v/qn"

#-----------Adding Bookmarks in Chrome--------------------------

Start-Process -FilePath Chrome -ArgumentList https://www.youtube.com/
Start-Process -FilePath Chrome -ArgumentList https://www.amazon.com/
#Start-Process -FilePath www.c-sharpcorner.com

#-----------Blocking Websites in Chrome--------------------------

$hostfile = "$env:windir\system32\drivers\etc\hosts"
$file = Get-Content $hostfile
$newfile = $file -replace "8.8.8.8   Google.com","4.4.4.4   Google.com"
Set-Content -Value $newfile -Path $hostfile -Force
