SET host=%1
SET rootCA=%2
SET opensslPath=%3

mkcert -install
mkcert %1 localhost 127.0.0.1 ::1
openssl pkcs12 -export -out %host%.pfx -inkey %host%+3-key.pem -in %host%+3.pem -certfile %rootCA%
openssl x509 -outform der -in %host%+3.pem -out %host%.crt
openssl x509 -outform der -in  %rootCA% -out %host%-rootCA.crt
