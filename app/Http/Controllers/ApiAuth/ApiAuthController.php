<?php

namespace App\Http\Controllers\ApiAuth;

use App\Http\Controllers\Controller;
use App\Http\Requests\ApiAuth\LoginRequest;
use App\Http\Requests\ApiAuth\RegisterRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class ApiAuthController extends Controller
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
            $data['token'] = $user->createToken($user->email)->plainTextToken;
            $data['name'] = $user->name;

            return successResponse('User registered successfully', $data);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     * Login api
     */
    public function login(LoginRequest $request): JsonResponse
    {
        try {
            if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
                $user = Auth::user();
                $data['token'] = $user->createToken($user->email)->plainTextToken;
                $data['name'] = $user->name;

                return successResponse('User login successfully', $data);

            } else {
                throw new \Exception('Password or Email is Wrong');
            }
        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     *Checkout own data
     */
    public function me()
    {
        return response()->json(auth('sanctum')->user());
    }

    /**
     *Logout Api
     */
    public function logout()
    {
        try {
            Auth::logout();

            return successResponse('User Logout Successfully', []);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }
}
