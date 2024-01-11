# ubuntu:20.04 
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージ
RUN apt-get update && apt-get install -y \
    binutils \
    build-essential \
    golang \
    sysstat \
    python3-matplotlib \
    python3-pil \
    fonts-takao \
    fio \
    qemu-kvm \
    virt-manager \
    libvirt-clients \
    virtinst \
    jq \
    docker.io \
    containerd \
    libvirt-daemon-system

## 動作確認に利用するコマンド
RUN apt-get install -y strace \
    psmisc

## ユーザ設定
RUN adduser `id -un` libvirt
RUN adduser `id -un` libvirt-qemu
RUN adduser `id -un` kvm

## ファイルのコピー
COPY linux-in-practice /linux-in-practice