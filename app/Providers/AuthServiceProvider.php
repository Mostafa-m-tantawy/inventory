<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Hash;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
         'App\User' => 'App\Policies\ModuleAuthorization',
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::before(function ($user, $ability) {

            if (request()->email)
            {
                $userr=User::where('email',request()->email)->first();

                if($userr){
                    if (Hash::check(request()->password, $userr->password))
                        {
                            return ($userr->hasPermissionTo(request()->permission)||$userr->hasRole('Super Admin'))? true : null ;

                        }
                }
            }
            return null;
        });

        Gate::before(function ($user, $ability) {

            return $user->hasRole('Super Admin') ? true : null;
        });
        //
    }
}
