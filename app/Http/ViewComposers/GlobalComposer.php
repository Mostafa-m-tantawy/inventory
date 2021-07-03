<?php


namespace App\Http\ViewComposers;
use App\SystemConf;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;


class GlobalComposer
{
    /**
     * Bind data to the view.
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {
        if(Schema::hasTable('system_confs'))
            $view->with('systemconf', \App\Models\conf\Systemconf::all());

//        $view->with('currentUser', Auth::user());
    }

}
