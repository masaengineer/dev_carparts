# サービス概要
**「Parts Sync（仮称）」** は、カーパーツ小売業者向けの売上管理に特化した業務効率化SaaSです。  
商品や販売データを一元管理し、日々の販売管理プロセスを自動化することで、作業効率を向上させます。  
将来的には、蓄積されたデータを活用した分析機能や、他販路への出品＆在庫管理機能を構想しています。



# このサービスへの思い・作りたい理由
開発のきっかけは、国内外に向けて日本車のカーパーツを販売している知人からの相談です。  
事業規模の拡大に伴い、スプレッドシートでの情報管理に限界を感じ、より効率的なシステムへの移行を検討していました。

カーパーツのEC販売に取り組む小規模事業者でも導入しやすく、  
業務効率化と売上向上を実現するソリューションを提供したいと考えています。



# ユーザー層について
- **主要ターゲット**：年商1,000万円〜1億円規模のカーパーツEC事業者  
- **選定理由**：
  - 取扱商品数が1万点以上と多く、効率的な商品管理が必須
  - 既存システムの価格が少なくない負担である
  - 成長過程にあり、システム投資による業務効率化ニーズが高い



# サービスの利用イメージ

### 現状の課題
- 現在、商品代金、各プラットフォームの手数料、国内外の送料、ささげ業務の外注費などが複数のスプレッドシートで分散管理されています。
- このため、データ更新の漏れや整合性の欠如が頻発し、月次や商品ごとの営業利益を集計する際に手作業で情報をまとめる必要があり、月平均で20時間の工数がかかっています。
- これが業務効率を低下させ、迅速な意思決定を妨げています。

### 解決策
- 最適化されたデータベースを導入し、商品代金、手数料、送料、外注費などの情報を一元管理します。
- これにより、データの更新漏れや整合性の欠如を防ぎ、月次の集計作業にかかる工数を大幅に削減します。
- 業務の効率化とともに、より正確な利益データをタイムリーに把握できるようになります。



# ユーザーの獲得について
- **MVPリリース**：複数のテストユーザーによる検証と改善
- **本リリース**：カーパーツ業界のコミュニティを通じたマーケティング、既存ユーザーによる口コミ紹介



# サービスの差別化ポイント
- **業界特化型の機能設計**
  - 複数販路の売上管理に対応（Shopify, eBay, Yahooショッピング, BtoB）
  - 国際取引にまつわる多通貨対応や、各配送オプションへの対応が可能

- **コストパフォーマンス**
  - 初期費用を抑制
  - 段階的な機能追加オプションの提供

- **将来的な拡張性が高い**
  - ユーザーフィードバックを反映した継続的な機能改善
  - API連携による他システムとの統合（Shopify, eBay, Yahooショッピング等に対応）


# 機能候補

### MVPリリース
- ユーザー登録機能
- CRUD処理（商品新規登録、一覧表示、編集、削除）
- 商品検索機能
- ページネーション
- CSV取り込み機能

### 本リリース
- ユーザー権限管理
- 画像登録機能
- インライン編集機能
- 画像ドラッグアンドドロップ並び替え機能



# 機能の実装方針予定
- **CSV取り込み機能**：roo-rb
- **ページネーション**：Kaminari
- **検索機能**：Ransak
- **権限管理**：Pundit
- **画像登録**：Cloudinary
- **インライン編集機能**：Hotwire + Turbo
- **画像ドラッグアンドドロップ機能**：Stimulus
- **テストコード**：SimpleCov


# ER図
[![Image from Gyazo](https://i.gyazo.com/cb29b7e0eeacfdf490f6165d6a19f976.png)](https://gyazo.com/cb29b7e0eeacfdf490f6165d6a19f976)
