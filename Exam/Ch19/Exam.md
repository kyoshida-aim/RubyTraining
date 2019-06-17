(1) EUC-JPの文字列`str_euc`と、Shift_JISの文字列`str_sjis`を連結して  
UTF-8の文字列を返すメソッド`to_utf8(str_euc, str_sjis)`を作ってください。

(2) Shift_JISで「こんにちは」と書かれたテキストファイルを作り、  
そのファイルを読み込んでUTF-8で出力するスクリプトを作ってみてください。

(3) `str.encode("Shift_JIS")`と`str.encode("Windows-31J")`を実行した時に結果が異なるような、UTF-8の文字列`str`を見つけてください。