<?php
// SESSIONスタートと関数ファイルは親のmain_un.phpで呼び出し済

// DB接続
$pdo = db_conn();

// GETデータ取得
$ent_id = $_GET['entid'];
$event_id = $_GET['edid'];

// SESSIONからuserid取得
$userid = $_SESSION["userid"];

/*----- 推し一覧 -----*/
// SQLでデータ取得
$stmt1 = $pdo->prepare("SELECT ent_id, ent_name FROM favorite WHERE user_id = $userid");
$status1 = $stmt1->execute();

// データ表示
if ($status1==false) {
    sql_error($stmt1);

}else{
    $favCount = 0; // 結果のカウント用変数

    // whileで1件ずつ取得
    while( $f_result = $stmt1->fetch(PDO::FETCH_ASSOC)){
        $favCount++;

        // SQLで取得したent_idとGETで取得したent_idが一致するかで分岐
        if($f_result['ent_id'] == $ent_id){
            $favli .= '<a class="favli_link active_fav" href="main_un.php?entid=' . h($f_result['ent_id']) . '"><li>' . h($f_result['ent_name']) . '</li></a>';
        }else{
            $favli .= '<a class="favli_link" href="main_un.php?entid=' . h($f_result['ent_id']) . '"><li>' . h($f_result['ent_name']) . '</li></a>';
        }

        // 新着一覧の表示で使う値を作成（すべての一覧から推しに登録しているものだけが出るようにするための処理）
        if($favCount == 1){
            $forfilter .= "event_members LIKE '%". h($f_result['ent_name']) ."%'";
        }else{
            $forfilter .= " OR event_members LIKE '%". h($f_result['ent_name']) ."%'";
        }
    
    }

    // 結果が0件だった場合のメッセージ表示
    if($favCount == 0) {
        $favli = '<p class="fav_none">推しの登録がありません</p>';
    }

    // ent_idがない場合（全てが選択されている状態）
    // 1行目は全ての色を青（選択されている状態）にするため、2行目は「.event_detail」の閉じるボタンの遷移先に利用（絞り込み中は絞り込みの表示に戻す）
    if($ent_id == 0){
        $favall = '<a class="favli_link active_fav" href="main_un.php"><li>全て</li></a>';
        $ed_close = '<a href="main_un.php" class="ed_close_btn">×</a>';
    }else{
        $favall = '<a class="favli_link" href="main_un.php"><li>全て</li></a>';
        $ed_close = '<a href="main_un.php?entid=' . h($ent_id) . '" class="ed_close_btn">×</a>';
    }

}

/*----- 新着一覧 -----*/

// SQLでデータ取得（推しのidから推しの名前を取得→後半で文字列部分一致で絞り込むために必要）
$stmt2 = $pdo->prepare("SELECT ent_name FROM favorite WHERE ent_id = :ent_id");
$stmt2->bindValue(':ent_id', $ent_id, PDO::PARAM_INT);
$status2 = $stmt2->execute();

// エラーハンドリング
if($status2 === false){
    sql_error($stmt2);
} else {
    $n_val = $stmt2->fetch();
}

// 絞り込みキー
if($n_val['ent_name']){
    // 推しの名前を部分一致検索する場合はこちら（先ほど取得したent_nameを使用）
    $filter = "event_members LIKE '%" . h($n_val['ent_name']) ."%'";

}else{
    // 部分一致していない時は、登録した推しの名前のものだけ画面に出る（推し一覧を取得する時に格納した値を利用）
    $filter = "(" . $forfilter . ")";
}

