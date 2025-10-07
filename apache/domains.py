import shutil
import os, shutil
from shutil import copyfile
import docker

print("Domains update")

folder = 'config/apache'
print('Config filder: ' + folder)
try:
    shutil.rmtree(folder)
except:
    print('[WARNING]: Domains folder not found')
try:
    os.mkdir(folder)
except:
    print('[WARNING]: Domains folder not create')
        
domains = ["kliox-dev.com"]
    

for item in os.listdir('domains'):
    print(item)
    config = 'config/apache/' + item + '.conf'
    file = open(config, 'w')
    
    file.write("<VirtualHost *:80>\n")
    
    # base domain
    file.write("ServerName ")
    file.write(item)
    file.write("\n")
    
    # domains
    file.write("ServerAlias www." + item)
    for domain in domains:
        file.write(" " + item + "." + domain)
        file.write(" www." + item + "." + domain)
    file.write("\n")
    
    file.write("ServerAdmin admin@kliox-dev.com\n")
    
    # folder
    file.write("DocumentRoot /var/www/" + item + "\n")
    
    file.write("ErrorLog ${APACHE_LOG_DIR}/error.log\n")
    file.write("CustomLog ${APACHE_LOG_DIR}/access.log combined\n")
    file.write("</VirtualHost>")
    
    # enable rewrite
    file.write("\n\n")
    file.write("<Directory /var/www/" + item + "/>\n")
    file.write("Options Indexes FollowSymLinks\n")
    file.write("AllowOverride All\n")
    file.write("</Directory>")
    
    file.close()

client = docker.from_env()

php82 = client.containers.get('apache-php82-1')
php82.restart()
