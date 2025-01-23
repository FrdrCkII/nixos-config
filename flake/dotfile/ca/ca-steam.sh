nix-shell -p openssl
openssl genrsa -out cakey.key 2048
openssl req -new -x509 -key cakey.key -out cacert.crt -days 3650
11
11
11
11
11
11
11
openssl genrsa -out steamcommunity.com.key 2048
openssl req -new -key steamcommunity.com.key -out steamcommunity.com.csr
11
11
11
11
11
11
11
1111
11
openssl x509 -req -CA cacert.crt -CAkey cakey.key -CAcreateserial -extfile v3.ext -in steamcommunity.com.csr -out steamcommunity.com.crt -days 3650
