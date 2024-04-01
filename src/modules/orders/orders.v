module orders

import json
import client {Client}
import model {Result, Order, Payment, DateAndQuantity, OnlineStats, SiteStats, IdAndQuantity, OrderParams, ActionResult}

// orders All orders
// See https://api.reyden-x.com/docs#/Orders/orders_v1_orders__get
pub fn orders(mut c Client, cursor string) !Result[[]Order] {
	mut path := ['/orders/']
	if cursor.len > 0 {
		path << '?cursor=${cursor}'
	}

	return c.get[Result[[]Order]](path.join(''))
}

// details Order details
// See https://api.reyden-x.com/docs#/Orders/order_details_v1_orders__order_id___get
pub fn details(mut c Client, order_id int) !Result[Order] {
	return c.get[Result[Order]]('/orders/${order_id}/')
}

// payments Order payments
// See https://api.reyden-x.com/docs#/Orders/order_payments_v1_orders__order_id__payments__get
pub fn payments(mut c Client, order_id int) !Result[[]Payment] {
	mut path := ['/orders/${order_id}/payments/']
	if cursor.len > 0 {
		path << '?cursor=${cursor}'
	}

	return c.get[Result[[]Payment]](path.join(''))
}

// online_stats Detailed information about users online
// See https://api.reyden-x.com/docs#/Orders/order_stats_online_v1_orders__order_id__statistics_online__get
pub fn online_stats(mut c Client, order_id int) !Result[[]OnlineStats] {
	return c.get[Result[[]OnlineStats]]('/orders/${order_id}/statistics/online/')
}

// clicks_stats Detailed information about clicks
// See https://api.reyden-x.com/docs#/Orders/order_stats_clicks_v1_orders__order_id__statistics_clicks__get
pub fn clicks_stats(mut c Client, order_id int) !Result[[]DateAndQuantity] {
	return c.get[Result[[]DateAndQuantity]]('/orders/${order_id}/statistics/clicks/')
}

// views_stats Detailed information about views
// See https://api.reyden-x.com/docs#/Orders/order_stats_views_v1_orders__order_id__statistics_views__get
pub fn views_stats(mut c Client, order_id int) !Result[[]DateAndQuantity] {
	return c.get[Result[[]DateAndQuantity]]('/orders/${order_id}/statistics/views/')
}

// sites_stats Detailed information about sites
// See https://api.reyden-x.com/docs#/Orders/order_stats_sites_v1_orders__order_id__statistics_sites__get
pub fn sites_stats(mut c Client, order_id int) !Result[[]SiteStats]] {
	return c.get[Result[[]SiteStats]]('/orders/${order_id}/statistics/sites/')
}

// multiple_views_stats View statistics for multiple orders
// See https://api.reyden-x.com/docs#/Orders/multiple_views_v1_orders_multiple_views__post
pub fn multiple_views_stats(mut c Client, identifiers []int) !Result[[]IdAndQuantity] {
	data := json.encode(identifiers)
	return c.post[Result[[]IdAndQuantity]]('/orders/multiple/views/', data)
}

// multiple_clicks_stats Click-through statistics for multiple orders
// See https://api.reyden-x.com/docs#/Orders/multiple_clicks_v1_orders_multiple_clicks__post
pub fn multiple_clicks_stats(mut c Client, identifiers []int) !Result[[]IdAndQuantity] {
	data := json.encode(identifiers)
	return c.post[Result[[]IdAndQuantity]]('/orders/multiple/clicks/', data)
}

// create_stream Create new order for Twitch or Youtube stream
// See https://api.reyden-x.com/docs#/Orders/twitch_stream_v1_orders_create_twitch_stream__post
pub fn create_stream(mut c Client, params OrderParams) !ActionResult {
	platform_code := params.platform_code()
	if !params.is_valid() {
		return error('${platform_code} has invalid params')
	}

	data := json.encode(params)
	return c.post[ActionResult]('/orders/create/${platform_code}/stream/', data)
}
