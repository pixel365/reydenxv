module traffic

import client {Client}
import model {Result, CodeAndQuantity}

// countries Traffic statistics by country
// See https://api.reyden-x.com/docs#/Traffic/Traffic_statistics_by_country_v1_traffic_countries__get
pub fn countries(mut c Client) !Result[[]CodeAndQuantity] {
	return c.get[Result[[]CodeAndQuantity]]('/traffic/countries/')
}

// languages Traffic statistics by language
// See https://api.reyden-x.com/docs#/Traffic/Traffic_statistics_by_language_v1_traffic_languages__get
pub fn languages(mut c Client) !Result[[]CodeAndQuantity] {
	return c.get[Result[[]CodeAndQuantity]]('/traffic/languages/')
}

// devices Traffic statistics by device type
// See https://api.reyden-x.com/docs#/Traffic/Traffic_statistics_by_device_type_v1_traffic_devices__get
pub fn devices(mut c Client) !Result[[]CodeAndQuantity] {
	return c.get[Result[[]CodeAndQuantity]]('/traffic/devices/')
}
