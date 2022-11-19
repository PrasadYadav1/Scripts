while($true) {
  $process = Get-Process chrome | Select-Object -Property CPU | Sort-Object CPU -desc | Select -first 1 | Select-Object -expand CPU
  if ($process -gt 1)
  {
  get-process chrome | select processname,cpu,id | ? {$_.cpu -gt 1 -and $_.id} | %{Stop-Process -processname chrome*}
  Write-Host Checking process cpu utilization $process
  Write-Host Chrome Process has been killed due to 90% utilization of CPU. exit from the loop
	break;
  }
}
<#
#taskkill /IM chrome.exe /F
#Get-Process | Where-Object { $_.CPU -gt 40 }
#Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 1| Select ProcessName,ID,CPU | Format-Table -AutoSize
#Get-Process chrome | Select-Object -Property CPU | Sort-Object CPU -desc | Select -first 1
#get-process chrome | select processname,cpu,id | ? {$_.cpu -gt 90 -and $_.id} | %{Stop-Process -processname chrome*}
#Get-Process chrome | Select-Object -expand CPU | Measure-Object -Sum | Select-Object -expand Sum
#Get-Process chrome | Select-Object -Property CPU | Sort-Object CPU -desc | Select -first 1 | Select-Object -expand CPU
#Get-Process | Where-Object { $_.Name -eq "myprocess" } | Select-Object -First 1 | Stop-Process
#>