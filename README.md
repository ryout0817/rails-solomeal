# ひとり飯
  料理投稿サイトです。</br>
  ひとり暮らしの方が投稿しやすいような簡単な料理を共有できます。</br>
 ![スクリーンショット 2022-12-16 15 46 42](https://user-images.githubusercontent.com/106238399/208042801-34d7370a-c0a0-4838-874d-451c1f8f9278.jpg)

 ![スクリーンショット 2022-12-16 16 13 41](https://user-images.githubusercontent.com/106238399/208043995-422e659f-fad8-406d-a97b-2165e0164e5f.jpg)

# URL
https://www.hitori-meshi-app.net/ </br>
画面右上のゲストログインボタンから、メールアドレスとパスワードを入力せずにログインでき、</br>
料理の投稿ができます。

# 使用技術
- Ruby 2.7.6
- Ruby on Rails 6.1.4
- MySQL  8.0.29
- Nginx
- Puma
- Unicorn
- AWS
  - VPC
  - EC2
  - RDS
  - Route53
  - AWS Certificate Manager (ACM)
- Docker/Docker-compose
- RSpec

# ER図

<img src="https://user-images.githubusercontent.com/106238399/208600741-27b5222c-7752-4861-9a0e-8349205fa1e4.jpg" width="80%">

# AWS構成図

<img src="https://user-images.githubusercontent.com/106238399/208605623-18b11565-fc47-4772-8fb7-599c0243316f.jpg" width="80%">

# 機能一覧
- ユーザー登録、ログイン機能、ゲストログイン機能(devise)
- 投稿機能
  - 画像投稿(carrierwave)
- いいね機能
  - ランキング機能
- ページネーション機能(kaminari)
- レシピ名、メインの材料によるキーワード検索機能(ransack)

# テスト
- RSpec
  - モデルテスト
  - システムテスト
