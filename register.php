<!-- ユーザ登録FORM -->
<?php
// SESSIONスタート
session_start();

// SESSIONにエラー情報があったら表示する
if(isset($_SESSION["error_msg"])){
    $alert = '<div class="alert">' . $_SESSION['error_msg'] . '</div>';
    unset($_SESSION['error_msg']); // メッセージを表示した後にセッション変数をクリア
}

// 関数ファイル呼び出し
require_once('funcs.php');
// ログアウト処理
sslogout();

?>

<?php include("head_logout.html");?>

<!-- ユーザ登録画面 -->
<div class="logreg_wrap">
    <?= $alert ?>
    <h2>ユーザ登録画面</h2>
    <form action="register_done.php" method="post" class="input_form">
        <div class="input_item">
            <label for="reg_name">名前</label>
            <input type="text" name="reg_name" id="reg_name" class="inputarea">
        </div>
        <div class="input_item">
            <label for="reg_email">メール</label>
            <input type="email" name="reg_email" id="reg_email" class="inputarea">
        </div>
        <div class="input_item">
            <label for="reg_password">パスワード</label>
            <input type="password" name="reg_password" id="reg_password" class="inputarea">
        </div>
        <button type="submit" id="register" class="act_btn">登録</button>
    </form>
    <a href="index.php" class="sub_btn">ログイン画面に戻る</a>
</div>

<?php include("foot.html");?>