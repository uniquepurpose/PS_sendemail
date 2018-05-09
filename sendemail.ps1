# Simple script to send mails with SMTP auth, STARTTLS and encrypted credentials

# To store encrypted password for SMTP auth in file run this command once:
# Read-Host -AsSecureString | ConvertFrom-SecureString | Out-File encrypted_password.txt

$mailuser = "alert@somedomain.com"
$mailpass = Get-Content encrypted_password.txt | ConvertTo-SecureString
$mailcred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $mailuser,$mailpass

$mailrecipient = "user@somedomain.com"
$mailsubject = "This is an alert!"
$mailbody = "Alert has been triggered on $(Get-Date -Format yyyy-MM-dd) $(Get-Date -Format hh:mm:ss)"
$mailserver = "smtp.somedomain.com"

Send-MailMessage -From $mailuser -To $recipient -Subject $mailsubject -Body $mailbody -SmtpServer $mailserver -Port 587 -UseSsl -Credential $mailcred
