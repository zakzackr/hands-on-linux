# hands-on-linux
[「Linuxのしくみ 増強改訂版 実験と図解で学OS、仮想マシン、コンテナの基礎知識」](https://www.amazon.co.jp/%EF%BC%BB%E8%A9%A6%E3%81%97%E3%81%A6%E7%90%86%E8%A7%A3%EF%BC%BDLinux%E3%81%AE%E3%81%97%E3%81%8F%E3%81%BF-%E2%80%95%E5%AE%9F%E9%A8%93%E3%81%A8%E5%9B%B3%E8%A7%A3%E3%81%A7%E5%AD%A6%E3%81%B6OS%E3%80%81%E4%BB%AE%E6%83%B3%E3%83%9E%E3%82%B7%E3%83%B3%E3%80%81%E3%82%B3%E3%83%B3%E3%83%86%E3%83%8A%E3%81%AE%E5%9F%BA%E7%A4%8E%E7%9F%A5%E8%AD%98%E3%80%90%E5%A2%97%E8%A3%9C%E6%94%B9%E8%A8%82%E7%89%88%E3%80%91-%E6%AD%A6%E5%86%85-%E8%A6%9A/dp/429713148X)ではサンプルコードを、Ubuntu20.24上で実行することが想定されています。本リポジトリでは、macユーザーが「Linuxのしくみ」をハンズオンで学習するために、Dockerを使用して仮想環境を構築することで、macOS上でUbuntuを動かす方法をまとめています。具体的な手順が以下になります。
    
書籍のサンプルコード（[linux-in-practice-2nd](https://github.com/satoru-takeuchi/linux-in-practice-2nd.git)）を使用しています。
    
## 💻 使用技術
- Docker
- Git

## ① 手順1
Desktopに移動し、本リポジトリをgit cloneする。本リポジトリの内容がhands-on-linuxフォルダとしてクローンされます。
今回の例では、Desktop以下にフォルダを作成していますが、どこでも大丈夫です。
```
cd Desktop
git clone https://github.com/zakzackr/hands-on-linux.git
```

## ② 手順2
hands-on-linuxフォルダに移動します。その後、2行目でDockerfileからhands-on-linuxというdocker imageを作成し、3行目でhands-on-linux(docker image)からコンテナを起動しています。
```
cd hands-on-linux
docker image build -t hands-on-linux .
docker run --rm -it hands-on-linux /bin/bash
```

手順2までを実行すると、下記のようにlinux-in-practiceフォルダ内に「Linuxのしくみ」で提供されているサンプルコードが表示されます。
```
root@8138f14ec0a3:/# cd linux-in-practice 
root@8138f14ec0a3:/linux-in-practice# ls
01-operating-system-overview  02-process-management-1  03-process-scheduler  04-memory-management  05-process-management-2  07-filesystem  08-storage-hierarchy  09-block-layer  10-virtualization  12-cgroups  LICENSE  README.md
```
## 試しにp.6のhello.goを実行してみる
```
root@8138f14ec0a3:/linux-in-practice# cd 01-operating-system-overview
root@8138f14ec0a3:/linux-in-practice/01-operating-system-overview# go build hello.go
root@8138f14ec0a3:/linux-in-practice/01-operating-system-overview# ./hello
hello world
root@8138f14ec0a3:/linux-in-practice/01-operating-system-overview# strace -o hello.log ./hello
hello world
root@8138f14ec0a3:/linux-in-practice/01-operating-system-overview# cat hello.log
...
write(1, "hello world\n", 12)           = 12
...
```
## 結果
書籍と同じ結果が得られました。
