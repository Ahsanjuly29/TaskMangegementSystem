<?php

namespace App\Http\Controllers\ApiAuth;

use App\Http\Controllers\Controller;
use App\Http\Requests\ApiAuth\RegisterRequest;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\JsonResponse;


class ApiAutController extends Controller
{
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(RegisterRequest $request): JsonResponse
    {
        try {
            $input = $request->all();
            $input['password'] = bcrypt($input['password']);
            $user = User::create($input);
            $data['token'] =  $user->createToken('LaravelNewApp')->plainTextToken;
            $data['name'] =  $user->name;
    
            $response = [
                'success' => 1,
                'message' => "User registered successfully",
                'data'    => $data,
            ];
    
            return response()->json($response, 200);            
        } catch (\Exception $e) {
            $response = [
                'success' => 0,
                'message' => "Registration Unsuccessful",
                'data' => []
            ];

            return response()->json($response, 401);
        }

    }

    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request): JsonResponse
    {
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::user();
            $data['token'] =  $user->createToken('MyApp')->plainTextToken;
            $data['name'] =  $user->name;

            $response = [
                'success' => true,
                'data'    => $data,
                'message' => "User login successfully",
            ];

            return response()->json($response, 200);
        } else {
            $response = [
                'success' => 0,
                'message' => "Unauthorised",
                'data' => ['error' => 'Unauthorised']
            ];

            return response()->json($response, 401);
        }
    }

        // Checkout own data
        public function me()
        {
            return response()->json(auth('sanctum')->user());
        }
    
        public function logout()
        {
            Auth::logout();
            $response = [
                'success' => true,
                'message' => "Successfully logged out",
                'data'    => [],
            ];

            return response()->json($response, 200);
        }

}
