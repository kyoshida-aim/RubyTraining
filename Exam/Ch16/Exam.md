(1) 電子メールのアドレスは`ローカルパート@ドメイン名`という形になっています。  
このような文字列から、ローカルパートを$1として、またドメイン名を＄2として取得する正規表現を作ってください。

(2) `"正規表現は難しい！　なんて難しいんだ！"`という文字列を、`gsub`メソッドを使って  
`"正規表現は簡単だ！　なんて簡単なんだ！"`という文字列に直してください。

(3) アルファベットとハイフンからなる文字列を与えられると、  
ハイフンで区切られた部分をCapitalizeするようなメソッド`word_capitalize`を定義してください
```
p word_capitalize("in-reply-to") #=> "In-Reply-To"
p word_capitalize("X-MAILER")    #=> "X-Mailer"
```