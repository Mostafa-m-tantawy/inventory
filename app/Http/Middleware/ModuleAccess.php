<?php

namespace App\Http\Middleware;

use Closure;
use Yoeunes\Toastr\Toastr;

class ModuleAccess
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next,$module)
    {

        if (!moduleAccess($module)) {
            toastr()->error(__('toastr.your subscription not contain this feature'));
        return back();
        }
        return $next($request);
    }
}
