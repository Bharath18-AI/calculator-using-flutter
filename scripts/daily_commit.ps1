# Daily Commit Automation Script (PowerShell)
# Usage: powershell -ExecutionPolicy Bypass -File .\scripts\daily_commit.ps1

$startDate = [DateTime]::Parse("2026-10-27")
$today = (Get-Date).Date
$diffDays = ($today - $startDate).Days

if ($diffDays -gt 14) {
    Write-Host "14-day automated cycle has elapsed ($diffDays days). No commit required."
    exit 0
}

$messages = @(
    "Update daily maintenance log and notes",
    "Refactor internal code comments",
    "Update documentation notes and formatting",
    "Sync daily project status and metrics",
    "Enhance code documentation clarity",
    "Tidy up utility comments and annotations",
    "Update project changelog and activity",
    "Routine daily project maintenance",
    "Refine inline documentation details",
    "Update activity timestamps and notes"
)

$targetFiles = @(
    "docs/ACTIVITY.md",
    "docs/UPDATES.md",
    "README.md"
)

$commitMsg = Get-Random -InputObject $messages
$targetFile = Get-Random -InputObject $targetFiles
$timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
$todayStr = (Get-Date).ToString("yyyy-MM-dd")

if ($targetFile -eq "docs/ACTIVITY.md") {
    Add-Content -Path "docs/ACTIVITY.md" -Value "| $todayStr | Maintenance | Local daily sync: $commitMsg ($timestamp) |"
} elseif ($targetFile -eq "docs/UPDATES.md") {
    Add-Content -Path "docs/UPDATES.md" -Value "- **$todayStr**: $commitMsg at $timestamp."
} else {
    Add-Content -Path "README.md" -Value "<!-- Last local health check: $timestamp -->"
}

git add $targetFile
git commit -m "$commitMsg"
git push origin main

Write-Host "Committed and pushed: '$commitMsg' on $targetFile"
