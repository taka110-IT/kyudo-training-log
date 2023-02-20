# 弓道練習記録帳
![title](https://user-images.githubusercontent.com/70277776/218054719-6cbfa706-bbde-42c3-84bb-ec231aea6400.png)

## 概要
弓道練習記録帳は、弓道の練習記録の管理・集計アプリです。<br>
スマートフォンやPCで手軽に練習記録の入力をしたり、過去の練習メモや月間の練習量の確認ができます。<br>

このアプリは的中率は記録せず、今月どれだけ練習したかの「実績」と、月初めに立てた「目標」だけを表示します。<br>
的中率にこだわらず練習量だけに注目する事で、的中率が低い時の練習へのモチベーション低下を防いだり、 的前に立つ前段階の人の基礎練習へのモチベーションを上げる効果が期待できます。<br>
メールアドレスがあれば無料で利用できます。

## URL
```
https://kyudo-training-log.com/
```

## 開発環境
- Ruby 3.1.2
- Ruby on Rails 7.0.4
- Node.js 16.17.0
- PostgreSQL 14.5
- hotwired/stimulus 3.1.0 
- hotwired/turbo-rails 7.1.3

## 開発環境のセットアップ
```
$ git clone https://github.com/taka110-IT/kyudo-training-log.git
$ cd kyudo-training-log
$ bin/setup
```

## 開発環境立ち上げ
```
$ bin/dev
```

## Lintとテスト
### Lint
```
$ rubocop
```

### テスト
```
$ bundle exec rspec
```

## ログイン
```
email: 'user1@user.com'
password: 'Useruser1'
```
