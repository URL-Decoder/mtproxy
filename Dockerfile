# Используем официальный образ MTProto Proxy
FROM dotcypress/mtproxy

# Порт для прокси
EXPOSE 80

# Запуск прокси с секретным ключом
CMD ["mtproxy", "--seed", "f2083bb79871d126a175a70b3cf2020b"]
