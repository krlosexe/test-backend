<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Log;

class AuthController extends Controller
{
    

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        try {
          if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 400);
          }
        } catch (JWTException $e) {
          return response()->json(['error' => 'could_not_create_token'], 500);
        }
        return response()->json(compact('token'));
    }



    public function getUser()
    {
        return response()->json(auth()->user());
    }


    public function logout()
    {
        auth()->logout();
        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }


    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }

    
}
