// ユーザ名ボタンtoggle
$('.userinfo').click(function () {

    if($('.userinfo').hasClass('active')){
        $('.userinfo_wrap').slideUp(300);
        $('.userinfo').removeClass('active');
    }else{
        $('.userinfo_wrap').slideDown(300);
        $('.userinfo').addClass('active');
    };

});

// GET情報取得
let url = new URL(window.location.href);
let params = url.searchParams;
let edid = params.get('edid');
console.log(edid);

if(edid == null){
    $('.event_detail').css('display', 'none');
    $('.data_area').css('width', '80%');
}else{
    $('.event_detail').css('display', 'block');
    $('.event_detail').css('width', '20%');
    $('.data_area').css('width', '60%');
}


/*----------- アラート系 ----------*/

// ログアウト時アラート
$(".logout_btn").on("click", function () {

    if(!confirm("ログアウトしてもよろしいですか？")){
        return false;
    }
});

// 推し削除時アラート
$(".delete_btn").on("click", function () {

    if(!confirm("削除してもよろしいですか？")){
        return false;
    }
});

// 推し登録時アラート
$("#submit_add_fav").on("click", function(){
    if ($("#ent_name").val() === "") {
        alert("名前を入力してください");
        return false;
    }else if($("#ent_type").val() === ""){
        alert("職種を選んでください");
        return false;
    }
});

// 管理開始時アラート
$(".start_mg").on("click", function () {
    if(!confirm("管理対象にしてよろしいですか？")){
        return false;
    }
});

// 管理対象外アラート
$(".outof_mg").on("click", function () {
    if(!confirm("【注】以降管理することができなくなります。よろしいですか？")){
        return false;
    }
});


// 管理終了時アラート
$(".exit_mg").on("click", function () {

    if(!confirm("管理対象から外してもよろしいですか？")){
        return false;
    }
});

/*--- ユーザ管理周り ---*/
// ログインボタンクリック時アラート
$("#login").on("click", function(){
    if ($("#email").val() === "") {
        alert("メールを入力してください");
        return false;
    }else if($("#password").val() === ""){
        alert("パスワードを入力してください");
        return false;
    }
});

// ユーザ登録ボタンクリック時アラート
$("#register").on("click", function(){
    if ($("#reg_name").val() === "") {
        alert("名前を入力してください");
        return false;
    }else if($("#reg_email").val() === ""){
        alert("メールを入力してください");
        return false;
    }else if($("#reg_password").val() === ""){
        alert("パスワードを入力してください");
        return false;
    }
});