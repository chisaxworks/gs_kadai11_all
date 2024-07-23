<!-- 関数まとめPHP -->
<?php
// 関数化したものを格納

// SESSION確認
function sscheck(){
    if(!isset($_SESSION["chk_ssid"]) || $_SESSION["chk_ssid"]!=session_id()){

        $_SESSION["error_msg"] = "ログインしてください";
        header('Location: index.php');
        exit(); //処理を止める ここから下は処理されない

    }else{
        session_regenerate_id(true);
        $_SESSION["chk_ssid"] = session_id();
      
    }
}

// ログアウト用SESSION一括破棄関数
function sslogout() {
    // SESSIONを初期化（空っぽにする）
    $_SESSION = array();

    // Cookieに保存してある"SessionIDの保存期間を過去にして破棄
    if (isset($_COOKIE[session_name()])) { //session_name()は、セッションID名を返す関数
        setcookie(session_name(), '', time()-42000, '/');
    }

    // サーバ側での、セッションIDの破棄
    session_destroy();
}

// DB接続関数
function db_conn(){
    try {
        $pdo = new PDO('mysql:dbname=gs_app_prot1;charset=utf8;host=localhost','root','');
        return $pdo;
    
    } catch (PDOException $e) {
        exit('DBConnectError:'.$e->getMessage());
    
    }
}

// XSS対策（echoする場所で使用）
function h($str){
    return htmlspecialchars($str, ENT_QUOTES, 'UTF-8');
}

// SQLエラー関数
function sql_error($stmt){
    $error = $stmt->errorInfo();
    exit('SQLError:' . print_r($error, true));

}

?>