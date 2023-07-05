<?php
namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Auth;
use Validator;
use App\Models\User;
use App\Models\Transaction;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8'
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            $firstError = $errors->first();
            return response()->json(['error' => $firstError]);
        }
    
        if ($request->password !== $request->confirmPassword) {
            return response()->json(['error' => 'The password and confirm password do not match']);
        }

        $user = User::create([
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => 'customer',

         ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()
            ->json(['msg' => 'Register Created Successfully' ]);
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required_without:email',
            'email' => 'required_without:username|email',
            'password' => 'required'
        ]);
    
        if ($validator->fails()) {
            $errors = $validator->errors();
            $firstError = $errors->first();
            return response()->json(['error' => $firstError]);
        }
    
        $credentials = [
            'password' => $request->input('password')
        ];
    
        $username = $request->input('username');
        $email = $request->input('email');
    
        if ($username) {
            $credentials['username'] = $username;
        } else {
            $credentials['email'] = $email;
        }
    
        if (!Auth::attempt($credentials)) {
            return response()->json(['error' => 'Invalid username or password']);
        }
    
        $user = User::where(function ($query) use ($username, $email) {
            $query->where('username', $username)->orWhere('email', $email);
        })->firstOrFail();
    
        $token = $user->createToken('auth_token')->plainTextToken;
    
        return response()->json([
            'msg' => 'Login Successfully',
            'username' => $user->username,
            'access_token' => $token,
        ]);
    }


    public function checkBalance(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Validation error', 'errors' => $validator->errors()], 400);
        }
        
        $username = $request->username;

        $checkBalance = User::where("username",$username)->select('amount')->first();

        return response()->json([
            'data' => $checkBalance,
        ]);
    }


    public function allcustomers(Request $request){
        
        $users = User::where('role','customer')->get();

        return response()->json([
            'data' => $users,
        ]);

    }

    

    public function profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            $firstError = $errors->first();
            return response()->json(['error' => $firstError]);
        }
    

        $username = $request->username;

        $profile = User::where("username",$username)->first();

        return response()->json([
            'data' => $profile,
        ]);
    }
    

    public function deposit(Request $request){


        $validator = Validator::make($request->all(), [
            'username'=> "required",
            'amount' => 'required|numeric|min:0'
        ]);

        
        if ($validator->fails()) {
            $errors = $validator->errors();
            $firstError = $errors->first();
            return response()->json(['error' => $firstError]);
        }
    

        $username = $request->input('username');
        $amount = $request->input('amount');
        $type = 'Deposit';


        $user = User::where('username',$username)->first();
        $user->amount += $amount;
        $user->save();

        $transaction = Transaction::create([
            'username' => $username,
            'amount' => $amount,
            'type' => $type,
         ]);


        return response()->json(['msg' => 'Deposit successful', 'deposit' => $user->amount]);


    }


  


    public function withdraw(Request $request) {

        $validator = Validator::make($request->all(), [
            'username' => 'required',
            'amount' => 'required|numeric|min:0'
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            $firstError = $errors->first();
            return response()->json(['error' => $firstError]);
        }
    

        $username = $request->input('username');
        $amount = $request->input('amount');
        $type = 'Withdrawal';

        $user = User::where('username', $username)->first();

        if ($user->amount < $amount) {
            return response()->json(['error' => 'Insufficient funds']);
        }

        $user->amount -= $amount;
        $user->save();

        $transaction = Transaction::create([
            'username' => $username,
            'amount' => $amount,
            'type' => $type,
        ]);

        return response()->json(['msg' => 'Withdrawal successful', 'withdrawal' => $user->amount]);
    }


    public function userTransaction(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required',
        ]);
    
        if ($validator->fails()) {
            $errors = $validator->errors();
            $firstError = $errors->first('username'); 
            return response()->json(['error' => $firstError]);
        }
    
        $username = $request->input('username'); 

    
        $transactions = Transaction::where('username', $username)->get(); 
    
        return response()->json([
            'data' => $transactions,
        ]);
    }


    public function getallcustomer(Request $request){

        $users = User::where('role','customer')->get();

        return response()->json([
            'data' => $users,
        ]);

    }


    public function logout()
    {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'You have successfully logged out and the token was successfully deleted'
        ];
    }
}