// SQLでデータ取得（公演データ：未管理のものだけ/推しの登録がない場合は何も出ない）
$item="";
if($favCount == 0) {
    //推しの登録がない場合
    $item = '表示する公演情報がありません';

}else{
    //推しの登録がある場合
    $stmt3 = $pdo->prepare("SELECT event.event_id, event_name, DATE_FORMAT(event_startDate, '%Y/%m/%d') as event_startDate,
                                DATE_FORMAT(event_startTime, '%H:%i') as event_startTime,
                                DATE_FORMAT(event_openTime,'%H:%i') as event_openTime, event_members, venue_name, venue_pref 
                            FROM event
                            JOIN venue on event.venue_id = venue.venue_id
                            LEFT JOIN(
                                SELECT event_id FROM event_mg_tbl WHERE user_id = $userid GROUP BY event_id
                            ) AS temptbl ON event.event_id = temptbl.event_id
                            WHERE temptbl.event_id IS NULL AND $filter AND event_startDate >= CURDATE()
                            ORDER BY event_startDate");
    $status3 = $stmt3->execute();

    // データ表示
    if ($status3==false) {
        sql_error($stmt3);

    }else{
        $itemCount = 0; // 結果のカウント用変数

        // whileで1件ずつ取得
        while( $n_result = $stmt3->fetch(PDO::FETCH_ASSOC)){
            $itemCount++;

            // 推しで絞り込みしていた場合のためにif文で分岐（絞り込んでいる場合はGETの値を追加）
            $item .= '<div class="item">';
            $item .= '<div class="item_sub"><p class="ename">' . h($n_result['event_name']) . '</p>';
            $item .= '<p><img src="img/venue.png" alt="会場">' . h($n_result['venue_name']) . '</p>';
            $item .= '<p><img src="img/date.png" alt="公演日時">' . h($n_result['event_startDate']) .' '. h($n_result['event_startTime']) . '開演</p>';
            $item .= '<p><img src="img/entertainer.png" alt="出演者">' . h($n_result['event_members']) . '</p></div>';
            if($ent_id){
                $item .= '<div class="mg_btn_wrap"><a class="mgact_btn ed_btn" href="main_un.php?edid=' . h($n_result['event_id']) . '&entid=' . $ent_id . '">詳細</a>';
            }else{
                $item .= '<div class="mg_btn_wrap"><a class="mgact_btn ed_btn" href="main_un.php?edid=' . h($n_result['event_id']) . '">詳細</a>';
            }

            $item .= '<a class="mgact_btn start_mg" href="add_mg.php?id=' . h($n_result['event_id']) . '">管理する</a>';
            $item .= '<a class="mgsub_btn outof_mg" href="outof_mg.php?id=' . h($n_result['event_id']) . '">管理しない</a></div></div>';

        }
        // 結果が0件だった場合のメッセージ表示
        if ($itemCount == 0) {
            $item = '表示する公演情報がありません';
        }
    }
}

// event_idがある場合は以下の処理が走る
if($event_id){

    /*--- 公演詳細 ---*/
    // SQLでデータ取得（公演データ）
    $stmt4 = $pdo->prepare("SELECT event_name, DATE_FORMAT(event_startDate, '%Y/%m/%d') as event_startDate,
                                DATE_FORMAT(event_startTime, '%H:%i') as event_startTime,
                                DATE_FORMAT(event_openTime,'%H:%i') as event_openTime, event_members, venue_name, venue_pref,
                                DATE_FORMAT(event_startDate, '%Y%m%d') as forgoogle_startDate,
                                DATE_FORMAT(event_startTime, '%H%i%s') as forgoogle_startTime
                            FROM event
                            JOIN venue on event.venue_id = venue.venue_id
                            WHERE event_id = :event_id");
    $stmt4->bindValue(':event_id', $event_id, PDO::PARAM_INT);
    $status4 = $stmt4->execute();

    // データ表示
    if ($status4==false) {
        sql_error($stmt4);

    }else{
        $e_result = $stmt4->fetch();

    }


    // 追加：Googleカレンダーボタン
        // 終了時間はまちまちなので仮で1時間にセット
        $forgoogle_endTime =  $e_result['forgoogle_startTime'] + 10000;
        // リンクの設定
        $google_calendar .= '<a target="_blank" href="https://www.google.com/calendar/render?action=TEMPLATE';
        $google_calendar .= '&text=' . h($e_result['event_name']);
        $google_calendar .= '&dates=' . h($e_result['forgoogle_startDate'])  . 'T' . h($e_result['forgoogle_startTime']);
        $google_calendar .= '/' . h($e_result['forgoogle_startDate'])  . 'T' . h($forgoogle_endTime);
        $google_calendar .= '&location='. h($e_result['venue_name']);
        $google_calendar .= '&details=終了時刻は1時間後に仮置きしていますので、劇場の情報をご確認ください';
        $google_calendar .= '" class="google_btn">Googleカレンダーに登録</a>';


    /*--- 販売情報一覧 ---*/
    // SQLでデータ取得（販売データ）
    $stmt5 = $pdo->prepare("SELECT DATE_FORMAT(ti_startDate, '%m/%d') as ti_startDate, DATE_FORMAT(ti_startTime, '%H:%i') as ti_startTime,
                            DATE_FORMAT(ti_endDate, '%m/%d') as ti_endDate, DATE_FORMAT(ti_endTime, '%H:%i') as ti_endTime,
                            agency_name, agency_url, sm_name, ticket_info.sm_id as sm_id
                            FROM ticket_info
                            JOIN ticket_agency on ticket_info.agency_id = ticket_agency.agency_id
                            JOIN sales_methods on ticket_info.sm_id = sales_methods.sm_id
                            WHERE event_id = :event_id AND ti_endDate >= CURDATE()
                            ORDER BY ticket_info.sm_id DESC");
    $stmt5->bindValue(':event_id', $event_id, PDO::PARAM_INT);
    $status5 = $stmt5->execute();

    // データ表示
    $ticket_info="";
    if ($status5==false) {
        sql_error($stmt5);

    }else{
        $apinfoCount = 0; // 結果のカウント用変数

        // whileで1件ずつ取得
        while( $a_result = $stmt5->fetch(PDO::FETCH_ASSOC)){
            $apinfoCount++;

            if($a_result['sm_id'] == 1){
                $ticket_info .= '<div class="ticketinfo_item"><p class="ti_type">' . h($a_result['sm_name']) . '</p>';
            }else{
                $ticket_info .= '<div class="ticketinfo_item"><p class="ti_type_sp">' . h($a_result['sm_name']) . '</p>';
            }
            $ticket_info .= '<a target="_blank" href="' . h($a_result['agency_url']) . '"><p class="ti_agency">' . h($a_result['agency_name']) . '</p></a>';
            $ticket_info .= '<p><span class="ti_stitle">販売開始日時：</span>' . h($a_result['ti_startDate']) .' '. h($a_result['ti_startTime']) . '</p>';
            $ticket_info .= '<p><span class="ti_stitle">販売終了日時：</span>' . h($a_result['ti_endDate']) .' '. h($a_result['ti_endTime']) . '</p></div>';
        }

        // 結果が0件だった場合のメッセージ表示
        if ($apinfoCount == 0) {
            $ticket_info = "<span>表示する販売情報がありません</span>";
        }

    }
}

?>

<div class="tab_wrap">
    <a href="main_un.php" class="tab_item active_tab">未整理情報</a>
    <a href="main_mg.php" class="tab_item">管理情報</a>
</div>
<div class="main_area">
    <div class="filter_area">
        <ul class="filter_favlist">
            <?= $favall ?>
            <?= $favli ?>
        </ul>
        <div class="mg_btn_wrap">
            <a href="favorite.php" class="mgsub_btn">推し管理画面</a>
        </div>
    </div>
    <div class="data_area">
        <?= $item ?>
    </div>
    <div class="event_detail">
        <?= $ed_close ?>
        <h2>公演詳細</h2>
        <div class="detail_item_wrap">
            <div class="detail_item">
                <h3>公演名</h3>
                <p><?= h($e_result['event_name']) ?></p>
            </div>
            <div class="detail_item">
                <h3>会場</h3>
                <p><?= h($e_result['venue_name']) .'('. h($e_result['venue_pref']) .')' ?></p>
            </div>
            <div class="detail_item">
                <h3>公演日</h3>
                <p><?= h($e_result['event_startDate']) ?></p>
            </div>
            <div class="detail_item">
                <h3>開演時間</h3>
                <p><?= h($e_result['event_startTime']) ?></p>
            </div>
            <div class="detail_item">
                <h3>開場時間</h3>
                <p><?= h($e_result['event_openTime']) ?></p>
            </div>
            <div class="detail_item">
                <h3>出演者</h3>
                <p><?= h($e_result['event_members']) ?></p>
            </div>
        </div>
        <?= $google_calendar?>
        <h2>チケット情報</h2>
        <div class="ticketinfo_wrap">
            <?= $ticket_info ?>
        </div>
    </div>
</div>