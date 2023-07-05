<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\Models\User;
use App\Models\Transaction;

class TransactionController extends Controller
{
   
    public function getallt(Request $request){

        return response()->json([
            'data' => 'dsfhsdjkf',
        ]);

    }

}
