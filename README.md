# README

## pushする前にすること
CIに組み込むの断念しちまった。
webコンテナに入ったあとで下記2つはやろう
```
# rubocop
bundle exec rubocop --auto-correct

# haml-lint
bundle exec haml-lint app/views/
```

## docker構築
```
# コンテナをビルド
$ docker-compose build

# コンテナの作成＆起動（バックグラウンド）
$ docker-compose up -d
```

## dockerコマンド
```
# webコンテナに入る
docker-compose exec web bash
→ このあとでrailsコマンドがうてる

# コンテナに入らずに直接コマンドうつこともできる
docker-compose exec web bin/rails s

# 立ち上がってるコンテナを一覧で見る
なんか困ったらとりあえずwebコンテナが落ちていないか確認
docker-compose ps
```

## 便利系
```
seedデータ作成
bin/rails db:seed_fu

データリセット
bin/rails db:migrate:reset db:seed_fu
```
