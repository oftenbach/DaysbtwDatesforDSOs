Write-Host "`n"
Write-Host ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>DAYS BETWEEN DATES: A TOOL FOR DSOs<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
Write-Host "---------------------------------GENERAL USAGE---------------------------------"
Write-Host "This script prompts you to enter 2 dates and automatically calculates the number of days between them (inclusive of the end date)."
Write-Host "You may repeat calculations ad infinitum so long as you enter 'y', 'Y', 'yes', 'Yes', 'YES', etc. when asked 'Do you wish to repeat this operation for a new date range? (Y/N)'"
Write-Host "`n"
Write-Host "When 'n', 'N', 'no', 'No', 'NO', etc. is entered instead, the script asks if you wish to have your previous calculations for the current session totaled." 
Write-Host "`n"
Write-Host "If 'yes' (or one of the aforementioned semantic equivalents) is entered, the total of all calculations obtained in the current session is given, after which the option to start a new session of calculations or exit the program displays; if 'no' et al. is entered, the same option is presented to start a new session; any other input here immediately terminates the shell window."
Write-Host "`n"
Write-Host "---------------------------------SAMPLE USE CASES---------------------------------"
Write-Host "(i) Track and relay to a student how many days the FT CPT (Full-Time Curricular Practical Training) request which you've authorized entails in your office's tailored CPT approval email."
Write-Host "(ii) Determine if a student has exceeded or will exceed the maximum number of total FT CPT days permitted without losing OPT eligibility at current degree level while processing their OPT or CPT request."
Write-Host "(iii) Calculate how many days of medical RCL/withdrawal a student has accrued."
Write-Host "`n"
$totalSum = 0
Write-Host "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<START DAYS BETWEEN DATES>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
$startdate = Read-Host "Please enter a start date in the format M/D/YYYY"
$enddate = Read-Host "Please enter an end date in the format M/D/YYYY"
$totalnum = (New-TimeSpan -Start $startdate -End $enddate).Days + 1
Write-Host "The number of days between the provided dates is: $totalnum"
$totalSum +=$totalnum
$repeat = Read-Host "Do you wish to repeat this operation for a new date range? (Y/N)"
while ($repeat -eq 'Y' -or $repeat -eq 'y' -or $repeat -eq 'Yes' -or $repeat -eq 'YES' -or $repeat -eq 'yes' -or $repeat -eq 'yEs' -or $repeat -eq 'yES' -or $repeat -eq 'YeS') { 
    $startdate = Read-Host "Please enter a start date in the format M/D/YYYY" 
    $enddate = Read-Host "Please enter an end date in the format M/D/YYYY" 
    $totalnum = (New-TimeSpan -Start $startdate -End $enddate).Days + 1 
    Write-Host "The number of days between the provided dates is: $totalnum" 
    $totalSum +=$totalnum
    $repeat = Read-Host "Do you wish to repeat this operation for a new date range? (Y/N)" }
if ($repeat -eq 'N' -or $repeat -eq 'n' -or $repeat -eq 'No' -or $repeat -eq 'NO' -or $repeat -eq 'no' -or $repeat -eq 'nO') {
    $total = Read-Host "Do you wish to total the previous calculations?" 
    if ($total -eq 'y' -or $total -eq 'Y' -or $total -eq 'Yes' -or $total -eq 'YES' -or $total -eq 'yes' -or $total -eq 'yEs' -or $total -eq 'yES' -or $total -eq 'YeS') { 
    Write-Host "The sum of all previous calculations is: $totalSum"   
    $answer = Read-Host "Do you wish to start a new session of this program for another student/case (Y) or exit now (N)?"
    if ($answer -eq "y" -or $answer -eq 'Y' -or $answer -eq 'Yes' -or $answer -eq 'YES' -or $answer -eq 'yes' -or $answer -eq 'yES' -or $answer -eq 'yEs' -or $answer -eq 'YeS') {
    & $MyInvocation.MyCommand
    } }
    if ($total -eq 'n' -or $total -eq 'N' -or $total -eq 'No' -or $total -eq 'NO' -or $total -eq 'no' -or $total -eq 'nO') { 
    $answer = Read-Host "Do you wish to start a new session of this program for another student/case (Y) or exit now (N)?"
    if ($answer -eq "y" -or $answer -eq 'Y' -or $answer -eq 'Yes' -or $answer -eq 'YES' -or $answer -eq 'yes' -or $answer -eq 'yES' -or $answer -eq 'yEs' -or $answer -eq 'YeS') {
        & $MyInvocation.MyCommand
        } }
    }
else {
    exit
}