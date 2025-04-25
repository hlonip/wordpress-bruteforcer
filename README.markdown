WordPress Brute Force Script
Overview
This repository contains a PowerShell script (brutal.ps1) designed for educational purposes to demonstrate brute force techniques against a WordPress login page. The script includes basic stealth headers, logging, and error handling to simulate a controlled brute force attempt.
WARNING: This script is for EDUCATIONAL USE ONLY. Unauthorized use of this script to attack systems without explicit permission is ILLEGAL and UNETHICAL. Always obtain proper authorization before testing any system.
Features

Attempts login to a WordPress site using a provided username and password list.
Includes basic stealth headers to mimic a browser request.
Logs all attempts and results to a timestamped file.
Handles errors and rate limiting (HTTP 429).
Configurable delay between attempts to avoid server overload.

Prerequisites

PowerShell 3.0 or higher.
A password list file (e.g., 10k-most-common.txt from SecLists).
Internet connection for HTTP requests.

Setup

Clone this repository:git clone https://github.com/hlonip/wordpress-bruteforcer.git
cd wordpress-bruteforcer


Place your password list file (e.g., 10k-most-common.txt) in the same directory as the script.
Update the script's configuration section in brutal.ps1 with your target URL and username:$targetUrl = "https://example.com/wp-login.php"
$username = "admin"
$passwordListPath = ".\10k-most-common.txt"

Note: For ethical testing, set up a local WordPress instance (e.g., using Docker or XAMPP) and use its URL. Ensure you have permission to test the target system.

Usage
Run the script in PowerShell:
.\brutal.ps1

The script will:

Load the password list.
Attempt to log in with each password.
Log results to a file (e.g., wp_brute_log_20250425_123456.txt).
Stop if credentials are found or after all passwords are tried.

Ethical Considerations

Only test systems you own or have explicit permission to test.
Unauthorized brute forcing violates laws like the Computer Fraud and Abuse Act (CFAA) in the USA.
Use this script to learn about security testing in a controlled, ethical environment (e.g., a local WordPress instance).

Disclaimer
The author and contributors are not responsible for any misuse of this script. By using this script, you agree to use it ethically and legally, and you assume all risks associated with its use.
License
This project is licensed under the MIT License. See the LICENSE.txt file for details.
Contributing
Contributions are welcome! Please submit a pull request or open an issue for suggestions or bug reports.
