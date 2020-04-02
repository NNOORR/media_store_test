<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{

    public  function login(Request $request)
    {
        if(!$token = auth()->attempt($request->only('email', 'password'))){
            return response()->json([
                'status' => -1,
                'code' => 1,
                'message' => 'user unauthorized',
                'objList' => null,
                'server_time' => time()
            ]);
        }

        return response()->json([
            'code' => 0,
            'message' => 'no message',
            'status' => 1,
            'objList' => [
                'token' => $token
            ],
            'server_time' => time()
        ]);
    }
}
