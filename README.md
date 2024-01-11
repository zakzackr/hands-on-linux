# hands-on-linux
「Linuxのしくみ 増強改訂版 〜実験と図解で学OS、仮想マシン、コンテナの基礎知識〜」をハンズオンで学習する際に、Ubuntu20.24でプログラムを実行することが想定されています。Dockerを使用した仮想環境を構築することで、macOS上でUbuntuを動かし、書籍内のコードを実行できるようにするための手順を説明します。
    
* 書籍のサンプルコード（[linux-in-practice-2nd](https://github.com/satoru-takeuchi/linux-in-practice-2nd.git)）を使用しています。

## 使用技術
- Docker
- Git

これらの知識がなくても下記の手順に従っていくことで、問題なく実行環境を構築することができると思います。

## 手順1
Desktopに移動し、本リモートリポジトリをgit cloneする。本リポジトリのフォルダやファイルがhands-on-linuxフォルダとしてクローンされる。
* 今回の例では、Desktop以下にフォルダを作成していますが、どこでも大丈夫です。
```
cd Desktop
git clone https://github.com/zakzackr/hands-on-linux.git
```

## 手順2
Dockerfileが存在するhands-on-linuxフォルダに移動します。その後、2行目でDockerfileからhands-on-linuxというdocker imageを作成し、3行目でhands-on-linux(docker image)からコンテナを実行しています。
```
cd hands-on-linux
docker image build -t hands-on-linux .
docker run --rm -it hands-on-linux /bin/bash
```

手順2までを実行すると、下記のようにlinux-in-practiceフォルダ内に「Linuxのしくみ」を学習する際に必要なフォルダが表示されます。
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
書籍と同じ結果が得られました。
