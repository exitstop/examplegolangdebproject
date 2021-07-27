# Описание

Пример проекта собирающий deb пакет и зашивающий версию и номер сборки внутрь программы
- Можно легко настроить для сборки разных deb пакетов из одного репозитория

# Как изменить ник проекта и имя проекта?

```
make change_name_project NAME_PROJECT=customnameproject NICK_NAME_PROJECT=nicknameproject
```

# Как скомпилировать для разных платформ?

```
make build-debian-all-platform
```
