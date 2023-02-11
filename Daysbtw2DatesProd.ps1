Write-Host "This shell script will ask you to enter two dates and automatically calculate the number of days between them for you."
Write-Host "You may repeat calculations ad infinitum so long as you answer 'y', 'Y', 'yes', 'Yes', or 'YES' when asked whether you wish to repeat the operation."
Write-Host "Once 'n', 'N', 'no', 'No', or 'NO' is received as a response, you may add the calculated total of all prior calculations."
Write-Host "Sample Use Cases:"
Write-Host "(i) Determine how many days a student's FT CPT authorization entails to enter in your 'CPT Recommended' template email."
Write-Host "(ii) Determine if student has exceeded or will exceed maximum number of total FT CPT days during processing of a CPT or OPT authorization request."

$totalSum = 0
$startdate = Read-Host "Please enter a start date in the format MM/DD/YYYY"
$enddate = Read-Host "Please enter an end date in the format MM/DD/YYYY"
$totalnum = (New-TimeSpan -Start $startdate -End $enddate).Days + 1
Write-Host "The number of days between the provided dates is: $totalnum"
$totalSum +=$totalnum
$repeat = Read-Host "Do you wish to repeat this operation? (Y/N)"
while ($repeat -eq 'Y' -or $repeat -eq 'y' -or $repeat -eq 'Yes' -or $repeat -eq 'YES' -or $repeat -eq 'yes') { 
    $startdate = Read-Host "Please enter a start date in the format MM/DD/YYYY" 
    $enddate = Read-Host "Please enter an end date in the format MM/DD/YYYY" 
    $totalnum = (New-TimeSpan -Start $startdate -End $enddate).Days + 1 
    Write-Host "The number of days between the provided dates is: $totalnum" 
    $totalSum +=$totalnum
    $repeat = Read-Host "Do you wish to repeat this operation? (Y/N)" }
if ($repeat -eq 'N' -or $repeat -eq 'n' -or $repeat -eq 'No' -or $repeat -eq 'NO' -or $repeat -eq 'no') {
    $total = Read-Host "Do you wish to total your previous calculations?" 
    if ($total -eq 'y' -or $total -eq 'Y' -or $total -eq 'Yes' -or $total -eq 'YES' -or $total -eq 'yes') { 
    Write-Host "The sum of all previous calculations is: $totalSum"   
    $answer = Read-Host "Do you want to restart this program (Y/N)?"
    if ($answer -eq "y" -or $answer -eq 'Y' -or $answer -eq 'Yes' -or $answer -eq 'YES' -or $answer -eq 'yes') {
    & $MyInvocation.MyCommand
    } }}
else {
    exit
}