module model

pub struct Price {
	id int
	name string
	format string
	price f64
	description string
	views MinMaxStep
	online_viewers MinMaxStep
}
