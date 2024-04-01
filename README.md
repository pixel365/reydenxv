# REYDEN-X

###### Reyden-X is an automated service for promoting live broadcasts on external sites with integrated system of viewers and views management.

- [Website](https://reyden-x.com/en)

- [API Documentation](https://api.reyden-x.com/docs)

### Installation

```shell
v install pixel365.reydenxv
```

### Quickstart

### User

##### Account Info

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.user

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := user.account(client) or {
    panic(err)
}
```

##### Balance Info

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.user

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := user.balance(client) or {
    panic(err)
}
```

### Traffic

##### Countries

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.traffic

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := traffic.countries(client) or {
    panic(err)
}
```

##### Languages

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.traffic

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := traffic.languages(client) or {
    panic(err)
}
```

##### Devices

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.traffic

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := traffic.devices(client) or {
    panic(err)
}
```

### Prices

##### Twitch

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.prices

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := prices.twitch(client) or {
    panic(err)
}
```

##### YouTube

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.prices

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := prices.youtube(client) or {
    panic(err)
}
```

##### GoodGame

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.prices

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := prices.goodgame(client) or {
    panic(err)
}
```

##### Trovo

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.prices

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := prices.trovo(client) or {
    panic(err)
}
```

##### VK Play

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.prices

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := prices.vkplay(client) or {
    panic(err)
}
```

### Orders

##### All Orders

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := o.orders(client, '') or {
    panic(err)
}
```

##### Order Details

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := o.details(client, 123456) or {
    panic(err)
}
```

##### Order Payments

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := o.payments(client, 123456) or {
    panic(err)
}
```

##### Detailed information about users online

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := o.online_stats(client, 123456) or {
    panic(err)
}
```

##### Detailed information about clicks

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := o.clicks_stats(client, 123456) or {
    panic(err)
}
```

##### Detailed information about views

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := o.views_stats(client, 123456) or {
    panic(err)
}
```

##### Detailed information about sites

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := o.sites_stats(client, 123456) or {
    panic(err)
}
```

##### View statistics for multiple orders

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

identifiers := [1, 2, 3, 4, 5]
result := o.multiple_views_stats(client, identifiers) or {
    panic(err)
}
```

##### Click-through statistics for multiple orders

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

identifiers := [1, 2, 3, 4, 5]
result := o.multiple_clicks_stats(client, identifiers) or {
    panic(err)
}
```

##### Create new order for Twitch stream

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o
import pixel365.reydenxv.model {TwitchParams, SmoothGain}

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

params := TwitchParams{
    launch_mode: 'auto'
    smooth_gain: SmoothGain{
        enabled: false
        minutes: 0
    }
    price_id: 123456
    number_of_views: 1000
    number_of_viewers: 50
    delay_time: 0
    twitch_id: 123
}
result := o.create_stream(client, params) or {
    panic(err)
}
```

##### Create new order for YouTube stream

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.orders as o
import pixel365.reydenxv.model {YouTubeParams, SmoothGain}

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

params := YouTubeParams{
    launch_mode: 'auto'
    smooth_gain: SmoothGain{
        enabled: false
        minutes: 0
    }
    price_id: 123456
    number_of_views: 1000
    number_of_viewers: 50
    delay_time: 0
    channel_url: 'some_channel_url'
}
result := o.create_stream(client, params) or {
    panic(err)
}
```

### Actions

##### Starting an order

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.run(client, 123456) or {
    panic(err)
}
```

##### Stop Order

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.stop(client, 123456) or {
    panic(err)
}
```

##### Cancel the Order

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.cancel(client, 123456) or {
    panic(err)
}
```

##### Change the number of viewers

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.change_online(client, 123456, 100) or {
    panic(err)
}
```

##### Change the time of the smooth set of viewers

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.change_increase_value(client, 123456, 100) or {
    panic(err)
}
```

##### Enable smooth increase of viewers

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.increase_on(client, 123456, 100) or {
    panic(err)
}
```

##### Disable smooth increase of viewers

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.increase_off(client, 123456) or {
    panic(err)
}
```

##### Add views to order

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.add_views(client, 123456, 1000) or {
    panic(err)
}
```

##### Check the task status

```v
import pixel365.reydenxv.client as c
import pixel365.reydenxv.action

mut client := c.Client{username: 'USERNAME', password: 'PASSWORD'}

result := action.task_status(client, 123456, 'some_task_id') or {
    panic(err)
}
```
