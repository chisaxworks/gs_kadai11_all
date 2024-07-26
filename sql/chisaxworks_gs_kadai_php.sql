-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql635.db.sakura.ne.jp
-- 生成日時: 2024 年 7 月 26 日 10:02
-- サーバのバージョン： 5.7.40-log
-- PHP のバージョン: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `chisaxworks_gs_kadai_php`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `event`
--

CREATE TABLE `event` (
  `event_id` int(12) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `venue_id` int(12) NOT NULL,
  `event_startDate` date NOT NULL,
  `event_startTime` time NOT NULL,
  `event_openTime` time NOT NULL,
  `event_members` varchar(500) NOT NULL,
  `event_source` varchar(30) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `event`
--

INSERT INTO `event` (`event_id`, `event_name`, `venue_id`, `event_startDate`, `event_startTime`, `event_openTime`, `event_members`, `event_source`, `isActive`, `createdDate`, `modifiedDate`) VALUES
(1, 'ロングコートダディ堂前企画 ネコちゃんの高いとこ登り', 1, '2024-08-16', '19:30:00', '19:00:00', 'ロングコートダディ／MC:スーズ 高見／ヒューマン中村／タモンズ／ツートライブ／らぶらいken(らぶおじさん、今井らいぱち、kentofukaya)／他', 'FANY', 1, '2024-07-21 17:59:12', '2024-07-21 17:59:12'),
(2, '滝音×マユリカの「夢夢夢らいぶ」', 1, '2024-08-28', '19:30:00', '19:00:00', '滝音／マユリカ／ゲスト:ザ・パンチ', 'FANY', 1, '2024-07-21 18:07:24', '2024-07-21 18:07:24'),
(3, '令和ロマンのR2D2', 1, '2024-09-08', '19:00:00', '18:30:00', '令和ロマン', 'FANY', 1, '2024-07-22 17:13:14', '2024-07-22 17:13:14'),
(4, 'まんざい道', 2, '2024-08-04', '20:00:00', '19:40:00', 'ダイタク／ゆにばーす／カラタチ／令和ロマン／素敵じゃないか／エバース／ナイチンゲールダンス／他', 'FANY', 1, '2024-07-22 17:14:57', '2024-07-22 17:14:57'),
(5, 'シシガシラ×ダイヤモンド×黒帯×チェリー大作戦『漫才至上主義』', 2, '2024-08-17', '18:00:00', '17:40:00', 'シシガシラ／ダイヤモンド／黒帯／チェリー大作戦／ゲスト:シンクロニシティ', 'FANY', 1, '2024-07-22 17:16:15', '2024-07-22 17:16:15'),
(6, 'シゲカズですpresentsクセツアーさらにさらにルミネザ～神豪華全組ネタと大阪名物神クセ企画の日～', 1, '2024-08-13', '19:30:00', '19:00:00', 'シゲカズです／ジェラードン(アタック西本・かみちぃ)／ロングコートダディ／マユリカ／ケビンス／エルフ', 'FANY', 1, '2024-07-22 17:19:28', '2024-07-22 17:19:28'),
(7, 'ルミネtheよしもと 平日14時の部 プラス', 1, '2024-09-27', '14:00:00', '13:30:00', '佐久間一行／トータルテンボス／NON STYLE／ライス／チョコレートプラネット／霜降り明星／コロコロチキチキペッパーズ／マユリカ／他', 'FANY', 1, '2024-07-24 17:37:47', '2024-07-24 17:37:47'),
(8, 'ルミネtheよしもと 平日16時の部 プラス', 1, '2024-09-27', '16:00:00', '15:30:00', '佐久間一行／トータルテンボス／NON STYLE／ライス／チョコレートプラネット／霜降り明星／コロコロチキチキペッパーズ／マユリカ／他', 'FANY', 1, '2024-07-24 17:38:10', '2024-07-24 17:38:10'),
(9, '濁', 2, '2024-08-29', '21:00:00', '20:40:00', 'ニッポンの社長／ロングコートダディ／シカゴ実業／大自然／マユリカ／kento fukaya／シモリュウ／ヒューマン中村／めっちゃ', 'FANY', 1, '2024-07-24 17:43:12', '2024-07-24 17:43:12'),
(10, ' ヨシモト∞ホール特別公演「ワラムゲ!SP」', 2, '2024-09-23', '15:00:00', '14:40:00', 'マユリカ／ネルソンズ／ゆにばーす／アイロンヘッド／THIS IS パン／他', 'FANY', 1, '2024-07-24 17:45:27', '2024-07-24 17:45:27'),
(11, '過去公演', 2, '2024-07-10', '19:00:00', '18:00:00', 'ロングコートダディ／マユリカ／令和ロマン', 'FANY', 1, '2024-07-25 19:51:05', '2024-07-25 19:51:05');

-- --------------------------------------------------------

--
-- テーブルの構造 `event_mg_tbl`
--

CREATE TABLE `event_mg_tbl` (
  `em_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `undermg_flg` int(11) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `event_mg_tbl`
--

INSERT INTO `event_mg_tbl` (`em_id`, `event_id`, `user_id`, `undermg_flg`, `createdDate`, `modifiedDate`) VALUES
(1, 1, 1, 1, '2024-07-22 18:00:02', '2024-07-22 18:00:02'),
(2, 6, 1, 1, '2024-07-22 18:09:07', '2024-07-22 19:06:31'),
(3, 4, 3, 0, '2024-07-22 19:04:25', '2024-07-22 22:26:32'),
(4, 6, 2, 0, '2024-07-22 18:09:07', '2024-07-22 22:28:08'),
(9, 3, 2, 1, '2024-07-22 22:28:12', '2024-07-22 22:28:12');

-- --------------------------------------------------------

--
-- テーブルの構造 `favorite`
--

CREATE TABLE `favorite` (
  `ent_id` int(12) NOT NULL,
  `ent_name` varchar(255) NOT NULL,
  `ent_type` varchar(30) NOT NULL,
  `user_id` int(12) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `favorite`
--

INSERT INTO `favorite` (`ent_id`, `ent_name`, `ent_type`, `user_id`, `createdDate`, `modifiedDate`) VALUES
(2, 'マユリカ', '芸人', 1, '2024-07-21 17:54:10', '2024-07-21 17:54:10'),
(3, '令和ロマン', '芸人', 2, '2024-07-21 22:24:39', '2024-07-21 22:24:39'),
(4, 'かまいたち', '芸人', 2, '2024-07-22 11:13:05', '2024-07-22 11:13:05'),
(5, '黒帯', '芸人', 3, '2024-07-22 11:14:08', '2024-07-22 11:14:08'),
(7, 'ロングコートダディ', '芸人', 1, '2024-07-22 15:10:18', '2024-07-22 15:10:18'),
(9, '令和ロマン', '芸人', 1, '2024-07-23 16:03:36', '2024-07-23 16:03:36');

-- --------------------------------------------------------

--
-- テーブルの構造 `sales_methods`
--

CREATE TABLE `sales_methods` (
  `sm_id` int(12) NOT NULL,
  `sm_name` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `sales_methods`
--

INSERT INTO `sales_methods` (`sm_id`, `sm_name`, `createdDate`, `modifiedDate`) VALUES
(1, '一般販売', '2024-07-23 22:40:07', '2024-07-23 22:40:07'),
(2, '先行販売', '2024-07-23 22:40:17', '2024-07-23 22:40:17');

-- --------------------------------------------------------

--
-- テーブルの構造 `ticket_agency`
--

CREATE TABLE `ticket_agency` (
  `agency_id` int(12) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `agency_url` varchar(2100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `ticket_agency`
--

INSERT INTO `ticket_agency` (`agency_id`, `agency_name`, `agency_url`, `createdDate`, `modifiedDate`) VALUES
(1, 'FANYチケット', 'https://yoshimoto.funity.jp/', '2024-07-23 10:19:37', '2024-07-23 10:19:37');

-- --------------------------------------------------------

--
-- テーブルの構造 `ticket_info`
--

CREATE TABLE `ticket_info` (
  `ti_id` int(12) NOT NULL,
  `event_id` int(12) NOT NULL,
  `sm_id` int(12) NOT NULL,
  `agency_id` int(12) NOT NULL,
  `ti_startDate` date NOT NULL,
  `ti_startTime` time NOT NULL,
  `ti_endDate` date NOT NULL,
  `ti_endTime` time NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `ticket_info`
--

INSERT INTO `ticket_info` (`ti_id`, `event_id`, `sm_id`, `agency_id`, `ti_startDate`, `ti_startTime`, `ti_endDate`, `ti_endTime`, `createdDate`, `modifiedDate`) VALUES
(1, 1, 1, 1, '2024-07-18', '10:00:00', '2024-08-16', '17:30:00', '2024-07-23 10:22:26', '2024-07-23 10:22:26'),
(2, 3, 1, 1, '2024-08-09', '10:00:00', '2024-09-08', '17:00:00', '2024-07-23 10:27:26', '2024-07-23 10:27:26'),
(3, 3, 2, 1, '2024-08-01', '11:00:00', '2024-08-06', '11:00:00', '2024-07-23 10:28:17', '2024-07-23 10:28:17'),
(4, 7, 2, 1, '2024-07-25', '11:00:00', '2024-07-28', '11:00:00', '2024-07-24 17:29:28', '2024-07-24 17:29:28'),
(5, 2, 1, 1, '2024-07-06', '10:00:00', '2024-08-28', '17:30:00', '2024-07-24 17:30:47', '2024-07-24 17:30:47'),
(6, 4, 1, 1, '2024-07-05', '10:00:00', '2024-08-03', '23:59:00', '2024-07-24 17:32:33', '2024-07-24 17:32:33'),
(7, 5, 1, 1, '2024-07-15', '10:00:00', '2024-08-16', '23:59:00', '2024-07-24 17:33:28', '2024-07-24 17:33:28'),
(8, 6, 1, 1, '2024-05-19', '10:00:00', '2024-08-13', '17:30:00', '2024-07-24 17:34:35', '2024-07-24 17:34:35'),
(9, 8, 2, 1, '2024-07-25', '11:00:00', '2024-07-28', '11:00:00', '2024-07-24 17:39:10', '2024-07-24 17:39:10'),
(10, 8, 1, 1, '2024-08-05', '10:00:00', '2024-09-27', '12:00:00', '2024-07-24 17:39:53', '2024-07-24 17:39:53'),
(11, 9, 2, 1, '2024-07-25', '11:00:00', '2024-07-28', '11:00:00', '2024-07-24 17:39:10', '2024-07-24 17:39:10'),
(12, 9, 1, 1, '2024-08-05', '10:00:00', '2024-09-27', '12:00:00', '2024-07-24 17:39:53', '2024-07-24 17:39:53'),
(13, 10, 1, 1, '2024-07-25', '10:00:00', '2024-08-28', '23:59:00', '2024-07-24 17:44:36', '2024-07-24 17:44:36'),
(14, 11, 2, 1, '2024-07-25', '11:00:00', '2024-07-28', '11:00:00', '2024-07-24 17:45:59', '2024-07-24 17:45:59'),
(15, 11, 1, 1, '2024-08-05', '10:00:00', '2024-09-22', '23:59:00', '2024-07-24 17:46:25', '2024-07-24 17:46:25'),
(16, 2, 2, 1, '2024-07-11', '11:00:00', '2024-07-16', '11:00:00', '2024-07-25 19:53:06', '2024-07-25 19:53:06');

-- --------------------------------------------------------

--
-- テーブルの構造 `user`
--

CREATE TABLE `user` (
  `user_id` int(12) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `password`, `isActive`, `createdDate`, `modifiedDate`) VALUES
(1, '倉本 知左子', 'chisaxworks@gmail.com', '$2y$10$Kv38uxmXG0Hbq5qhA4bvDOghkPWhLU1jMA0KnjoFTwTkba4Ow/yq.', 1, '2024-07-21 17:50:45', '2024-07-21 17:50:45'),
(2, '山田 花子', 'hana@gmail.com', '$2y$10$21aRu3Asn45kxVmhxpXDk.zhGBn2A6IgytXnNa7l0uImP1ePoZv36', 1, '2024-07-21 17:51:30', '2024-07-21 17:51:30'),
(3, 'てすと一郎', 'test1@gmail.com', '$2y$10$C2MgYuy95PNsUi0joDfB4eJ.wffLE4pxC38kD5Tj8nAOjY9buq6b6', 1, '2024-07-21 21:34:00', '2024-07-21 21:34:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `venue`
--

CREATE TABLE `venue` (
  `venue_id` int(12) NOT NULL,
  `venue_name` varchar(255) NOT NULL,
  `venue_pref` varchar(4) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `venue`
--

INSERT INTO `venue` (`venue_id`, `venue_name`, `venue_pref`, `createdDate`, `modifiedDate`) VALUES
(1, 'ルミネtheよしもと', '東京都', '2024-07-21 17:52:40', '2024-07-21 17:52:40'),
(2, 'ヨシモト∞ホール', '東京都', '2024-07-21 17:53:11', '2024-07-21 17:53:11');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- テーブルのインデックス `event_mg_tbl`
--
ALTER TABLE `event_mg_tbl`
  ADD PRIMARY KEY (`em_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`ent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `sales_methods`
--
ALTER TABLE `sales_methods`
  ADD PRIMARY KEY (`sm_id`);

--
-- テーブルのインデックス `ticket_agency`
--
ALTER TABLE `ticket_agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- テーブルのインデックス `ticket_info`
--
ALTER TABLE `ticket_info`
  ADD PRIMARY KEY (`ti_id`),
  ADD KEY `ticketAgency_id` (`agency_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `sm_id` (`sm_id`);

--
-- テーブルのインデックス `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- テーブルのインデックス `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venue_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- テーブルの AUTO_INCREMENT `event_mg_tbl`
--
ALTER TABLE `event_mg_tbl`
  MODIFY `em_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- テーブルの AUTO_INCREMENT `favorite`
--
ALTER TABLE `favorite`
  MODIFY `ent_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `sales_methods`
--
ALTER TABLE `sales_methods`
  MODIFY `sm_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `ticket_agency`
--
ALTER TABLE `ticket_agency`
  MODIFY `agency_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `ticket_info`
--
ALTER TABLE `ticket_info`
  MODIFY `ti_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- テーブルの AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `venue`
--
ALTER TABLE `venue`
  MODIFY `venue_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON UPDATE CASCADE;

--
-- テーブルの制約 `event_mg_tbl`
--
ALTER TABLE `event_mg_tbl`
  ADD CONSTRAINT `event_mg_tbl_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `event_mg_tbl_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- テーブルの制約 `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- テーブルの制約 `ticket_info`
--
ALTER TABLE `ticket_info`
  ADD CONSTRAINT `ticket_info_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_info_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `ticket_agency` (`agency_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_info_ibfk_3` FOREIGN KEY (`sm_id`) REFERENCES `sales_methods` (`sm_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
