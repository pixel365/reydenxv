module prices

import client {Client}
import model {Result, Platform, Price}

fn request(mut c Client, p Platform) !Response[[]Price] {
	return c.get[Result[[]Price]]('/prices/${p.str()}/')
}

// twitch All prices for Twitch
// See https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get
pub fn twitch(mut c Client) !Response[[]Price] {
	return request(c, Platform.twitch)
}

// youtube All prices for YouTube
// See https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get
pub fn youtube(mut c Client) !Response[[]Price] {
	return request(c, Platform.youtube)
}

// goodgame All prices for GoodGame
// See https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get
pub fn goodgame(mut c Client) !Response[[]Price] {
	return request(c, Platform.goodgame)
}

// trovo All prices for Trovo
// See https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get
pub fn trovo(mut c Client) !Response[[]Price] {
	return request(c, Platform.trovo)
}

// vkplay All prices for VkPlay
// See https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get
pub fn vkplay(mut c Client) !Response[[]Price] {
	return request(c, Platform.vkplay)
}
