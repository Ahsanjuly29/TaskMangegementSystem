<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

abstract class Controller
{
    public function generateAuthToken()
    {
        $user = Auth::user();
        $data['token'] = $user->createToken($user->email)->plainTextToken;
        $data['name'] = $user->name;

        ///////////////////////////////////////////////
        //  *Set Token ////////////////////////////////
        ///////////////////////////////////////////////
        $this->setToken('loginToken' . $user->id, $data['token']);

        return $data;
    }

    public function setToken($tokenName, $token)
    {
        Session::put($tokenName, $token);
    }
}
