<?php
// SESSIONスタート
session_start();
// 関数ファイル呼び出し
require_once('funcs.php');
// LOGINチェック
sscheck();
?>

<?php include("head.php");?>
<?php include("managed.php");?>
<?php include("foot.html");?>