module model

pub struct Balance {
	id int
	amount f64
	currency_id int
	user_id int
	formatted_amount f64
	curency string
}

pub struct Account {
	id int
	username string
	date_joined string
	email string
	is_active bool
	is_blocked bool
	is_reseller bool
	has_image bool
	image_extension string
	image_url string
	currency_id int
	discount_value int
	twitch_id int
	twitch_login string
}
