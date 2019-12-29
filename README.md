# README
## 資料
- [飲食店業務分析](https://docs.google.com/spreadsheets/d/1drwHjFpCz4v_QBm2E8EMtBPyGcoLa3TvToBDG1mU7mk/edit#gid=0)  
- [要件定義](https://docs.google.com/spreadsheets/d/1ETEMSWruTbVzw9RAzRiKCvJlLDkJDSyNP-cF4G65pDM/edit#gid=640974096)


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
