## **EngineScript - An Automated High-Performance WordPress Server**

EngineScript automates the process of building a high-performance LEMP server. We've specifically built EngineScript with WordPress users in mind, so the install process will take you from a bare server all the way to a working WordPress installation with Nginx FastCGI cache enabled in about 30 minutes.

EngineScript is meant to be run as root user on a fresh VPS. Initial setup will remove existing Apache, Nginx, PHP, and MySQL installations, so be careful.

As this is a pre-release version.

#### Features

#### Requirements
- **A Newly Created VPS** *([Digital Ocean](https://m.do.co/c/e57cc8492285) droplet recommended)*
- **Ubuntu 22.04**
- **64-Bit OS**
- **Minimum 1GB RAM** *(2GB+ recommended)*
- **Cloudflare** *(free or paid)*
- **30 minutes of your time**

### Install EngineScript
#### Step 1 - Initial Install
Run the following command
```shell
wget https://raw.githubusercontent.com/EngineScript/EngineScript/master/setup.sh && bash setup.sh
```

#### Step 2 - Edit Options File
After the initial setup script has run, you'll need to alter the install options file before continuing.

Edit the following file: **/home/EngineScript/enginescript-install-options.txt**.

Download the file via FTP and edit it using your favorite text editor. You may also edit the file directly from the console using the following command:
```shell
nano /home/EngineScript/enginescript-install-options.txt
```

Retrieve  your Cloudflare Global API Key at https://dash.cloudflare.com/profile/api-tokens


#### Step 3 - Main Install Process
Once you've filled out the enginescript-install-options.txt file with your personal settings, run the following command to continue with the installation process:
```shell
bash /usr/local/bin/enginescript/enginescript-install.sh
```

----------

#### Domain Creation
After EngineScript is fully installed, type `es.menu` in console to bring up the EngineScript menu. Choose option **1** to create a new domain.

Domain creation is almost entirely automated, requiring you to only enter the domain name you wish to create. During this automated process, we'll create a unique Nginx vhost file, create new MySQL database, request a new SSL certificate from Cloudflare, download WordPress, install and activate plugins, and assign the applicable data to your wp-config.php.

Before your site is ready to use, you'll need to go into Cloudflare to configure a number of important settings. Follow the steps below to finalize your installation:

##### Go to the Cloudflare Dashboard
1. Select your site.
2. Click on the SSL/TLS tab.

##### Click on the Overview section
1. Set the SSL mode to Full (Strict).

##### Click on the Edge Certificates section
1. Set Always Use HTTPS to Off. *(Important: This can cause redirect loops)*
2. Enable HSTS. *(Optional)* We recommend enabling HSTS. However, turning off HSTS will make your site unreachable until the Max-Age time expires. This is a setting you want to set once and leave on forever.
3. Set Minimum TLS Version to TLS 1.3.
4. Enable Opportunistic Encryption.
5. Enable TLS 1.3.
6. Enable Automatic HTTPS Rewrites

##### Click on the Origin Server section
1. Set Authenticated Origin Pulls to On.

##### Click on the Network tab
1. Enable HTTP/2.
2. Enable HTTP/3 (with QUIC). *(Optional)*
3. Enable 0-RTT Connection Resumption. *(Optional)*
4. Enable IPv6 Compatibility. *(Optional)*
5. Enable gRPC. *(Optional)*
6. Enable WebSockets. *(Optional)*
7. Enable Onion Routing. *(Optional)*
8. Set Pseudo IPv4 to Add Header. *(Optional)*
9. Enable IP Geolocation. *(Optional)*

### EngineScript Information
#### EngineScript Location Reference
|Location        |Usage                          |
|----------------|-------------------------------|
|**/etc/mysql**                  |MySQL (MariaDB) config |
|**/etc/nginx**                  |Nginx config |
|**/etc/php**                    |PHP config |
|**/etc/redis**                  |Redis config |
|**/home/EngineScript**          |EngineScript user directories |
|**/usr/local/bin/enginescript** |EngineScript source |
|**/var/lib/mysql**              |MySQL database |
|**/var/log**                    |Server logs |
|**/var/www/admin/enginescript** |Tools that may be accessed via your server's IP address |
|**/var/www/sites/*yourdomain.com*/html**|Root directory for your WordPress installation |
|                                |                |

#### EngineScript Commands
|Command            |Function                       |
|-------------------|-------------------------------|
|**`es.cache`**     |Clear FastCGI Cache, OpCache, and Redis *(server-wide)* |
|**`es.optimize`**  |Losslessly compress all images in the WordPress /uploads directory *(server-wide)* |
|**`es.menu`**	    |EngineScript menu |
|**`es.restart`**   |Restart Nginx and PHP |
|**`es.update`**    |Update EngineScript |
|                   |                                |

### Support EngineScript
Need a VPS? EngineScript recommends [Digital Ocean](https://m.do.co/c/e57cc8492285)

----------
