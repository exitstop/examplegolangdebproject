### Описание

Пример проекта собирающий deb пакет и зашивающий версию и номер сборки внутрь программы
- Можно легко настроить для сборки разных deb пакетов из одного репозитория

### Как изменить ник проекта и имя проекта?

```
make change_name_project NAME_PROJECT=customnameproject NICK_NAME_PROJECT=nicknameproject
```

### Как скомпилировать для разных платформ?

```
make build-debian-all-platform
```
- В папке package будут deb пакеты

### Осторожно .gitignore настроен очень жестко

- .gitignore игнорирует все что не указано внем
- Если нужно разрешить много папок используйте команду из корня поректа:

```
find . -type d | cut -c 3- | sed 's/^/!*/' | grep -v ".git"
```
- Не забудьте удалить папки которые не нужны в вашем репозитори например build или package
