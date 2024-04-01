module model

pub struct Order {
	Id
	Date
	uuid string
	status string
	ordered_view_qty int
	price_per_view f64
	is_autostart bool
	online_users_limit int
	platform string
	content_type string
	// parameters
	// extras
	// statistics
	content_classification_labels []string
}
