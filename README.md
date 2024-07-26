# ①課題番号-プロダクト名
- 11-卒業制作プロトタイプ（推し情報管理ツール）
- 現段階は芸人さんの劇場の公演情報のみ扱う形で制作しました（卒業制作時にはテレビなども対応したい）

## ②課題内容（どんな作品か）

- ユーザ登録・ログイン・ログアウト機能（ログアウトは名前をクリックするとログアウトリンクが出ます）
- 推しの登録・削除機能
- 推しに関連する公演情報の一覧を表示（公演日が今日以降のもののみ）
    - 詳細ボタンで詳細も表示
    - 管理するボタンを押すと管理情報のタブに移動し未整理のタブにはでない
    - 管理しないボタンを押すと、未整理情報・管理情報タブ両方とも出ない（復活もできないがDB上は保持）
    - 管理対象にした公演は管理情報画面に表示され、詳細も引き続き表示
    - 管理対象で完了するボタンを押すと、未整理情報・管理情報タブ両方とも出ない（復活もできないは保持）
    - Googleカレンダー登録ボタンを設置
- 公演の詳細画面ではチケット情報も表示（販売終了日が今日以降のもののみ）

- データを取得する機能はv1.1においては未実施

## ③DEMO
- https://chisaxworks.sakura.ne.jp/gs_kadai11_all/

## ④作ったアプリケーション用のIDまたはPasswordがある場合
- アカウントについて
    - 以下のアカウントでログインが可能ですが、推しの登録削除や管理対象外にしたりする場合はアカウントを作成してください（メールアドレスは架空のもので構いません）
- ユーザ１
    - ログインメールアドレス: chisaxworks@gmail.com
    - ログインパスワード: test
    - 画面表示名：倉本 知左子
- ユーザ２
    - ログインメールアドレス: hana@gmail.com ※存在するかもですが架空として利用
    - ログインパスワード: test
    - 画面表示名：山田 花子
 
- 【参考】今回はデータ取得部分は実装していないので、手動でサンプルの公演情報をいくつか登録しています。そのため、推しとして登録してデータが出てくる芸人は以下の通りです。
    - 今回主として登録した芸人：マユリカ（６件以上あるかも）、令和ロマン、ロングコートダディ
    - 上記に付随して、推し登録して情報が出てくる芸人（1〜３件程度）：
        - 佐久間一行／トータルテンボス／NON STYLE／ライス／チョコレートプラネット／霜降り明星／コロコロチキチキペッパーズ／ネルソンズ／ゆにばーす／アイロンヘッド／THIS IS パン／滝音／ニッポンの社長／シカゴ実業／大自然／kento fukaya／シモリュウ／ヒューマン中村／めっちゃ／ザ・パンチ／ダイタク／カラタチ／素敵じゃないか／エバース／ナイチンゲールダンス／シゲカズです／ジェラードン／ケビンス／エルフ／ヒューマン中村／タモンズ／ツートライブ／らぶらいken／黒帯／ダイヤモンド／シシガシラ／チェリー大作戦

## ⑤工夫した点・こだわった点
- 機能面
    - 情報を管理する前の状態（未整理）と、管理対象にした状態で表示を分けました（基本はTODO管理としては管理対象だけ見てれば良い）。管理しない、または、完了で一覧から出てこなくなります。
    - どちらの画面でも推しの名前で絞り込めるようにしました。その際に今誰を選択しているかをわかるようにしました（PHPで判定して、echoするタグにclass名をつけるつけないをする）
    - 未整理の一覧は自分の推しのものだけが出るようにしていますが、推しが追加削除されても連動するようにしています
- UIUX面
    - 公演詳細についてはカード型の方に入りきらないので、右側に表示させるようにしました。モーダルウィンドウだと使いにくいかと思い、表示非表示切り替えにしました。
    - 推しの絞り込みをしている状態で、詳細ボタンを押しても絞り込みが維持されるようにしました（そこがクリアされてしまうのは違和感があるので）
    - チケット情報は先行か一般かの表示部分の色を変えています

## ⑥難しかった点・次回トライしたいこと(又は機能)
- DB
    - 今回正規化も意識して新たにDBを作りましたが、推し情報・公演情報・チケット情報・管理の有無などリレーションも複雑になり、検討が難しかったです
    - 今後テレビなども増やした場合どうDBを保持していくのか大変だろうなと感じています（だから卒制に選んだわけですが）
- SQL
    - DBが複雑になったことにより３つのテーブルのJOINやLEFT JOINなどの考慮が必要になり、その実現がかなり大変でした
    - 特に管理したもの以外を未整理に出す、というところは、管理Tblとは通常のJOINだけでは実現できず、単なるLEFT JOINでもレコードがダブったりしたのでかなり調べました
- 公演詳細画面の表示非表示
    - 公演詳細について右側に出したのですが、その時点の左側の描写を保持しつつ、右側に対象の公演詳細を出すのをどうするのかかなり悩みました
    - 最終的には以下のようにしています
        - 詳細ボタンを押す際に、今絞り込んでいるかどうか（推しのID有無）を見て、有ればGETにその公演IDと推しIDを組み合わせて、描画後の画面でも推しの絞り込みを維持するという仕組みにしました 
        - また詳細をクリックしていない時はjavascriptでGETの値を取得して、公演IDがなければCSSでdisplay:noneに、公演IDがあればdisplay:blockすることで表示非表示を実現しました。

## ⑦質問・疑問・感想、シェアしたいこと等なんでも
- 今後実装していきたいもの
    - データの取得機能（それに伴いデプロイ先をAWSにする）
    - アラート機能
    - 劇場以外のテレビ等の情報も表示する（それに合わせて表示項目の見直しは必要と思われる）
