<?php

// SESSIONスタート
session_start();
// 関数ファイル呼び出し
require_once('funcs.php');
// LOGINチェック
sscheck();

// GETデータ取得
$event_id = $_GET['id'];

// SESSIONからuserid取得
$userid = $_SESSION["userid"];

// DB接続
$pdo = db_conn();

// データ登録SQL作成（管理外として登録）
$stmt = $pdo->prepare('INSERT INTO
        event_mg_tbl(em_id, event_id, user_id, undermg_flg, createdDate, modifiedDate)
        VALUES(NULL, :event_id, :user_id, 0, now(), now())');

$stmt->bindValue(':event_id', $event_id, PDO::PARAM_INT);
$stmt->bindValue(':user_id', $userid, PDO::PARAM_INT);
$status = $stmt->execute();

//データ登録処理後
if($status === false){
  sql_error($stmt);
}

// manage.phpにリダイレクト
header('Location: main_un.php');

?>