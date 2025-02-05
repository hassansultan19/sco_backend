<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class PackageExpiredNotification extends Notification
{
    use Queueable;

    protected $package;
    protected $remainingDays;

    public function __construct($package, $remainingDays)
    {
        $this->package = $package;
        $this->remainingDays = $remainingDays;
    }

    public function via($notifiable)
    {
        return ['mail']; // Send via email
    }

    public function toMail($notifiable)
    {
        $message = new MailMessage();

        $message->subject('Your Package Update')
                ->greeting('Hello ' . $notifiable->name . ',')
                ->line('Here is an update regarding your package.')
                ->line('Package Details:')
                ->line('Start Date: ' . $this->package->start_date)
                ->line('End Date: ' . $this->package->end_date);

        if ($this->remainingDays < 0) {
            $message->line('Your package expired ' . abs($this->remainingDays) . ' days ago.');
        } else {
            $message->line('Your package will expire in ' . $this->remainingDays . ' days.');
        }

        $message->action('Renew Package', url('/packages/renew/' . $this->package->id))
                ->line('Thank you for using our service.');

        return $message;
    }
}