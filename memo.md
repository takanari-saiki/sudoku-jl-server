## aws
download zip file from github using curl command
```
$ curl -L -O https://github.com/takanari-saiki/sudoku-jl-server/archive/master.zip
-L : follow redirects
$ unzip master.zip
creating: sudoku-jl-server-master
```

start server
```
ブラウザでec2にアクセスするとうまくコピーペーストできない。
対処としては、コマンドは手でうち、文字列の部分だけ、コピーペーストする。
$ nohup julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); Pkg.precompile(); include("server.jl")' &
```

stop server
```
ポートの確認
$ lsof -i -P
プロセスの確認
$ ps aux | grep julia
$ kill <process id>
```
