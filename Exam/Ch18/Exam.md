(1) 変数`$:`にはRubyが利用するライブラリが置かれているディレクトリの名前が、配列の形で格納されています。  
この変数を使って、Rubyが利用できるライブライのファイル名の順に出力するメソッド`print_libraries`を定義してください。

(2) Unix のduコマンドのように、ファイルとディレクトリに保存されているデータの大きさを、  
再帰的に掘り下げて調べ、表示するメソッド`du`を定義してください。  
このメソッドは引数をひとつだけとります。
```
du(調べるディレクトリ名)
```
指定されたディレクトリにあるファイルの大きさ(バイト数)とディレクトリの大きさを表示します。  
ディレクトリの起きさは、そのディレクトリの下にあるファイルの大きさの合計とします。  