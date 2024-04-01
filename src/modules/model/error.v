module model

pub struct RequestError {
	status_code int
	message string
}

fn (e RequestError) msg() string {
	return e.message
}

fn (e RequestError) code() int {
	return e.status_code
}
