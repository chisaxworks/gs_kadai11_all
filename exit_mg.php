<?php

// SESSIONスタート
session_start();
// 関数ファイル呼び出し
require_once('funcs.php');
// LOGINチェック
sscheck();

// GETデータ取得
$em_id = $_GET['id'];

// DB接続
$pdo = db_conn();

//データ更新SQL作成
$stmt = $pdo->prepare(
    'UPDATE event_mg_tbl SET undermg_flg = 0, modifiedDate = now() WHERE em_id = :em_id;'
);

$stmt->bindValue(':em_id', $em_id, PDO::PARAM_INT);
$status = $stmt->execute(); //実行

//データ削除処理後
if ($status === false) {
    sql_error($stmt);
}

// 元の画面にリダイレクト
header('Location: main_mg.php');


?>