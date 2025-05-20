#Set static IP. Change ip,subnet,gateway and DNS server to preferred settings.
netsh interface ip set address name="Wi-Fi" static 
netsh interface ipv4 set dnsservers "Wi-Fi" static 8.8.8.8 primary
