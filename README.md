# dotfiles

# генерируем ключи на Rutoken
pkcs11-tool --module /usr/lib/librtpkcs11ecp.so --keypairgen --key-type rsa:2048 -l --id 45

# выгружем публичный SSH ключ в файл, который нужно закинуть на GitHub.com
ssh-keygen -D /usr/lib/librtpkcs11ecp.so -I 0:45 >> key.pub

# в файл ~/.ssh/config добавим поддержку авторизацию на GitHub.com через Rutoken
Host github.com
    HostName github.com
    User git
    IdentitiesOnly yes
    PreferredAuthentications publickey
    PKCS11Provider /usr/lib/librtpkcs11ecp.so

