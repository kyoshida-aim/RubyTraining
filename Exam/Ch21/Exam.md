(1) Array#collectのような動作をする`my_collect`メソッドを作成してください。  
引数としてeachメソッドをもつオブジェクトを受け取って、各要素をブロックで処理します。  
次の(??)に当てはまるコードを考えてください。
```
def my_collect(obj, &block)
  (??)
end

ary = my_collect([1, 2, 3, 4, 5]) do |i|
  i * 2
end
p ary #=> [2, 4, 6, 8, 10]
```

(2) 次のSymbol#to_procメソッドを使ったサンプルの結果を確認してください。
```
to_class = :class.to_proc
p to_class.call("test")   #=> ?
p to_class.call(123)      #=> ?
p to_class.call(2 ** 100) #=> ?
```

(3) カウンターの例の応用として、実行するたびにcallメソッドでそれまでに与えられた引数の合計を返すProcオブジェクトを返すメソッドを考えます。  
次の`(??)`に当てはまるコードを考えてください。
```
def accumlator
  total = 0
  Proc.new do
    (??)
  end
end

acc = accumlator
p acc.call(1) #=> 1
p acc.call(2) #=> 3
p acc.call(3) #=> 6
p acc.call(4) #=> 10
```