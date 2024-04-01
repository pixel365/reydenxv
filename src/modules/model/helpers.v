module model

pub enum Platform {
	twitch
	youtube
	goodgame
	trovo
	vkplay
}

pub struct Id {
	id int
}

pub struct Date {
	created_at string
	updated_at string
}

pub struct CodeAndQuantity {
	code string
	quantity int
}

pub struct MinMaxStep {
	min int
	max int
	step int
}

pub struct DateAndQuantity {
	date string
	quantity int
}

pub struct OnlineStats {
	created_at string
	in_settings int
	in_fact int
}

pub struct SiteStats {
	domain string
	views int
	clicks int
	ctr f64
}

pub struct Payment {
	Id
	Date
	payed_at string
	order_id int
	amount f64
	external_id string
	uuid string
	receipt string
}

pub struct IdAndQuantity {
	Id
	quantity int
}

pub struct SmoothGain {
	enabled bool
	minutes int
}

pub interface OrderParams {
	is_valid() bool
	platform_code() string
}

pub struct BaseOrderParams {
	launch_mode string
	smooth_gain SmoothGain
	price_id int
	number_of_views int
	number_of_viewers int
	delay_time int
}

fn is_launch_mode_valid(launch_mode string) bool {
	return launch_mode == "auto" || launch_mode == "manual" || launch_mode == "delay"
}

pub struct TwitchParams {
	BaseOrderParams
	twitch_id int
}

pub struct YouTubeParams {
	BaseOrderParams
	channel_url string
}

pub fn (o TwitchParams) is_valid() bool {
	return is_launch_mode_valid(o.launch_mode) && o.twitch_id > 0
}

pub fn (o TwitchParams) platform_code() string {
	return "twitch"
}

pub fn (o YouTubeParams) is_valid() bool {
	return is_launch_mode_valid(o.launch_mode) && o.channel_url.len > 0
}

pub fn (o YouTubeParams) platform_code() string {
	return "youtube"
}

pub struct Task {
	Id
	url string
	expires_at string
}

pub struct ActionResult {
	task Task
	request_id string
	action string
	order_id int
	value int
}

pub struct TaskDetails {
	status string
}
