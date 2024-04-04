# 大分市の駐輪場検索アプリ

## 機能
| 駐輪場詳細の表示 | 車種での絞込 |
| ---- | ---- |
| ![駐輪場詳細](https://github.com/shota-nagato/bicycle-parking/assets/131429438/fdf7eaa3-4078-4462-bee5-405d96776d41) | ![車種絞り込み](https://github.com/shota-nagato/bicycle-parking/assets/131429438/011ea556-bec1-4b83-a53b-d763fb3da494)|

| 拡大縮小ボタン | 現在地表示 |
| ---- | ---- |
| ![拡大縮小](https://github.com/shota-nagato/bicycle-parking/assets/131429438/c52cc179-575d-400f-873f-636dfdcf9917) | ![現在地](https://github.com/shota-nagato/bicycle-parking/assets/131429438/fe678b1a-33b5-48f0-8bae-10653296f46c) |

## バージョン
```
Ruby:   3.2.2
Rails:  7.1.2
Nodejs  18.19.0
```

## 使用技術
```
ESBuild
TailwindCSS
Mapbox
```

## 環境構築手順
**1. Git Clone**
```
git clone git@github.com:shota-nagato/bicycle-parking.git
```
**2. ディレクトリ移動**
```
cd bicycle_parking
```

**3. .envファイルを作成**
```
MAPBOX_ACCESS_TOKEN="your access token"
MAPBOX_JAPAN_STYLE="japan style url"
```

**4. setup**
```
make setup
```
