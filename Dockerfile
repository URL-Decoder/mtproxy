# Используем официальный образ для сборки
FROM ekidd/rust-musl-builder as builder
WORKDIR /home/rust/src
ADD . ./
RUN sudo chown -R rust:rust .
RUN cargo build --release

# Минимальный образ для запуска
FROM alpine:latest
COPY --from=builder /home/rust/src/target/x86_64-unknown-linux-musl/release/mtproxy /bin/

# Запуск прокси с секретным ключом
ENTRYPOINT ["mtproxy", "--seed", "f2083bb79871d126a175a70b3cf2020b"]
