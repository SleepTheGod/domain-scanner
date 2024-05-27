#!/bin/bash

# Function to resolve IP address from domain name
resolve_domain() {
    domain="$1"
    ip=$(dig +short "$domain" | grep -E "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n 1)
    echo "$ip"
}

# Function to process subdomains in parallel
process_subdomains() {
    url="$1"
    subdomain="$2"
    host="$subdomain.$url"
    ip=$(resolve_domain "$host")
    if [ -n "$ip" ]; then
        echo "Callback: $host | $ip"
    fi
}

subdomains=("dc" "api" "irc" "irix" "fileserver" "backup" "agent" "c2c" "login" "mssql" "mysql" "localhost" "nameserver" "netstats" "mobile" "mobil"  "ftp" "webadmin" "uploads" "transfer" "tmp" "support" "smtp0#" "smtp#" "smtp" "sms" "shopping" "sandbox" "proxy" "manager" "cpanel" "webmail" "forum" "driect- connect" "vb" "forums" "pop#" "pop" "home" "direct" "mail" "access" "admin" "oracle" "monitor" "administrator" "email" "downloads" "ssh" "webmin" "paralel" "parallels" "www0" "www" "www1" "www2" "www3" "www4" "www5" "autoconfig.admin" "autoconfig" "autodiscover.admin" "autodiscover" "sip" "msoid" "lyncdiscover")

echo -e "\033[36m" # Cyan color
echo "
   Created By Taylor Christian Newsome
   Type 'search' to begin
"

# Command line options
if [[ "$1" == "-h" || "$1" == "--h" ]]; then
    echo "Usage: domain <domain_name>"
    exit 0
fi

if [ "$1" == "search" ]; then
    read -p "$(echo -e '\033[36mEnter The Domain Name:\033[35m')" url

    # Max number of parallel processes
    MAX_PARALLEL=10

    # Counter for parallel processes
    parallel_count=0

    for subdomain in "${subdomains[@]}"; do
        # Execute process_subdomains function in background
        process_subdomains "$url" "$subdomain" &
        ((parallel_count++))

        # Wait for parallel processes to reach maximum limit
        if [ $parallel_count -ge $MAX_PARALLEL ]; then
            wait
            parallel_count=0
        fi
    done

    # Wait for remaining background processes to finish
    wait
fi
