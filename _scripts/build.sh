#!/usr/bin/env bash
set -eux

# 必要な最低限のライブラリ（Homebrew経由）
brew install gcc zlib

# パス設定
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export LDFLAGS="-L$(brew --prefix zlib)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include"

# ビルドディレクトリへ移動（展開済み前提）
cd ~/Python-3.10.7

# 構成・ビルド・インストール（最小構成）
./configure \
    --prefix="$HOME/.local/python-3.10.7" \
    --with-ensurepip=install \
    --enable-optimizations

make -j"$(nproc)"
make install
