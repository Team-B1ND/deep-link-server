FROM rust:1.77 as builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM ubuntu:latest
WORKDIR /app
COPY --from=builder /app/target/release/deep-link-server /app/server
COPY static /app/static
EXPOSE 9090
CMD ["/app/server"]