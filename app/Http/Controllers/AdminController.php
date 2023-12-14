<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Categorie;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function home()
    {
        $activeVendor = Vendor::where('acc_status', '=', 'active')->count();
        $newvendorRequest = Vendor::where('acc_status', '=', 'new')->count();
        $activeUser = User::where('acc_status', '=', 'active')->count();
        $productCount = Product::count();
        $categories = Categorie::count();

        $orderCount = Order::all()->count();
        $profit = Order::where('status', '=', 'ORDER CONFIRMED')->sum('total')*0.01;
        $Product_delivered = Order::where('status', '=', 'ORDER CONFIRMED')->count();


        $data = [
            'activeVendor' => $activeVendor,
            'newvendorRequest' => $newvendorRequest,
            'activeUser' => $activeUser,
            'productCount' => $productCount,
            'categories' => $categories,
            'orderCount' => $orderCount,
            'Product_delivered' => $Product_delivered,
            'profit' => $profit,
        ];
        return view('dashboard.admin.home')->with($data);
    }
    public function check(Request $req)
    {
        $req->validate([
            'email' => 'required|email|exists:admins,email',
            'password' => 'required|min:5|max:30'
        ], [
            'email.exists' => 'No user found with this email!'
        ]);

        $creds = $req->only('email', 'password');

        if (Auth::guard('admin')->attempt($creds)) {
            return redirect()->route('admin.home');
        } else {
            return redirect()->route('admin.login')->with('fail', 'Wrong Credientials!!!');
        }
    }

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }
}
