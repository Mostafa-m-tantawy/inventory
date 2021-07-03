<?php

namespace App\Listeners;

use App\Events\EditOrder;
use App\Events\NewOrder;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendNewOrderNotification
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  EditOrder  $event
     * @return void
     */
    public function handle(NewOrder $event)
    {
        //
    }
}
