#!/bin/bash

rustup target add x86_64-linux-android armv7-linux-androideabi aarch64-linux-android aarch64-apple-ios aarch64-apple-ios-sim x86_64-apple-ios x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu aarch64-apple-darwin x86_64-apple-darwin

# 使用 `&` 让编译任务并行执行
cargo build --target x86_64-linux-android --features sqlcipher-vendored --release &
cargo build --target armv7-linux-androideabi --features sqlcipher-vendored --release &
cargo build --target aarch64-linux-android --features sqlcipher-vendored --release &
cargo build --target aarch64-apple-ios --features sqlcipher --release &
cargo build --target aarch64-apple-ios-sim --features sqlcipher --release &
cargo build --target x86_64-apple-ios --features sqlcipher --release &
cargo build --target x86_64-unknown-linux-gnu --features sqlcipher-vendored --release &
cargo build --target aarch64-unknown-linux-gnu --features sqlcipher-vendored --release &
cargo build --target aarch64-apple-darwin --features sqlcipher --release &
cargo build --target x86_64-apple-darwin --features sqlcipher --release &

# 等待所有后台任务完成
wait