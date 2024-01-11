# hands-on-linux
Linuxのしくみをハンズオンで学習する際に、macOS上でubuntuを動かすためのDockerfileを作成しました。

## 手順1
ローカルにhands-on-linuxフォルダを作成する。今回の例ではDesktop以下に作成してみます。
```
cd Desktop
mkdir hands-on-linux
```

## 手順2
hands-on-linuxに移動し、本リモートリポジトリをgit cloneする。hands-on-linux以下に本レポジトリのフォルダやファイルがクローンされる。
```
cd hands-on-linux
git clone <<http or SSH>>
```

## 手順3
hands-on-linuxフォルダ内にDockerfileが存在するので、そのまま下記のコマンドを実行してください。
1行目でDockerfileからhands-on-linuxというdocker imageを作成し、2行目でhands-on-linux(docker image)からコンテナを実行しています。
```
docker image build -t hands-on-linux .
docker run --rm -it hands-on-linux /bin/bash
```

手順3までを実行すると、下記のようにlinux-in-practiceフォルダ内に「Linuxのしくみ」を学習する際に必要なフォルダが表示されます。
```
root@d538a7a89928:/linux-in-practice# ls
01-operating-system-overview  02-process-management-1  03-process-scheduler  04-memory-management  05-process-management-2  07-filesystem  08-storage-hierarchy  09-block-layer  10-virtualization  12-cgroups  LICENSE  README.md
```
## 試しにp.6のhello.goを実行してみる
```
cd 01-operating-system-overview
root@d538a7a89928:/linux-in-practice/01-operating-system-overview# go build hello.go
root@d538a7a89928:/linux-in-practice/01-operating-system-overview# ./hello
hello world
```
予想通りhello worldという結果が返されました。
