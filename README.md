# The-View
  料理投稿サイトです。</br>
  ひとり暮らしの方が投稿しやすいような簡単な料理を共有できます。</br>
 ![Test Image 1](app/assets/images/スクリーンショット 2022-12-16 15.46.42)

# URL
http://18.182.183.4/ </br>
画面右上のゲストログインボタンから、メールアドレスとパスワードを入力せずにログインでき、</br>
料理の投稿ができます。

# 使用技術
- Ruby 2.7.6
- Ruby on Rails 6.1.4
- MySQL  8.0.29
- Nginx
- Puma
- AWS
  - VPC
  - EC2
  - RDS
  - Route53
- Docker/Docker-compose
- RSpec

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
  - システムテスト
