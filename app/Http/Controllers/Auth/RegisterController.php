<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Providers\RouteServiceProvider;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function __construct()
    {
     //   $this->middleware(['auth:api']);
    }

    public function register(Request $request)
    {
       $user = new User();
       $user->name = $request->name;
       $user->email = $request->email;
       $user->password = Hash::make($request->password);
       if($user->save())
           return response()->json([
               'status' => 1,
               'code' => 0,
               'message' => 'no message',
               'objList' => null,
               'server_time' => time()
           ]);
        else
            return response()->json([
                'status' => -1,
                'code' => 2,
                'message' => 'Failed to create new account!',
                'objList' => null,
                'server_time' => time()
            ]);
    }
}
