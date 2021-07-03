<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        $route = request()->getUri();

        if (Auth::guard($guard)->check() ) {

            if(Auth::user()->is_active==1)
                if(strpos($route,'pos')===false)
                    return redirect('/dashboard');
                else
                    return redirect(route('dashboard.pos'));

            else {
                Auth::logout();
                return redirect('/home');
            }
        }

        return $next($request);
    }
}
