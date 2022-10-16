# calculator

## 概要
HTMLを用いて書いた電卓GUIです．ブラウザで動きます．
外部公開用にブランチを分けました

## 仕様
`+ - * / ( )` を用いた四則演算を行う

### 制約
- これらの演算子と数字，スペース以外の文字列は入力されないものとする
- 演算子の優先順位は実際の四則演算と同様に，掛け算と割り算が優先され，`()`内の計算が最優先される．
- 入力数は整数のみ（負の数を含む）とする．
- `12(3+4)` のような，`(`横に`*`が省略された記法には対応していない．
- `+-`のような演算子が連続して入力された場合は直前に入力された演算子のみ有効とする．
- また，`)`の数が`(`の数を上回る場合，`)`の入力を許さない．
- 答えが小数になる計算では可能な限り表示する．
- `=`が押されて結果を表示後は任意の入力を行うと計算結果が消去される．

### 例
| 入力        | 出力 |
| ----------- | ---- |
| -2+6/3*(6-4) | 4    |

## 内部仕様
[再帰下降構文解析](https://ja.wikipedia.org/wiki/%E5%86%8D%E5%B8%B0%E4%B8%8B%E9%99%8D%E6%A7%8B%E6%96%87%E8%A7%A3%E6%9E%90)を用いる．

### 拡張BNF
```
expression = ["+"|"-"], term, { ("+"|"-"), term } ;
term       = factor, { ("*"|"/"), factor } ;
factor     = number | "(", expression, ")" ;
```
```math
\prod_{k=2}^{\pi}({}_k C_2 \times 6)
```
![\prod_{k=2}^{\pi}({}_k C_2 \times 6)
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cprod_%7Bk%3D2%7D%5E%7B%5Cpi%7D%28%7B%7D_k+C_2+%5Ctimes+6%29%0A)

## 参考文献
### 再帰下降構文解析
- [JavaScriptでゆるく学ぶ再帰下降構文解析 - Qiita](https://qiita.com/aql/items/84cead7c028f54e089e0#1--2--3--7)
- [基本的な正規表現一覧](https://murashun.jp/article/programming/regular-expression.html)

### javascript
- [ES modules基礎知識 | 第1回 仕様の概要とその周辺課題](https://www.codegrid.net/articles/2017-es-modules-1/)
