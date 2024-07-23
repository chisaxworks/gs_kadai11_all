<!-- ログアウト画面 -->
<?php
// SESSIONスタート
session_start();

// 関数ファイル呼び出し
require_once('funcs.php');
// ログアウト処理
sslogout();
?>

<?php include("head_logout.html");?>

<!-- ログアウト画面 -->
<div class="logreg_wrap">
    <h2>ログアウトしました</h2>
    <a href="index.php" class="sub_btn">ログイン画面に戻る</a>
</div>

<?php include("foot.html");?>