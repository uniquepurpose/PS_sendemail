# Simple script to send mails with SMTP auth, STARTTLS and encrypted credentials
# To store encrypted password for SMTP auth in file run this command once:
# Read-Host -AsSecureString | ConvertFrom-SecureString | Out-File $mailpassfile

# Please adjust these variables accordingly.
$mailuser = "alert@somedomain.com"
$mailpassfile = "C:\Scripts\encrypted_password.txt"
$mailrecipient = "user@somedomain.com"
$mailsubject = "This is an alert!"
$mailbody = "Alert has been triggered on $(Get-Date -Format yyyy-MM-dd) $(Get-Date -Format HH:mm:ss)"
$mailserver = "smtp.somedomain.com"

# This is where the magic happens:
$mailpass = Get-Content $mailpassfile | ConvertTo-SecureString
$mailcred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $mailuser,$mailpass

Send-MailMessage -From $mailuser -To $recipient -Subject $mailsubject -Body $mailbody -SmtpServer $mailserver -Port 587 -UseSsl -Credential $mailcred
