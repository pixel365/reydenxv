module user

import client {Client}
import model {Balance, Account}

// account User Account
// See https://api.reyden-x.com/docs#/User/get_user_v1_user__get
pub fn account(mut c Client) !Account {
	return c.get[Account]('/user/account/')
}

// balance User Balance
// See https://api.reyden-x.com/docs#/User/get_balance_v1_user_balance__get
pub fn balance (mut c Client) !Balance {
	return c.get[Balance]('/user/balance/')
}
