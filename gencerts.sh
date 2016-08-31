# 


#!/bin/bash

for DOMAIN in *; do
    if [ -d "${DOMAIN}" ]; then
    	echo "INFO Generating KEY, CSR and CRT for ${DOMAIN}"
    	echo "###"
    	echo "INFO Generating private key for ${DOMAIN}: ${DOMAIN}.key"
    	openssl genrsa -out ${DOMAIN}/${DOMAIN}.key 2048
    	echo "INFO Generating CSR for ${DOMAIN}: ${DOMAIN}.csr"
		openssl req -new -sha256 -key ${DOMAIN}/${DOMAIN}.key -out ${DOMAIN}/${DOMAIN}.csr
    	echo "INFO Generating SSL for ${DOMAIN}: ${DOMAIN}.crt"
        openssl x509 -signkey ${DOMAIN}/${DOMAIN}.key -in ${DOMAIN}/${DOMAIN}.csr -req -days 365 -out ${DOMAIN}/${DOMAIN}.crt
        echo -e "\n"
        echo "INFO Gerenated files for ${DOMAIN}"
        ls -lrt ${DOMAIN}
	fi
done
