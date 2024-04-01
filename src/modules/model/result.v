module model

pub struct Result[T] {
	request_id string
	cached bool
	cache_expires_at string
	result T
	cursor string
}
