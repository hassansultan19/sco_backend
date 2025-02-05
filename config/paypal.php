<?php

return [
    'mode'    => env('PAYPAL_MODE', 'sandbox'),
    'sandbox' => [
        'client_id'         => 'AWsblEkJhuCD3KKCtPZq6J6FAK3lwqlSqDY08g26qarDGyPdKKK9Pll1mJK7nATl-VYI0PN9rDu7U-de',
        'client_secret'     => 'EL3UtED26xhabRMgoXqw9a1B_XUiS4qyPixUSTqlUj9xZBrBN6niyzcTn-z5eYBBycjKou349Tx2zWVT',
    ],
    'live' => [
        'client_id'         => 'AWsblEkJhuCD3KKCtPZq6J6FAK3lwqlSqDY08g26qarDGyPdKKK9Pll1mJK7nATl-VYI0PN9rDu7U-de',
        'client_secret'     => 'EL3UtED26xhabRMgoXqw9a1B_XUiS4qyPixUSTqlUj9xZBrBN6niyzcTn-z5eYBBycjKou349Tx2zWVT',
    ],

    'payment_action' => 'Sale',
    'currency'       =>  'USD',
];
