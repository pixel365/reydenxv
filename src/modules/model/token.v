module model

pub struct Token {
	request_id string
	token_type string
	expires_in string
pub:
	access_token string
}

pub fn (t Token) is_authenticated() bool {
	if t.access_token == '' {
		return false
	}
	return true
}
