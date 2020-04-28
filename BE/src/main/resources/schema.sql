DROP TABLE IF EXISTS babchan;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS badge;
DROP TABLE IF EXISTS thumb_image;
DROP TABLE IF EXISTS detail_section;
DROP TABLE IF EXISTS food_type;

CREATE TABLE food_type
(
    type       VARCHAR(64) PRIMARY KEY,
    menu_index INTEGER,
    sub_title  VARCHAR(64),
    main_title VARCHAR(64)
);

CREATE TABLE babchan
(
    hash          VARCHAR(32) PRIMARY KEY,
    type          VARCHAR(64) REFERENCES food_type (type) ON UPDATE CASCADE ON DELETE CASCADE,
    image         VARCHAR(128),
    alt           VARCHAR(64),
    title         VARCHAR(128),
    description   VARCHAR(128),
    n_price       VARCHAR(32),
    s_price       VARCHAR(32),
    top_image     VARCHAR(128),
    point         VARCHAR(128),
    delivery_info VARCHAR(128),
    delivery_fee  VARCHAR(128)
);

CREATE TABLE delivery
(
    hash VARCHAR(32) REFERENCES babchan (hash) ON UPDATE CASCADE ON DELETE CASCADE,
    type VARCHAR(64)
);

CREATE TABLE badge
(
    hash      VARCHAR(32) REFERENCES babchan (hash) ON UPDATE CASCADE ON DELETE CASCADE,
    badgeName VARCHAR(32),
    badgeHexa VARCHAR(32)
);

CREATE TABLE thumb_image
(
    hash     VARCHAR(32) REFERENCES babchan (hash) ON UPDATE CASCADE ON DELETE CASCADE,
    imageUrl VARCHAR(256)
);

CREATE TABLE detail_section
(
    hash     VARCHAR(32) REFERENCES babchan (hash) ON UPDATE CASCADE ON DELETE CASCADE,
    imageUrl VARCHAR(256)
);