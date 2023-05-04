-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Bulan Mei 2023 pada 17.04
-- Versi server: 5.7.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blog`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `album_seo` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id`, `album_name`, `album_seo`, `photo`, `is_active`) VALUES
(17, 'Album 1', 'album-1', 'album-1-1581343722711.jpg', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `album_umkm`
--

CREATE TABLE `album_umkm` (
  `id` int(11) NOT NULL,
  `id_umkm` int(11) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `album_umkm`
--

INSERT INTO `album_umkm` (`id`, `id_umkm`, `gambar`) VALUES
(117, 20, '62b6226ff5b0e43090c8672c3ca0f554.png'),
(118, 20, 'c1273c1e9398819d69eeab5b0d89d94b.png'),
(119, 20, 'd31bbe345dd3bf4fc1ddb05b492fda2c.png'),
(121, 1, 'b4803a617d3601b7af13be3120ecb65d.jpg'),
(122, 1, '9978a0ed58d8c0ab4db67654c682317d.jpg'),
(123, 1, 'a55f404ac09825effae6528bc812255a.jpg'),
(124, 15, 'b035888e6c841968d7543a1b9418ba26.jpg'),
(125, 16, '6595f96b58c21a56950e706afcb92322.jpg'),
(126, 17, 'ca0f4bdfb030c4f405fa80b42a48c14f.jpg'),
(127, 18, '7f93ce6e4f7350d7407cd8c6d8f88093.jpg'),
(128, 19, '76d0dde2d72494a99ded353a6961b9d7.jpg'),
(129, 20, '45d8d99b52234a1cec7faf494501209a.jpg'),
(130, 21, 'a47cb2cef437854ed3b45effa5ae2920.png'),
(131, 21, 'e3a9a20f74a23cfa841c096d38ed8aa0.jpeg'),
(132, 22, 'e2729d13ec513588b95eb0607084c22d.png'),
(133, 23, 'ee1ce75be38144200c1c62a51459c623.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `banner`
--

INSERT INTO `banner` (`id`, `title`, `photo`) VALUES
(5, 'Home', '3f0edd4a3de4375c41038e0ccf300b3b.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category_name`, `slug`, `is_active`) VALUES
(9, 'Berita UMKM', 'berita-umkm', 'Y'),
(10, 'Pengumuman', 'pengumuman', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `contact`
--

INSERT INTO `contact` (`id`, `contact_name`, `description`) VALUES
(1, 'About Me', 'SIPULANG (Sistem Informasi Potensi UMKM Kelurahan Gunung Anyar) adalah sebuah platform yang digunakan untuk memberikan informasi tentang potensi UMKM (Usaha Mikro Kecil Menengah) di Kelurahan Gunung Anyar, Surabaya, Indonesia. Web ini membantu masyarakat untuk mencari informasi mengenai UMKM yang ada di wilayah tersebut dan juga memberikan kemudahan dalam mengakses informasi terkait kegiatan UMKM di kelurahan Gunung Anyar.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  `gallery_name` varchar(100) NOT NULL,
  `gallery_seo` varchar(100) NOT NULL,
  `information` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id`, `id_album`, `gallery_name`, `gallery_seo`, `information`, `photo`, `is_active`) VALUES
(9, 17, 'Galeri 2', 'galeri-2', 'LIfe is Strange', 'galeri-2-15815614412.jpg', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identity`
--

CREATE TABLE `identity` (
  `id` int(11) NOT NULL,
  `web_name` varchar(255) NOT NULL,
  `web_address` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `identity`
--

INSERT INTO `identity` (`id`, `web_name`, `web_address`, `meta_description`, `meta_keyword`, `photo`) VALUES
(1, 'Sipulang.com', 'Sipulang.com', 'SIPULANG (Sistem Informasi Potensi UMKM Kelurahan Gunung Anyar) adalah sebuah platform yang digunakan untuk memberikan informasi tentang potensi UMKM (Usaha Mikro Kecil Menengah) di Kelurahan Gunung Anyar, Surabaya, Indonesia. Web ini membantu masyarakat untuk mencari informasi mengenai UMKM yang ada di wilayah tersebut dan juga memberikan kemudahan dalam mengakses informasi terkait kegiatan UMKM di kelurahan Gunung Anyar.', 'Sipulang.com', '66e930207e93af0d9131474e68f97d5a.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(4, '::1', 'admin', 1683210050);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 'Setting Web', '', 'fas fa-fw fa-cog', 'Y'),
(3, 'Manajemen Artikel', '', 'fas fa-fw fa-newspaper', 'Y'),
(7, 'UMKM', '', 'fas fa-fw fa-store-alt', 'Y'),
(8, 'Logout', 'auth/logout', '', 'N'),
(9, 'Profile', 'home', 'fas fa-fw fa-home', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posting`
--

CREATE TABLE `posting` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featured` char(1) NOT NULL,
  `choice` char(1) NOT NULL,
  `thread` char(1) NOT NULL,
  `id_category` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `posting`
--

INSERT INTO `posting` (`id`, `title`, `seo_title`, `content`, `featured`, `choice`, `thread`, `id_category`, `photo`, `is_active`, `date`) VALUES
(69, 'New MacBook Pro 13-inch spotted with 10th-generation Ice Lake', 'new-macbook-pro-13-inch-spotted-with-10th-generation-ice-lake', '<p>It looks like Apple has plans to give the MacBook Pro 13-inch a \r\nconsiderable power boost in 2020. And, it’s about darn time, especially \r\nsince 8th-generation Intel Core processors are aging at this point, \r\nespecially on a premium laptop.</p><p>A <a href=\"https://twitter.com/_rogame/status/1228636786517270529?s=20\" target=\"_blank\" class=\"hawk-link-parsed\"><u>3DMark Time Spy benchmark</u></a>, recently leaked by <a href=\"https://twitter.com/_rogame\" target=\"_blank\" class=\"hawk-link-parsed\"><u>@_rogame</u></a>\r\n on Twitter, shows a new 13-inch MacBook Pro boasting marked performance\r\n improvements over 2019’s second highest configuration. If you’re not \r\nfamiliar with this serial leaker, he was responsible for uncovering a <a href=\"https://www.reddit.com/r/Amd/comments/dvq3xx/16_macbook_pro_with_an_rx_5500m_8gb/\" target=\"_blank\" class=\"hawk-link-parsed\"><u>Geekbench 4 benchmark</u></a>\r\n of the 16-inch MacBook Pro boasting the Radeon 5500M graphics card \r\nbefore it came out. So, you know this is coming from a reliable source.</p><aside class=\"hawk-widget\" data-render-type=\"fte\" data-widget-type=\"seasonal\"></aside><p>The\r\n unreleased 13-inch MacBook Pro model is fitted with an Intel Core \r\ni7-1068NG7 processor with a 2.3GHz base clock, Turbo Boost up to 4.1GHz \r\nclocks and a TDP of 28W. Based on an <a href=\"https://twitter.com/_rogame/status/1228628173509857280?s=20\" target=\"_blank\" class=\"hawk-link-parsed\"><u>earlier tweet</u></a>, it also boasts 32GB of memory and 2TB of storage (SSD).</p><p>It’s worth noting that the i7-1068NG7 could be a variant of the i7-1068G7, which <a href=\"https://wccftech.com/2020-macbook-pro-13-vs-predecessor-benchmark-leak-shows-30-gpu-lead/\" target=\"_blank\" class=\"hawk-link-parsed\"><u>Wccftech.com</u></a> praises as the best performing mobile chip in the Ice Lake U family. <br></p>', 'Y', 'N', 'Y', 6, '1c9ed66e86d7f2edff5ea376dba2f5b0.jpg', 'Y', '2020-02-23'),
(70, 'Trump Mocks ‘Parasite’ Best Picture Win: ‘What the Hell Was That All About?’', 'trump-mocks-parasite-best-picture-win-what-the-hell-was-that-all-about', '<p>President <a href=\"https://variety.com/t/donald-trump/\" id=\"auto-tag_donald-trump\" data-tag=\"donald-trump\">Donald Trump</a> took aim at “<a href=\"https://variety.com/t/parasite/\" id=\"auto-tag_parasite\" data-tag=\"parasite\">Parasite</a>’s” historic Oscar wins at a Colorado rally on Thursday. “How bad were the Academy Awards this year?” he asked, prompting jeers from the crowd. “Did you see it?”</p>\r\n<p>“The winner is… a movie from South Korea! What the hell was that all \r\nabout?” he went on. “We got enough problems with South Korea with trade.\r\n On top of that, they give them best movie of the year? Was it good? I \r\ndon’t know. Let’s get ‘Gone With the Wind.’ Can we get ‘Gone With the \r\nWind’ back, please?”</p>\r\n\r\n<p>“So many great movies…” he bemoaned before again mocking, “the winner is from South Korea!”</p>\r\n<p>“I thought it was best foreign film, right? Best foreign movie,” he said. “Did this ever happen before?”</p>\r\n<p>It hadn’t, actually, happened before. “<a href=\"https://variety.com/2020/film/news/bong-joon-ho-makes-triumphant-return-to-korea-talks-oscars-and-parasite-in-black-and-white-1203507772/\" id=\"related_article_link_parasite\" data-tag=\"parasite\">Parasite</a>” made history when it became the first foreign-language film to win best picture at the <a href=\"https://variety.com/t/oscars/\" id=\"auto-tag_oscars\" data-tag=\"oscars\">Oscars</a>, also taking home original screenplay, director for Bong Joon Ho and best international film.</p><p>He also took a shot at <a href=\"https://variety.com/t/brad-pitt/\" id=\"auto-tag_brad-pitt\" data-tag=\"brad-pitt\">Brad Pitt</a>,\r\n who used his speech for winning supporting actor to, in part, call out \r\nthe Trump impeachment trial for blocking the testimony of former \r\nnational security adviser John Bolton. Trump said he was “never a fan” \r\nof Pitt, addressing his <a href=\"https://variety.com/2020/film/news/parasite-imax-remaster-release-1203509462/\" id=\"related_article_link_oscars\" data-tag=\"oscars\">Oscars</a> speech.</p>\r\n<p>“He got up and said little wiseguy statements,” Trump said of Pitt. “He’s a little wiseguy.”</p>\r\n<p>During the Oscars, Pitt joked, “They told me I only have 45 seconds \r\nup here, which is 45 seconds more than the Senate gave John Bolton this \r\nweek. I’m thinking maybe Quentin [Tarantino] does a movie about it — in \r\nthe end, the adults do the right thing.”</p>\r\n<p>Neon, the distributor of “Parasite,” took Trump’s jabs in stride, \r\ntweeting that it was “understandable” that Trump couldn’t comprehend the\r\n subtitled film. “He can’t read,” it said, including the hashtag \r\n#Bong2020.</p>', 'Y', 'N', 'N', 8, '25dc9bb7836f4c5d30369531728747dd.jpg', 'Y', '2020-02-24'),
(71, 'Will there be a Witcher 4? Here\'s what we know', 'will-there-be-a-witcher-4-here-s-what-we-know', '<p>Will there be a Witcher 4? Maybe, but it’s not coming anytime \r\nsoon—and while it seems likely that developer CD Projekt Red will \r\neventually make another Withcher game, it probably won\'t have a \"4\" in \r\nthe title.</p><p>CD Projekt Red is currently hard at work on its most ambitious game yet, <a href=\"https://www.pcgamer.com/everything-we-know-about-cyberpunk-2077/\" target=\"_blank\" class=\"hawk-link-parsed\">Cyberpunk 2077</a>. It’s looking great, but I can’t help but wish for a proper return to the unforgettable fantasy world of The Witcher.</p><aside class=\"hawk-widget\" data-render-type=\"fte\" data-widget-type=\"seasonal\"></aside><p>The Witcher 3: Wild Hunt is one of the <a href=\"https://www.pcgamer.com/best-rpgs-of-all-time/\" target=\"_blank\" class=\"hawk-link-parsed\"><u>greatest RPGs of all time</u></a>,\r\n so an eventual sequel would be highly anticipated. So much, in fact, \r\nthat there’s no shortage of rumors about a theoretical fourth Witcher \r\ngame, and CD Projekt has commented on the possibility a few times. We’ve\r\n gathered everything we know for sure about the next Witcher game so you\r\n can manage your expectations accordingly.</p><h2 id=\"cd-projekt-just-signed-a-new-deal-with-witcher-creator-andrzej-sapkowski\">CD Projekt just signed a new deal with Witcher creator Andrzej Sapkowski</h2><p>CD\r\n Projekt famously got the rights to make Witcher games for a flat \r\nup-front fee, which novelist Andrzej Sapkowski wasn\'t thrilled about \r\nafter the games became enormously popular. Since 2018 the two parties \r\nhave been negotiating a new deal, and in December 2019 they <a href=\"https://www.pcgamer.com/cd-projekt-has-a-new-deal-with-the-witcher-creator-andrez-sapkowski/\" target=\"_blank\" class=\"hawk-link-parsed\">finally reached it</a>.\r\n The new agreement \"solidifies and reinforces the company’s relationship\r\n with Mr. Andrzej Sapkowski—author of The Witcher saga.\"</p><p>The most interesting quote, however, is this one: \"The agreement \r\nconfers new rights upon the Company and reaffirms its existing title to \r\n\'The Witcher\' intellectual property in developing video games, graphic \r\nnovels, board games and merchandise.\"</p><p>That doesn\'t spell out that \r\nnew videogames are on the way, but it\'s a sure sign that CD Projekt has a\r\n long-term interest in The Witcher.</p><p>CD Projekt Red has been somewhat vague about the future of The \r\nWitcher game series, but it’s at least clear that the studio needs to \r\ntake a break from that world. In a 2017 <a href=\"https://youtu.be/-RFPNVROfVo\" target=\"_blank\" class=\"hawk-link-parsed\">investor call</a>,\r\n CDPR co-founder and CEO Marcin Iwinski said that the studio is not \r\nabandoning The Witcher forever, but it’s not the current focus. \"For the\r\n past ten years the team has been working on swords and castles and \r\nmedieval Slavic monsters. So I think it’s time for some guns, androids, \r\nand some ammo.\"</p><p>That’s fair. After three massive RPGs in the same \r\nuniverse and the same character, you naturally want to do something new.\r\n Cyberpunk 2077 is in many ways The Witcher\'s opposite, so it fits the \r\nbill. He also reiterated that the studio values The Witcher highly. \"We \r\nlike this world a lot. We invested 15 years of our lives in it and a lot\r\n of money. So, we’ll think about [another Witcher game] at some point. \r\nBut please consider us as rational people, we sometimes have weird ideas\r\n but overall our thinking is very rational. We have full rights to The \r\nWitcher games. They are ours. We have invested enormous funds into \r\npromoting it, and it’s a very strong brand.\"</p><p>So, yes, CDPR loves \r\nThe Witcher and knows that players would get excited about another \r\nsequel. After all, The Witcher 3: Wild Hunt <a href=\"https://www.pcgamer.com/the-witcher-3-has-sold-more-than-20-million-copies/\" target=\"_blank\" class=\"hawk-link-parsed\"><u>sold over 20 million copies</u></a>. But it’s working on other stuff, so it might be a long time before we see a full-fledged return to the fantasy world.</p><p>Gwent spin-off Thronebreaker, released in late 2018, <a href=\"https://www.pcgamer.com/thronebreaker-the-witcher-tales-hasnt-sold-as-well-as-cdpr-expected/\" target=\"_blank\" class=\"hawk-link-parsed\">had disappointing sales</a>,\r\n and the competitive Gwent card game never really broke out of \r\nHearthstone\'s shadow. But it does continue to be supported, so a small \r\npart of CD Projekt Red is still embedded in the Witcher universe, even \r\nif another big game isn\'t in development.</p>', 'Y', 'N', 'N', 7, 'ac7387a3ad0607e8f7db1a8da44f80de.jpg', 'Y', '2020-02-23'),
(72, 'Nintendo Switch Pro: what we want to see from a new Switch console', 'nintendo-switch-pro-what-we-want-to-see-from-a-new-switch-console', '<p>Rumors have been circling for a while now that a Nintendo Switch Pro \r\nis in the works. However, contrary to belief, a Switch Pro certainly \r\nwon\'t be releasing this year as Nintendo has officially confirmed that a\r\n new Switch isn\'t coming in 2020.</p><p>But that\'s not to say we won\'t see a new Nintendo Switch in the future.</p><aside class=\"hawk-widget\" data-render-type=\"fte\" data-widget-type=\"seasonal\"></aside><p>While we technically seen two new Switch devices release in 2019 - the Switch with longer battery and the handheld <a href=\"https://www.techradar.com/reviews/nintendo-switch-lite-review\" data-original-url=\"https://www.techradar.com/uk/news/nintendo-switch-lite-release-date-price-games-and-more\" class=\"hawk-link-parsed\">Nintendo Switch Lite</a> - we\'re still expecting Nintendo to have another, more premium, Switch up its sleeve. </p><p>This new Switch (or Switch Pro) would boast upgraded hardware in comparison to the original <a href=\"https://www.techradar.com/reviews/nintendo-switch\" class=\"hawk-link-parsed\">Nintendo Switch</a>, potentially offering better graphics and processing power, among other improved features - although it\'s been suggested this <a href=\"https://www.techradar.com/news/the-latest-nintendo-switch-pro-rumors-are-pretty-disappointing\" class=\"hawk-link-parsed\">upgrade won\'t be as extensive as we\'d like to see</a>.</p><p>With Nintendo not even confirming the existence of a Switch Pro, and the\r\n company ruling out a 2020 release for any new Switch, when would be a \r\nlikely release window? And, if the rumors <em>are</em> true, what \r\nfeatures would this new Switch likely offer? While we wait for more \r\ndefinitive answers, let\'s run through the likely (and unlikely) \r\npossibilities below.</p>', 'N', 'Y', 'Y', 6, '91c9893cd2a1f8284c883b3b04775b90.jpg', 'Y', '2020-02-23'),
(73, 'The Last of Us 2 release date, trailers, news and rumors', 'the-last-of-us-2-release-date-trailers-news-and-rumors', '<p>There are only a few months left to wait until we can all finally get our hands on The Last of Us 2 - and we\'re getting excited.</p><p>The\r\n ending of The Last of Us was pretty conclusive. But as it turns out, \r\nthat hasn\'t stopped developer Naughty Dog from cranking out a sequel in \r\nthe form of The Last of Us 2 – or, The Last of Us: Part 2 if we\'re using\r\n its proper name. </p><aside class=\"hawk-widget\" data-render-type=\"fte\" data-widget-type=\"seasonal\"></aside><p>Given\r\n the first game was hailed by players and critics alike as a masterpiece\r\n with excellent, emotional storytelling and engaging, realistic \r\ncharacters, we have to admit that the decision to release a follow-up \r\nisn\'t particularly shocking. We\'d probably have been more surprised if \r\nthere <em>wasn\'t</em> one. And yet, when The Last of Us 2 was first announced, we\'d be lying if we said our hearts didn\'t skip a beat. </p><p>The\r\n Last of Us 2 was first announced by Naughty Dog at PlayStation \r\nExperience in 2016 alongside a teaser trailer, but it wasn\'t until \r\nSeptember 2019 that we were finally told the game\'s initial release date\r\n of February 2020 during a State of Play livestream. However, Naughty \r\nDog later announced that the release date has been delayed by a few \r\nmonths, and we now know we\'ll be joining Ellie and Joel again in May \r\n2020. <br></p>', 'N', 'Y', 'N', 7, 'dcc5f464a60adebca40c21ec9be5ec26.jpg', 'Y', '2020-02-23'),
(74, 'Ben Affleck Thinks Robert Pattinson is Going to Be a Great Batman', 'ben-affleck-thinks-robert-pattinson-is-going-to-be-a-great-batman', '<p>Former Batman Ben Affleck is sharing his support for his successor in \r\nthe role, Robert Pattinson, who will play the Caped Crusader in next \r\nyear\'s <a href=\"https://screenrant.com/tag/the-batman/\"><strong><em>The Batman</em></strong></a>. Starting with 2016\'s <a href=\"https://screenrant.com/tag/batman-v-superman/\"><em>Batman v. Superman: Dawn of Justice</em></a>,\r\n Affleck was the fifth actor to play Batman in a live-action film, and \r\nhe appeared in three movies total (which includes a small cameo in <a href=\"https://screenrant.com/tag/suicide-squad/\"><em>Suicide Squad</em></a>). Affleck was reportedly going to direct, write, and star in <em>The Batman, </em>but\r\n reports later emerged suggesting someone new would take over the role. \r\nAffleck later departed the project, and Matt Reeves signed on to write \r\nand direct with Pattinson filling the role of Bruce Wayne.</p><p>Production on <em>The Batman </em>has been underway for a little while now, and recently Reeves unveiled the <a href=\"https://screenrant.com/batman-robert-pattinson-costume-bat-suit-reveal-video/\">first official look of Pattinson in costume</a>.\r\n Excitement for the 2021 film has only been building as production has \r\ncontinued, especially due to its large cast. Aside from Pattinson, <em>The Batman </em>will star <a href=\"https://screenrant.com/batman-movie-catwoman-costume-zoe-kravitz-photos-motorcycle/\">Zoë Kravitz</a>, Colin Farrell, Jeffrey Wright, Paul Dano, Andy Serkis, <a href=\"https://www.cbr.com/the-batman-peter-sarsgaard-jayme-lawson-roles/\" target=\"_blank\" rel=\"noopener noreferrer\">Peter Sarsgaard</a>, and John Turturro.</p><p>While promoting his new film <em><a href=\"https://screenrant.com/tag/the-way-back/\">The Way Back</a> </em>in an interview with <a href=\"https://www.youtube.com/watch?v=5oYrYpn4bIc\" target=\"_blank\" rel=\"noopener noreferrer\">Jake Hamilton</a>, Affleck was briefly asked about his time as Batman as well as the initial script he wrote for <em>The Batman</em>. Affleck was quick to share some words of support for Pattinson, saying, \"<em>I think Robert\'s a great actor, he\'s going to do great</em>.\" Affleck also opened up a bit more about why he chose to leave, explaining that he had \"<em>kind of lost my passion for it</em>.\" He added, \"<em>The movie deserves to be made by someone whose dying to do it and can\'t wait, and that wasn\'t me at the time, so I moved on</em>.\"</p><p>Recently, Affleck elaborated on his departure from <em>The Batman</em>\r\n in a more candid manner than he had previously. Whereas before, it \r\nseemed like creative differences led to his exit, Affleck admitted that \r\nit was a more personal reason. Affleck explained, \"<em>I showed somebody\r\n ‘The Batman’ script. They said, ‘I think the script is good. I also \r\nthink you’ll drink yourself to death if you go through what you just \r\nwent though again</em>.\" It seems that the <a href=\"https://screenrant.com/ben-affleck-batman-exit-justice-league-reshoots-drama-rehab/\">process behind making and promoting 2017\'s <em>Justice League</em></a>\r\n effectively diminished his interest in playing Batman, which isn\'t too \r\nsurprising considering that film\'s troubled production history. <a href=\"https://screenrant.com/ben-afflecks-addiction-rehab-statement/\">Affleck\'s struggles with alcoholism</a> reportedly added to his stress.</p>\r\n<p>Affleck\'s recent comments, including the ones in support of \r\nPattinson, suggest he\'s made some peace with his rocky tenure as Batman.\r\n Of course, it\'s impossible to say for sure without being inside of his \r\nhead, but it\'s a bit of a relief to know that he has moved onto projects\r\n he feels more passionate about. Affleck\'s Batman, while perhaps not as \r\nbeloved as say Michael Keaton\'s or Christian Bale\'s, was a solid take on\r\n the well-known character, and it would have been interesting to see \r\nwhat his version of <em><strong>The Batman</strong> </em>would have \r\nbeen. Instead though, fans will get the chance to see a new actor take \r\non the role, and only time will tell if they enjoy it or not.</p>', 'N', 'N', 'N', 8, '0bd7bd67d3784eb4a9be9ef50510274a.jpg', 'Y', '2020-02-24'),
(75, 'Apple shares drop amid reports of low demand for iPhone X', 'apple-shares-drop-amid-reports-of-low-demand-for-iphone-x', '<p>BEIJING/SAN FRANCISCO, Dec 26 (Reuters) – Shares in <a href=\"http://www.globalnews.ca/tag/apple\" target=\"_blank\" rel=\"noopener\">Apple Inc</a>\r\n and several of its Asian suppliers fell on Tuesday after a report by \r\nTaiwan’s Economic Daily and comments from some analysts suggested <a href=\"http://www.globalnews.ca/tag/iphone-x\" target=\"_blank\" rel=\"noopener\">iPhone X</a> demand could come in below expectations in the first quarter.</p><p>Apple\r\n will slash its sales forecast for the iPhone X in the quarter to 30 \r\nmillion units, the newspaper said on Monday, citing unidentified \r\nsources, down from what it said was an initial plan of 50 million units.</p><p>Apple\r\n has not publicly disclosed quarterly sales targets for the iPhone X, \r\nwhich went on sale in November at a base price of $999 in the United \r\nStates. An Apple spokeswoman said the company does not comment on market\r\n rumors.</p><p>Shares of Apple surged 45 percent this year before the iPhone X launch \r\nas investors anticipated interest from iPhone users who had gone years \r\nsince buying a new one.</p><p>Shares of Apple have edged slightly lower since the iPhone X debut. They fell 2.5 percent to $170.57 on Tuesday.</p><p>During\r\n a trip to China this month Apple Chief Executive Tim Cook said he \r\n“couldn’t be happier” with the demand for the iPhone X in the country. \r\nThe company also had described pre-orders for iPhone X as “off the \r\ncharts.”</p> \r\n  \r\n  \r\n <h3>Varying estimates</h3><p>Estimates of how many of the new phones Apple is making, and how many it will sell, vary widely.</p>', 'N', 'Y', 'N', 6, '0806ef39ec267c04b99a51a88129327a.jpg', 'Y', '2020-02-24'),
(76, 'Massive Samsung Galaxy S20 Ultra camera test: 100x zoom and 108MP photo samples', 'massive-samsung-galaxy-s20-ultra-camera-test-100x-zoom-and-108mp-photo-samples', '<p>At the low end, U.S.-based JL Warren Capital expects Apple to ship 25\r\n million iPhone X units as consumers balk at the “high price” and “lack \r\nof interesting innovations.”</p><p>On the high end, Chicago-based Loop \r\nCapital estimated in a note last week 40 million to 45 million \r\nfirst-quarter shipments. Jefferies forecast about 40 million \r\nfirst-quarter sales.</p>         ', 'N', 'N', 'Y', 6, '344d68e696bcc03d9a9e4445b5a7be24.jpg', 'Y', '2020-02-24'),
(77, 'Spiderman: Into The Spider Verse', 'spiderman-into-the-spider-verse', '<p><i>Spider-Man: Into the Spider-Verse</i> is a 2018 American <a href=\"https://en.wikipedia.org/wiki/Computer_animation\" title=\"Computer animation\">computer-animated</a> <a href=\"https://en.wikipedia.org/wiki/Superhero_film\" title=\"Superhero film\">superhero film</a> featuring the <a href=\"https://en.wikipedia.org/wiki/Marvel_Comics\" title=\"Marvel Comics\">Marvel Comics</a> character <a href=\"https://en.wikipedia.org/wiki/Miles_Morales\" title=\"Miles Morales\">Miles Morales / Spider-Man</a>, produced by <a href=\"https://en.wikipedia.org/wiki/Columbia_Pictures\" title=\"Columbia Pictures\">Columbia Pictures</a> and <a href=\"https://en.wikipedia.org/wiki/Sony_Pictures_Animation\" title=\"Sony Pictures Animation\">Sony Pictures Animation</a> in association with <a href=\"https://en.wikipedia.org/wiki/Marvel_Entertainment\" title=\"Marvel Entertainment\">Marvel</a>, and distributed by <a href=\"https://en.wikipedia.org/wiki/Sony_Pictures_Motion_Picture_Group#Sony_Pictures_Releasing\" class=\"mw-redirect\" title=\"Sony Pictures Motion Picture Group\">Sony Pictures Releasing</a>. It is the first animated <a href=\"https://en.wikipedia.org/wiki/Feature_film\" title=\"Feature film\">feature film</a> in the <a href=\"https://en.wikipedia.org/wiki/Spider-Man_in_film\" title=\"Spider-Man in film\"><i>Spider-Man</i> franchise</a>,<sup id=\"cite_ref-HenryDiversity_4-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Spider-Man:_Into_the_Spider-Verse#cite_note-HenryDiversity-4\">[4]</a></sup><sup id=\"cite_ref-Perry_2015_5-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Spider-Man:_Into_the_Spider-Verse#cite_note-Perry_2015-5\">[5]</a></sup> and is set in a shared <a href=\"https://en.wikipedia.org/wiki/Multiverse\" title=\"Multiverse\">multiverse</a> called the \"<a href=\"https://en.wikipedia.org/wiki/Spider-Verse\" title=\"Spider-Verse\">Spider-Verse</a>\", which has <a href=\"https://en.wikipedia.org/wiki/Parallel_universes_in_fiction\" title=\"Parallel universes in fiction\">alternate universes</a>. The film was directed by <a href=\"https://en.wikipedia.org/wiki/Bob_Persichetti\" title=\"Bob Persichetti\">Bob Persichetti</a>, <a href=\"https://en.wikipedia.org/wiki/Peter_Ramsey\" title=\"Peter Ramsey\">Peter Ramsey</a>, and <a href=\"https://en.wikipedia.org/wiki/Rodney_Rothman\" title=\"Rodney Rothman\">Rodney Rothman</a> from a screenplay by <a href=\"https://en.wikipedia.org/wiki/Phil_Lord_and_Christopher_Miller\" title=\"Phil Lord and Christopher Miller\">Phil Lord</a> and Rothman, and a story by Lord. It stars the voices of <a href=\"https://en.wikipedia.org/wiki/Shameik_Moore\" title=\"Shameik Moore\">Shameik Moore</a>, <a href=\"https://en.wikipedia.org/wiki/Jake_Johnson\" title=\"Jake Johnson\">Jake Johnson</a>, <a href=\"https://en.wikipedia.org/wiki/Hailee_Steinfeld\" title=\"Hailee Steinfeld\">Hailee Steinfeld</a>, <a href=\"https://en.wikipedia.org/wiki/Mahershala_Ali\" title=\"Mahershala Ali\">Mahershala Ali</a>, <a href=\"https://en.wikipedia.org/wiki/Brian_Tyree_Henry\" title=\"Brian Tyree Henry\">Brian Tyree Henry</a>, <a href=\"https://en.wikipedia.org/wiki/Lily_Tomlin\" title=\"Lily Tomlin\">Lily Tomlin</a>, <a href=\"https://en.wikipedia.org/wiki/Lauren_Vélez\" title=\"Lauren Vélez\">Luna Lauren Velez</a>, <a href=\"https://en.wikipedia.org/wiki/John_Mulaney\" title=\"John Mulaney\">John Mulaney</a>, <a href=\"https://en.wikipedia.org/wiki/Kimiko_Glenn\" title=\"Kimiko Glenn\">Kimiko Glenn</a>, <a href=\"https://en.wikipedia.org/wiki/Nicolas_Cage\" title=\"Nicolas Cage\">Nicolas Cage</a>, and <a href=\"https://en.wikipedia.org/wiki/Liev_Schreiber\" title=\"Liev Schreiber\">Liev Schreiber</a>. In the film, Miles Morales joins other Spider-Men from various dimensions who team up to save <a href=\"https://en.wikipedia.org/wiki/New_York_City\" title=\"New York City\">New York City</a> from <a href=\"https://en.wikipedia.org/wiki/Kingpin_(character)\" title=\"Kingpin (character)\">Kingpin</a>.\r\n</p><p>Plans for an animated <a href=\"https://en.wikipedia.org/wiki/Spider-Man\" title=\"Spider-Man\">Spider-Man</a> film by Lord and <a href=\"https://en.wikipedia.org/wiki/Phil_Lord_and_Christopher_Miller\" title=\"Phil Lord and Christopher Miller\">Christopher Miller</a>\r\n were leaked in 2014 and announced in April 2015. Persichetti, Ramsey \r\nand Rothman joined over the next two years, with Moore and Schreiber \r\ncast in April 2017. Lord and Miller wanted the film to have a unique \r\nstyle, combining <a href=\"https://en.wikipedia.org/wiki/Sony_Pictures_Imageworks\" title=\"Sony Pictures Imageworks\">Sony Pictures Imageworks</a>\'\r\n computer animation pipeline with traditional hand-drawn comic book \r\ntechniques inspired by the work of Miles Morales co-creator <a href=\"https://en.wikipedia.org/wiki/Sara_Pichelli\" title=\"Sara Pichelli\">Sara Pichelli</a>.\r\n The film required up to 140 animators, the largest crew used by Sony \r\nPictures Animation. The film was dedicated to the memories of the \r\ncreators of Spider-Man, <a href=\"https://en.wikipedia.org/wiki/Stan_Lee\" title=\"Stan Lee\">Stan Lee</a> and <a href=\"https://en.wikipedia.org/wiki/Steve_Ditko\" title=\"Steve Ditko\">Steve Ditko</a>, who both died in 2018.\r\n</p><p><i>Spider-Man: Into the Spider-Verse</i> had its world premiere at the <a href=\"https://en.wikipedia.org/wiki/Fox_Theater,_Westwood_Village\" title=\"Fox Theater, Westwood Village\">Regency Village Theater</a> in <a href=\"https://en.wikipedia.org/wiki/Los_Angeles\" title=\"Los Angeles\">Los Angeles</a>\r\n on December 1, 2018, and was theatrically released in the United States\r\n on December 14. It grossed over $375 million worldwide against a $90 \r\nmillion budget. It received praise for its animation, characters, story,\r\n voice acting, humor and soundtrack, and won numerous awards, including \r\nBest Animated Feature at the <a href=\"https://en.wikipedia.org/wiki/91st_Academy_Awards\" title=\"91st Academy Awards\">91st Academy Awards</a>, <a href=\"https://en.wikipedia.org/wiki/46th_Annie_Awards\" title=\"46th Annie Awards\">46th Annie Awards</a>, and <a href=\"https://en.wikipedia.org/wiki/76th_Golden_Globe_Awards\" title=\"76th Golden Globe Awards\">76th Golden Globe Awards</a>. It was the first non-<a href=\"https://en.wikipedia.org/wiki/Walt_Disney_Animation_Studios\" title=\"Walt Disney Animation Studios\">Disney</a>-<a href=\"https://en.wikipedia.org/wiki/Pixar\" title=\"Pixar\">Pixar</a> or <a href=\"https://en.wikipedia.org/wiki/DreamWorks_Animation\" title=\"DreamWorks Animation\">Dreamworks</a> film to win the <a href=\"https://en.wikipedia.org/wiki/Academy_Award_for_Best_Animated_Feature\" title=\"Academy Award for Best Animated Feature\">Academy Award for Best Animated Feature</a> since <i><a href=\"https://en.wikipedia.org/wiki/Rango_(2011_film)\" title=\"Rango (2011 film)\">Rango</a></i> (2011), as well as the first non-Disney/Pixar film since <i><a href=\"https://en.wikipedia.org/wiki/Happy_Feet\" title=\"Happy Feet\">Happy Feet</a></i>\r\n (2006) to win that award when a Disney or Pixar film was also in \r\ncontention. A sequel is set to be released on April 8, 2022, and a \r\nspin-off is also in development.<sup id=\"cite_ref-Sequel2022_6-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Spider-Man:_Into_the_Spider-Verse#cite_note-Sequel2022-6\">[6]</a></sup>\r\n</p>', 'N', 'Y', 'N', 8, '4bdda3a531e4bcca86bad2fadd62853e.jpg', 'Y', '2020-02-24'),
(78, 'Life Is Strange ', 'life-is-strange', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\r\n tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.\"</p><p>\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem \r\naccusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab\r\n illo inventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?\"</p>', 'N', 'N', 'N', 7, '16c7b0990a9da254948f200d61d5bbc2.jpg', 'Y', '2020-02-24'),
(79, 'Nintendo Switch New Color', 'nintendo-switch-new-color', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \r\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \r\nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \r\nex ea commodo consequat. Duis aute irure dolor in reprehenderit in \r\nvoluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur \r\nsint occaecat cupidatat non proident, sunt in culpa qui officia deserunt\r\n mollit anim id est laborum.\"</p><p>\"Sed\r\n ut perspiciatis unde omnis iste natus error sit voluptatem accusantium \r\ndoloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo \r\ninventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?\"</p>\r\n\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing \r\npleasure and praising pain was born and I will give you a complete \r\naccount of the system, and expound the actual teachings of the great \r\nexplorer of the truth, the master-builder of human happiness. No one \r\nrejects, dislikes, or avoids pleasure itself, because it is pleasure, \r\nbut because those who do not know how to pursue pleasure rationally \r\nencounter consequences that are extremely painful. Nor again is there \r\nanyone who loves or pursues or desires to obtain pain of itself, because\r\n it is pain, but because occasionally circumstances occur in which toil \r\nand pain can procure him some great pleasure. To take a trivial example,\r\n which of us ever undertakes laborious physical exercise, except to \r\nobtain some advantage from it? But who has any right to find fault with a\r\n man who chooses to enjoy a pleasure that has no annoying consequences, \r\nor one who avoids a pain that produces no resultant pleasure?\"</p>', 'N', 'N', 'N', 6, '33e0169602846b53eb635ca6cd3397a1.jpg', 'Y', '2020-02-24'),
(81, 'The Walking Dead Seasson 10', 'the-walking-dead-seasson-10', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \r\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \r\nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \r\nex ea commodo consequat. Duis aute irure dolor in reprehenderit in \r\nvoluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur \r\nsint occaecat cupidatat non proident, sunt in culpa qui officia deserunt\r\n mollit anim id est laborum.\"</p><p>\"Sed\r\n ut perspiciatis unde omnis iste natus error sit voluptatem accusantium \r\ndoloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo \r\ninventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?\"</p>\r\n\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing \r\npleasure and praising pain was born and I will give you a complete \r\naccount of the system, and expound the actual teachings of the great \r\nexplorer of the truth, the master-builder of human happiness. No one \r\nrejects, dislikes, or avoids pleasure itself, because it is pleasure, \r\nbut because those who do not know how to pursue pleasure rationally \r\nencounter consequences that are extremely painful. Nor again is there \r\nanyone who loves or pursues or desires to obtain pain of itself, because\r\n it is pain, but because occasionally circumstances occur in which toil \r\nand pain can procure him some great pleasure. To take a trivial example,\r\n which of us ever undertakes laborious physical exercise, except to \r\nobtain some advantage from it? But who has any right to find fault with a\r\n man who chooses to enjoy a pleasure that has no annoying consequences, \r\nor one who avoids a pain that produces no resultant pleasure?\"</p>', 'N', 'N', 'N', 8, 'd1b6077499ecdfa48be70dee1242f8d6.jpg', 'Y', '2020-02-24'),
(82, 'Best Horror Game', 'best-horror-game', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \r\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \r\nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \r\nex ea commodo consequat. Duis aute irure dolor in reprehenderit in \r\nvoluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur \r\nsint occaecat cupidatat non proident, sunt in culpa qui officia deserunt\r\n mollit anim id est laborum.\"</p><p>\"Sed\r\n ut perspiciatis unde omnis iste natus error sit voluptatem accusantium \r\ndoloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo \r\ninventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?\"</p>\r\n\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing \r\npleasure and praising pain was born and I will give you a complete \r\naccount of the system, and expound the actual teachings of the great \r\nexplorer of the truth, the master-builder of human happiness. No one \r\nrejects, dislikes, or avoids pleasure itself, because it is pleasure, \r\nbut because those who do not know how to pursue pleasure rationally \r\nencounter consequences that are extremely painful. Nor again is there \r\nanyone who loves or pursues or desires to obtain pain of itself, because\r\n it is pain, but because occasionally circumstances occur in which toil \r\nand pain can procure him some great pleasure. To take a trivial example,\r\n which of us ever undertakes laborious physical exercise, except to \r\nobtain some advantage from it? But who has any right to find fault with a\r\n man who chooses to enjoy a pleasure that has no annoying consequences, \r\nor one who avoids a pain that produces no resultant pleasure?\"</p>', 'N', 'N', 'N', 7, '9efd7a1bb33824c1552ede8084361631.png', 'Y', '2020-02-24'),
(94, 'Pemaparan Program Kerja KKNT87 UPN “Veteran” Jawa Timur Bersama Para UMKM di Kelurahan Gunung Anyar', 'pemaparan-program-kerja-kknt87-upn-veteran-jawa-timur-bersama-para-umkm-di-kelurahan-gunung-anyar', '', 'N', 'N', 'N', 9, '5367c2797dcb5741ac842047bcaa1c8e.png', 'Y', '2023-05-02'),
(95, 'Survei UMKM Ilfa Souvenir di RW04 Kelurahan Gunung Anyar', 'survei-umkm-ilfa-souvenir-di-rw04-kelurahan-gunung-anyar', '', 'N', 'N', 'N', 9, '346e994bf3e699431106ee293e0c856b.png', 'Y', '2023-05-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rt`
--

CREATE TABLE `rt` (
  `id` int(11) NOT NULL,
  `rt` varchar(10) NOT NULL,
  `id_rw` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rt`
--

INSERT INTO `rt` (`id`, `rt`, `id_rw`) VALUES
(1, '99', 1),
(2, '01', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rw`
--

CREATE TABLE `rw` (
  `id` int(11) NOT NULL,
  `rw` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rw`
--

INSERT INTO `rw` (`id`, `rw`) VALUES
(1, '01'),
(2, '02'),
(3, '03'),
(4, '04'),
(5, '05'),
(6, '06'),
(7, '07'),
(8, '08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenu`
--

CREATE TABLE `submenu` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `sub_title` varchar(50) NOT NULL,
  `sub_url` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `submenu`
--

INSERT INTO `submenu` (`id`, `id_menu`, `sub_title`, `sub_url`, `is_active`) VALUES
(1, 1, 'Identitas Web', 'admin/identity', 'Y'),
(2, 1, 'Kontak', 'admin/contact', 'Y'),
(5, 3, 'Kategori', 'admin/category', 'Y'),
(6, 3, 'Posting', 'admin/posting', 'Y'),
(7, 4, 'Album', 'admin/album', 'N'),
(8, 4, 'Gallery Foto', 'admin/gallery', 'N'),
(11, 7, 'RW', 'admin/rw', 'Y'),
(12, 7, 'RT', 'admin/rt', 'Y'),
(13, 7, 'UMKM', 'admin/umkm', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `umkm`
--

CREATE TABLE `umkm` (
  `id` int(11) NOT NULL,
  `nama_umkm` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_rt` varchar(10) NOT NULL,
  `pemilik` varchar(100) NOT NULL,
  `nib` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `lokasi` text NOT NULL,
  `whatsapp` text NOT NULL,
  `shopee` text NOT NULL,
  `tokopedia` text NOT NULL,
  `facebook` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  `cover` text NOT NULL,
  `link_gmaps` text,
  `grab` text,
  `gojek` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `umkm`
--

INSERT INTO `umkm` (`id`, `nama_umkm`, `created_at`, `id_rt`, `pemilik`, `nib`, `deskripsi`, `lokasi`, `whatsapp`, `shopee`, `tokopedia`, `facebook`, `status`, `cover`, `link_gmaps`, `grab`, `gojek`) VALUES
(15, 'Warung Berkah', '2023-04-30 13:25:18', '2', 'Pak Berkah', '1', '<p class=\"MsoNormal\"><span lang=\"IN\">Warung Berkah\r\nadalah sebuah UMKM yang terletak di Kantin Pasar Gunung Anyar. Warung\r\nini menawarkan berbagai jenis minuman dan makanan yang cocok untuk dinikmati\r\nkapan saja. Jika Pengunjung sedang mencari tempat untuk melepas dahaga atau\r\nmengisi perut di tengah kesibukan di pasar, Warung Berkah adalah pilihan yang\r\ntepat. </span></p><p class=\"MsoNormal\"><span lang=\"IN\"> Menu minuman di Warung Berkah\r\ntermasuk kopi, teh hangat atau es, susu hangat atau es, dan Pop Ice. Kopi di\r\nWarung Berkah tersedia dalam berbagai varian, termasuk kopi hitam, kopi susu,\r\natau kopi latte. Teh juga tersedia dalam berbagai rasa, dari teh hijau hingga\r\nteh tarik. Susu hangat atau es adalah pilihan yang tepat untuk Pengunjung yang\r\ningin menikmati minuman yang segar dan menyehatkan. Pop Ice yang tersedia di\r\nsini juga merupakan minuman penyegar yang populer di kalangan pengunjung pasar.\r\nSelain minuman,</span></p><p class=\"MsoNormal\"><span lang=\"IN\"> Warung Berkah juga menawarkan berbagai jenis mie seperti mie\r\nrebus dan mie goreng instan. Mie ini bisa menjadi pilihan yang tepat jika Pengunjung\r\ningin mengisi perut atau mencari makanan yang mudah dan cepat disajikan. Warung\r\nini menyajikan mie dengan bumbu yang lezat dan aroma yang menggugah selera. Secara\r\nkeseluruhan, Warung Berkah adalah sebuah tempat makan yang menyenangkan untuk\r\ndikunjungi di Kantin Pasar Gunung Anyar. Dengan pilihan minuman dan makanan\r\nyang bervariasi, tempat ini adalah pilihan yang tepat untuk Pengunjung yang\r\ningin menikmati hidangan lezat sambil menikmati suasana di pasar.<o></o></span></p>', 'Kantin Pasar Gunung Anyar\r\n', '', '', '', '', 'Y', '89dc2e823909a52d4ed49928a64fcb98.jpg', 'https://goo.gl/maps/6VNKSMrzkmj1CBty6', '', ''),
(16, 'Kedai Makan Mak Minah', '2023-04-30 13:30:14', '2', 'Bu Minah', '2', '<p class=\"MsoNormal\"><span lang=\"IN\">Kedai Mak\r\nMinah oleh Bu Minah adalah sebuah usaha kecil menengah yang terletak di Kantin\r\nPasar Gunung Anyar. Kedai ini menawarkan berbagai jenis makanan dan minuman\r\nyang cocok untuk dijadikan sebagai santapan sehari-hari. Kedai ini dikelola\r\noleh Bu Minah, seorang ibu rumah tangga yang memiliki keahlian dalam memasak\r\nmakanan tradisional Jawa.</span></p><p class=\"MsoNormal\"><span lang=\"IN\">Salah satu menu Pengunjunglan\r\ndi Kedai Mak Minah adalah nasi atau lontong pecel, dan nasi atau lontong lodeh.\r\nKedai ini menggunakan bahan-bahan yang berkualitas untuk membuat saus pecel dan\r\nlodeh yang khas. Selain itu, kedai ini juga menyediakan lontong mie, yang\r\nmerupakan perpaduan antara lontong dan mie dalam satu hidangan. Semua hidangan\r\nini disajikan dengan lauk-pauk yang segar dan lezat.</span></p><p class=\"MsoNormal\"><span lang=\"IN\">Selain hidangan\r\nutama, Kedai Mak Minah juga menyediakan berbagai jenis gorengan seperti tempe\r\ndan tahu goreng yang garing dan lezat. Pengunjung juga dapat menikmati es degan\r\ndan es cao yang segar dan menyegarkan di tengah cuaca yang panas.</span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span lang=\"IN\">Kedai Mak Minah\r\nadalah pilihan yang tepat bagi Pengunjung yang mencari makanan yang enak dan\r\nmurah di Kantin Pasar Gunung Anyar. Dengan hidangan yang bervariasi dan cita\r\nrasa yang autentik, Kedai Mak Minah menawarkan pengalaman kuliner yang\r\nmemuaskan bagi pengunjung pasar. Selain itu, kedai ini juga merupakan usaha\r\nkecil menengah yang patut didukung untuk memajukan ekonomi lokal.<o></o></span></p>', 'Kantin Pasar Gunung Anyar\r\n', '', '', '', '', 'Y', '018bc30dd16f8406bca44a4db4cf7d5b.jpg', 'https://goo.gl/maps/6VNKSMrzkmj1CBty6', '', ''),
(17, 'Cak Lontong Gunung Anyar', '2023-04-30 13:42:42', '2', 'Cak Lontong', '-', '<p class=\"MsoNormal\"><span lang=\"IN\">UMKM Cak Lontong\r\nadalah sebuah usaha kecil menengah yang berlokasi di Kantin Pasar Gunung Anyar.\r\nUMKM ini terkenal dengan hidangan lontong kupang dan lontong balap yang lezat\r\ndan menjadi favorit bagi pengunjung pasar. Selain itu, UMKM Cak Lontong juga\r\nmenyediakan minuman segar seperti es teh, kopi atau susu, dan es degan yang\r\ncocok untuk menemani hidangan.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Lontong kupang di\r\nUMKM Cak Lontong disajikan dengan kuah yang kaya akan bumbu dan rempah-rempah.\r\nHidangan ini biasanya ditambahkan dengan kerupuk dan taburan bawang goreng\r\nuntuk memberikan sensasi renyah dan gurih. Selain itu, UMKM ini juga menyajikan\r\nlontong balap, hidangan yang terdiri dari lontong, tauge, kerupuk dan bumbu kacang\r\nyang khas.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Untuk minuman,\r\nUMKM Cak Lontong menyediakan es teh yang menyegarkan serta kopi atau susu yang\r\ndapat dinikmati dalam berbagai varian. Es degan juga tersedia untuk Pengunjung\r\nyang ingin menikmati minuman segar yang khas.<o></o></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span lang=\"IN\">UMKM Cak Lontong\r\nadalah pilihan yang tepat bagi Pengunjung yang mencari hidangan yang enak dan\r\nterjangkau di Kantin Pasar Gunung Anyar. Selain itu, dengan membeli di UMKM Cak\r\nLontong, Pengunjung juga turut mendukung usaha kecil menengah dan membantu\r\nmemajukan ekonomi lokal. Dengan pelayanan yang ramah dan hidangan yang lezat,\r\nUMKM Cak Lontong menjadi tempat makan yang cocok untuk dikunjungi bersama\r\nkeluarga atau teman.<o></o></span></p>', 'Kantin Pasar Gunung Anyar', '', '', '', '', 'Y', 'e94e3b2f7e4f0d40eb8588c7aa84a01c.jpg', 'https://goo.gl/maps/6VNKSMrzkmj1CBty6', '', ''),
(18, 'Warung Kopi Cak Tanto', '2023-04-30 13:46:06', '2', 'Cak Tanto', '-', '<p class=\"MsoNormal\"><span lang=\"IN\">Warung Kopi Cak\r\nTanto adalah sebuah usaha kecil menengah yang berlokasi di Kantin Pasar Gunung\r\nAnyar. Warung ini menawarkan berbagai jenis kopi yang berkualitas dan lezat,\r\nserta minuman lain seperti susu, es teh, dan pop ice yang cocok untuk menemani\r\nhidangan. Selain minuman, Warung Kopi Cak Tanto juga menyediakan rokok dan\r\nmakanan ringan lainnya.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Warung ini\r\nmerupakan pilihan yang tepat bagi Pengunjung yang mencari tempat bersantai\r\nsambil menikmati secangkir kopi atau minuman segar di Kantin Pasar Gunung\r\nAnyar. Warung Kopi Cak Tanto menawarkan suasana yang nyaman dan santai, dengan\r\nlayanan yang ramah dan profesional.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Pengunjung dapat\r\nmemilih berbagai jenis kopi seperti kopi tubruk, kopi susu, atau kopi latte,\r\nyang semuanya disajikan dengan biji kopi berkualitas tinggi. Minuman susu, es\r\nteh, dan pop ice juga tersedia dalam berbagai varian, dan dapat dinikmati baik\r\ndalam suasana hangat maupun dingin.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Selain minuman,\r\nWarung Kopi Cak Tanto juga menyediakan berbagai jenis rokok dan makanan ringan\r\nyang cocok untuk menemani secangkir kopi atau minuman lainnya. Pengunjung dapat\r\nmemilih dari berbagai jenis rokok dan cemilan seperti kerupuk, kacang, atau\r\ngorengan yang dijamin lezat.</span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span lang=\"IN\">Warung Kopi Cak\r\nTanto adalah tempat yang cocok untuk menikmati hidangan ringan dan minuman\r\nsegar dengan suasana santai dan nyaman di Kantin Pasar Gunung Anyar. Selain\r\nitu, dengan membeli di Warung Kopi Cak Tanto, Pengunjung juga turut mendukung\r\nusaha kecil menengah dan membantu memajukan ekonomi lokal.<o></o></span></p>', 'Kantin Pasar Gunung Anyar', '', '', '', '', 'Y', '377e28cf555fa5b5cc1657fea5d96571.jpg', 'https://goo.gl/maps/6VNKSMrzkmj1CBty6', '', ''),
(19, 'Sate Ayam Madura', '2023-04-30 13:54:09', '2', 'Pak Madura', '-', '<p class=\"MsoNormal\"><span lang=\"IN\">UMKM Sate Ayam\r\nMadura adalah sebuah usaha kecil menengah yang terletak di Kantin Pasar Gunung\r\nAnyar. UMKM ini terkenal dengan hidangan sate ayam Madura yang lezat dan\r\nmenjadi favorit bagi pengunjung pasar. Selain sate ayam, UMKM Sate Ayam Madura\r\njuga menyediakan lontong atau nasi sebagai pelengkap.</span></p><p class=\"MsoNormal\"><span lang=\"IN\">Hidangan sate\r\nayam Madura di UMKM ini disajikan dengan bumbu kacang yang kaya rasa dan\r\nrempah-rempah yang khas. Potongan ayam yang empuk dan lembut ditusuk pada\r\ntusukan bambu, kemudian dibakar di atas arang yang menyala hingga matang\r\nsempurna. Sate ayam Madura biasanya dinikmati dengan lontong atau nasi, dan\r\ndisajikan dengan irisan mentimun, bawang goreng, dan sambal khas Madura yang\r\npedas dan gurih.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Selain hidangan\r\nsate ayam Madura, UMKM ini juga menyediakan lontong atau nasi sebagai\r\npelengkap. Pengunjung dapat memilih antara nasi atau lontong sebagai pendamping\r\nhidangan sate ayam Madura yang lezat.<o></o></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span lang=\"IN\">UMKM Sate Ayam\r\nMadura adalah pilihan yang tepat bagi Pengunjung yang mencari hidangan sate\r\nayam yang lezat dan terjangkau di Kantin Pasar Gunung Anyar. Dengan bumbu yang\r\nkhas dan rasa yang lezat, hidangan sate ayam Madura di UMKM ini akan memuaskan\r\nselera Pengunjung. Selain itu, dengan membeli di UMKM Sate Ayam Madura, Pengunjung\r\njuga turut mendukung usaha kecil menengah dan membantu memajukan ekonomi lokal.<o></o></span></p>', 'Kantin Pasar Gunung Anyar', '', '', '', '', 'Y', 'd7fce0efaeae1784c50dd8c95900bc30.jpg', 'https://goo.gl/maps/6VNKSMrzkmj1CBty6', '', ''),
(20, 'Warung Arion', '2023-04-30 13:59:24', '2', 'Bu Arion', '-', '<p class=\"MsoNormal\"><span lang=\"IN\">Warung Arion\r\nadalah sebuah usaha kecil menengah yang berlokasi di Kantin Pasar Gunung Anyar.\r\nUMKM ini menyediakan berbagai macam makanan dengan harga yang terjangkau, yaitu\r\nserba 10.000. Pengunjung dapat menikmati berbagai jenis hidangan mulai dari\r\nayam geprek, ayam bakar, ayam katsu, steak ayam, hingga mie nyemek dengan harga\r\nyang sangat terjangkau.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Hidangan ayam\r\ngeprek yang disajikan di Warung Arion adalah salah satu hidangan yang paling\r\nterkenal dan menjadi favorit di kalangan pengunjung pasar. Ayam geprek\r\ndisajikan dengan tambahan bumbu pedas yang khas dan rempah-rempah yang\r\nmemberikan rasa yang gurih dan lezat. Selain ayam geprek, Warung Arion juga\r\nmenyediakan ayam bakar, ayam katsu, dan steak ayam yang juga menjadi pilihan\r\nhidangan yang populer di kalangan pelanggan.<o></o></span></p><p class=\"MsoNormal\"><span lang=\"IN\">Untuk\r\npelengkapnya, UMKM Warung Arion juga menyediakan mie nyemek yang lezat dan\r\nsegar, serta aneka jus dan es teh sebagai minuman yang menyegarkan. Pengunjung\r\ndapat menikmati hidangan yang lengkap dan nikmat di Warung Arion dengan harga\r\nyang sangat terjangkau.<o></o></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span lang=\"IN\">UMKM Warung Arion\r\nadalah pilihan yang tepat bagi Pengunjung yang mencari hidangan yang lezat dan\r\nterjangkau di Kantin Pasar Gunung Anyar. Dengan berbagai pilihan hidangan mulai\r\ndari ayam geprek, ayam bakar, ayam katsu, steak ayam, mie nyemek, dan aneka jus\r\nserta es teh, Warung Arion akan memuaskan selera Pengunjung. Selain itu, dengan\r\nmembeli di Warung Arion, Pengunjung juga turut mendukung usaha kecil menengah\r\ndan membantu memajukan ekonomi lokal.<o></o></span></p>', 'Kantin Pasar Gunung Anyar', '', '', '', '', 'Y', 'ae444dfa4c1264c3266b9c96480cceb9.jpg', 'https://goo.gl/maps/6VNKSMrzkmj1CBty6', '', ''),
(22, 'Baru', '2023-05-04 14:48:15', '2', '-', 'Tidak Memiliki NIB', '<p>asda</p>', '', '', '', '', '', 'Y', '8a4a128369382c183f639b80fb77dcd8.jpeg', '', '', ''),
(23, 'Te', '2023-05-04 14:49:22', '1', 'tes', 'Tidak Memiliki NIB', '<p>-</p>', '', '', '', '', '', 'Y', 'd517716aed98684ffaac0b7b0ba28a0e.jpeg', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$QUM2OeQCZclQqJIhZKKMt.Aq8dA3Y7eIzjtXsyr.xuE0kDjfj8SLS', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1683210059, 1, 'Garsans', 'News', NULL, '0123456789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(37, 1, 1),
(38, 1, 2);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_rt`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_rt` (
`id` int(11)
,`rt` varchar(10)
,`id_rw` int(11)
,`rw` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_rw`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_rw` (
`id` int(11)
,`rw` varchar(10)
,`jumlah_umkm` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_umkm`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_umkm` (
`id` int(11)
,`nama_umkm` varchar(100)
,`created_at` timestamp
,`id_rt` varchar(10)
,`pemilik` varchar(100)
,`nib` varchar(100)
,`deskripsi` text
,`lokasi` text
,`whatsapp` text
,`shopee` text
,`tokopedia` text
,`facebook` text
,`status` char(1)
,`cover` text
,`link_gmaps` text
,`grab` text
,`gojek` text
,`rt` varchar(10)
,`rw` varchar(10)
,`id_rw` int(11)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_rt`
--
DROP TABLE IF EXISTS `view_rt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rt`  AS SELECT `rt`.`id` AS `id`, `rt`.`rt` AS `rt`, `rt`.`id_rw` AS `id_rw`, `rw`.`rw` AS `rw` FROM (`rt` join `rw` on((`rw`.`id` = `rt`.`id_rw`)))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_rw`
--
DROP TABLE IF EXISTS `view_rw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rw`  AS SELECT `rw`.`id` AS `id`, `rw`.`rw` AS `rw`, count(`umkm`.`id`) AS `jumlah_umkm` FROM ((`rw` left join `rt` on((`rw`.`id` = `rt`.`id_rw`))) left join `umkm` on((`rt`.`id` = `umkm`.`id_rt`))) GROUP BY `rw`.`id``id`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_umkm`
--
DROP TABLE IF EXISTS `view_umkm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_umkm`  AS SELECT `umkm`.`id` AS `id`, `umkm`.`nama_umkm` AS `nama_umkm`, `umkm`.`created_at` AS `created_at`, `umkm`.`id_rt` AS `id_rt`, `umkm`.`pemilik` AS `pemilik`, `umkm`.`nib` AS `nib`, `umkm`.`deskripsi` AS `deskripsi`, `umkm`.`lokasi` AS `lokasi`, `umkm`.`whatsapp` AS `whatsapp`, `umkm`.`shopee` AS `shopee`, `umkm`.`tokopedia` AS `tokopedia`, `umkm`.`facebook` AS `facebook`, `umkm`.`status` AS `status`, `umkm`.`cover` AS `cover`, `umkm`.`link_gmaps` AS `link_gmaps`, `umkm`.`grab` AS `grab`, `umkm`.`gojek` AS `gojek`, `rt`.`rt` AS `rt`, `rw`.`rw` AS `rw`, `rt`.`id_rw` AS `id_rw` FROM ((`umkm` join `rt` on((`umkm`.`id_rt` = `rt`.`id`))) join `rw` on((`rw`.`id` = `rt`.`id_rw`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `album_umkm`
--
ALTER TABLE `album_umkm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `identity`
--
ALTER TABLE `identity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posting`
--
ALTER TABLE `posting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rt`
--
ALTER TABLE `rt`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rw`
--
ALTER TABLE `rw`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `umkm`
--
ALTER TABLE `umkm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `album_umkm`
--
ALTER TABLE `album_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT untuk tabel `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `identity`
--
ALTER TABLE `identity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `posting`
--
ALTER TABLE `posting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT untuk tabel `rt`
--
ALTER TABLE `rt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `rw`
--
ALTER TABLE `rw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `umkm`
--
ALTER TABLE `umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
