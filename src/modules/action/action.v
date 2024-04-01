module action

import client {Client}
import model {ActionResult, TaskDetails}

// run Launches an order
// See https://api.reyden-x.com/docs#/Orders/order_run_v1_orders__order_id__action_run__patch
pub fn run(mut c Client, order_id int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/run/')
}

// stop Stop the order
// See https://api.reyden-x.com/docs#/Orders/order_stop_v1_orders__order_id__action_stop__patch
pub fn stop(mut c Client, order_id int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/stop/')
}

// cancel Cancel the order
// See https://api.reyden-x.com/docs#/Orders/order_cancel_v1_orders__order_id__action_cancel__patch
pub fn cancel(mut c Client, order_id int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/cancel/')
}

// change_online Change the number of viewers
// See https://api.reyden-x.com/docs#/Orders/order_change_online_v1_orders__order_id__action_change_online__value___patch
pub fn change_online(mut c Client, order_id int, value int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/change/online/${value}/')
}

// change_increase_value Change the time of the smooth set of viewers
// See https://api.reyden-x.com/docs#/Orders/change_increase_value_v1_orders__order_id__action_increase_change__value___patch
pub fn change_increase_value(mut c Client, order_id int, value int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/increase/change/${value}/')
}

// increase_on Enable smooth increase of viewers
// See https://api.reyden-x.com/docs#/Orders/increase_on_v1_orders__order_id__action_increase_on__value___patch
pub fn increase_on(mut c Client, order_id int, value int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/increase/on/${value}/')
}

// increase_off Disable smooth increase of viewers
// See https://api.reyden-x.com/docs#/Orders/increase_off_v1_orders__order_id__action_increase_off__patch
pub fn increase_off(mut c Client, order_id int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/increase/off/')
}

// add_views Add views to order
// See https://api.reyden-x.com/docs#/Orders/add_views_v1_orders__order_id__action_add_views__value___patch
pub fn add_views(mut c Client, order_id int, value int) !ActionResult {
	return c.patch[ActionResult]('/orders/${order_id}/action/add/views/${value}/')
}

// task_status Check the task status
// See https://api.reyden-x.com/docs#/Orders/order_get_task_status_v1_orders__order_id__task__task_id__status__get
pub fn task_status(mut c Client, order_id string, task_id string) !TaskDetails {
	return c.get[TaskDetails]('/orders/${order_id}/task/${task_id}/status/')
}
