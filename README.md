# alpine-postfix


Postfix docker container based on Alpine Linux (from Mailu/postfix). 
** Tested against smtp.com and AWS SES Service. I can't ensure if will work out of the box for another MX providers **

# Customized for using as relay with smtp.com email service

This image is designed to work with smtp.com provider but you can set it up with whatever you like, it was tested against sendgrid and aws ses (you will have to modify some settings but it can work as well)

The **docker-compose.yaml** file uses environment variables, so it's up to you to export them via external .env file or something else. If you like to put your environment vars in your compose file you are free to do that but I do not recommend this, you don't want to expose sensitive data in your repo.

# Postfix configuration files

Located in **conf** directory, there is a main.cf custom file with the following settings:

* DOMAIN: for setting up mydomain value
* HOSTNAME: for setting up hostname value
* MESSAGE_SIZE_LIMIT: message_size_limit setting
* RELAYNETS: List of allowed networks (mynetworks postfix setting)
* RELAYHOST: the realy host which should be receiving emails (in my case smtp.com, it can be aws, google etc)
* TLS: smtp_use_tls setting
* SASL_AUTH: smtp_sasl_auth_enable setting

I made this config because I only needed to modify those settings, you can customize this as much as you like


# Auth file
Under conf folder there is a **sasl_passwd.map** file (example). Here you can add your user/password to authenticate into your remote MX. The postmap command automatically runs on the Docker image so there is no need to mess around with it.
