<?php

namespace App\Policies;

use App\Restaurant;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ModuleAuthorization
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function update(User $user, $model)
    {
        $restaurant=$user->store;
        return true;
    }
}
