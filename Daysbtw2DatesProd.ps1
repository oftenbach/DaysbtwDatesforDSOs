Write-Host "This script prompts you to enter 2 dates and automatically calculates the number of days between them (inclusive of the end date)."
Write-Host "You may repeat calculations ad infinitum so long as you enter 'y', 'Y', 'yes', 'Yes', or 'YES' when asked 'Do you wish to repeat this operation for a new date range? (Y/N)'"
Write-Host "When 'n', 'N', 'no', 'No', or 'NO' is entered instead, the script asks if you wish to have your previous calculations for the current session totaled." 
Write-Host "If 'yes' (or one of the aforementioned semantic equivalents) is entered, the total of all calculations obtained in the current session is given, after which the option to start a new session of calculations or exit the program displays; any other input here force-quits this shell window instantly."
Write-Host "Sample Use Cases:"
Write-Host "(i) Track and relay to a student how many days the FT CPT (Full-Time Curricular Practical Training) request which you've just authorized entails in your office's tailored CPT approval email."
Write-Host "(ii) Determine if a student has exceeded or will exceed, respectively, the maximum number of total FT CPT days permitted without losing OPT eligibility at current degree level while processing their OPT or CPT request."

$totalSum = 0
Write-Host "--------CALCULATE # OF DAYS BTW ANY DATE RANGE---------"
$startdate = Read-Host "Please enter a start date in the format M/D/YYYY"
$enddate = Read-Host "Please enter an end date in the format M/D/YYYY"
$totalnum = (New-TimeSpan -Start $startdate -End $enddate).Days + 1
Write-Host "The number of days between the provided dates is: $totalnum"
$totalSum +=$totalnum
$repeat = Read-Host "Do you wish to repeat this operation for a new date range? (Y/N)"
while ($repeat -eq 'Y' -or $repeat -eq 'y' -or $repeat -eq 'Yes' -or $repeat -eq 'YES' -or $repeat -eq 'yes') { 
    $startdate = Read-Host "Please enter a start date in the format M/D/YYYY" 
    $enddate = Read-Host "Please enter an end date in the format M/D/YYYY" 
    $totalnum = (New-TimeSpan -Start $startdate -End $enddate).Days + 1 
    Write-Host "The number of days between the provided dates is: $totalnum" 
    $totalSum +=$totalnum
    $repeat = Read-Host "Do you wish to repeat this operation for a new date range? (Y/N)" }
if ($repeat -eq 'N' -or $repeat -eq 'n' -or $repeat -eq 'No' -or $repeat -eq 'NO' -or $repeat -eq 'no') {
    $total = Read-Host "Do you wish to total the previous calculations?" 
    if ($total -eq 'y' -or $total -eq 'Y' -or $total -eq 'Yes' -or $total -eq 'YES' -or $total -eq 'yes') { 
    Write-Host "The sum of all previous calculations is: $totalSum"   
    $answer = Read-Host "Do you wish to start a new session of this program for another student/case (Y) or exit now (N)?"
    if ($answer -eq "y" -or $answer -eq 'Y' -or $answer -eq 'Yes' -or $answer -eq 'YES' -or $answer -eq 'yes') {
    & $MyInvocation.MyCommand
    } }}
else {
    exit
}
