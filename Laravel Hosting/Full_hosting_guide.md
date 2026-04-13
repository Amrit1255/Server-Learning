# Complete Guide: Hosting a Laravel Website on cPanel
A Beginner-Friendly Step-by-Step Documentation

---

## 1. Introduction

Laravel is a modern PHP framework used to build dynamic websites and web applications.

To make a Laravel project accessible on the internet, we must deploy it on a hosting server and connect it with a domain name.

Most shared hosting providers use cPanel, which provides tools for:

* File management
* Domain management
* Database management
* Email hosting
* SSL certificates

This guide explains how to host a Laravel website on cPanel from start to finish.

---

## 2. Requirements Before Hosting

Before starting deployment, make sure you have the following:

**Domain Name**
Example:
`nepalresult.com`

You can buy a domain from providers like Hostinger.

**Hosting Account**
Your hosting must support:
* PHP ≥ 8.2
* MySQL database
* SSH access (optional but helpful)
* Composer support

Your hosting package may include:
* NVMe storage
* Unlimited bandwidth
* Free SSL
* cPanel access

**Laravel Project Files**
You should have the complete Laravel project including:
* app
* bootstrap
* config
* database
* resources
* routes
* storage
* vendor
* public
* composer.json

**Local Development Tools (Recommended)**
These tools are usually installed on the developer’s computer:
* Composer
* Node.js
* Vite
* MySQL

---

## 3. Connect Domain to Hosting

If your domain is purchased from another provider, update the DNS nameservers.

Example DNS:
* dns1.nestnepal.com
* dns2.nestnepal.com
* dns3.nestnepal.com
* dns4.nestnepal.com

Steps:
1. Login to your domain provider.
2. Go to Domain DNS Settings.
3. Replace nameservers with your hosting DNS.
4. Save changes.

DNS propagation may take 5–30 minutes (sometimes up to 24 hours).

---

## 4. Access cPanel

Open your hosting panel:
`https://yourdomain.com/cpanel`

Login using credentials provided by the hosting provider.

Inside cPanel you will see tools like:
* File Manager
* MySQL Databases
* Domains
* SSL/TLS
* Cron Jobs

---

## 5. Upload Laravel Project

Open:
**cPanel → File Manager**

Create a Folder called:
`laravel`

Upload your Laravel Project ZIP File into that folder:
Then:
**Right Click → Extract**

Your folder should look like:
```text
public_html
   └── laravel
       ├── app
       ├── bootstrap
       ├── config
       ├── database
       ├── public
       ├── resources
       ├── routes
       ├── storage
       ├── vendor
```

---

## 6. Configure the Public Folder

Laravel serves the website from the public directory.
We must redirect the domain to that folder.

**Copy Files**
From:
`laravel/public`

Copy:
`index.php`
`.htaccess`

Paste into:
`public_html`

**Edit index.php**
Open:
`public_html/index.php`

Modify the paths:
```php
require __DIR__.'/laravel/vendor/autoload.php';
$app = require_once __DIR__.'/laravel/bootstrap/app.php';
```

---

## 7. Fix .htaccess

In:
`public_html/.htaccess`

Use:
```apache
<IfModule mod_rewrite.c>
    RewriteEngine On

    RewriteCond %{REQUEST_URI} !^/laravel/public/

    RewriteRule ^(.*)$ laravel/public/$1 [L]
</IfModule>
```
This ensures all requests go to the Laravel router.

---

## 8. Create the Database

Go to:
**cPanel → MySQL Databases**

Create:
**Database**
Example:
`nepalres_nepalresult_db`

**Database User**
Example:
`nepalres_amrit1255`

**Add User to Database (Very Very Important)**
Select:
**User → Database**
Click:
**Add → ALL PRIVILEGES**

---

## 9. Configure Laravel Environment

Inside:
`laravel/.env`

Update Database credential:
Example:
```env
DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=nepalres_nepalresult_db
DB_USERNAME=nepalres_amrit1255
DB_PASSWORD=yourpassword
```

Also update:
```env
APP_ENV=production
APP_DEBUG=false
APP_URL=https://nepalresult.com
```

---

## 10. Install Dependencies (SSH Method)

If SSH is available:
```bash
ssh username@server-ip 
```
(For Username = Servername & Server_IP = Ip Assigned for Server)

Navigate to project:
```bash
cd public_html/laravel
```

Run:
```bash
composer install --no-dev
```

---

## 1. Generate Application Key

Run:
```bash
php artisan key:generate
```
This creates the encryption key for Laravel.

---

## 12. Run Database Migration

To create database tables:
```bash
php artisan migrate
```

---

## 13. Build Frontend Assets

Laravel uses Vite for CSS and JS.
Run locally:
```bash
npm install
npm run build
```

Upload this folder to server:
`laravel/public/build`

Important file:
`manifest.json`

---

## 14. Set File Permissions

Run:
```bash
chmod -R 775 storage
chmod -R 775 bootstrap/cache
```
These folders must be writable.

---

## 15. Clear Laravel Cache

Run:
```bash
php artisan optimize:clear
```

---

## 16. Enable SSL Certificate

In CPanel go to:
**SSL/TSL Status**

Click:
**Run AutoSSL**

Your Website will Now Work On:
`https://yourdomain.com`

---

## 17. Test The Website:

Check, Homepage:
`https://yourdomain.com`

Admin Login:
`https://yourdomain.com/login`

Other Route:
`https://yourdomain.com/register` or any other

---

## 18. Common Problems and Solutions:

**problem 1. Composer Version Error (php version not supported)**
Solution: Change The Php Version (cPanel → Select PHP Version)

**Problem 2. Databae Access Denied (Access denied for user)**
Solutions: Ensure user has All PRIVILEGES On Database.

**Problem 3. 404 on Routes ([domain.com/login](https://domain.com/login))**
solution: fix .htaccess 

**Problem 4. Vite Manifest Error (Vite manifest not found)**
Solution: Upload (laravel/public/build/manifest.json)

---

## 19. Recommended Production Commands.

Run These following Commands after Deployment:
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

---

## 20. Final Laravel Deployment Structure

```text
public_html
   ├── index.php
   ├── .htaccess
   └── laravel
        ├── app
        ├── bootstrap
        ├── config
        ├── database
        ├── public
        ├── resources
        ├── routes
        ├── storage
        └── vendor
```

---

## Conclusion

By following this documentation step-by-step, even a beginner can successfully deploy a Laravel website on cPanel hosting.

Key things to remember:
* Correct folder structure
* Proper database configuration
* Correct .env settings
* Upload Vite build files
* Configure .htaccess

Once completed, your Laravel website will be fully live on the internet.