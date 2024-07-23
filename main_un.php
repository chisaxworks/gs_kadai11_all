<?php
/*----- ログイン関連部分 -----*/
// SESSIONスタート
session_start();

// 関数ファイル呼び出し
require_once('funcs.php');

// LOGINチェック
sscheck();

// 登録画面から遷移した人はSESSIONにIdを持っていないためそれを格納する作業
$useremail = $_SESSION["useremail"];
if(!isset($_SESSION["userid"])){

    //PHPからDB接続
    $pdo = db_conn();

    // データ取得SQL（ユーザテーブル）
    $stmt = $pdo->prepare('SELECT user_id FROM user WHERE user_email = :useremail');
    $stmt->bindValue(':useremail', $useremail, PDO::PARAM_STR);
    $status = $stmt->execute();

    // エラーハンドリング
    if($status === false){
    sql_error($stmt);

    } else {
        // 格納！
        $val = $stmt->fetch();
        $_SESSION["userid"] = $val["id"];
    }
}
/*----- ログイン関連部分 -----*/
?>

<?php include("head.php");?>
<?php include("unmanaged.php");?>
<?php include("foot.html");?>