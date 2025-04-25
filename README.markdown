🚨 New Project Release: WordPress Brute Force Script 🚨

I'm excited to share my latest project on GitHub: The WordPress Brute Force Script! This educational tool demonstrates brute-force techniques on WordPress login pages and includes essential features like stealth headers, error handling, and logging to simulate a controlled brute force attempt.

⚠️ Important Disclaimer:
This script is for educational purposes only! Unauthorized use of this script to attack systems without explicit permission is ILLEGAL and UNETHICAL. Always obtain proper authorization before testing any system.

🔑 Key Features:
Login Attempts: Uses a provided username and password list to attempt logging into a WordPress site.

Stealth Headers: Mimics a real browser request to avoid detection.

Logging: Logs all attempts and results to a timestamped file.

Error Handling: Handles rate limiting (HTTP 429) to avoid being blocked.

Configurable Delay: Adjustable delay between attempts to prevent server overload.

⚙️ Prerequisites:
PowerShell 3.0 or higher.

A password list file (e.g., 10k-most-common.txt from SecLists).

Internet connection for HTTP requests.

📥 Setup Instructions:
Clone the repository:

bash
Copy
Edit
git clone https://github.com/hlonip/wordpress-bruteforcer.git
cd wordpress-bruteforcer
Place your password list (e.g., 10k-most-common.txt) in the same directory as the script.

Update the script's configuration in brutal.ps1:

powershell
Copy
Edit
$targetUrl = "https://example.com/wp-login.php"
$username = "admin"
$passwordListPath = ".\10k-most-common.txt"
Note: For ethical testing, use a local WordPress instance (e.g., Docker or XAMPP) and set up its URL. Make sure you have permission to test the target system.

🖥️ How to Use:
Run the script in PowerShell:

powershell
Copy
Edit
.\brutal.ps1
The script will:

Load the password list.

Attempt login with each password.

Log results to a file (e.g., wp_brute_log_20250425_123456.txt).

Stop if credentials are found or after all passwords are attempted.

🔒 Ethical Considerations:
Only test systems you own or have explicit permission to test.

Unauthorized brute-forcing violates laws like the Computer Fraud and Abuse Act (CFAA) in the USA.

Use this script to learn about security testing in a controlled, ethical environment (e.g., a local WordPress instance).

📄 License:
This project is licensed under the MIT License. See the LICENSE.txt file for full details.

🤝 Contributing:
Contributions are welcome! If you have suggestions or find any issues, feel free to submit a pull request or open an issue.

🔗 Check it out on GitHub: wordpress-bruteforcer

⚡ Follow me for more updates on cybersecurity, ethical hacking tutorials, and exciting projects in the security space! Let’s learn together and contribute to a more secure digital world. 💻🔐
