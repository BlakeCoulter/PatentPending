CREATE TABLE business( --entity
	bid char(22),
	city varchar,
	business_name varchar,
	business_address varchar,
	business_state varchar,
	postal code INTEGER,
	latitude FLOAT,
	longitude FLOAT,
	stars FLOAT,
	review_count INTEGER,
	is_open BINARY,
	PRIMARY KEY(bid)
);

CREATE TABLE categories ( --not optional  multivalue of business
	bid char(22) NOT NULL,
	catagory varchar,
	PRIMARY KEY (bid),
	FOREIGN KEY (bid) REFERENCES business(bid)
);

CREATE TABLE business_hours( --not optional  multivalue of business
	bid char(22) NOT NULL,
	monday varchar,
	tuesday varchar,
	wednesday varchar,
	thursday varchar,
	friday varchar,
	saturday varchar,
	sunday varchar,
	FOREIGN KEY (bid) REFERENCES business(bid)
);

CREATE TABLE attributes ( --not optional  nested attribute of business
	bid char(22) NOT NULL,
	GoodForKids varchar,
	NoiseLevel varchar,
	RestaurantsDelivery varchar,
	Alcohol varchar,
	Caters varchar,
	wifi varchar,
	RestaurantsTakeOut varchar,
	BusinessAcceptsCreditCards varchar,
	PRIMARY KEY (bid),
	FOREIGN KEY (bid) REFERENCES business(bid)

);

CREATE TABLE GoodForMeal( --optional   nested attribute of attributes
	bid char(22), 
	dessert varchar,
	latenight varchar,
	lunch varchar,
	dinner varchar,
	brunch varchar,
	breakfast varchar,
	PRIMARY KEY (bid),
	FOREIGN KEY (bid) REFERENCES business(bid) 
);

CREATE TABLE Ambience( -- optional   nested attribute of attributes
	bid char(22), 
	romantic varchar,
	initimate varchar,
	touristy varchar,
	hipster varchar,
	divey varchar,
	classy varchar, 
	trendy varchar,
	upscale varchar,
	casual varchar,
	PRIMARY KEY (bid),
	FOREIGN KEY (bid) REFERENCES business(bid) 
);

CREATE TABLE parking( --optional  nested attribute of attributes
	bid char(22),
	garage varchar,
	street varchar,
	validated varchar,
	lot varchar,
	valet varchar,
	PRIMARY KEY (bid),
	FOREIGN KEY (bid) REFERENCES business(bid)
);

CREATE TABLE check_in( --entity
	bid char(22) NOT NULL,
	PRIMARY KEY (bid),
	FOREIGN KEY (bid) REFERENCES business(bid)
);

CREATE TABLE check_in_table( --multivalue of check_in
	bid char(22) NOT NULL,
	check_in_date varchar,
	PRIMARY KEY (bid),
	FOREIGN KEY (bid) REFERENCES business(bid)
);

CREATE TABLE tip( --relation
	bid char(22),
	u_id char(22),
	tip_date varchar,
	likes INTEGER,
	txt varchar,
	PRIMARY KEY (bid,u_id),
	FOREIGN KEY (bid) REFERENCES business(bid),
	FOREIGN KEY (u_id) REFERENCES user(u_id)
);

CREATE TABLE user( --entity
	u_id char(22),
	avg_stars FLOAT,
	cool INTEGER,
	fans INTEGER,
	funny INTEGER,
	u_name varchar,
	tip_count varchar,
	useful INTEGER,
	yelping_since varchar,
	PRIMARY KEY (u_id)
);

CREATE TABLE friends( --multivalue of user
	u_id char(22) NOT NULL,
	friend_id char(22),
	PRIMARY KEY (u_id),
	FOREIGN KEY (u_id) REFERENCES user(u_id)
);




