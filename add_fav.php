<?php

// SESSIONスタート
session_start();
// 関数ファイル呼び出し
require_once('funcs.php');
// LOGINチェック
sscheck();

// POSTデータ取得
$ent_name = $_POST["ent_name"];
$ent_type = $_POST["ent_type"];

// SESSIONからuserid取得
$userid = $_SESSION["userid"];

// DB接続
$pdo = db_conn();

// データ登録SQL作成
$stmt = $pdo->prepare('INSERT INTO
    favorite(ent_id, ent_name, ent_type, user_id, createdDate, modifiedDate)
    VALUES(NULL, :ent_name, :ent_type, :user_id, now(), now())');

$stmt->bindValue(':ent_name', $ent_name, PDO::PARAM_STR);
$stmt->bindValue(':ent_type', $ent_type, PDO::PARAM_STR);
$stmt->bindValue(':user_id', $userid, PDO::PARAM_INT);
$status = $stmt->execute();

//データ登録処理後
if($status === false){
  sql_error($stmt);
}

// 元の画面にリダイレクト
header('Location: favorite.php');


?>