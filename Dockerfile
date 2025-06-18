FROM rust:1.77 AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM ubuntu:latest
WORKDIR /app
COPY --from=builder /app/target/release/deep-link-server /app/server
COPY .well-known /app/.well-known
EXPOSE 9090
CMD ["/app/server"]