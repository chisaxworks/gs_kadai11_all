<!-- ログインFORM -->
<?php
// SESSIONスタート
session_start();

// 関数ファイル呼び出し
require_once('funcs.php');

// SESSIONにエラー情報があったら表示する
if(isset($_SESSION["error_msg"])){
    $alert = '<div class="alert">' . $_SESSION['error_msg'] . '</div>';
    unset($_SESSION['error_msg']); // メッセージを表示した後にセッション変数をクリア
}

// LOGINチェック(index専用：SESSION残ってたらmainに移動する)
if(isset($_SESSION["chk_ssid"]) && $_SESSION["chk_ssid"] = session_id()){

    // セッションID払出しし直し
    session_regenerate_id(true);
    $_SESSION["chk_ssid"] = session_id();

    // メインに移動
    header('Location: main_un.php');
}

?>

<?php include("head_logout.html");?>

<!-- ログイン画面 -->
<div class="logreg_wrap">
    <?= $alert ?>
    <h2>ログイン画面</h2>
    <form action="login_done.php" method="post" class="input_form">
        <div class="input_item">
            <label for="email">メール</label>
            <input type="email" name="email" id="email" class="inputarea">
        </div>
        <div class="input_item">
            <label for="password">パスワード</label>
            <input type="password" name="password" id="password" class="inputarea">
        </div>
        <button type="submit" id="login" class="act_btn">ログイン</button>
    </form>
    <a href="register.php" class="sub_btn">ユーザ登録はこちら</a>
</div>

<?php include("foot.html");?>