--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO mosaic;

--
-- Name: challenges; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE challenges (
    id integer NOT NULL,
    description text,
    name character varying,
    is_locked boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tags text,
    category character varying,
    points integer DEFAULT 1,
    submissions_count integer,
    comments_count integer DEFAULT 0
);


ALTER TABLE challenges OWNER TO mosaic;

--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: mosaic
--

CREATE SEQUENCE challenges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE challenges_id_seq OWNER TO mosaic;

--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mosaic
--

ALTER SEQUENCE challenges_id_seq OWNED BY challenges.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE comments (
    id integer NOT NULL,
    body text,
    user_id integer,
    commentable_type character varying,
    commentable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parent_id integer,
    cached_user_name character varying,
    cached_user_email character varying
);


ALTER TABLE comments OWNER TO mosaic;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: mosaic
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO mosaic;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mosaic
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO mosaic;

--
-- Name: submissions; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE submissions (
    id integer NOT NULL,
    challenge_id integer,
    user_id integer,
    is_private boolean DEFAULT false,
    approved_at timestamp without time zone,
    denied_at timestamp without time zone,
    url character varying,
    content text,
    points integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    cached_votes_total integer DEFAULT 0,
    cached_votes_score integer DEFAULT 0,
    cached_votes_up integer DEFAULT 0,
    cached_votes_down integer DEFAULT 0,
    cached_weighted_score integer DEFAULT 0,
    cached_weighted_total integer DEFAULT 0,
    cached_weighted_average double precision DEFAULT 0.0,
    cached_username character varying,
    cached_user_ids_liked text,
    comments_count integer DEFAULT 0
);


ALTER TABLE submissions OWNER TO mosaic;

--
-- Name: submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mosaic
--

CREATE SEQUENCE submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submissions_id_seq OWNER TO mosaic;

--
-- Name: submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mosaic
--

ALTER SEQUENCE submissions_id_seq OWNED BY submissions.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_type character varying,
    taggable_id integer,
    tagger_type character varying,
    tagger_id integer,
    context character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE taggings OWNER TO mosaic;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: mosaic
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggings_id_seq OWNER TO mosaic;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mosaic
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0
);


ALTER TABLE tags OWNER TO mosaic;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: mosaic
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO mosaic;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mosaic
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    username character varying,
    cached_submission_points text,
    cached_points integer DEFAULT 0,
    purchases text
);


ALTER TABLE users OWNER TO mosaic;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mosaic
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO mosaic;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mosaic
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: mosaic
--

