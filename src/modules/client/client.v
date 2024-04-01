module client

import json
import net.http
import model { Token, RequestError }

const url = 'https://api.reyden-x.com/v1'

pub struct Client {
	username string
	password string
pub mut:
	token Token
}

pub fn (mut c Client) request(method http.Method, url string, data string) !http.Response{
	mut request := http.new_request(method, url, data)
	request.add_header(http.CommonHeader.authorization, 'Bearer ${c.token.access_token}')

	response := request.do() or {
		return RequestError{
			status_code: http.Status.internal_server_error.int(), 
			message: http.Status.internal_server_error.str()
		}
	}

	return response
}

pub fn (mut c Client) is_authenticated() !bool {
	if !c.token.is_authenticated() {
		return RequestError{
			status_code: http.Status.unauthorized.int(), 
			message: http.Status.unauthorized.str()
		}
	}
	return true
}

pub fn (mut c Client) token() !Token {
	c.auth() or {return err}
	return c.token
}

pub fn (mut c Client) refresh_token() !Token {
	c.is_authenticated() or {return err}
	return c.patch[Token]('/token/refresh/')
}

pub fn (mut c Client) revoke_token() !http.Response {
	c.is_authenticated() or {return err}
	return c.request(http.Method.delete, '/token/revoke/', '')
}

pub fn (mut c Client) get[T](path string) !T {
	c.auth() or {return err}
	response := c.request(http.Method.get, '${url}/${path}', '') or {return err}
	return c.handle_response[T](response)
}

pub fn (mut c Client) post[T](path string, data string) !T {
	c.auth() or {return err}
	response := c.request(http.Method.post, '${url}/${path}', data) or {return err}
	return c.handle_response[T](response)
}

pub fn (mut c Client) delete[T](path string) !T {
	c.auth() or {return err}
	response := c.request(http.Method.delete, '${url}/${path}', '') or {return err}
	return c.handle_response[T](response)
}

pub fn (mut c Client) patch[T](path string) !T {
	c.auth() or {return err}
	response := c.request(http.Method.patch, '${url}/${path}', '') or {return err}
	return c.handle_response[T](response)
}

fn (mut c Client) handle_response[T](response http.Response) !T {
	if response.status_code == http.Status.ok.int() {
		result := json.decode(T, response.body) or {
			return RequestError{
				status_code: http.Status.internal_server_error.int(), 
				message: 'Response Decode Error'
			}
		}
		return result
	}

	return RequestError{status_code: response.status_code, message: response.status.str()}
}

fn (mut c Client) auth() !Token {
	if c.token.is_authenticated() {
		return c.token
	}
	response := http.post_form('${url}/token/', {
		'username': c.username,
		'password': c.password
	}) or {
		return RequestError{
			status_code: http.Status.bad_request.int(), 
			message: http.Status.bad_request.str()
		}
	}

	if response.status_code == http.Status.ok.int() {
		c.token = json.decode(Token, response.body) or {
			return RequestError{
				status_code: http.Status.bad_request.int(),
				message: 'Token Decode Error'
			}
		}
	}

	c.is_authenticated() or {return err}

	return c.token
}
