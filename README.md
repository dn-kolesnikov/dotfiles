# dotfiles

# генерируем ключи на Rutoken
```
pkcs11-tool --module /usr/lib/librtpkcs11ecp.so --keypairgen --key-type rsa:2048 -l --id 45
```

# выгружем публичный SSH ключ в файл, который нужно закинуть на GitHub.com
```
ssh-keygen -D /usr/lib/librtpkcs11ecp.so -I 0:45 >> key.pub
```

# в файл ~/.ssh/config добавим поддержку авторизацию на GitHub.com через Rutoken
```
Host github.com
    HostName github.com
    User git
    IdentitiesOnly yes
    PreferredAuthentications publickey
    PKCS11Provider /usr/lib/librtpkcs11ecp.so
```

# Настройка плагина для VIM - YouCompleteMe

настройка этого плагина должна быть такой, после того, как его установили через vim-plug
по умолчению это каталог ~/.vim/pluged/YouCompleteMe

```cd ~/.vim/pluged/YouCompleteMe```

## 1. создаем виртуальное окружение для python
```python3 -m venv venv```

## 2. активируем это окружение
source venv/bin/activate

## 3. делаем сборку
```python3 ./install.py --clang-completer```

без виртуального окружения, может ничего не заработать!!!
