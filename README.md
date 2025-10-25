## Diabetes Community Platform (A1Circle)

Full progress and screenshots are documented in `workSummary.md`.

### Run Locally (XAMPP)

1. **Clone**

   - Clone into your XAMPP web root (adjust path as needed):
     `C:\xampp\htdocs\diabetes-community`

2. **Start services**

   - Start **Apache** and **MySQL** in the XAMPP Control Panel.

3. **Import database**

   - Open phpMyAdmin: http://localhost/phpmyadmin
   - Create database: `diabetes_community`
   - Import `diabetes_community.sql` from the project root.

4. **Verify configuration**

   - Open `config.php` and confirm:
     ```php
     'host' => 'localhost',
     'port' => 3306,
     'database' => 'diabetes_community',
     'username' => 'root',
     'password' => '',
     'url' => 'http://localhost/diabetes-community/public',
     ```
   - Adjust credentials or URL if your environment differs.

After cloning the repository and importing the database: Install Composer dependencies->
Open CMD in the project root:
composer install --no-dev --prefer-dist
(This step generates the vendor/ folder, required for Flarum and PHP
autoloading.)

Create writable folders. Still in CMD:
mkdir public\assets
mkdir storage\cache
mkdir storage\formatter
mkdir storage\logs
mkdir storage\sessions
mkdir storage\tmp
mkdir storage\less
attrib -R storage /S /D
attrib -R public /S /D
php vendor\bin\flarum cache:clear

(This ensures all required directories exist and are writable by PHP/Flarum.)

5. **Launch**
   - Visit: http://localhost/diabetes-community/public

### Notes

- **Email** (verification & notifications) is already configured in the imported DB via the Flarum admin panel. No action needed for local testing.

### (Optional) Administrator access

If you prefer to promote your own freshly registered account:

```sql
UPDATE users SET is_email_confirmed = 1 WHERE email='your_email';
INSERT INTO group_user (user_id, group_id)
SELECT id, 1 FROM users WHERE email='your_email';  -- group_id=1 = Admin
```

### Test Accounts (for Evaluation)

The following test users are included in the exported database and can be used to log in immediately:

- **Username:** smaree08  
  **Password:** smaree08

- **Username:** wardaaaw123  
  **Password:** wardaaaw123

_(These accounts were created exclusively for testing and demonstration purposes.)_