CREATE TABLE votes (
    id integer NOT NULL,
    votable_type character varying,
    votable_id integer,
    voter_type character varying,
    voter_id integer,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE votes OWNER TO mosaic;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: mosaic
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO mosaic;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mosaic
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY challenges ALTER COLUMN id SET DEFAULT nextval('challenges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY submissions ALTER COLUMN id SET DEFAULT nextval('submissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-07-02 04:13:14.835245	2016-07-02 04:13:14.835245
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY challenges (id, description, name, is_locked, created_at, updated_at, tags, category, points, submissions_count, comments_count) FROM stdin;
22	Here are a few CSS features that you won't use as much, but are fun to know about.\r\n\r\n## `:hover`\r\n\r\n`:hover` is a [psuedo-class](http://www.w3schools.com/css/css_pseudo_classes.asp) that lets you define a different set of properties for when your mouse hovers over an element. It works like this?\r\n\r\n```html\r\nWhat did one lawyer say to the other lawyer? <span class="answer">We are both lawyers</span>.\r\n```\r\n\r\n```css\r\n.answer{\r\n  color: black;\r\n  background-color: black;\r\n}\r\n\r\n.answer:hover{\r\n  color: white;\r\n}\r\n```\r\n\r\n<style>.answer{color: black;background-color: black;} .answer:hover{color: white;}</style>\r\n\r\n> What did one lawyer say to the other lawyer? <span class="answer">We are both lawyers</span>\r\n\r\n---\r\n\r\n## `cursor`\r\n\r\n`cursor` lets you change what your mouse looks like when you hover over an element. It works like this:\r\n\r\n```html\r\n<ul>\r\n  <li style="cursor: crosshair">crosshair</li>\r\n  <li style="cursor: grab">grab</li>\r\n  <li style="cursor: help">help</li>\r\n  <li style="cursor: not-allowed">not-allowed</li>\r\n  <li style="cursor: s-resize">s-resize</li>\r\n</ul>\r\n```\r\n\r\n> <ul><li style="cursor: crosshair">crosshair</li><li style="cursor: wait">wait</li><li style="cursor: help">help</li><li style="cursor: not-allowed">not-allowed</li><li style="cursor: s-resize">s-resize</li></ul>\r\n\r\n---\r\n\r\n## `float`\r\n\r\n`float` pulls elements over to the right or left:\r\n\r\n```html\r\n<span style="float: right">5 points</span>\r\n<b>Challenge #5</b>\r\n```\r\n\r\n> <span style="float: right">5 points</span><b>Challenge #5</b>\r\n\r\n`float` is commonly used to make [complex CSS layouts](https://css-tricks.com/all-about-floats/), but it's usually easier to do this with [flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/).\r\n\r\n---\r\n\r\n## `animation`\r\n\r\n`animation` lets you change CSS properties over time:\r\n\r\n```css\r\n@keyframes example {\r\n    from {background-color: white; width: 200px; height: 100px;}\r\n    to {background-color: red; width: 400px; height: 200px;}\r\n}\r\n\r\n#animate-me {\r\n    background-color: white;\r\n    width: 200px;\r\n    height: 100px;\r\n    border: 1px solid black;\r\n}\r\n\r\n#animate-me:hover{\r\n    animation-name: example;\r\n    animation-duration: 4s;\r\n}\r\n```\r\n\r\n```html\r\n<div id="animate-me">Heat me up with your mouse</div>\r\n```\r\n\r\n<style>@keyframes example {from {background-color: white; width: 200px; height: 100px;}to {background-color: red; width: 400px; height: 200px;}}#animate-me {background-color: white;width: 200px;height: 100px;border: 1px solid black;}#animate-me:hover{animation-name: example;animation-duration: 4s;}</style>\r\n\r\n> <div id="animate-me">Heat me up with your mouse</div>\r\n\r\nCSS animations can get [pretty crazy](http://webdesignerwall.com/trends/47-amazing-css3-animation-demos). Here's a [CSS3 Animation Guide](http://www.w3schools.com/css/css3_animations.asp).\r\n\r\n---\r\n\r\n## `background-image`\r\n\r\nJust like `background-color`, but with an image.\r\n\r\nI'll use an image from [subtle patterns](http://subtlepatterns.com/): https://res.cloudinary.com/genco/image/upload/v1469719540/cheap_diagonal_fabric_l8wlyr.png\r\n\r\n```css\r\n#title{\r\n  background-image: url(https://res.cloudinary.com/genco/image/upload/v1469719540/cheap_diagonal_fabric_l8wlyr.png);\r\n  padding: 50px;\r\n  font-weight: 100;\r\n  font-size: 50pt;\r\n}\r\n```\r\n\r\n```html\r\n<h1 id="title">Poems</h1>\r\n```\r\n\r\n> <h1 style="background-image:url(https://res.cloudinary.com/genco/image/upload/v1469719540/cheap_diagonal_fabric_l8wlyr.png); padding: 50px; font-weight: 100; font-size: 50pt;">Poems</h1>\r\n\r\n---\r\n\r\n*  filter, background-image, background gradient; \r\n\r\n---\r\n\r\n## Resources\r\n\r\n* http://www.w3schools.com/cssref/default.asp\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake a surprising page that uses at least two CSS features from this page.	9 Random CSS properties	t	2016-07-25 23:49:34.088221	2016-07-28 16:43:18.631441	\N	01 CSS	15	0	0
4	To make something bold, surround it by `<b>` and `</b>`, like this:\r\n\r\n```html\r\n<!DOCTYPE html>\r\n<html>\r\n<head>\r\n  <meta charset="utf-8">\r\n  <meta name="viewport" content="width=device-width">\r\n  <title>JS Bin</title>\r\n</head>\r\n<body>\r\nI am very <b>angry!</b>\r\n</body>\r\n</html>\r\n```\r\n\r\n(make sure to put your new code between the `<body>` and `</body>` tags or it might break)\r\n\r\nIt'll look like this:\r\n\r\n> I am very **angry!**\r\n\r\nTo pass this challenge, write a short story where one of the characters is **yelling**, host it on [jsbin](http://jsbin.com), [HTML House](https://html.house), [CodePen](http://codepen.io/), or [JSFiddle](https://jsfiddle.net/), then paste the URL in the solution box above.\r\n\r\n*Note: you can also use the `<strong>` tag - it does the same thing*	2 The bold tag	f	2016-07-15 00:13:48.813214	2016-07-24 17:19:41.947659	\N	00 HTML	5	13	0
28	Derek Sivers is a very successful entrepreneur and human. Here's his bio:\r\n\r\n> Originally a professional musician and circus clown, Derek Sivers created CD Baby in 1998.\r\n> It became the largest seller of independent music online, with $100M in sales for 150,000 musicians.\r\n> In 2008, Derek sold CD Baby for $22M, giving the proceeds to a charitable trust for music education.\r\n> He is a frequent speaker at the TED Conference, with over 5 million views of his talks.\r\n> Since 2011 he has published 34 books, including “Anything You Want” which shot to #1 on all of its Amazon categories.\r\n\r\n## Challenge\r\n\r\nAnswer the following questions based on Derek Sivers' blog:\r\n\r\n* What does Derek Sivers believe [ideas are worth](http://sivers.org/multiply)? \r\n* What's the best way to come up with (amazing ideas)[http://sivers.org/obvious]?	20 Derek Sivers on Ideas	f	2016-07-26 02:01:47.774716	2016-07-26 02:01:47.774716	\N	09 Business	20	0	0
21	It's useful to select individual HTML tags individually or as a group to give them special styles.\r\n\r\nIt would be hard to use a different tag for each thing you want to select (especially if you just want to use `div` and `span`), so coders made up a way for you to give your HTML tags names.\r\n\r\nThere are two kinds of HTML tag names: `class` and `id`.\r\n\r\n---\r\n\r\n## `class`\r\n\r\nGive HTML elements a class, like this:\r\n\r\n```html\r\n<div class="joke">\r\n  What did one wall say to the other wall? "Whoa a talking wall."\r\n</div>\r\n```\r\n\r\nand you can select it in CSS with a `.` like this:\r\n\r\n```css\r\n.joke {\r\n  background-color: green;\r\n  border: 5px dashed yellow;\r\n  color: white;\r\n  margin-bottom: 10px;\r\n}\r\n```\r\n\r\n<style>\r\n.joke {\r\n  background-color: green;\r\n  border: 5px dashed yellow;\r\n  color: white;\r\n  margin-bottom: 10px;\r\n}\r\n</style>\r\n\r\n> <div class="joke">What did one wall say to the other wall? "Whoa a talking wall."</div>\r\n\r\nThe cool thing about classes is that you can apply them to any HTML element, so this will work too:\r\n\r\n```html\r\n<h1 class="joke">Funny jokes</h1>\r\n<div class="joke">\r\n  What did one wall say to the other wall? "Whoa a talking wall."\r\n</div>\r\n```\r\n\r\n> <h1 class="joke">Funny jokes</h1><div class="joke">What did one wall say to the other wall? "Whoa a talking wall.</div>\r\n\r\n<mark>Spaces don't work in class names</mark>. If you try to do something like `<span class="super awesome">lol</span>` and `super awesome{color: red}` it won't work, because browsers will think you're trying to do something else.\r\n\r\n---\r\n\r\n## `id`\r\n\r\n`id` works just like `class`, but it should only be used to identify **a single HTML element**. It also uses the hashtag `#` instead of the `.` in the CSS selector, like this:\r\n\r\n```html\r\n<h1 id="main-title">A Website About Corn</h1>\r\n```\r\n\r\n```css\r\n#main-title {\r\n  font-weight: bold;\r\n  color: yellow;\r\n  background-color: black;\r\n}\r\n```\r\n\r\n> <h1 style="font-weight: bold;  color: yellow; background-color: black;">A Website About Corn</h1>\r\n\r\nJust like in classes, <mark>spaces don't work in id names</mark>.\r\n\r\n---\r\n\r\n## Resources\r\n\r\n* [CSS Selectors](http://www.w3schools.com/cssref/css_selectors.asp)\r\n* [Getting started with CSS Selectors](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors)\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nStyle the `.apples` and `.bananas` classes:\r\n\r\n```html\r\nI like to eat eat eat \r\n<strong class="apples">apples</strong> and\r\n<strong class="bananas">bananas</strong>.<br>\r\nI like to eat eat eat \r\n<strong class="apples">apples</strong> and\r\n<strong class="bananas">bananas</strong>.<br>\r\nI like to ate ate ate \r\n<strong class="apples">ay-ples</strong> and\r\n<strong class="bananas">bay-nay-nays</strong>.<br>\r\nI like to ate ate ate \r\n<strong class="apples">ay-ples</strong> and\r\n<strong class="bananas">bay-nay-nays</strong>.<br>\r\nI like to eet eet eet\r\n<strong class="apples">ee-ples</strong> and\r\n<strong class="bananas" id="favorite">bee-nee-nees</strong>.<br>\r\nI like to eet eet eet\r\n<strong class="apples">ee-ples</strong> and\r\n<strong class="bananas">bee-nee-nees</strong>.<br>\r\nI like to ite ite ite\r\n<strong class="apples">i-ples</strong> and\r\n<strong class="bananas">by-by-nys</strong>.<br>\r\nI like to ite ite ite\r\n<strong class="apples">i-ples</strong> and\r\n<strong class="bananas">by-by-nys</strong>.<br>\r\nI like to ote ote ote\r\n<strong class="apples">oh-ples</strong> and\r\n<strong class="bananas">bo-no-nos</strong>.<br>\r\nI like to ote ote ote\r\n<strong class="apples">oh-ples</strong> and\r\n<strong class="bananas">bo-no-nos</strong>.<br>\r\nI like to ute ute ute\r\n<strong class="apples">uupples</strong> and\r\n<strong class="bananas">bununus</strong>.<br>\r\nI like to ute ute ute\r\n<strong class="apples">uupples</strong> and\r\n<strong class="bananas">bununus</strong>.\r\n```\r\n\r\n"bee-nee-nees" was always my favorite line, so I gave it an id of `favorite`. Make sure it stands out.	7 id and class	f	2016-07-25 23:48:52.285743	2016-07-27 21:10:45.178078	\N	01 CSS	10	0	0
6	Header tags make text big, like this:\r\n\r\n> # I am a header tag!\r\n\r\nMake header tags like this:\r\n\r\n```html\r\n<h1>I am a header tag!</h1>\r\n```\r\n\r\nYou can also make smaller header tags like this:\r\n\r\n```html\r\n<h2>H2 tag</h2>\r\n<h3>H3 tag</h3>\r\n<h4>H4 tag</h4>\r\n```\r\n\r\nThey will look like this: \r\n\r\n> ## H2 Tag\r\n> ### H3 Tag\r\n> #### H4 Tag\r\n\r\nMake a web page that uses header tags to say what the page is about, then paste the URL below.\r\n\r\n---\r\n\r\n## More Resources\r\n\r\n* [Khan Academy HTML Basics](https://www.khanacademy.org/computing/computer-programming/html-css/intro-to-html/p/html-basics)\r\n* [W3 Schools HTML Headings](http://www.w3schools.com/html/html_headings.asp)	3 Header tags	f	2016-07-24 17:13:43.137258	2016-07-25 00:45:01.229829	\N	00 HTML	5	16	0
12	Take everything you've learned about HTML and make one website about anything you want. You can use as many tags as you want, and your website can be about anything you want.\r\n\r\nHere are some project ideas:\r\n\r\n* Your favorite animal\r\n* A biography of you\r\n* Your summer vacation\r\n*  The causes and consequences of the Green Revolution in the period from 1945 to the present\r\n* Your favorite food	99 HTML Final Project	f	2016-07-24 20:14:43.470398	2016-07-25 01:31:24.149611	\N	00 HTML	50	16	0
7	You can make text:\r\n\r\n* *italic* with the `<i>` or `<em>` tags\r\n* <u>underlined</u> with the `<u>` tag\r\n* <s>struck through</s> with the `<s>` tag.\r\n\r\nYou can also <i>mix <u>these <s>together</s></u></i> by nesting the tags:\r\n\r\n```html\r\n <i>mix <u>these <s>together</s></u></i>\r\n```\r\n\r\nIt's important when nesting tags that you close them in the reverse order you opened them, like this:\r\n\r\n```html\r\n<b><i>This is right</i></b>\r\n```\r\n\r\n**Not** like this:\r\n\r\n```html\r\n<b><i>This is wrong</b></i>\r\n```\r\n\r\nIf you close your tags in the wrong order, weird stuff will start to happen (not right now when things are simple, but later on when your code is more complicated).\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake a web page that uses a mix of the *italic*, <u>underline</u>, and <s>strike</s> tags, and <i><u>mix some of them together</u></i>.\r\n\r\n---\r\n\r\n## Resources\r\n\r\n* [The i tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/i) and [the em tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/em)\r\n* [The u tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/u)\r\n* [The s tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/s)\r\n* [Nesting tags](http://www.bu.edu/tech/services/comm/websites/www/non-wordpress/start/html-introduction/syntax/nesting-tags/)	4 Italic, Underline, and Strike	f	2016-07-24 17:31:13.676885	2016-07-24 17:32:56.028039	\N	00 HTML	5	12	0
10	## Lists\r\n\r\nLists have a parent tag (either unordered list - `<ul>` - or ordered list - `<ol>`) and many child tags (`<li>` - list item)\r\n\r\nUnordered lists look like this:\r\n\r\n```html\r\n<ul>\r\n  <li>Eggs</li>\r\n  <li>Carrots</li>\r\n  <li>Broccoli</li>\r\n</ul>\r\n```\r\n\r\n> <ul><li>Eggs</li><li>Carrots</li><li>Broccoli</li></ul>\r\n\r\nOrdered lists look like this:\r\n\r\n```html\r\n<ol>\r\n  <li>Eggs</li>\r\n  <li>Carrots</li>\r\n  <li>Broccoli</li>\r\n</ol>\r\n```\r\n\r\n> <ol><li>Eggs</li><li>Carrots</li><li>Broccoli</li></ol>\r\n\r\nIn ordered lists, the browser automatically adds the numbers for you.\r\n\r\n## Tables\r\n\r\nTables have many parts. Here's what they look like:\r\n\r\n```html\r\n<table>\r\n  <thead>\r\n    <tr>\r\n      <th>Pokedex</th>\r\n      <th>Name</th>\r\n      <th>Type</th>\r\n    </tr>\r\n  </thead>\r\n  <tbody>\r\n    <tr>\r\n      <td>1</td>\r\n      <td>Bulbasaur</td>\r\n      <td>Grass/Poison</td>\r\n    </tr>\r\n    <tr>\r\n      <td>2</td>\r\n      <td>Charmander</td>\r\n      <td>Fire</td>\r\n    </tr>\r\n    <tr>\r\n      <td>3</td>\r\n      <td>Squirtle</td>\r\n      <td>Water</td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n```\r\n\r\n> <table class="table"><thead><tr><th>Pokedex</th><th>Name</th><th>Type</th></tr></thead><tbody><tr><td>1</td><td>Bulbasaur</td><td>Grass/Poison</td></tr><tr><td>2</td><td>Charmander</td><td>Fire</td></tr><tr><td>3</td><td>Squirtle</td><td>Water</td></tr></tbody></table>\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake a list and/or table of some useful information. Bonus points for embedding images and links.	7 Lists and tables	f	2016-07-24 18:55:13.636818	2016-07-25 23:50:23.927875	\N	00 HTML	6	12	0
25	## Challenge\r\n\r\nSummarize Start Small, Stay Small Chapter 2: Why Niches are the Name of the Game.	2 Start Small, Stay Small Chapter 2: Why Niches are the Name of the Game	f	2016-07-26 01:37:52.194164	2016-07-26 01:37:52.194164	\N	09 Business	20	0	0
26	## Challenge\r\n\r\nSummarize Start Small Stay Small Chapter 3: Your Product.	3 Start Small Stay Small Chapter 3: Your Product	f	2016-07-26 01:43:26.124781	2016-07-26 01:43:26.124781	\N	09 Business	20	0	0
23	You have two choices for your final CSS project:\r\n\r\n## 1. Style CSS Zen Garden\r\n\r\nRemember [CSS Zen Garden](http://www.csszengarden.com/)?\r\n\r\nYou now know enough CSS to style [the HTML from that page](http://jsbin.com/viqivisece/edit?html,css,output). \r\n\r\nStealing inspiration from existing CSS Zen Garden templates is strongly encouraged.\r\n\r\n## 2. Style your final HTML project\r\n\r\nTake your final HTML project and add CSS rules to make it look better.\r\n\r\nFor inspiration of what "better" is, take another look at [Web Design in 4 Minutes](http://jgthms.com/web-design-in-4-minutes) and [CSS Zen Garden](http://www.csszengarden.com/).	99 CSS Final Project	f	2016-07-26 00:02:58.397665	2016-07-27 14:53:01.379835	\N	01 CSS	75	0	0
19	There are two HTML elements I haven't told you about, because they wouldn't make sense until now. \r\n\r\nThese elements are `div` and `span`. They wouldn't make sense because they don't do anything on their own - they're just boxes you can put around things to group them together. \r\n\r\nWith combined with CSS, though, you can do some pretty interesting things. \r\n\r\n## span \r\n\r\nIn the following examples, I'll be using this HTML: \r\n\r\n```html \r\nI can't get enough <span>tacos</span>. \r\n``` \r\n\r\n`span` is usually used for a piece of text inside of something. You can make it pretend to be a `<b>`: \r\n\r\n```css \r\nspan{ \r\n  font-weight: bold; \r\n} \r\n``` \r\n\r\n> I can't get enough <span style="font-weight: bold">tacos</span>. \r\n\r\nor an  `<i>`: \r\n\r\n```css \r\nspan{ \r\n  font-style: italic; \r\n} \r\n``` \r\n \r\n> I can't get enough <span style="font-style: italic">tacos</span>. \r\n \r\nor both: \r\n \r\n```css \r\nspan{ \r\n  font-style: italic; \r\n  font-weight: bold; \r\n} \r\n``` \r\n \r\n> I can't get enough <span style="font-style: italic; font-weight: bold">tacos</span>. \r\n \r\nIt doesn't have any default style, so you can make it whatever you want it to be. \r\n \r\n ---\r\n \r\n## div \r\n \r\nIn the following examples, I'll be using this HTML: \r\n \r\n```html \r\n<div>I can't get enough tacos.</div> \r\n``` \r\n \r\n`div`s are just like `span`s, but for putting boxes around other things. \r\n \r\nYou can make the box red: \r\n \r\n```css \r\ndiv{ \r\n  background-color: red; \r\n} \r\n``` \r\n\r\n> <div style="background-color: red;">I can't get enough tacos.</div>\r\n\r\nOr anything you could do with a `span`:\r\n\r\n```css \r\ndiv{ \r\n  font-weight: 100;\r\n} \r\n``` \r\n\r\n> <div style="font-weight: 100;">I can't get enough tacos.</div>\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake this HTML:\r\n\r\n```html\r\n<div>I <span>love</span> cake and <span>ice-cream</span></div>\r\n```\r\n\r\nlook like this:\r\n\r\n![Screen Shot 2016-07-25 at 7.12.32 PM](https://res.cloudinary.com/genco/image/upload/v1469491970/Screen_Shot_2016-07-25_at_7.12.32_PM_xus2px.png)\r\n\r\n<!-- psst: http://jsbin.com/juteqo/edit?html,css,output -->\r\n\r\nwithout editing the HTML.	6 div and span	f	2016-07-25 21:48:13.968615	2016-07-26 00:13:28.636384	\N	01 CSS	8	1	0
24	"Start Small, Stay Small" is the best book I've read for learning how to go from making things to making businesses.\r\n\r\nHere's the intro:\r\n\r\n> Start Small, Stay Small is a step-by-step guide to launching a self-funded startup. If you're a desktop, mobile or web developer, this book is your blueprint to getting your startup off the ground with no outside investment. This book intentionally avoids topics restricted to venture-backed startups such as: honing your investment pitch, securing funding, and figuring out how to use the piles of cash investors keep placing in your lap. This book assumes: \r\n> * You don't have $6M of investor funds sitting in your bank account \r\n> * You're not going to relocate to the handful of startup hubs in the world \r\n> * You're not going to work 70 hour weeks for low pay with the hope of someday making millions from stock options \r\n>\r\n> There's nothing wrong with pursuing venture funding and attempting to grow fast like Amazon, Google, Twitter, and Facebook. It just so happened that most people are not in a place to do this. \r\n> Start Small, Stay Small also focuses on the single most important element of a startup that most developers avoid: marketing. There are many great resources for learning how to write code, organize source control, or connect to a database. This book does not cover the technical aspects developers already know or can learn elsewhere. It focuses on finding your idea, testing it before you build, and getting it into the hands of your customers.\r\n\r\nIt retails for [$20.68 on Amazon](https://www.amazon.com/Start-Small-Stay-Developers-Launching/dp/0615373968). Here it is for free:\r\n\r\n* [start small stay small rob walling.epub](https://s3.amazonaws.com/gen.co/books/start+small+stay+small+rob+walling.epub)\r\n* [start small stay small.mobi](https://s3.amazonaws.com/gen.co/books/start+small+stay+small.mobi)\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nSummarize chapter 1: The Chasm Between Developer and Entrepreneur.	1 Start Small, Stay Small Chapter 1: The Chasm Between Developer and Entrepreneur	f	2016-07-26 01:33:58.260829	2016-07-26 01:36:16.833707	\N	09 Business	20	0	0
15	Here's the most basic example of CSS: changing text color.\r\n\r\nWith this HTML:\r\n\r\n```html\r\n<h1>Black is my favorite color</h1>\r\n```\r\n\r\n> <h1>Black is my favorite color</h1>\r\n\r\nYou can add a color like this:\r\n\r\n```html\r\n<h1 style="color: red">Red is my favorite color</h1>\r\n```\r\n\r\n> <h1 style="color: red">Red is my favorite color</h1>\r\n\r\nThe `style` attribute will work on most HTML elements you've learned so far:\r\n\r\n```html\r\n<b style="color: goldenrod"><i>goldenrod is an actual color name</i></b>\r\n```\r\n\r\n> <b style="color: goldenrod"><i>goldenrod is an actual color name</i></b>\r\n\r\nNot every color name will work. Here's [a list of every color name you can use](http://www.w3schools.com/colors/colors_names.asp). You'll learn a way to get any color (and mix colors together) in the next lesson.\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nWrite an advertisement for a candy that comes in different <i style="color: red">c</i><i style="color: orange">o</i><i style="color: yellow">l</i><i style="color: green">o</i><i style="color: blue">r</i><i style="color: purple">s</i>.	1 color	f	2016-07-25 19:18:09.054343	2016-07-25 19:45:05.405775	\N	01 CSS	5	9	0
20	In addition to a `height` and `width`, each HTML element has a `margin` (space around itself), a `border` (line around itself), and `padding` (space between the border and the contents):\r\n\r\n![Screen Shot 2016-07-25 at 6.32.06 PM](https://res.cloudinary.com/genco/image/upload/v1469489550/Screen_Shot_2016-07-25_at_6.32.06_PM_rauf3a.png)\r\n\r\nYou can see (and edit) the box model of any HTML object in Chrome by right clicking on it and selecting "Inspect": \r\n\r\n<img src="https://res.cloudinary.com/genco/image/upload/v1469489488/Screen_Shot_2016-07-25_at_6.30.25_PM_rebswl.png" style="width: 50%" />\r\n\r\nThen, in the developer toolbar, select the "Computed" tab:\r\n\r\n<img src="https://res.cloudinary.com/genco/image/upload/v1469490184/Screen_Shot_2016-07-25_at_6.30.58_PM_cnwafs.png" style="width: 50%" />\r\n\r\nYou can double click any of these values to change them.\r\n\r\n---\r\n\r\n## `border`\r\n\r\n`border`s are really fun:\r\n\r\n```css\r\ndiv{\r\n  border: 1px solid black;\r\n}\r\n```\r\n\r\n> <div style="border: 1px solid black">I can't get enough tacos.</div>\r\n\r\n```css\r\ndiv{\r\n  border: 10px dotted rgb(100, 200, 50);\r\n}\r\n```\r\n\r\n> <div style="border: 10px dotted rgb(100, 200, 50);">I can't get enough tacos.</div>\r\n\r\nIf you want a different `border` on some sides, use `-top`, `-right`, `-bottom`, and `-left` suffixes:\r\n\r\n```css\r\ndiv{\r\n  border-top: 10px dashed blue;\r\n  border-right: 10px solid red;\r\n  border-bottom: 10px dotted green;\r\n  border-left: 10px double yellow;\r\n}\r\n```\r\n\r\n> <div style="border-right: 10px solid red;border-left: 10px double yellow;border-top: 10px dotted blue;border-bottom: 10px dashed green;">I can't get enough tacos.</div>\r\n\r\n---\r\n\r\n## `width` and `height`\r\n\r\n`width` and `height` are exactly what they sound like:\r\n\r\n```html\r\ndiv{\r\n  border: 1px solid black;\r\n  width: 100px;\r\n  height: 200px;\r\n}\r\n```\r\n\r\n> <div style="border: 1px solid black; width: 100px; height: 200px;">I can't get enough tacos</div>\r\n\r\nYou can define them in units of `px`, `em`, `% (percent of the containing element)`, `rem`, `vh` (percent of the window height), and `vw` (percent of the window width). Of these, you'll most likely use `%` the most:\r\n\r\n```html\r\ndiv{\r\n  border: 1px solid black;\r\n  width: 100%;\r\n}\r\n```\r\n\r\n> <div style="border: 1px solid black; width: 100%;">I can't get enough tacos</div>\r\n\r\n---\r\n\r\n## `padding`\r\n\r\nTo get more space on the inside, use `padding`:\r\n\r\n```css\r\ndiv{\r\n  border: 1px solid black;\r\n  padding: 50px;\r\n}\r\n```\r\n\r\n> <div style="border: 1px solid black; padding: 50px;">I can't get enough tacos.</div>\r\n\r\nIf you want different `padding` on each side, use `-top`, `-right`, `-bottom`, and `-left` suffixes:\r\n\r\n```css\r\ndiv{\r\n  border: 1px solid black;\r\n  background-color: rgb(200, 255, 255);\r\n  padding-top: 25px;\r\n  padding-left: 50px;\r\n  padding-bottom: 75px;\r\n  padding-right: 100px;\r\n}\r\n```\r\n\r\n> <div style="border: 1px solid black;background-color: rgb(200, 255, 255); padding: 25px 50px 75px 100px;">I can't get enough tacos. Nor sir. Me and tacos are like a fat kid and cake.</div>\r\n\r\n---\r\n\r\n## `margin`\r\n\r\nTo get more space on the outside, use `margin`:\r\n\r\n```css\r\ndiv{\r\n  border: 1px solid black;\r\n  margin: 50px;\r\n}\r\n```\r\n\r\n> <div style="border: 1px solid black; margin: 50px;">I can't get enough tacos.</div>\r\n\r\nIf you want a different `margin` on each side, use `-top`, `-right`, `-bottom`, and `-left` suffixes:\r\n\r\n```css\r\ndiv{\r\n  border: 1px solid black;\r\n  margin-top: 25px;\r\n  margin-right: 50px;\r\n  margin-bottom: 75px;\r\n  margin-left: 100px;\r\n}\r\n```\r\n\r\n> <div style="border: 1px solid black; margin: 25px 50px 75px 100px;">I can't get enough tacos.</div>\r\n\r\n---\r\n\r\n## `padding` and `margin` Shorthand\r\n\r\n`padding` and `margin` have a [shorthand](http://www.w3schools.com/css/css_padding.asp) to make it easier to give each side a value. This:\r\n\r\n```css\r\ndiv{\r\n  padding-top: 25px;\r\n  padding-right: 50px;\r\n  padding-bottom: 75px;\r\n  padding-left: 100px;\r\n  margin-top: 25px;\r\n  margin-right: 50px;\r\n  margin-bottom: 75px;\r\n  margin-left: 100px;\r\n}\r\n```\r\n\r\nis the same as this:\r\n\r\n```css\r\ndiv{\r\n  padding: 25px 50px 75px 100px;\r\n  margin:  25px 50px 75px 100px;\r\n}\r\n```\r\n\r\n---\r\n\r\n## References\r\n\r\n* [CSS Box Model](http://www.w3schools.com/css/css_boxmodel.asp)\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nUsing only `div`s and CSS, draw a face.	8 Box Model	f	2016-07-25 23:22:03.970214	2016-07-26 00:32:37.616928	\N	01 CSS	15	0	0
3	[jsbin.com](http://jsbin.com/) is a website that makes it easy to write short practice webpages and share them with a URL.\r\n\r\nWhen you open jsbin, it will show you this HTML code (don't worry - you don't need to know what any of this means yet):\r\n\r\n```html\r\n<!DOCTYPE html>\r\n<html>\r\n<head>\r\n  <meta charset="utf-8">\r\n  <meta name="viewport" content="width=device-width">\r\n  <title>JS Bin</title>\r\n</head>\r\n<body>\r\n  \r\n</body>\r\n</html>\r\n```\r\n\r\nand the output will be blank:\r\n\r\n![Screen Shot 2016-07-12 at 10.45.03 PM](https://res.cloudinary.com/genco/image/upload/v1468448498/Screen_Shot_2016-07-12_at_10.45.03_PM_u4cwis.png)\r\n\r\nTo make your first webpage, type something between the `<body>` and `</body>` tags, like this:\r\n\r\n```html\r\n<!DOCTYPE html>\r\n<html>\r\n<head>\r\n  <meta charset="utf-8">\r\n  <meta name="viewport" content="width=device-width">\r\n  <title>JS Bin</title>\r\n</head>\r\n<body>\r\n  Hello world!\r\n</body>\r\n</html>\r\n```\r\n\r\nand your webpage will look something like this:\r\n\r\n![Screen Shot 2016-07-12 at 10.52.32 PM](https://res.cloudinary.com/genco/image/upload/v1468448509/Screen_Shot_2016-07-12_at_10.52.32_PM_cclg2l.png)\r\n\r\nCopy the link to your jsbin (highlight the URL bar and press CTRL+C), paste it in the "solution URL" box above (CTRL+P), then press the blue "Send" button to share your webpage with me (to check it off and give you points) and the rest of the class.\r\n\r\nIf you don't want the rest of the class to see what you made, click the "private" checkbox before sending it.\r\n\r\nAfter you send a solution, you can see what other people have sent under the "Solutions" tab.\r\n\r\nIf you don't like jsbin or it doesn't work, there are a lot of alternatives. Here are a few you can try:\r\n\r\n* [HTML House](https://html.house)\r\n* [CodePen](http://codepen.io/)\r\n* [JSFiddle](https://jsfiddle.net/)	1 First webpage	f	2016-07-13 03:51:31.465832	2016-07-24 20:26:58.901585	\N	00 HTML	1	15	4
17	It can get very boring to keep writing `style="..."` for every HTML element you create:\r\n\r\n```html\r\n<b style="color: red">this</b><br/>\r\n<b style="color: red">code</b><br/>\r\n<b style="color: red">is</b><br/>\r\n<b style="color: red">very</b><br/>\r\n<b style="color: red">messy</b>\r\n```\r\n\r\n> <b style="color: red">this</b><br/><b style="color: red">code</b><br/><b style="color: red">is</b><br/><b style="color: red">very</b><br/><b style="color: red">messy</b>\r\n\r\nIt's also hard to change the color later - you have to change it everywhere you used the color!\r\n\r\nProgrammers are very lazy, so they invented a shortcut way to define the styles for multiple HTML elements at once using **selectors**.\r\n\r\nThe easiest kind of selector is an **element selector**, and it works like this:\r\n\r\n```html\r\n<style>\r\n  b{\r\n    color: red\r\n  }\r\n</style>\r\n  \r\n<b>this</b><br/>\r\n<b>saves</b><br/>\r\n<b>so</b><br/>\r\n<b>much</b><br/>\r\n<b>typing</b>\r\n```\r\n\r\n> <style>b{color: red}</style><b>this</b><br/><b>saves</b><br/><b>so</b><br/><b>much</b><br/><b>typing</b>\r\n\r\nNow, if you want to change the color, you only have to change it in one place:\r\n\r\n```html\r\n<style>\r\n  b{\r\n    color: rgb(100, 100, 50);\r\n  }\r\n</style>\r\n  \r\n<b>this</b><br/>\r\n<b>saves</b><br/>\r\n<b>so</b><br/>\r\n<b>much</b><br/>\r\n<b>typing</b>\r\n```\r\n\r\n> <style>div.two b{color: rgb(100, 100, 50)}</style><div class="two"><b>this</b><br/><b>saves</b><br/><b>so</b><br/><b>much</b><br/><b>typing</b></div>\r\n\r\n## JSBin css tab\r\n\r\nThere are two ways to include CSS in JSBin. You can either include it between `<style>` and `</style>` tags in your HTML, or you can add it to the `CSS` tab and JSBin will automatically include it on your page:\r\n\r\n![Screen Shot 2016-07-25 at 3.16.39 PM](https://res.cloudinary.com/genco/image/upload/v1469477842/Screen_Shot_2016-07-25_at_3.16.39_PM_o2g3cr.png)\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nUse CSS selectors to make this HTML look more colorful (don't edit the HTML - just add some `<style>`):\r\n\r\n```html\r\n<h1>Romeo and Juilet</h1>\r\n<h2>Act I</h2>\r\n<b>SAMPSON</b><br/>\r\n<p>Gregory, o' my word, we'll not carry coals.</p>\r\n<b>GREGORY</b>\r\n<p>No, for then we should be colliers.</p>\r\n<b>SAMPSON</b><br/>\r\n<p>I mean, an we be in choler, we'll draw.</p>\r\n<b>GREGORY</b>\r\n<p>Ay, while you live, draw your neck out o' the collar.</p>\r\n<b>SAMPSON</b><br/>\r\n<p>I strike quickly, being moved.</p>\r\n```	4 Tag selectors	f	2016-07-25 19:51:16.441425	2016-07-25 20:17:57.090689	\N	01 CSS	6	4	0
27	[The Personal MBA](https://personalmba.com) is the best business book I've ever read. It's a summary of over 1,000 business books read by the author, Josh Kaufman.\r\n\r\nJosh is a pretty cool guy:\r\n\r\n![13427836_10153925257264221_6894632551872204337_n](https://res.cloudinary.com/genco/image/upload/v1469497576/13427836_10153925257264221_6894632551872204337_n_zreruf.jpg)\r\n\r\nHe's also extremely effective at obtaining, digesting, and retaining information. \r\n\r\nHe decided an MBA was overpriced, so decided to become a full time reader. He visited the library every day for over a year and learned much more than he would have at an expensive school.\r\n\r\n> “You wasted $150,000 on an education you coulda got for a buck fifty in late charges at the public library.”\r\n> --Will Hunting (played by Matt Damon), Good Will Hunting\r\n\r\nHere's a description of the book from [the book's manifesto](https://personalmba.com/manifesto/):\r\n\r\n> The Personal MBA is a project designed to help you educate yourself about advanced business concepts. This manifesto will show you how to substantially increase your knowledge of business on your own time and with little cost, all without setting foot inside a classroom.\r\n\r\nand the book's introduction:\r\n\r\n> The Personal MBA is an introductory business primer. Its purpose is to give you a clear, comprehensive overview of the most important business concepts in as little time as possible. The vast majority of modern business practice requires little more than common sense, simple arithmetic, and knowledge of a few very important ideas and principles.\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nBased on the book's online content in the links below, answer the following questions:\r\n\r\n* What is [the iron law of the market](https://personalmba.com/iron-law-of-the-market/)?\r\n* What are the most important factors in [evaluating a market](https://personalmba.com/10-ways-to-evaluate-a-market/)?\r\n* What are the easiest/most fun ways you can [provide value](https://personalmba.com/12-standard-forms-of-value/)?\r\n* How do you decide [how much to charge](https://personalmba.com/pricing-uncertainty-principle/)?\r\n* How can you [make more money](https://personalmba.com/4-methods-to-increase-revenue/)? What's the easiest way?	-10 The Personal MBA: Business Concepts	f	2016-07-26 01:53:57.534399	2016-07-26 13:46:48.069621	\N	09 Business	20	1	0
8	## br\r\n\r\nWhen you want a new line, hitting enter in your HTML won't work:\r\n\r\n```html\r\nI have been trying\r\nTo write a haiku for you\r\nSome things I just can't do\r\n```\r\n\r\n> I have been trying To write a haiku for you Some things I just can't do.\r\n\r\nTo get a new line, use the `<br/>` tag: \r\n\r\n```html\r\nI have been trying<br/>\r\nTo write a haiku for you<br/>\r\nSome things I just can't do\r\n```\r\n\r\n> I have been trying <br/>To write a haiku for you<br/>Some things I just can't do.\r\n\r\nNote that there is no `</br>` tag. This is because `<br>` is a **self closing tag** (or [void element](https://www.w3.org/TR/html-markup/syntax.html#syntax-elements)). This means that nothing goes inside of a `<br>` tag, so it closes itself by putting a slash at the end (like `<br/>`).\r\n\r\n## hr\r\n\r\nAnother self closing tag that makes a new line is the `<hr/>` tag. `<hr>` will also draw a horizontal line across the page: \r\n\r\n```html\r\nI have been trying<hr/>\r\nTo write a haiku for you<hr/>\r\nSome things I just can't do\r\n```\r\n\r\n> I have been trying <hr>To write a haiku for you<hr>Some things I just can't do\r\n\r\n## p\r\n\r\nOne last way to make a new line is to surround blocks of text in paragraph tags, like this:\r\n\r\n```html\r\n<p>Mr. and Mrs. Dursley, of number four, Privet Drive, were proud to say that they were perfectly normal, thank you very much. They were the last people you'd expect to be involved in anything strange or mysterious, because they just didn't hold with such nonsense.</p>\r\n\r\n<p>Mr. Dursley was the director of a firm called Grunnings, which made drills. He was a big, beefy man with hardly any neck, although he did have a very large mustache. Mrs. Dursley was thin and blonde and had nearly twice the usual amount of neck, which came in very useful as she spent so much of her time craning over garden fences, spying on the neighbors. The Dursleys had a small son called Dudley and in their opinion there was no finer boy anywhere.</p>\r\n```\r\n\r\n> <p>Mr. and Mrs. Dursley, of number four, Privet Drive, were proud to say that they were perfectly normal, thank you very much. They were the last people you'd expect to be involved in anything strange or mysterious, because they just didn't hold with such nonsense.</p><p>Mr. Dursley was the director of a firm called Grunnings, which made drills. He was a big, beefy man with hardly any neck, although he did have a very large mustache. Mrs. Dursley was thin and blonde and had nearly twice the usual amount of neck, which came in very useful as she spent so much of her time craning over garden fences, spying on the neighbors. The Dursleys had a small son called Dudley and in their opinion there was no finer boy anywhere.</p>\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake a web page with a poem or [haiku](http://www.kidzone.ws/poetry/haiku.htm) on multiple lines.	5 New lines	f	2016-07-24 17:43:52.325795	2016-07-24 18:44:13.503664	\N	00 HTML	5	11	0
14	Up until now, your websites have looked pretty boring: just black text on a white background. CSS is the language that will let you make your websites look much prettier.\r\n\r\nHere's an example of the power of CSS - take a look at [this jsbin](http://output.jsbin.com/mahumudejo):\r\n\r\n![Screen Shot 2016-07-25 at 2.08.50 PM](https://res.cloudinary.com/genco/image/upload/v1469473832/Screen_Shot_2016-07-25_at_2.08.50_PM_hswxav.png)\r\n\r\nPretty boring, right? \r\n\r\nBut by adding one line of HTML code (a line that imports a CSS style sheet):\r\n\r\n```html\r\n<link rel="stylesheet" media="screen" href="/214/214.css?v=8may2013">\r\n```\r\n\r\nthat exact same code makes [a page that looks way better](http://www.csszengarden.com/214/):\r\n\r\n![Screen Shot 2016-07-25 at 2.11.36 PM](https://res.cloudinary.com/genco/image/upload/v1469473912/Screen_Shot_2016-07-25_at_2.11.36_PM_f91uzp.png)\r\n\r\nJust by changing the CSS, you can make [the exact same HTML code look completely different](http://www.csszengarden.com/221/):\r\n\r\n![Screen Shot 2016-07-25 at 2.12.12 PM](https://res.cloudinary.com/genco/image/upload/v1469474009/Screen_Shot_2016-07-25_at_2.12.12_PM_xtdsyg.png)\r\n\r\n## "Web Design in 4 Minutes"\r\n\r\nHere's another example of the power of CSS: [Web Design in 4 Minutes](http://jgthms.com/web-design-in-4-minutes/).\r\n\r\nThe website starts out very simple - just the basic HTML you're already familiar with:\r\n\r\n<a href="http://jgthms.com/web-design-in-4-minutes/"><img src="https://res.cloudinary.com/genco/image/upload/v1469629714/Screen_Shot_2016-07-27_at_9.27.50_AM_shwip0.png" width="50%" class="shadow" /></a>\r\n\r\nStep by step the website gets more CSS rules that make it look better and better:\r\n\r\n<a href="http://jgthms.com/web-design-in-4-minutes/"><img src="https://res.cloudinary.com/genco/image/upload/v1469629782/Screen_Shot_2016-07-27_at_9.29.17_AM_cq7kh7.png" width="50%" class="shadow" /></a>\r\n\r\nUntil the final result:\r\n\r\n<a href="http://jgthms.com/web-design-in-4-minutes/"><img src="https://res.cloudinary.com/genco/image/upload/v1469629827/Screen_Shot_2016-07-27_at_9.30.02_AM_ib1ixq.png" width="50%" class="shadow" /></a>\r\n\r\nIt's important to never forget that your *content* is always the most important thing, but making things look good helps your content get consumed.\r\n\r\nHow is this possible? You're about to find out :D\r\n\r\n---\r\n\r\n## References\r\n\r\n* [CSS Introduction](http://www.w3schools.com/css/css_intro.asp)\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nPoke around the [full list of CSS Zen Garden designs](http://www.mezzoblue.com/zengarden/alldesigns/) and paste the URL to the best one below.\r\n	0 What is CSS?	f	2016-07-25 19:14:12.252014	2016-07-27 14:48:08.54543	\N	01 CSS	1	6	0
9	Now we're getting into the fun stuff!\r\n\r\n## Links\r\n\r\nTo make a link, use the anchor (`<a>`) tag:\r\n\r\n```html\r\n<a href="http://google.com">Google</a>\r\n```\r\n> [Google](http://google.com)\r\n\r\nThe `<a>` tag has an **attribute** named `href` that you set to the place where you want the link to go.\r\n\r\nTo make links open in a new window or tab, set the `target` attribute to `_blank`:\r\n\r\n```html\r\n<a href="http://google.com" target="_blank">Google in a new window</a>\r\n```\r\n> <a href="http://google.com" target="_blank">Google in a new window</a>\r\n\r\n## Images\r\n\r\nTo include images in your page, first you need a public URL for an image.\r\n\r\nI found a page on [The Art of Cat Breading](http://www.ualr.edu/giellis/catbreading.html) that has some good pictures:\r\n\r\n![Screen Shot 2016-07-24 at 1.00.29 PM](https://res.cloudinary.com/genco/image/upload/v1469385633/Screen_Shot_2016-07-24_at_1.00.29_PM_akb3bg.png)\r\n\r\nTo get the URL for one of the pictures, right click on it and select "Copy Image Address":\r\n\r\n![Screen Shot 2016-07-24 at 1.00.44 PM](https://res.cloudinary.com/genco/image/upload/v1469385642/Screen_Shot_2016-07-24_at_1.00.44_PM_ultdny.png)\r\n\r\nOnce you have the public URL for an image, you can include it in your page like this:\r\n\r\n```html\r\n<img src="http://www.ualr.edu/giellis/assets/images/catbread2.jpg" />\r\n```\r\n\r\n> ![](http://www.ualr.edu/giellis/assets/images/catbread2.jpg)\r\n\r\nTo make it smaller, define `width` and/or `height` attributes:\r\n\r\n```html\r\n<img src="http://www.ualr.edu/giellis/assets/images/catbread2.jpg" width="100px" />\r\n```\r\n\r\n> <img src="http://www.ualr.edu/giellis/assets/images/catbread2.jpg" width="100px" />\r\n\r\nIf you use the CSS `style` attribute (we'll learn more about it later), you can stretch out your image:\r\n\r\n```html\r\n<img src="http://www.ualr.edu/giellis/assets/images/catbread2.jpg" style="width: 300px; height: 100px" />\r\n```\r\n> <img src="http://www.ualr.edu/giellis/assets/images/catbread2.jpg" style="width: 300px; height: 100px" />\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake a web page about your favorite animal. Include pictures and links. Bonus points if I can click an image to see more images.\r\n\r\n---\r\n\r\n## Resources\r\n\r\n* [anchor tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a)\r\n* [HTML attributes](http://www.w3schools.com/html/html_attributes.asp)\r\n* [What does HREF stand for?](http://stackoverflow.com/questions/3586169/what-does-href-stand-for-in-html)\r\n* [image tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img)	6 Links and images	f	2016-07-24 17:58:37.721976	2016-07-24 18:41:46.195392	\N	00 HTML	6	18	0
16	Just like the `color` CSS property, you can define a `background-color`:\r\n\r\n```html\r\n<b style="color: white; background-color: black">I was born in the dark</b>\r\n```\r\n\r\n> <b style="color: white; background-color: black">I was born in the dark</b>\r\n\r\nIt's limiting to just use the [named CSS colors](http://www.w3schools.com/colors/colors_names.asp), so here are two ways you can make any\r\n color you want.\r\n\r\n## RGB\r\n\r\nColors can be defined by mixing together different values of <span style="color: red">red</span>, <span style="color: green">green</span>, and <span style="color: blue">blue</span>, like this:\r\n\r\n```html\r\n<b style="color: rgb(255, 0, 0);">I'm red</b>\r\n<b style="color: rgb(0, 255, 0);">I'm green</b>\r\n<b style="color: rgb(0, 0, 255);">I'm blue</b>\r\n<b style="color: rgb(255, 255, 0);">I'm red and green</b>\r\n<b style="color: rgb(255, 0, 255);">I'm red and blue</b>\r\n<b style="color: rgb(0, 255, 200);">I'm green and a little blue</b>\r\n<b style="color: rgb(255, 255, 255);">I'm red, green, and blue</b>\r\n<b style="color: rgb(0, 0, 0);">I'm nothing</b>\r\n```\r\n\r\n> <b style="color: rgb(255, 0, 0);">I'm red</b>\r\n<b style="color: rgb(0, 255, 0);">I'm green</b>\r\n<b style="color: rgb(0, 0, 255);">I'm blue</b>\r\n<b style="color: rgb(255, 255, 0);">I'm red and green</b>\r\n<b style="color: rgb(255, 0, 255);">I'm red and blue</b>\r\n<b style="color: rgb(0, 255, 200);">I'm green and a little blue</b>\r\n<b style="color: rgb(255, 255, 255);">I'm red, green, and blue</b>\r\n<b style="color: rgb(0, 0, 0);">I'm nothing</b>\r\n\r\nThere's [a fun RGB slider on W3 schools](http://www.w3schools.com/css/css_colors.asp) you can play with to mix colors together:\r\n\r\n<a href="http://www.w3schools.com/css/css_colors.asp" target="_blank"><img src="https://res.cloudinary.com/genco/image/upload/v1469475341/Screen_Shot_2016-07-25_at_2.35.10_PM_pxuwha.png" /></a>\r\n\r\n## Hexadecimal\r\n\r\nAn older way of mixing colors together is by defining them in [hexadecimal](https://en.wikipedia.org/wiki/Hexadecimal) (a number system that uses [base 16](https://en.wikipedia.org/wiki/Hexadecimal) instead of [base 10](https://en.wikipedia.org/wiki/Decimal)). It works the same as `rgb`, but instead of using the decimal numbers `0` to `255` it uses the hexadecimal numbers `00` to `FF`, like this:\r\n\r\n```html\r\n<b style="color: #FF0000">I'm red</b>\r\n<b style="color: #00FF00">I'm green</b>\r\n<b style="color: #0000FF">I'm blue</b>\r\n<b style="color: #FFFF00">I'm red and green</b>\r\n<b style="color: #FF00FF">I'm red and blue</b>\r\n<b style="color: #00FF99">I'm green and a little blue</b>\r\n<b style="color: #FFFFFF">I'm red, green, and blue</b>\r\n<b style="color: #000000">I'm nothing</b>\r\n```\r\n\r\n> <b style="color: #FF0000">I'm red</b>\r\n<b style="color: #00FF00">I'm green</b>\r\n<b style="color: #0000FF">I'm blue</b>\r\n<b style="color: #FFFF00">I'm red and green</b>\r\n<b style="color: #FF00FF">I'm red and blue</b>\r\n<b style="color: #00FF99">I'm green and a little blue</b>\r\n<b style="color: #FFFFFF">I'm red, green, and blue</b>\r\n<b style="color: #000000">I'm nothing</b>\r\n\r\n---\r\n\r\n## References\r\n\r\n* [CSS Colors](http://www.w3schools.com/css/css_colors.asp)\r\n* [RGB to Hex converter](http://www.rgbtohex.net/)\r\n* [Flat design colors](http://flatuicolors.com/)\r\n* [Color scheme generator](http://colorschemer.com/online.html)\r\n* [A nicer color scheme generator](http://paletton.com/)\r\n* [Adobe's color scheme generator](https://color.adobe.com/)\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake an advertisement flyer for a birthday clown.	2 background-color	f	2016-07-25 19:28:08.817501	2016-07-25 19:50:05.251897	\N	01 CSS	5	6	0
18	## font-size\r\n\r\n```css\r\np {\r\n  font-size: 2em;\r\n}\r\n```\r\n\r\n> <p style="font-size: 2em">What I have to tell you is very important</p>\r\n\r\n```css\r\np {\r\n  font-size: 0.3em;\r\n}\r\n```\r\n\r\n> <p style="font-size: 0.3em">What I have to tell you is not very important</p>\r\n\r\n`em` is a unit of measurement (like a foot or a mile). `2em` means "two times bigger than the normal body font" - it will automatically adjust to the default font size of the device someone loads your website on. Something that's `1em` will be bigger on a 32 inch iMac than on an iPhone, because the default on a 32 inch iMac is bigger than on an iPhone.\r\n\r\nYou can also use `px`:\r\n\r\n```css\r\np {\r\n  font-size: 12px;\r\n}\r\n```\r\n\r\n> <p style="font-size: 12px">What I have to tell you is sort of important</p>\r\n\r\n`px` stands for "pixels" - it's a way to measure things absolutely. Something that's `12px` on an iPhone will be the same size as on a 32 inch iMac. It's usually better to work in `em`.\r\n\r\nThere are also units of `pt`, `cm`, `in`, `mm`, `pc` - which [you shouldn't use](https://www.w3.org/Style/Examples/007/units.en.html) - and `%`, `rem`, `vh`, and `vw` (which we'll use later for defining the size of boxes).\r\n\r\n## font-family\r\n\r\n```css\r\np {\r\n  font-family: "Impact";\r\n}\r\n```\r\n\r\n> <p style="font-family: Impact">What I have to tell you is very important</p>\r\n\r\nThere are [a lot of web safe fonts to choose from](http://www.w3schools.com/cssref/css_websafe_fonts.asp), and even a way to choose [almost any font you want](https://www.google.com/fonts#!), including cool handwriting fonts:\r\n\r\n```html\r\n<link href='https://fonts.googleapis.com/css?family=Homemade+Apple' rel='stylesheet' type='text/css'>\r\n<style>p{font-family:  'Homemade Apple', cursive;}</style>\r\n<p>Dear Mr. Potter, <br/>You have been accepted into Hogwarts School of Witchcraft and Wizardry! Woohoo! This definitely won't end badly. You're sure to have a grand ol' time and never be in any danger at all.</p>\r\n```\r\n\r\n<link href='https://fonts.googleapis.com/css?family=Homemade+Apple' rel='stylesheet' type='text/css'>\r\n\r\n> <p style="font-family: 'Homemade Apple', cursive;">Dear Mr. Potter, <br/>You have been accepted into Hogwarts School of Witchcraft and Wizardry! Woohoo! This definitely won't end badly. You're sure to have a grand ol' time and never be in any danger at all.</p>\r\n\r\n## shadows\r\n\r\nText <span style="text-shadow: 4px 4px 2px rgba(150, 150, 150, 1);">shadows </span> can make text look like it's popping out of the page. They're tricky to edit by hand, so I usually just use a [CSS Shadow Generator](http://css3gen.com/text-shadow/).\r\n\r\n## bold, italic, strike, underline\r\n\r\nYou can fake a `<b>`, `<i>`, `<s>`, or `<u>` tag with the [font-style](http://www.w3schools.com/cssref/pr_font_font-style.asp) and `text-decoration` CSS properties.\r\n\r\nThere are [a few other things you can do with font](http://www.w3schools.com/cssref/default.asp#font), but they're usually not as useful.\r\n\r\n---\r\n\r\n## Challenge\r\n\r\n[Generate a random essay](http://longessays.com/) about something and style the font appropriate to the topic.	5 font	f	2016-07-25 20:21:21.420551	2016-07-25 21:46:11.604487	\N	01 CSS	8	3	0
29	Coders are incredibly lazy, so they'll often invent new ways of doing things that save just a little bit of time when there's already a perfectly good way of doing it. CSS selectors have a lot of these kinds of inventions.\r\n\r\nChild selectors are a way to select an HTML element's children. It works like this:\r\n\r\n```html\r\n<h1>Todo:</h1>\r\n<ul>\r\n  <li>Do laundry</li>\r\n  <li>Walk dog</li>\r\n  <li>Solve world peace</li>\r\n</ul>\r\n\r\n<h1>Sandwich recipe:</h1>\r\n<ol>\r\n  <li>Bread\r\n  <li>Ingredients</li>\r\n  <li>Close</li>\r\n  <li>Cheese - sprinkle it on</li>\r\n</ol>\r\n```\r\n\r\n```css\r\nul li{\r\n  color: white;\r\n  border: 1px dotted yellow;\r\n  margin-bottom: 10px;\r\n  background-color: red;\r\n}\r\n\r\nol li{\r\n  color: white;\r\n  border: 1px dotted yellow;\r\n  margin-bottom: 10px;\r\n  background-color: blue;\r\n}\r\n```\r\n\r\n<style>ul li{color: white;border: 1px dotted yellow;margin-bottom: 10px;background-color: red;}ol li{color: white;border: 1px dotted yellow;margin-bottom: 10px;background-color: blue;}</style>\r\n> <h1>Todo:</h1><ul><li>Do laundry</li><li>Walk dog</li><li>Solve world peace</li></ul>\r\n<h1>Sandwich recipe:</h1><ol><li>Bread<li>Ingredients</li><li>Close</li><li>Cheese - sprinkle it on</li></ol>\r\n\r\nThis makes the `li` children of `ul` red, and the `li` children of `ol` blue.\r\n\r\n---\r\n\r\n## Cascading Style Sheets\r\n\r\nUp until now we haven't talked about what CSS actually stands for, because it wouldn't make sense. Now it will.\r\n\r\n<abbr title="Cascading Style Sheets">CSS</abbr> stands for Cascading Style Sheets. The "Style Sheets" part should already make sense: CSS is code that helps style your HTML documents.\r\n\r\nHere's where the "Cascading" part comes in.\r\n\r\nNotice how most of the CSS rules in the above lists are the same? The `color`, `border`, and `margin-bottom` values are all the same. It's only the `background-color` that changes. Knowing what you know about how lazy programmers are, I'll bet you're expecting a lazier way to write that code.\r\n\r\nThis CSS does the exact same thing as the CSS above, and it's easier to code:\r\n\r\n```css\r\nli{\r\n  color: white;\r\n  border: 1px dotted yellow;\r\n  margin-bottom: 10px;\r\n}\r\n\r\nul li{\r\n  background-color: red;\r\n}\r\n\r\nol li{\r\n  background-color: blue;\r\n}\r\n```\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nIn as few CSS rules as you can, make this HTML:\r\n\r\n```html\r\n<h1>Jokes</h1>\r\n\r\n<table>\r\n  <thead>\r\n    <tr>\r\n      <th class="question">Question</th>\r\n      <th class="answer">Answer</th>\r\n    </tr>\r\n  </thead>\r\n  <tbody>\r\n    <tr class="odd">\r\n      <td class="question">What's worse than finding a worm in your apple?</td>\r\n      <td class="answer">Getting shot.</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="question">What's green and has wheels?</td>\r\n      <td class="answer">Grass. I lied about the wheels.</td>\r\n    </tr>\r\n    <tr class="odd">\r\n      <td class="question">Why did the boy drop his ice cream?</td>\r\n      <td class="answer">Because he was hit by a bus</td>\r\n    </tr>\r\n    <tr class="even">\r\n      <td class="question">Why was six afraid of seven?</td>\r\n      <td class="answer">It wasn't. Numbers are not sentient and thus incapable of feeling fear.</td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n```\r\n\r\nLook like this:\r\n\r\n![Screen Shot 2016-07-28 at 8.52.48 AM](https://res.cloudinary.com/genco/image/upload/v1469713984/Screen_Shot_2016-07-28_at_8.52.48_AM_yxbmwe.png)\r\n\r\nNote: if you make the `color` the same as the `background-color`, then you can't see the text unless you highlight it.\r\n\r\n<!-- <style>\r\n      * {\r\n        font-family: "Comic Sans MS", cursive, sans-serif;\r\n      }\r\n\r\n      td{\r\n        border: 2px solid black;\r\n      }\r\n\r\n      .even td{\r\n        background-color: #eee;\r\n      }\r\n\r\n      .odd td{\r\n        background-color: #999;\r\n      }\r\n\r\n      .even td.answer{\r\n        color: #eee;\r\n      }\r\n\r\n      .odd td.answer{\r\n        color: #999;\r\n      }\r\n    </style>\r\n    -->	7.1 Child selectors	f	2016-07-27 20:46:44.674493	2016-07-28 23:38:24.664464	\N	01 CSS	12	\N	0
31	Once you have a domain name, it's easy to set up the domain name to redirect to another website, but more professional if your HTML, CSS, and Javascript are hosted directly on the domain name.\r\n\r\nHosting usually costs money (about $5/month is a good starting point), but there's a way to get it for free by using [Github Pages](https://pages.github.com/).\r\n\r\nHere's a video tutorial I made on how to set it up:\r\n\r\n<iframe width="560" height="315" src="https://www.youtube.com/embed/CJLb8UUIJPg" frameborder="0" allowfullscreen></iframe>\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nSet up your own website on Github pages and paste the URL below. For bonus points, link it to your own custom domain name and paste your domain name below.	02 Github Pages	f	2016-07-29 14:00:13.148563	2016-07-29 14:34:44.655673	\N	08 Webmastering	50	\N	0
11	There are a lot of HTML tags that aren't used very much, but are still fun to know about.\r\n\r\n## pre\r\n\r\nTo include code in your web page, use the `<pre>` tag:\r\n\r\n```html\r\n<pre>\r\nThis is how to make things <b>bold</b>!\r\n</pre>\r\n```\r\n\r\n> <pre>This is how to make things <b>bold</b>!</pre>\r\n\r\n## abbr\r\n\r\nThe `abbr` tag is used for showing an abbreviation:\r\n\r\n```html\r\nI love <abbr title="Hypertext Markup Language">HTML</abbr>\r\n```\r\n> I love <abbr title="Hypertext Markup Language">HTML</abbr>\r\n\r\nHover your mouse over the abbreviation to see what it stands for.\r\n\r\n## sub and sup\r\n\r\n`sub` and `sup` are used for subtext and supertext:\r\n\r\n```html\r\nIn school I learn about x<sup>2</sup> and H<sub>2</sub>O.\r\n```\r\n> In school I learn about x<sup>2</sup> and H<sub>2</sub>O.\r\n\r\n## iframe\r\n\r\n`iframe`s let you include a webpage in another webpage. It doesn't always work because some webpages don't want other people to include their page in an iframe.\r\n\r\n```html\r\n<iframe src="http://christian.gen.co/" width="100%" height="300px"></iframe>\r\n```\r\n<iframe src="http://christian.gen.co/" width="100%" height="300px"></iframe>\r\n\r\n## blink and marquee\r\n\r\n**Never ever use these tags** - they are terrible and super annoying. I <blink>refuse</blink> to show you how they work.\r\n\r\n<marquee>![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75HzuEy488Z3-dbw20sZK40FOAQeeq24sCP5Td0IvPRFKR_CmJg)</marquee>\r\n\r\n## Audio\r\nThe audio tag is used to put audio into a webpage:\r\n\r\n1. Find an .mp3 file, if its a video then extract the audio.\r\n2. Host the audio file online, you can use dropbox or soundcloud.\r\n3. Add the code below to your existing code.\r\n4. Add the file name in and your code should work.\r\n \r\n ```html\r\n<audio controls>\r\n  <source src="" type="audio/mpeg">\r\n</audio>\r\n```\r\n\r\n---\r\n\r\n## Every HTML tag\r\n\r\nHere's a [list of every HTML tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) - there are a lot of them, but you really only need the ones we've covered here.\r\n\r\nI'm holding back a few tags you will need later because they won't make sense until you learn CSS and Javascript. These tags are:\r\n\r\n* CSS: `span`, and `div`\r\n* Javascript: `form`, `button`, `label`, `textarea`, and `input`\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nMake a page with at least two of these random tags.	8 Random HTML tags	f	2016-07-24 19:05:38.291073	2016-07-28 16:48:21.475576	\N	00 HTML	8	10	1
30	Domain names make it easier for other people to find your website.\r\n\r\nInstead of an ugly URL like http://jsbin.com/sirenewide/edit?html,output you can just tell people to go to something like mycoolwebsite.com or [gen.co](http://gen.co) - much easier to remember.\r\n\r\nDomain names cost money. As cheap as $0.88/year for a new <abbr title="Top Level Domain">TLD</abbr> like .xyz, about $10/year for most established TLDs like .com or .net, and as much as $100/year for some "premium" TLDs like .io.\r\n\r\nThe great thing about making websites is that this is one of the most expensive costs of setup. If you had any other kind of business you'd probably spend more than that on toilet paper every week!\r\n\r\n## Registrars\r\n\r\nRegistrars are companies that can sell you domain names. My top recommendation is [Namecheap](http://namecheap.com):\r\n\r\n![Screen Shot 2016-07-29 at 8.51.49 AM](https://res.cloudinary.com/genco/image/upload/v1469800331/Screen_Shot_2016-07-29_at_8.51.49_AM_as8yoa.png)\r\n\r\nThis is because they have a lot of domain names that are only $0.88/year for the first year. Search for an available domain name, like thisdomainnamesurelyisnttaken.xyz:\r\n\r\n![Screen Shot 2016-07-29 at 8.53.53 AM](https://res.cloudinary.com/genco/image/upload/v1469800447/Screen_Shot_2016-07-29_at_8.53.53_AM_exhcbw.png)\r\n\r\nand you'll see a list of available domains. Here I can see that the .com is still available for $10.69/year, and the .xyz is available for just $0.88/year.\r\n\r\nFrom here, just add the domain name to your cart and check out. If this is your first domain name, you'll need to create an account.\r\n\r\n### Alternative Registrars\r\n\r\nIf you know you're going to be getting a .com, .net, or .org, those will all be around $10 no matter where you go, so it makes sense to buy it from an easier to use website. Try either [Hover](http://hover.com) or [Google Domains](https://domains.google.com/registrar).\r\n\r\n---\r\n\r\n## Whois guard\r\n\r\nWhen you register a domain name, it's a legal requirement to include information on who you are so that other people can contact you if your website is doing bad things.\r\n\r\nYou can look up this contact information with [a Whois request](http://www.whois.com/whois/).\r\n\r\nHowever, if you pay a little extra when you buy your domain name, you can hide your contact information. This is usually called "Whois guard" or "privacy guard", and will cost a few more dollars a year when you buy your domain name.\r\n\r\nThis cost isn't that much, and the benefit is potentially large, so you should always buy Whois guard.\r\n\r\n---\r\n\r\n## Challenge\r\n\r\nRegister a domain name and paste it below.\r\n\r\nIf you would like to spend 50 of your points for me to buy you an $0.88 domain name, call me over when you get to the part to enter credit card information.	01 Domain names	f	2016-07-29 13:58:16.282248	2016-07-29 15:13:28.228459	\N	08 Webmastering	40	\N	0
\.


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mosaic
--

SELECT pg_catalog.setval('challenges_id_seq', 31, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY comments (id, body, user_id, commentable_type, commentable_id, created_at, updated_at, parent_id, cached_user_name, cached_user_email) FROM stdin;
14	Hello!	1	Challenge	3	2016-07-25 01:01:36.819183	2016-07-25 01:01:36.819183	\N	christian.genco@gmail.com	christian.genco@gmail.com
15	lol hi	3	Challenge	3	2016-07-25 01:15:12.652485	2016-07-25 01:15:12.652485	\N	joe	joe@gmail.com
16	How do I do this?!?!?!?!?1	1	Challenge	3	2016-07-25 14:43:30.372676	2016-07-25 14:43:30.372676	\N	cgenco	christian.genco@gmail.com
17	this makes no sense how does this happen!?!?	1	Challenge	3	2016-07-25 16:11:54.452003	2016-07-25 16:11:54.452003	\N	cgenco	christian.genco@gmail.com
18	test	1		\N	2016-07-26 16:47:19.198543	2016-07-26 16:47:19.198543	\N	cgenco	christian.genco@gmail.com
19	hi	1		\N	2016-07-26 16:47:31.01624	2016-07-26 16:47:31.01624	\N	cgenco	christian.genco@gmail.com
20	test	1	Submission	23	2016-07-26 16:49:24.244092	2016-07-26 16:49:24.244092	\N	cgenco	christian.genco@gmail.com
21	why doesn't this show up?	1	Submission	23	2016-07-26 20:02:36.553327	2016-07-26 20:02:36.553327	\N	cgenco	christian.genco@gmail.com
22	oh good	1	Submission	23	2016-07-26 20:07:55.417418	2016-07-26 20:07:55.417418	\N	cgenco	christian.genco@gmail.com
23	rofl	1	Submission	23	2016-07-26 20:09:00.945833	2016-07-26 20:09:00.945833	\N	cgenco	christian.genco@gmail.com
27	hi	1	Submission	23	2016-07-26 20:17:24.789444	2016-07-26 20:17:24.789444	\N	cgenco	christian.genco@gmail.com
28	Can **I** still do cool \r\n\r\n```html\r\n<div>formatting?</div>\r\n```	1	Submission	23	2016-07-26 20:21:39.258223	2016-07-26 20:21:39.258223	\N	cgenco	christian.genco@gmail.com
29	This was really interesting (and also spooky) - I'll be on the lookout the next time I go to Disney World!	1	Submission	115	2016-07-26 20:24:03.478811	2016-07-26 20:24:03.478811	\N	cgenco	christian.genco@gmail.com
30	Ahh what happens next D:	1	Submission	39	2016-07-26 20:28:37.902452	2016-07-26 20:28:37.902452	\N	cgenco	christian.genco@gmail.com
31	I like that Lockheart is on team Lockheart.	1	Submission	92	2016-07-26 20:29:44.435742	2016-07-26 20:29:44.435742	\N	cgenco	christian.genco@gmail.com
32	This is just a picture of pie lol.	1	Submission	101	2016-07-26 21:08:55.337587	2016-07-26 21:08:55.337587	\N	cgenco	christian.genco@gmail.com
33	whoa this is super cool but YOU DID ALL OF YOUR HTML WRRRRRRROOOOONNNNGGGGG!!!!	1	Submission	23	2016-07-27 14:03:40.643624	2016-07-27 14:03:40.643624	\N	cgenco	christian.genco@gmail.com
34	This is super cool. Your code is well organized too! Safari seems to choke on the transitions after a few have been done - you may be hitting the edge of CSS and into rendering bug territory. In a few years web browsers will be caught up with you :D	1	Submission	116	2016-07-27 14:32:52.812405	2016-07-27 14:32:52.812405	\N	cgenco	christian.genco@gmail.com
35	I love the bunny pushing a tiny shopping cart of carrots lol. \r\n\r\nEmbed your images in the link (just replace the text inside the link with your image tags) to get a check plus :D	1	Submission	117	2016-07-27 14:33:55.994136	2016-07-27 14:33:55.994136	\N	cgenco	christian.genco@gmail.com
36	Close - instead of pasting in the URL of the image:\r\n\r\n```html\r\n<a href="..." target="blank_">\r\n  http://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-bunnies-28__605.jpg\r\n</a>\r\n```\r\n\r\ntry pasting the entire `<img>` tag:\r\n\r\n```html\r\n<a href="..." target="blank_">\r\n  <img src="http://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-bunnies-28__605.jpg" />\r\n</a>\r\n```\r\n	1	Submission	118	2016-07-27 14:38:05.645392	2016-07-27 14:38:05.645392	\N	cgenco	christian.genco@gmail.com
37	Is there a tag that's used to make it where you can click on an image to open a link?	8	Challenge	11	2016-07-27 14:52:11.67704	2016-07-27 14:52:11.67704	\N	origamigirl3	origamigirl3@gmail.com
38	Oh interesting - so this works, but there's an error in your image tag that would make problems later on if you added more HTML.\r\n\r\nHere's what you have:\r\n\r\n```html\r\n<a href="http://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-bunnies-28__605.jpg" target="blank_">\r\n  <img=src "http://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-bunnies-28__605.jpg\r\n</a>\r\n```\r\n\r\nThe problem here is with the `<img>` tag:\r\n\r\n```html\r\n<img=src "http://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-bunnies-28__605.jpg\r\n```\r\n\r\nTake another look at [how to make image tags](/challenges/9). This is close, but there are three characters out of place.	1	Submission	119	2016-07-27 14:58:30.942976	2016-07-27 14:58:30.942976	\N	cgenco	christian.genco@gmail.com
39	This story is hilarious - I love it!\r\n\r\nYou have a tiny error that didn't change anything in this page, but might make problems later on.\r\n\r\nIt's easier to see by spreading out your html:\r\n\r\n```\r\n<h1>Once</h1>\r\nupon a time their was<b> a very funny man</b>.<br/>Everyday he would go to the bakery to buy pies.\r\nHe would buy all <i>types of pies</i>,\r\n<ul>\r\n<li>cream pie</li>\r\n<li>blueberry pie</li>\r\n<li>crumble apple pie</li>\r\n<li>pumpkin pie</li>\r\n<li>fudge with extra cream pie</li>\r\n<br/>As he was exiting the bakery a car that had skidded into a barrel\r\nfull of coconuts.The coconuts rolled every where and the funny man had the pies in his hand and he slipped on the coconuts and his hands lost control and it looked like he was throwing the pies on purpose\r\nand all the pies he flung fell on all the townspeople and the funny man started to laugh and say "hahha a pie for you,\r\na pie for you and a pie for all of you".The man saved a pie for himself and put it on his face and he and the coconuts went all the way\r\nback to his house, the end.\r\n```\r\n\r\nThe error is that you open your `<ul>`, but never close it. 	1	Submission	120	2016-07-27 15:15:02.09729	2016-07-27 15:15:02.09729	\N	cgenco	christian.genco@gmail.com
40	This is a super good page (and would get a check plus on the links and images challenge), but you don't use any of the new random tags :-o\r\n\r\nInclude an `<abbr>` or `<iframe>` to get points!	1	Submission	121	2016-07-27 15:16:29.137296	2016-07-27 15:16:29.137296	\N	cgenco	christian.genco@gmail.com
41	This is hilarious. Points for using the `<abbr>` tag, but you never close the `<pre>` or `<b>` tags:\r\n\r\n```html\r\n<pre><b>\r\n```	1	Submission	122	2016-07-27 15:23:40.856379	2016-07-27 15:23:40.856379	\N	cgenco	christian.genco@gmail.com
42	Reupload with full links please!	1	Submission	123	2016-07-27 15:24:43.319512	2016-07-27 15:24:43.319512	\N	cgenco	christian.genco@gmail.com
43	Awesome! Good use of a wide variety of tags, good page structure, and good visual hierarchy (everything is laid out logically).	1	Submission	124	2016-07-27 15:26:38.009003	2016-07-27 15:26:38.009003	\N	cgenco	christian.genco@gmail.com
44	<marquee>I hate marquees ಠ_ಠ</marquee>	1	Submission	129	2016-07-27 15:51:02.354287	2016-07-27 15:51:02.354287	\N	cgenco	christian.genco@gmail.com
45	icy.	1	Submission	134	2016-07-27 16:03:26.306615	2016-07-27 16:03:26.306615	\N	cgenco	christian.genco@gmail.com
46	This is awful.	1	Submission	136	2016-07-27 16:20:11.317902	2016-07-27 16:20:11.317902	\N	cgenco	christian.genco@gmail.com
47	thank you	4	Submission	136	2016-07-27 16:20:49.104867	2016-07-27 16:20:49.104867	\N	Necromancer25005	paulchinnam@icloud.com
48	Excellent code - all of your tags are closed in the right order!	1	Submission	137	2016-07-27 16:24:14.314855	2016-07-27 16:24:14.314855	\N	cgenco	christian.genco@gmail.com
49	Also: long live MewTwo.	1	Submission	137	2016-07-27 16:24:25.57808	2016-07-27 16:24:25.57808	\N	cgenco	christian.genco@gmail.com
50	> Then they all farted together and that caused their love to last forever The End\r\n\r\nlol. Gregory and Sampson?\r\n\r\nI want to see more styling!	1	Submission	142	2016-07-27 20:33:44.006915	2016-07-27 20:33:44.006915	\N	cgenco	christian.genco@gmail.com
51	lol I love it	1	Submission	145	2016-07-28 14:18:41.796352	2016-07-28 14:18:41.796352	\N	cgenco	christian.genco@gmail.com
52	This is so scary D:	1	Submission	144	2016-07-28 14:19:23.062818	2016-07-28 14:19:23.062818	\N	cgenco	christian.genco@gmail.com
54	This is awesome - very good work.\r\n\r\nYou could turn this into a money-making website if you add [Amazon Affiliate Links](https://affiliate-program.amazon.com/) - if anyone clicks on one of the links to buy a laptop (and they actually buy it), you'll get a commission on the sale.\r\n\r\nHere's [a random guide I found on setting up Amazon Affiliate sites](http://entrepreneurs.about.com/od/homebasedbusiness/ht/amazonaffiliate.htm).	1	Submission	147	2016-07-28 15:15:28.087183	2016-07-28 15:15:28.087183	\N	cgenco	christian.genco@gmail.com
55	Dark and spooky - I like it.	1	Submission	149	2016-07-28 15:16:05.855777	2016-07-28 15:16:05.855777	\N	cgenco	christian.genco@gmail.com
60	Maple bacon is a weird flavor.\r\n\r\nGet a check plus by making the images work :D	1	Submission	161	2016-07-28 16:50:18.506194	2016-07-28 16:50:18.506194	\N	cgenco	christian.genco@gmail.com
53	This picture is awesome.	1	Submission	146	2016-07-28 14:48:56.118607	2016-07-28 14:48:56.118607	\N	cgenco	christian.genco@gmail.com
56	I love your monkey stories! For more points, add more HTML tags: images, tables, lists, or some random ones.	1	Submission	148	2016-07-28 15:17:31.490618	2016-07-28 15:17:31.490618	\N	cgenco	christian.genco@gmail.com
57	For more points, add more styles to each element!	1	Submission	154	2016-07-28 16:01:46.002365	2016-07-28 16:01:46.002365	\N	cgenco	christian.genco@gmail.com
59	lol\r\n\r\n`getoutavi.mp3` doesn't work on my computer D:\r\n\r\nAlso: for full points, add more HTML tags: tables, lists, paragraphs, headings, etc. Check out the final projects that got full points to see more what I'm looking for.	1	Submission	158	2016-07-28 16:29:09.603617	2016-07-28 16:29:09.603617	\N	cgenco	christian.genco@gmail.com
58	This is cool, but I want to see `background-color`, not just `color`.	1	Submission	155	2016-07-28 16:03:09.698084	2016-07-28 16:03:09.698084	\N	cgenco	christian.genco@gmail.com
61	For more points, use more tags!	1	Submission	162	2016-07-29 14:42:18.202386	2016-07-29 14:42:18.202386	\N	cgenco	christian.genco@gmail.com
62	Hah, I like this story. For full points, include another new random HTML tag.	1	Submission	165	2016-07-29 14:44:23.741311	2016-07-29 14:44:23.741311	\N	cgenco	christian.genco@gmail.com
63	This is fantastic - excellent work!	1	Submission	166	2016-07-29 14:57:07.807435	2016-07-29 14:57:07.807435	\N	cgenco	christian.genco@gmail.com
64		9	Submission	154	2016-07-29 16:06:20.437516	2016-07-29 16:06:20.437516	\N	Rk371143	emailrohitkannan@gmail.com
65	lol I see what you did there.\r\n\r\nI like that you just made up your own `<r>` tag.	1	Submission	170	2016-07-29 16:12:54.966327	2016-07-29 16:12:54.966327	\N	cgenco	christian.genco@gmail.com
66	Nice custom font :D	1	Submission	172	2016-07-29 16:37:09.170416	2016-07-29 16:37:09.170416	\N	cgenco	christian.genco@gmail.com
67	hahahahaha.	1	Submission	174	2016-07-29 16:41:28.958331	2016-07-29 16:41:28.958331	\N	cgenco	christian.genco@gmail.com
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mosaic
--

SELECT pg_catalog.setval('comments_id_seq', 67, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY schema_migrations (version) FROM stdin;
20160702041206
20160709023201
20160709023202
20160709023203
20160709023204
20160709023205
20160709023206
20160709023305
20160709032700
20160710031115
20160712024550
20160713020658
20160722224542
20160722224554
20160722235708
20160723000141
20160723011254
20160723012419
20160723015126
20160723025517
20160723172737
20160723181651
20160723181941
20160723182831
20160723232606
20160724012817
20160725005822
20160726201529
20160729142050
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY submissions (id, challenge_id, user_id, is_private, approved_at, denied_at, url, content, points, created_at, updated_at, deleted_at, cached_votes_total, cached_votes_score, cached_votes_up, cached_votes_down, cached_weighted_score, cached_weighted_total, cached_weighted_average, cached_username, cached_user_ids_liked, comments_count) FROM stdin;
22	3	1	f	\N	\N	http://jsbin.com/xijexajiga/1/edit?html,output	\N	1	2016-07-25 01:33:41.4684	2016-07-25 14:58:23.541443	\N	1	1	1	0	1	1	0	cgenco	---\n- 1\n	0
24	3	1	f	\N	\N	http://jsbin.com/fawitixufe/1/edit?html,output	\N	1	2016-07-25 14:46:26.944519	2016-07-25 14:46:38.615583	\N	0	0	0	0	0	0	0	cgenco	\N	0
25	3	6	f	\N	\N	http://jsbin.com/xeholexawu/edit?html,output	\N	1	2016-07-25 14:50:27.686643	2016-07-25 14:59:24.715121	\N	2	2	2	0	2	2	0	omardude	---\n- 1\n- 7\n	0
26	3	6	f	\N	\N	http://jsbin.com/xeholexawu/edit?html,output	\N	1	2016-07-25 14:51:00.562106	2016-07-25 14:55:07.815622	\N	1	1	1	0	1	1	0	omardude	---\n- 1\n	0
27	3	8	t	\N	\N	http://jsbin.com/lubukiredo/edit?html,output	\N	1	2016-07-25 14:51:52.778694	2016-07-25 14:55:06.880601	\N	1	1	1	0	1	1	0	origamigirl3	---\n- 1\n	0
28	3	7	f	\N	\N	http://jsbin.com/voxedequko/1/edit?html,output	\N	1	2016-07-25 14:56:52.506833	2016-07-25 14:59:44.84598	\N	1	1	1	0	1	1	0	Armluck03	---\n- 1\n	0
29	3	5	t	\N	\N	http://jsbin.com/cukivafido/1/edit?html,output	\N	1	2016-07-25 14:56:53.837115	2016-07-25 14:58:46.822869	\N	2	2	2	0	2	2	0	MMOONNKKEEYY	---\n- 1\n- 5\n	0
30	4	6	f	\N	\N	http://jsbin.com/xeholexawu/edit?html,output	\N	7	2016-07-25 14:58:25.693639	2016-07-25 14:59:13.092523	\N	1	1	1	0	1	1	0	omardude	---\n- 1\n	0
31	4	8	t	\N	\N	http://jsbin.com/loxacefago/edit?html,output	\N	7	2016-07-25 15:02:46.510445	2016-07-25 15:03:50.194049	\N	1	1	1	0	1	1	0	origamigirl3	---\n- 1\n	0
32	6	6	f	\N	\N	http://jsbin.com/xeholexawu/1/edit?html,output	\N	5	2016-07-25 15:05:27.070349	2016-07-25 15:09:12.017203	\N	0	0	0	0	0	0	0	omardude	\N	0
33	4	5	t	\N	\N	http://jsbin.com/maqaleruma/edit?html,output	\N	7	2016-07-25 15:09:09.894918	2016-07-25 15:18:55.4661	\N	2	2	2	0	2	2	0	MMOONNKKEEYY	---\n- 5\n- 1\n	0
34	6	8	t	\N	\N	http://jsbin.com/fesimimeko/edit?html,output	\N	7	2016-07-25 15:11:12.675927	2016-07-25 15:19:28.149929	\N	1	1	1	0	1	1	0	origamigirl3	---\n- 1\n	0
35	3	4	f	\N	\N	http://jsbin.com/newinowoku/edit?html,output	\N	0	2016-07-25 15:11:40.8319	2016-07-25 15:21:49.91091	\N	0	0	0	0	0	0	0	Necromancer25005	\N	0
36	7	6	t	\N	\N	http://jsbin.com/rilazozuro/1/edit?html,output	\N	0	2016-07-25 15:15:34.083125	2016-07-25 15:27:16.161696	\N	0	0	0	0	0	0	0	omardude	\N	0
37	3	4	f	\N	\N	http://jsbin.com/newinowoku/edit?html,output	\N	10	2016-07-25 15:15:35.227691	2016-07-25 15:23:32.699582	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	0
38	6	5	t	\N	\N	http://jsbin.com/zuvaqavuho/edit?html,output	\N	0	2016-07-25 15:22:03.534918	2016-07-25 15:27:43.585467	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 5\n	0
40	4	7	t	\N	\N	http://jsbin.com/voxedequko/1/edit?html,output	\N	5	2016-07-25 15:23:53.305098	2016-07-25 15:25:03.535022	\N	0	0	0	0	0	0	0	Armluck03	\N	0
41	4	7	t	\N	\N	http://jsbin.com/yaquremovo/edit?html,output	\N	5	2016-07-25 15:26:01.612731	2016-07-25 15:27:58.225667	\N	0	0	0	0	0	0	0	Armluck03	\N	0
43	8	8	t	\N	\N	http://jsbin.com/katocaxoga/edit?html,output	\N	0	2016-07-25 15:29:57.032373	2016-07-25 15:32:59.813771	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
44	7	6	f	\N	\N	http://jsbin.com/rilazozuro/1/edit?html,output	\N	5	2016-07-25 15:34:10.989108	2016-07-25 16:14:45.352197	\N	0	0	0	0	0	0	0	omardude	\N	0
45	4	4	f	\N	\N	http://jsbin.com/fedujarinu/edit?html,output	\N	7	2016-07-25 15:56:12.461812	2016-07-25 16:15:24.810768	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	0
46	9	6	f	\N	\N	http://jsbin.com/niyoxukisi/1/edit?html,output	\N	6	2016-07-25 15:57:48.619396	2016-07-25 16:15:41.158373	\N	0	0	0	0	0	0	0	omardude	\N	0
47	3	1	f	\N	\N	http://jsbin.com/kuvajehaxa/edit?html,output	\N	1	2016-07-25 16:10:55.154856	2016-07-25 16:15:30.611239	\N	0	0	0	0	0	0	0	cgenco	\N	0
48	3	9	f	\N	\N	http://jsbin.com/potenifiho/edit?html,output	\N	1	2016-07-25 16:12:53.534756	2016-07-25 16:13:22.049616	\N	1	1	1	0	1	1	0	Rk371143	---\n- 1\n	0
49	4	9	f	\N	\N	http://jsbin.com/juguzuceqo/edit?html,output	\N	5	2016-07-25 16:17:02.972143	2016-07-25 16:19:21.21634	\N	0	0	0	0	0	0	0	Rk371143	\N	0
50	3	10	f	\N	\N	http://jsbin.com/koduyekutu/edit?html,output	\N	1	2016-07-25 16:17:51.138712	2016-07-25 16:19:35.554004	\N	1	1	1	0	1	1	0	greninjaisreal	---\n- 1\n	0
51	3	12	f	\N	\N	http://jsbin.com/pagafagegu/edit?html,output	\N	1	2016-07-25 16:18:31.452052	2016-07-25 16:19:53.590714	\N	2	2	2	0	2	2	0	AlphaArceusOmegaMewtwo	---\n- 12\n- 1\n	0
52	6	9	f	\N	\N	http://jsbin.com/todekonira/edit?html,output	\N	0	2016-07-25 16:19:11.693886	2016-07-25 16:20:29.112315	\N	0	0	0	0	0	0	0	Rk371143	\N	0
53	3	11	f	\N	\N	http://jsbin.com/tewedusuxi/1/edit	\N	1	2016-07-25 16:19:22.533381	2016-07-25 16:20:48.771293	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
54	6	9	f	\N	\N	http://jsbin.com/todekonira/edit?html,output	\N	5	2016-07-25 16:20:42.419622	2016-07-25 16:20:57.985293	\N	0	0	0	0	0	0	0	Rk371143	\N	0
55	4	10	f	\N	\N	http://jsbin.com/pugotijiwo/edit?html,output	\N	5	2016-07-25 16:22:25.364665	2016-07-25 16:22:53.800596	\N	1	1	1	0	1	1	0	greninjaisreal	---\n- 1\n	0
56	4	11	f	\N	\N	http://jsbin.com/qebigonore/1/edit	\N	5	2016-07-25 16:25:25.76473	2016-07-25 16:28:23.001513	\N	1	1	1	0	1	1	0	Vaporeon	---\n- 1\n	0
57	7	9	f	\N	\N	http://jsbin.com/misuxonixo/edit?html,output	\N	0	2016-07-25 16:26:59.256184	2016-07-25 16:29:10.342332	\N	0	0	0	0	0	0	0	Rk371143	\N	0
58	7	9	f	\N	\N	http://jsbin.com/misuxonixo/edit?html,output	\N	5	2016-07-25 16:29:54.260422	2016-07-25 16:30:12.192923	\N	0	0	0	0	0	0	0	Rk371143	\N	0
59	4	12	f	\N	\N	http://jsbin.com/qekofafibe/edit?html,output	\N	0	2016-07-25 16:30:47.302983	2016-07-26 15:31:07.99348	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	0
60	4	4	f	\N	\N	http://jsbin.com/cahonowajo/edit?html,css,output	\N	40	2016-07-25 16:31:04.300873	2016-07-25 16:55:11.573812	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	0
61	6	11	f	\N	\N	http://jsbin.com/bopuzoqowi/1/edit	\N	5	2016-07-25 16:34:05.447878	2016-07-25 16:37:03.539098	\N	1	1	1	0	1	1	0	Vaporeon	---\n- 1\n	0
62	8	9	f	\N	\N	http://jsbin.com/himomolope/edit?html,output	\N	5	2016-07-25 16:35:11.190154	2016-07-25 16:37:23.388058	\N	1	1	1	0	1	1	0	Rk371143	---\n- 1\n	0
63	6	10	f	\N	\N	http://jsbin.com/faxogequli/edit?html,output	\N	0	2016-07-25 16:36:14.886113	2016-07-25 16:40:36.310271	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
64	6	10	f	\N	\N	http://jsbin.com/riromekoco/edit?html,output	\N	5	2016-07-25 16:40:48.699886	2016-07-25 16:41:14.817538	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
65	6	12	f	\N	\N	http://jsbin.com/qekofafibe/edit?html,output	\N	0	2016-07-25 16:40:58.736747	2016-07-25 16:45:53.547439	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	0
67	7	10	f	\N	\N	http://jsbin.com/lozuvugeso/edit?html,output	\N	0	2016-07-25 16:46:45.055663	2016-07-25 16:47:41.684395	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
68	6	12	f	\N	\N	http://jsbin.com/qekofafibe/edit?html,output	\N	0	2016-07-25 16:46:52.429776	2016-07-25 16:48:26.740254	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	0
82	10	6	f	\N	\N	http://jsbin.com/yaxumemiri/1/edit?html,output	\N	6	2016-07-26 14:49:34.951497	2016-07-26 14:50:08.743846	\N	0	0	0	0	0	0	0	omardude	\N	0
39	7	8	t	\N	\N	http://jsbin.com/golefuhubu/edit?html,output	\N	10	2016-07-25 15:22:25.026401	2016-07-25 15:24:44.589485	\N	0	0	0	0	0	0	0	origamigirl3	\N	1
66	4	12	f	\N	\N	http://jsbin.com/qekofafibe/edit?html,output	\N	0	2016-07-25 16:46:35.22804	2016-07-25 16:47:06.661745	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	0
69	7	11	f	\N	\N	http://jsbin.com/xarazapije/1/edit	\N	7	2016-07-25 16:47:31.356181	2016-07-25 16:48:52.953806	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
70	7	10	f	\N	\N	http://jsbin.com/virenawiku/edit?html,output	\N	5	2016-07-25 16:48:36.875311	2016-07-25 16:49:09.02974	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
71	9	9	f	\N	\N	http://jsbin.com/kogipunovo/edit?html,output	\N	8	2016-07-25 16:52:53.289017	2016-07-25 16:53:26.163129	\N	1	1	1	0	1	1	0	Rk371143	---\n- 1\n	0
72	8	10	f	\N	\N	http://jsbin.com/saxucuxuyo/edit?html,output	\N	7	2016-07-25 16:54:25.673324	2016-07-25 16:56:00.829894	\N	1	1	1	0	1	1	0	greninjaisreal	---\n- 1\n	0
73	8	11	f	\N	\N	http://jsbin.com/sajehiduzu/1/edit	\N	5	2016-07-25 16:57:08.984779	2016-07-25 16:57:30.118747	\N	1	1	1	0	1	1	0	Vaporeon	---\n- 1\n	0
74	6	5	t	\N	\N	http://jsbin.com/pacodopije/1/edit?html,output	\N	0	2016-07-26 14:07:44.193097	2016-07-26 14:11:24.45305	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	0
75	6	4	f	\N	\N	http://jsbin.com/bipafulona/edit?html,output	\N	20	2016-07-26 14:09:03.551909	2016-07-26 14:12:14.674496	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	0
77	8	6	f	\N	\N	http://jsbin.com/qupoqisiyo/1/edit?html,output	\N	7	2016-07-26 14:27:04.191218	2016-07-26 14:41:37.562379	\N	0	0	0	0	0	0	0	omardude	\N	0
78	6	7	t	\N	\N	http://jsbin.com/sagoropixe/1/edit?html,output	\N	7	2016-07-26 14:27:29.891892	2016-07-26 14:45:30.108286	\N	0	0	0	0	0	0	0	Armluck03	\N	0
79	7	5	f	\N	\N	http://jsbin.com/hirurikedu/1/edit?html,output	\N	7	2016-07-26 14:29:35.33062	2016-07-26 14:46:47.178451	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 1\n	0
80	8	5	t	\N	\N	http://jsbin.com/ricoketaga/1/edit?html,output	\N	5	2016-07-26 14:41:34.491206	2016-07-26 14:47:02.055586	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	0
81	8	8	t	\N	\N	http://jsbin.com/sirenewide/edit?html,output	\N	0	2016-07-26 14:42:46.168209	2016-07-26 14:48:00.496497	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
83	10	6	f	\N	\N	http://jsbin.com/batuselobe/1/edit?html,output	\N	6	2016-07-26 14:51:12.027629	2016-07-26 14:51:43.66819	\N	0	0	0	0	0	0	0	omardude	\N	0
84	8	8	t	\N	\N	http://jsbin.com/jebexaziyo/edit?html,output	\N	5	2016-07-26 14:51:49.354857	2016-07-26 14:52:42.139728	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
85	9	8	t	\N	\N	http://jsbin.com/sirenewide/edit?html,output	\N	0	2016-07-26 14:52:29.44368	2016-07-26 14:54:54.244866	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
86	9	8	t	\N	\N	http://jsbin.com/sirenewide/edit?html,output	\N	0	2016-07-26 14:54:09.286859	2016-07-26 14:54:56.181036	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
87	9	8	t	\N	\N	http://jsbin.com/sirenewide/1/edit?html,output	\N	0	2016-07-26 14:54:34.472007	2016-07-26 14:54:55.374127	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
88	9	8	t	\N	\N	http://jsbin.com/rawahowibo/1/edit?html,output	\N	8	2016-07-26 14:55:35.299695	2016-07-26 14:55:45.942157	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
89	7	4	f	\N	\N	http://jsbin.com/hecogisiwe/edit?html,output	\N	15	2016-07-26 15:08:58.938448	2016-07-26 15:13:31.442939	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	0
90	9	5	t	\N	\N	http://jsbin.com/porofuleze/1/edit?html,output	\N	0	2016-07-26 15:19:18.467078	2016-07-26 15:26:31.000548	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	0
91	11	6	f	\N	\N	http://jsbin.com/mogoyuyosi/1/edit?html,output	\N	8	2016-07-26 15:21:25.743471	2016-07-26 15:22:11.390099	\N	0	0	0	0	0	0	0	omardude	\N	0
101	12	6	f	\N	\N	data:image/jpeg;base64,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	\N	0	2016-07-26 15:46:28.417778	2016-07-26 16:10:12.357625	\N	0	0	0	0	0	0	0	omardude	\N	1
94	7	7	f	\N	\N	http://jsbin.com/jimunaceyi/edit?html,output	\N	7	2016-07-26 15:28:08.997381	2016-07-26 15:31:30.822438	\N	0	0	0	0	0	0	0	Armluck03	\N	0
95	8	4	f	\N	\N	http://jsbin.com/divoxudawo/edit?html,output	\N	17	2016-07-26 15:30:41.982442	2016-07-26 16:06:05.273812	\N	0	0	0	0	0	0	0	Necromancer25005	\N	0
96	10	5	f	\N	\N	http://jsbin.com/kufowujuhi/1/edit?html,output	\N	6	2016-07-26 15:30:54.273857	2016-07-26 16:08:27.007714	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	0
97	4	12	f	\N	\N	http://jsbin.com/gumipekoni/edit?html,output	\N	5	2016-07-26 15:32:27.864818	2016-07-26 15:51:18.640253	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	0
98	6	12	f	\N	\N	http://jsbin.com/qekofafibe/edit?html,output	\N	5	2016-07-26 15:32:55.513132	2016-07-26 15:51:17.914041	\N	1	1	1	0	1	1	0	AlphaArceusOmegaMewtwo	---\n- 1\n	0
99	7	12	f	\N	\N	http://jsbin.com/catexagaqa/1/edit?html,output	\N	5	2016-07-26 15:40:22.497559	2016-07-26 16:08:43.838683	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	0
100	8	12	f	\N	\N	http://jsbin.com/hihonobosi/1/edit?html,output	\N	5	2016-07-26 15:42:58.389378	2016-07-26 16:05:11.026395	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	0
93	9	5	t	\N	\N	http://jsbin.com/porofuleze/1/edit?html,output	\N	0	2016-07-26 15:26:21.06641	2016-07-27 14:16:16.763382	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	0
102	9	11	f	\N	\N	http://jsbin.com/lewucecahu/1/edit	\N	6	2016-07-26 15:54:01.070484	2016-07-26 15:56:34.760915	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
103	14	6	f	\N	\N	http://www.csszengarden.com/214/	\N	1	2016-07-26 16:04:56.034856	2016-07-26 16:07:11.654445	\N	0	0	0	0	0	0	0	omardude	\N	0
104	9	10	f	\N	\N	http://jsbin.com/jirodororo/edit?html,output	\N	6	2016-07-26 16:05:46.444316	2016-07-26 16:11:02.363735	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
105	10	11	f	\N	\N	http://jsbin.com/vomayitiho/1/edit	\N	6	2016-07-26 16:08:53.858766	2016-07-26 16:09:50.331744	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
106	10	11	f	\N	\N	http://jsbin.com/qimokenogu/1/edit	\N	8	2016-07-26 16:12:16.776101	2016-07-26 16:13:57.168674	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
107	12	6	f	\N	\N	file:///C:/Users/asif/Downloads/jsbin.hekecojoci.1.html	\N	0	2016-07-26 16:12:49.64319	2016-07-26 16:15:20.944016	\N	0	0	0	0	0	0	0	omardude	\N	0
108	10	9	f	\N	\N	http://jsbin.com/piqiqixiqu/edit?html,output	\N	8	2016-07-26 16:13:14.221592	2016-07-26 16:17:21.541692	\N	0	0	0	0	0	0	0	Rk371143	\N	0
109	12	6	f	\N	\N	http://jsbin.com/zusacopono/edit?html,output	\N	27	2016-07-26 16:15:10.753525	2016-07-26 16:18:34.698226	\N	0	0	0	0	0	0	0	omardude	\N	0
110	9	11	f	\N	\N	http://jsbin.com/sediqihesu/1/edit	\N	0	2016-07-26 16:20:39.456471	2016-07-26 16:23:10.303801	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
111	9	11	f	\N	\N	http://jsbin.com/yupotabubi/1/edit\\	\N	6	2016-07-26 16:21:48.988324	2016-07-26 16:23:08.302251	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
112	11	9	f	\N	\N	http://jsbin.com/kayeyadebi/edit?html,output	\N	8	2016-07-26 16:25:46.662747	2016-07-26 16:41:38.872768	\N	1	1	1	0	1	1	0	Rk371143	---\n- 1\n	0
113	15	6	f	\N	\N	http://jsbin.com/nucodixowu/1/edit?html,output	\N	5	2016-07-26 16:33:19.67779	2016-07-26 16:41:10.922121	\N	0	0	0	0	0	0	0	omardude	\N	0
114	11	11	f	\N	\N	http://jsbin.com/naqemeqito/1/edit	\N	8	2016-07-26 16:42:28.64041	2016-07-26 16:43:22.77882	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
115	10	10	f	\N	\N	http://jsbin.com/hebisobunu/edit?html,output	\N	6	2016-07-26 16:46:42.762693	2016-07-26 20:25:00.61419	\N	1	1	1	0	1	1	0	greninjaisreal	---\n- 1\n	1
92	10	8	t	\N	\N	http://jsbin.com/fakosutanu/1/edit?html,output	\N	10	2016-07-26 15:23:54.426089	2016-07-26 15:26:20.30642	\N	1	1	1	0	1	1	0	origamigirl3	---\n- 1\n	1
42	6	5	t	\N	\N	http://jsbin.com/zuvaqavuho/1/edit?html,output	\N	0	2016-07-25 15:27:56.198603	2016-07-25 15:32:24.215331	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	0
76	6	5	t	\N	\N	http://jsbin.com/jepimadapo/edit?html,output	\N	5	2016-07-26 14:11:14.110341	2016-07-26 14:11:44.321795	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 1\n	0
23	3	1	f	\N	\N	http://jsbin.com/xijexajiga/1/edit?html,output	\N	1	2016-07-25 01:34:55.893984	2016-07-26 20:09:52.8161	\N	0	0	0	0	0	0	0	cgenco	\N	7
124	12	6	f	\N	\N	http://jsbin.com/mowutipuvi/1/edit?html,output	\N	50	2016-07-27 15:24:41.683617	2016-07-27 15:26:42.109747	\N	0	0	0	0	0	0	0	omardude	\N	1
116	9	4	f	\N	\N	http://jsbin.com/dukodatiba/edit?html,output	\N	35	2016-07-27 14:10:53.999355	2016-07-27 14:32:55.851159	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	1
125	11	8	t	\N	\N	http://jsbin.com/xekupaxehe/1/edit?html,output	\N	10	2016-07-27 15:32:50.645623	2016-07-27 15:45:14.364358	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
117	9	5	t	\N	\N	http://jsbin.com/kuqebazawe/1/edit?html,output	\N	6	2016-07-27 14:28:19.815073	2016-07-27 14:33:59.006428	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 1\n	1
126	10	4	f	\N	\N	http://jsbin.com/sowusavepe/edit?html,output	\N	8	2016-07-27 15:34:09.598592	2016-07-27 15:47:36.599669	\N	0	0	0	0	0	0	0	Necromancer25005	\N	0
127	10	4	f	\N	\N	http://jsbin.com/fisudupegi/edit?html,output	\N	8	2016-07-27 15:44:51.949486	2016-07-27 15:47:37.521494	\N	0	0	0	0	0	0	0	Necromancer25005	\N	0
118	9	5	t	\N	\N	http://jsbin.com/yolewikiti/edit?html,output	\N	6	2016-07-27 14:36:29.084575	2016-07-27 14:38:31.965377	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	1
128	10	4	f	\N	\N	http://jsbin.com/dotewazoki/edit?html,output	\N	30	2016-07-27 15:46:46.833136	2016-07-27 15:48:01.724781	\N	0	0	0	0	0	0	0	Necromancer25005	\N	0
119	9	5	f	\N	\N	http://jsbin.com/sovedumika/1/edit?html,output	\N	0	2016-07-27 14:51:05.079098	2016-07-27 14:58:49.136111	\N	0	0	0	0	0	0	0	MMOONNKKEEYY	\N	1
130	11	11	f	\N	\N	http://jsbin.com/roqifudive/1/edit	\N	8	2016-07-27 15:47:56.108591	2016-07-27 15:49:24.341187	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
120	8	7	f	\N	\N	http://jsbin.com/niqukisuti/1/edit?html,output	\N	7	2016-07-27 14:58:21.857942	2016-07-27 15:03:39.64182	\N	1	1	1	0	1	1	0	Armluck03	---\n- 1\n	1
137	9	12	f	\N	\N	http://jsbin.com/qitemoxogu/1/edit?html,output	\N	8	2016-07-27 16:21:49.419266	2016-07-27 16:23:58.549647	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	2
121	11	8	t	\N	\N	http://jsbin.com/zaleciruxa/1/edit?html,output	\N	0	2016-07-27 15:06:45.970693	2016-07-27 15:16:32.314331	\N	1	1	1	0	1	1	0	origamigirl3	---\n- 1\n	1
129	12	6	f	\N	\N	http://jsbin.com/cedayuquto/1/edit?html,output	\N	58	2016-07-27 15:47:35.863673	2016-07-27 15:53:56.152812	\N	0	0	0	0	0	0	0	omardude	\N	1
122	11	5	f	\N	\N	http://jsbin.com/salobiqaxe/1/edit?html,output	\N	8	2016-07-27 15:20:24.659696	2016-07-27 15:23:44.031671	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 1\n	1
123	12	6	f	\N	\N	http://jsbin.com/mowutipuvi/1/edit?html,output	\N	0	2016-07-27 15:21:28.044128	2016-07-27 15:24:45.286703	\N	0	0	0	0	0	0	0	omardude	\N	1
131	15	12	f	\N	\N	http://jsbin.com/yozipalami/1/edit?html,output	\N	5	2016-07-27 15:53:27.804674	2016-07-29 15:40:21.54135	\N	1	1	1	0	1	1	0	AlphaArceusOmegaMewtwo	---\n- 12\n	0
132	12	9	f	\N	\N	http://jsbin.com/qibixosowi/edit?html,output	\N	25	2016-07-27 15:53:38.378291	2016-07-27 15:58:24.496851	\N	0	0	0	0	0	0	0	Rk371143	\N	0
133	11	10	f	\N	\N	http://jsbin.com/numezixova/edit?html,output	\N	8	2016-07-27 15:55:28.970478	2016-07-27 16:03:12.769406	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
134	14	9	f	\N	\N	http://www.csszengarden.com/200/	\N	1	2016-07-27 15:56:16.381714	2016-07-27 16:03:29.34985	\N	0	0	0	0	0	0	0	Rk371143	\N	1
135	15	9	f	\N	\N	http://jsbin.com/ruqogitano/edit?html,output	\N	7	2016-07-27 16:11:58.572716	2016-07-27 16:19:22.475343	\N	0	0	0	0	0	0	0	Rk371143	\N	0
136	11	4	f	\N	\N	http://jsbin.com/basedexivo/edit?html,output	\N	8	2016-07-27 16:19:07.319003	2016-07-27 16:20:03.436165	\N	0	0	0	0	0	0	0	Necromancer25005	\N	2
138	16	6	f	\N	\N	http://jsbin.com/xixerogofi/1/edit?html,css,output	\N	7	2016-07-27 16:26:40.575188	2016-07-27 16:27:19.704153	\N	1	1	1	0	1	1	0	omardude	---\n- 1\n	0
139	12	11	f	\N	\N	http://jsbin.com/fupugefupa/1/edit	\N	45	2016-07-27 16:30:08.430463	2016-07-27 16:40:35.113383	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
140	12	4	f	\N	\N	http://jsbin.com/wumepefuje/edit?html,output	\N	100	2016-07-27 16:38:03.353565	2016-07-27 16:42:01.574487	\N	0	0	0	0	0	0	0	Necromancer25005	\N	0
143	12	11	f	\N	\N	http://jsbin.com/saqegoculo/1/edit	\N	55	2016-07-27 16:42:02.252091	2016-07-27 16:42:58.284702	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
141	14	4	f	\N	\N	http://www.csszengarden.com/218/	\N	1	2016-07-27 16:40:33.371603	2016-07-27 16:45:36.881036	\N	0	0	0	0	0	0	0	Necromancer25005	\N	0
146	9	7	f	\N	\N	http://jsbin.com/mehesiwozi/edit?html,output	\N	6	2016-07-28 14:38:51.855476	2016-07-28 14:48:58.947972	\N	1	1	1	0	1	1	0	Armluck03	---\n- 1\n	1
145	19	4	f	\N	\N	http://jsbin.com/civinazohu/edit?html,output	\N	10	2016-07-28 14:17:25.02517	2016-07-28 14:19:12.161108	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	1
144	16	9	f	\N	\N	http://jsbin.com/cukefurite/edit?html,output	\N	5	2016-07-27 16:53:56.085462	2016-07-28 14:19:27.059727	\N	1	1	1	0	1	1	0	Rk371143	---\n- 1\n	1
149	14	5	f	\N	\N	http://www.csszengarden.com/219/	\N	1	2016-07-28 15:11:38.945795	2016-07-28 15:16:07.531176	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 1\n	1
147	12	8	t	\N	\N	http://jsbin.com/quvexekahi/1/edit?html,output	\N	65	2016-07-28 14:54:52.464666	2016-07-28 15:14:09.417062	\N	1	1	1	0	1	1	0	origamigirl3	---\n- 1\n	1
151	15	11	f	\N	\N	http://jsbin.com/qitemoxogu/1/edit?html,output	\N	0	2016-07-28 15:48:28.255123	2016-07-28 15:49:05.607763	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
148	12	5	t	\N	\N	http://jsbin.com/giwekawafo/1/edit?html,output	\N	40	2016-07-28 14:59:35.604042	2016-07-28 15:17:06.192896	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 5\n	1
150	27	8	t	\N	\N	http://jsbin.com/zaqonabupu/1/edit?html,output	\N	20	2016-07-28 15:24:34.542374	2016-07-28 15:49:38.859089	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
152	15	11	f	\N	\N	http://jsbin.com/qitemoxogu/1/edit?html,output	\N	5	2016-07-28 15:49:28.87347	2016-07-28 15:49:53.918574	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
153	15	11	f	\N	\N	http://jsbin.com/celibumuku/edit?html,output	\N	5	2016-07-28 15:50:53.664338	2016-07-28 15:58:40.187236	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
156	16	11	f	\N	\N	http://jsbin.com/celibumuku/edit?html,output	\N	5	2016-07-28 15:57:02.440008	2016-07-28 15:58:41.939136	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
155	16	12	f	\N	\N	http://jsbin.com/tinisuwamu/edit?html,output	\N	0	2016-07-28 15:56:17.660314	2016-07-28 16:03:16.596021	\N	0	0	0	0	0	0	0	AlphaArceusOmegaMewtwo	\N	1
142	17	6	f	\N	\N	http://jsbin.com/qohemopaja/1/edit?html,output	\N	0	2016-07-27 16:41:45.726993	2016-07-28 16:16:59.455316	\N	0	0	0	0	0	0	0	omardude	\N	1
157	18	9	f	\N	\N	http://jsbin.com/nulerisewa/edit?html,output	\N	8	2016-07-28 16:06:05.599481	2016-07-28 16:28:08.452378	\N	0	0	0	0	0	0	0	Rk371143	\N	0
154	17	9	f	\N	\N	http://jsbin.com/cuhuvejiho/edit?html,output	\N	0	2016-07-28 15:54:32.027534	2016-07-28 16:17:17.130076	\N	0	0	0	0	0	0	0	Rk371143	\N	2
160	17	11	f	\N	\N	http://jsbin.com/celibumuku/edit?html,css,output	\N	8	2016-07-28 16:22:16.973205	2016-07-28 16:23:45.427198	\N	0	0	0	0	0	0	0	Vaporeon	\N	0
158	12	10	t	\N	\N	http://jsbin.com/sajuxayife/edit?html,output	\N	10	2016-07-28 16:07:32.025178	2016-07-28 16:29:30.152079	\N	0	0	0	0	0	0	0	greninjaisreal	\N	1
159	14	10	f	\N	\N	http://www.csszengarden.com/150/	\N	1	2016-07-28 16:18:57.39099	2016-07-28 16:27:28.536966	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
173	17	9	f	\N	\N	http://jsbin.com/lomesetuja/edit?html,output	\N	6	2016-07-29 16:24:45.438632	2016-07-29 16:38:40.308408	\N	0	0	0	0	0	0	0	Rk371143	\N	0
161	15	10	f	\N	\N	http://jsbin.com/qebipusaxa/edit?html,output	\N	5	2016-07-28 16:44:03.083739	2016-07-28 16:49:59.820335	\N	0	0	0	0	0	0	0	greninjaisreal	\N	1
162	12	10	f	\N	\N	http://jsbin.com/rufakunaba/edit?html,output	\N	25	2016-07-28 16:59:51.406876	2016-07-29 14:42:08.03476	\N	0	0	0	0	0	0	0	greninjaisreal	\N	1
164	12	5	t	\N	\N	http://jsbin.com/rukiwifibe/1/edit?html,output	\N	50	2016-07-29 14:21:13.823273	2016-07-29 14:42:46.672984	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 5\n	0
163	14	8	t	\N	\N	http://www.csszengarden.com/214/	\N	1	2016-07-29 14:20:04.608068	2016-07-29 14:43:05.227155	\N	0	0	0	0	0	0	0	origamigirl3	\N	0
165	11	7	f	\N	\N	http://jsbin.com/qamimalovu/1/edit?html,output	\N	4	2016-07-29 14:30:50.547021	2016-07-29 14:44:05.469637	\N	0	0	0	0	0	0	0	Armluck03	\N	1
174	16	10	f	\N	\N	http://jsbin.com/tolakiwura/edit?html,output	\N	7	2016-07-29 16:39:44.680834	2016-07-29 16:41:24.091189	\N	1	1	1	0	1	1	0	greninjaisreal	---\n- 1\n	1
166	15	8	t	\N	\N	http://jsbin.com/barefogeye/1/edit?html,output	\N	10	2016-07-29 14:53:32.262842	2016-07-29 14:56:15.304595	\N	1	1	1	0	1	1	0	origamigirl3	---\n- 1\n	1
167	10	7	f	\N	\N	http://jsbin.com/?html,output	\N	0	2016-07-29 15:11:29.300008	2016-07-29 15:12:16.801374	\N	0	0	0	0	0	0	0	Armluck03	\N	0
168	15	5	f	\N	\N	http://jsbin.com/vakayajiyu/1/edit?html,output	\N	7	2016-07-29 15:15:44.683166	2016-07-29 15:21:32.689006	\N	1	1	1	0	1	1	0	MMOONNKKEEYY	---\n- 1\n	0
169	18	4	f	\N	\N	http://jsbin.com/webiqocimu/edit?html,output	\N	35	2016-07-29 15:36:46.865798	2016-07-29 16:11:39.006613	\N	1	1	1	0	1	1	0	Necromancer25005	---\n- 1\n	0
170	16	12	f	\N	\N	http://jsbin.com/juzopihiri/edit?html,output	\N	5	2016-07-29 15:48:35.374646	2016-07-29 16:12:57.784305	\N	1	1	1	0	1	1	0	AlphaArceusOmegaMewtwo	---\n- 1\n	1
171	12	10	f	\N	\N	http://jsbin.com/notuvelisu/edit?html,output	\N	50	2016-07-29 16:05:01.383914	2016-07-29 16:14:38.209097	\N	0	0	0	0	0	0	0	greninjaisreal	\N	0
172	18	11	f	\N	\N	http://jsbin.com/jihupeqisa/1/edit	\N	10	2016-07-29 16:20:54.761288	2016-07-29 16:37:02.163616	\N	0	0	0	0	0	0	0	Vaporeon	\N	1
\.


--
-- Name: submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mosaic
--

SELECT pg_catalog.setval('submissions_id_seq', 174, true);


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY taggings (id, tag_id, taggable_type, taggable_id, tagger_type, tagger_id, context, created_at) FROM stdin;
\.


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mosaic
--

SELECT pg_catalog.setval('taggings_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY tags (id, name, taggings_count) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mosaic
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, username, cached_submission_points, cached_points, purchases) FROM stdin;
8	origamigirl3@gmail.com	$2a$11$Ugkc4.QQudhL2dj30gdCMeb95dgLdc2WILQK3JFc3Q982/2MVSSI6	\N	\N	\N	4	2016-07-29 14:14:51.019362	2016-07-27 14:16:18.070065	71.40.112.113	71.40.112.105	2016-07-25 14:45:12.575507	2016-07-29 14:56:15.318404	Sarah	origamigirl3	---\n9: 8\n8: 5\n3: 1\n6: 7\n4: 7\n7: 10\n10: 10\n11: 10\n12: 65\n27: 20\n14: 1\n15: 10\n	154	\N
3	joe@gmail.com	$2a$11$Q5FLxuUgfMHXP9fp.3Eeo.Nyv2dFmtG/xEiWrUyI.eH3YQ2xMWSYC	\N	\N	\N	1	2016-07-25 01:14:56.104623	2016-07-25 01:14:56.104623	::1	::1	2016-07-25 01:14:56.100406	2016-07-27 13:59:38.863014	Joe	joe	\N	0	\N
7	axm0846@g.coppellisd.com	$2a$11$AypNGrIO80s3gLDqZbpBWOUYPrz6sc8J9i9K8BbjPL5yxVbbS3TMm	\N	\N	\N	4	2016-07-28 14:19:16.802296	2016-07-27 14:09:54.678985	71.40.112.105	71.40.112.105	2016-07-25 14:42:44.711555	2016-07-29 15:12:16.813814	aryav	Armluck03	---\n3: 1\n4: 5\n6: 7\n7: 7\n8: 7\n9: 6\n11: 4\n10: 0\n	37	\N
11	ajv8472@g.coppellisd.com	$2a$11$MS6I3x6TzYgTgJ97Ov0glOaRoNX7Ia7m0DLpLGMN4VHcVvAUwqBX.	\N	\N	\N	11	2016-07-29 15:49:15.183564	2016-07-28 15:33:09.893824	71.40.112.113	71.40.112.113	2016-07-25 16:09:53.596076	2016-07-29 16:37:02.179393	Flareon	Vaporeon	---\n9: 6\n3: 1\n4: 5\n6: 5\n8: 5\n10: 8\n7: 7\n11: 8\n12: 55\n15: 5\n16: 5\n17: 8\n18: 10\n	128	\N
5	armancjuma@gmail.com	$2a$11$Pyx827K11uww28veWsyvUeVj8DGr5ojKOk3qZBNszxESMG91jdWoS	\N	\N	\N	3	2016-07-29 14:05:42.61899	2016-07-26 14:04:30.117055	71.40.112.113	71.40.112.105	2016-07-25 14:40:54.862298	2016-07-29 15:21:31.995657	Arman	MMOONNKKEEYY	---\n9: 6\n6: 5\n3: 1\n8: 5\n10: 6\n7: 7\n4: 7\n11: 8\n12: 50\n14: 1\n15: 7\n	103	\N
9	emailrohitkannan@gmail.com	$2a$11$A493Fp5dGerWJ/PyBbv6A.4zxVlSOOBlE4weCx7vth/hYcr1gBWCy	\N	\N	\N	6	2016-07-29 16:05:33.109414	2016-07-28 15:48:57.733929	71.40.112.105	71.40.112.105	2016-07-25 16:08:36.995122	2016-07-29 16:38:40.324082	Rohit Kannan	Rk371143	---\n7: 5\n6: 5\n3: 1\n8: 5\n4: 5\n9: 8\n10: 8\n11: 8\n12: 25\n14: 1\n15: 7\n16: 5\n17: 6\n18: 8\n	97	\N
10	mhl9814@g.coppellisd.com	$2a$11$qCv5O3eO2gJC02pjWtqJw.QcgDjxJ1MXsz/rYWMBAS6O0pTiUwtam	\N	\N	\N	6	2016-07-29 15:33:20.232677	2016-07-28 15:33:13.431165	71.40.112.113	71.40.112.113	2016-07-25 16:09:52.255802	2016-07-29 16:41:21.197011	greninjaisreal	greninjaisreal	---\n6: 5\n7: 5\n3: 1\n4: 5\n9: 6\n8: 7\n10: 6\n11: 8\n12: 50\n14: 1\n15: 5\n16: 7\n	106	\N
6	sxa9928@g.coppellisd.com	$2a$11$ZxE7IZ0loB2aKMC3ferCXOhESmqZCgwxEAYTzxitrmTPe6Oul0e3q	\N	\N	\N	3	2016-07-28 14:23:49.906889	2016-07-26 14:13:30.182564	71.40.112.105	71.40.112.105	2016-07-25 14:41:05.687446	2016-07-28 16:16:59.47169	Omar Ali	omardude	---\n12: 58\n7: 5\n14: 1\n3: 1\n15: 5\n6: 5\n10: 6\n9: 6\n4: 7\n8: 7\n11: 8\n16: 7\n17: 0\n	116	\N
1	christian.genco@gmail.com	$2a$11$2.NCMLWTihVYzcwwFcjsMORByJoyOyXvSEfeGSXtPrTIjyjy09Kra	\N	\N	\N	8	2016-07-29 14:13:49.179004	2016-07-28 13:57:55.229964	71.40.112.113	71.40.112.113	2016-07-12 02:49:47.613719	2016-07-29 14:23:44.617574	Christian Genco	cgenco	---\n3: 1\n	1	\N
4	paulchinnam@icloud.com	$2a$11$.RFWXlsjBIAuH./lZkJTPujCMe4prK4SUvl.Deuw/MpqnEYM5uuDm	\N	\N	\N	5	2016-07-28 14:16:07.554841	2016-07-27 14:05:54.753012	71.40.112.105	71.40.112.105	2016-07-25 14:39:12.328523	2016-07-29 16:11:36.425072	Paul	Necromancer25005	---\n3: 10\n4: 40\n7: 15\n8: 17\n6: 20\n9: 35\n10: 30\n11: 8\n12: 100\n14: 1\n19: 10\n18: 35\n	321	\N
12	lrd1510@g.coppellisd.com	$2a$11$ryXiyVoEEQfPtOofnXY7g.y6nvIP5pEYowd0DDWINl7yBXNv/tazS	\N	\N	\N	5	2016-07-29 15:33:40.285331	2016-07-28 15:38:09.017094	71.40.112.113	71.40.112.113	2016-07-25 16:10:21.334264	2016-07-29 16:12:57.798385	Lohith Dudhyala	AlphaArceusOmegaMewtwo	---\n4: 5\n6: 5\n3: 1\n7: 5\n8: 5\n15: 5\n9: 8\n16: 5\n	39	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mosaic
--

SELECT pg_catalog.setval('users_id_seq', 12, true);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: mosaic
--

COPY votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
52	Submission	6	User	1	t	\N	1	2016-07-24 22:40:35.694398	2016-07-24 22:40:35.694398
58	Submission	22	User	1	t	\N	1	2016-07-25 14:43:44.448371	2016-07-25 14:43:44.448371
59	Submission	27	User	1	t	\N	1	2016-07-25 14:55:06.844168	2016-07-25 14:55:06.844168
60	Submission	26	User	1	t	\N	1	2016-07-25 14:55:07.781574	2016-07-25 14:55:07.781574
61	Submission	29	User	1	t	\N	1	2016-07-25 14:58:40.139271	2016-07-25 14:58:40.139271
62	Submission	28	User	1	t	\N	1	2016-07-25 14:58:41.978227	2016-07-25 14:58:41.978227
63	Submission	25	User	1	t	\N	1	2016-07-25 14:58:42.796386	2016-07-25 14:58:42.796386
64	Submission	29	User	5	t	\N	1	2016-07-25 14:58:46.790926	2016-07-25 14:58:46.790926
65	Submission	30	User	1	t	\N	1	2016-07-25 14:59:09.541091	2016-07-25 14:59:09.541091
66	Submission	25	User	7	t	\N	1	2016-07-25 14:59:24.681088	2016-07-25 14:59:24.681088
67	Submission	31	User	1	t	\N	1	2016-07-25 15:03:40.315067	2016-07-25 15:03:40.315067
69	Submission	33	User	5	t	\N	1	2016-07-25 15:10:06.731299	2016-07-25 15:10:06.731299
70	Submission	33	User	1	t	\N	1	2016-07-25 15:18:55.429154	2016-07-25 15:18:55.429154
71	Submission	34	User	1	t	\N	1	2016-07-25 15:19:28.113897	2016-07-25 15:19:28.113897
73	Submission	37	User	1	t	\N	1	2016-07-25 15:21:48.861282	2016-07-25 15:21:48.861282
74	Submission	38	User	5	t	\N	1	2016-07-25 15:22:14.491466	2016-07-25 15:22:14.491466
75	Submission	48	User	1	t	\N	1	2016-07-25 16:13:20.638683	2016-07-25 16:13:20.638683
76	Submission	45	User	1	t	\N	1	2016-07-25 16:15:24.779176	2016-07-25 16:15:24.779176
77	Submission	51	User	12	t	\N	1	2016-07-25 16:18:51.119476	2016-07-25 16:18:51.119476
78	Submission	50	User	1	t	\N	1	2016-07-25 16:19:34.739374	2016-07-25 16:19:34.739374
79	Submission	51	User	1	t	\N	1	2016-07-25 16:19:53.559458	2016-07-25 16:19:53.559458
80	Submission	55	User	1	t	\N	1	2016-07-25 16:22:52.985483	2016-07-25 16:22:52.985483
81	Submission	56	User	1	t	\N	1	2016-07-25 16:28:22.963616	2016-07-25 16:28:22.963616
84	Submission	61	User	1	t	\N	1	2016-07-25 16:37:02.710077	2016-07-25 16:37:02.710077
85	Submission	62	User	1	t	\N	1	2016-07-25 16:37:21.959811	2016-07-25 16:37:21.959811
86	Submission	71	User	1	t	\N	1	2016-07-25 16:53:25.34371	2016-07-25 16:53:25.34371
87	Submission	60	User	1	t	\N	1	2016-07-25 16:55:11.539141	2016-07-25 16:55:11.539141
88	Submission	72	User	1	t	\N	1	2016-07-25 16:56:00.791507	2016-07-25 16:56:00.791507
89	Submission	73	User	1	t	\N	1	2016-07-25 16:57:30.084517	2016-07-25 16:57:30.084517
90	Submission	75	User	1	t	\N	1	2016-07-26 14:10:48.278006	2016-07-26 14:10:48.278006
91	Submission	76	User	1	t	\N	1	2016-07-26 14:11:43.511468	2016-07-26 14:11:43.511468
92	Submission	79	User	1	t	\N	1	2016-07-26 14:46:46.38666	2016-07-26 14:46:46.38666
93	Submission	89	User	1	t	\N	1	2016-07-26 15:12:55.700711	2016-07-26 15:12:55.700711
95	Submission	92	User	1	t	\N	1	2016-07-26 15:26:20.266811	2016-07-26 15:26:20.266811
97	Submission	98	User	1	t	\N	1	2016-07-26 15:51:17.877008	2016-07-26 15:51:17.877008
98	Submission	112	User	1	t	\N	1	2016-07-26 16:41:38.172668	2016-07-26 16:41:38.172668
99	Submission	115	User	1	t	\N	1	2016-07-26 20:25:00.576883	2016-07-26 20:25:00.576883
100	Submission	116	User	1	t	\N	1	2016-07-27 14:32:55.812998	2016-07-27 14:32:55.812998
101	Submission	117	User	1	t	\N	1	2016-07-27 14:33:58.970667	2016-07-27 14:33:58.970667
102	Submission	120	User	1	t	\N	1	2016-07-27 15:03:39.60948	2016-07-27 15:03:39.60948
103	Submission	121	User	1	t	\N	1	2016-07-27 15:16:31.499745	2016-07-27 15:16:31.499745
104	Submission	122	User	1	t	\N	1	2016-07-27 15:23:06.869682	2016-07-27 15:23:06.869682
105	Submission	138	User	1	t	\N	1	2016-07-27 16:27:19.668934	2016-07-27 16:27:19.668934
106	Submission	144	User	1	t	\N	1	2016-07-28 14:19:10.994719	2016-07-28 14:19:10.994719
107	Submission	145	User	1	t	\N	1	2016-07-28 14:19:12.122128	2016-07-28 14:19:12.122128
108	Submission	146	User	1	t	\N	1	2016-07-28 14:48:58.379854	2016-07-28 14:48:58.379854
110	Submission	147	User	1	t	\N	1	2016-07-28 15:12:57.224218	2016-07-28 15:12:57.224218
111	Submission	149	User	1	t	\N	1	2016-07-28 15:15:58.317597	2016-07-28 15:15:58.317597
112	Submission	148	User	5	t	\N	1	2016-07-28 15:16:36.457788	2016-07-28 15:16:36.457788
115	Submission	164	User	5	t	\N	1	2016-07-29 14:21:27.680681	2016-07-29 14:21:27.680681
116	Submission	166	User	1	t	\N	1	2016-07-29 14:55:52.580848	2016-07-29 14:55:52.580848
117	Submission	168	User	1	t	\N	1	2016-07-29 15:21:32.648153	2016-07-29 15:21:32.648153
118	Submission	131	User	12	t	\N	1	2016-07-29 15:40:21.505698	2016-07-29 15:40:21.505698
119	Submission	169	User	1	t	\N	1	2016-07-29 16:11:38.963778	2016-07-29 16:11:38.963778
120	Submission	170	User	1	t	\N	1	2016-07-29 16:12:40.323642	2016-07-29 16:12:40.323642
121	Submission	174	User	1	t	\N	1	2016-07-29 16:41:24.05184	2016-07-29 16:41:24.05184
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mosaic
--

SELECT pg_catalog.setval('votes_id_seq', 121, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_commentable_type_and_commentable_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_comments_on_commentable_type_and_commentable_id ON comments USING btree (commentable_type, commentable_id);


--
-- Name: index_comments_on_parent_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_comments_on_parent_id ON comments USING btree (parent_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_submissions_on_cached_votes_down; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_cached_votes_down ON submissions USING btree (cached_votes_down);


--
-- Name: index_submissions_on_cached_votes_score; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_cached_votes_score ON submissions USING btree (cached_votes_score);


--
-- Name: index_submissions_on_cached_votes_total; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_cached_votes_total ON submissions USING btree (cached_votes_total);


--
-- Name: index_submissions_on_cached_votes_up; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_cached_votes_up ON submissions USING btree (cached_votes_up);


--
-- Name: index_submissions_on_cached_weighted_average; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_cached_weighted_average ON submissions USING btree (cached_weighted_average);


--
-- Name: index_submissions_on_cached_weighted_score; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_cached_weighted_score ON submissions USING btree (cached_weighted_score);


--
-- Name: index_submissions_on_cached_weighted_total; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_cached_weighted_total ON submissions USING btree (cached_weighted_total);


--
-- Name: index_submissions_on_challenge_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_challenge_id ON submissions USING btree (challenge_id);


--
-- Name: index_submissions_on_user_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_submissions_on_user_id ON submissions USING btree (user_id);


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_taggings_on_context ON taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_taggings_on_taggable_id ON taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_taggings_on_taggable_type ON taggings USING btree (taggable_type);


--
-- Name: index_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_taggings_on_tagger_id ON taggings USING btree (tagger_id);


--
-- Name: index_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_taggings_on_tagger_id_and_tagger_type ON taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE UNIQUE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON votes USING btree (votable_id, votable_type, vote_scope);


--
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON votes USING btree (voter_id, voter_type, vote_scope);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE UNIQUE INDEX taggings_idx ON taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: mosaic
--

CREATE INDEX taggings_idy ON taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_62fce1582b; Type: FK CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY submissions
    ADD CONSTRAINT fk_rails_62fce1582b FOREIGN KEY (challenge_id) REFERENCES challenges(id);


--
-- Name: fk_rails_8d85741475; Type: FK CONSTRAINT; Schema: public; Owner: mosaic
--

ALTER TABLE ONLY submissions
    ADD CONSTRAINT fk_rails_8d85741475 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

