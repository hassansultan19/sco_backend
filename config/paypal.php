<?php

return [
    'mode'    => env('PAYPAL_MODE', 'sandbox'),
    'sandbox' => [
        'client_id'         => 'AXe8IX9mXy0sA2KcqbBgyDzUiQVRl4vT4M1BwOCm3mkzLDpqryK2zF1jFB9h5_6uiQzaA6UHyGXE9ZoZ',
        'client_secret'     => 'EBIHjAJwTOS1QmzHsWOaDlD-El5rpUBY62bsMMHh0L_jxFpiLF3LjpWYWuGoNH95GIcvix_Q9lqnCsho',
    ],
    'live' => [
        'client_id'         => 'AXe8IX9mXy0sA2KcqbBgyDzUiQVRl4vT4M1BwOCm3mkzLDpqryK2zF1jFB9h5_6uiQzaA6UHyGXE9ZoZ',
        'client_secret'     => 'EBIHjAJwTOS1QmzHsWOaDlD-El5rpUBY62bsMMHh0L_jxFpiLF3LjpWYWuGoNH95GIcvix_Q9lqnCsho',
    ],

    'payment_action' => 'Sale',
    'currency'       =>  'USD',
];
