<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\Vendor;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class VendorController extends Controller
{

    public function home()
    {
        $productCount = Product::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->count();
        $order = Order::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->get();

        $orderCount = count($order);
        $profit = Order::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->where('status', '=', 'ORDER CONFIRMED')->sum('total')*0.05;
        $productSold = Order::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->where('status', '=', 'ORDER CONFIRMED')->count();

        $newOrders = json_decode(Order::where('payment_status', '!=', 'PENDING')->where('status', '=', 'PENDING')->orderBy('id', 'desc')->count());

        // $last7daysOrder = Order::select('total', 'created_at')->whereDate('created_at', Carbon::now()->subDays(7))->get();

        $mon = ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        $monthlyOrders = [];
        foreach ($mon as $key => $value) {
            $monthlyOrders[] = Order::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->where(\DB::raw("DATE_FORMAT(created_at, '%b')"),$value)->count();
        }

        $week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        $weeklyOrders = [];
        foreach ($week as $key => $value) {
            $weeklyOrders[] = Order::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->where(\DB::raw("DATE_FORMAT(created_at, '%a')"),$value)->count();
        }

        $year = ['2022','2023','2024','2025','2026','2027', '2028'];
        $yearlyOrders = [];
        foreach ($year as $key => $value) {
            $yearlyOrders[] = Order::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->where(\DB::raw("DATE_FORMAT(created_at, '%Y')"),$value)->count();
        }

        // return $orderss;
        
        $weekFormated = json_encode($week);
        $weeklyOrdersFormated = json_encode($weeklyOrders);

        $monFormated = json_encode($mon,JSON_NUMERIC_CHECK);
        $monthlyOrdersFormated = json_encode($yearlyOrders,JSON_NUMERIC_CHECK);

        $yearFormated = json_encode($year,JSON_NUMERIC_CHECK);
        $yearlyOrdersFormated = json_encode($yearlyOrders,JSON_NUMERIC_CHECK);

    	// return view('chartjs')->with('year',)->with('user',);

        // $last7daysOrder = Order::where('vendor_id', '=', Auth::guard('vendor')->user()->id)->where('payment_status', '=', 'PAID')->whereDate('created_at', Carbon::now()->subDays(7))->get();

        // return $last7daysOrder;
        
        return view('dashboard.vendor.home', compact('productCount', 'orderCount', 'profit', 'productSold', 'newOrders', 'yearFormated', 'yearlyOrdersFormated', 'weekFormated', 'weeklyOrdersFormated', 'monFormated', 'monthlyOrdersFormated'));
    }
    public function create(Request $req)
    {
        $req->validate([
            'shopname' => 'required',
            'phone' => 'required|min:11',
            'address' => 'required',
            'email' => 'required|email|unique:vendors,email',
            'password' => 'required|min:5|max:30',
            'cpassword' => 'required|min:5|max:30|same:password'
        ], [
            'cpassword.same' => 'Password must match!!! Try again...'
        ]);

        $vendor = new Vendor;
        $vendor->shopname = $req->shopname;
        $vendor->acc_status = 'new';
        $vendor->phone = $req->phone;
        $vendor->address = $req->address;
        $vendor->email = $req->email;
        $vendor->password = Hash::make($req->password);
        $vendor->save();

        if ($vendor) {
            return redirect()->back()->with('success', 'Vendor registered successfully... Wait for admin approval!!!');
        } else {
            return redirect()->back()->with('error', 'Somthing went wrong! Please try agian later...');
        }
    }

    public function check(Request $req)
    {
        $req->validate([
            'email' => 'required|email|exists:vendors,email',
            'password' => 'required|min:5|max:30'
        ], [
            'email.exists' => 'No user found with this email!'
        ]);

        $creds = $req->only('email', 'password');

        if (Auth::guard('vendor')->attempt($creds)) {
            if (Auth::guard('vendor')->user()->acc_status == 'new') {
                Auth::guard('vendor')->logout();
                return redirect()->route('vendor.login')->with('fail', 'We are reviewing your request, Please wait for admin approval!!!');
            } elseif (Auth::guard('vendor')->user()->acc_status == 'deactivated') {
                Auth::guard('vendor')->logout();
                return redirect()->route('vendor.login')->with('fail', 'Sorry your account deactivated!!! Contact with admin...');
            } else {
                $notificaton = [
                    'message' => 'Welcome ' . Auth::guard('vendor')->user()->shopname,
                    'alert-type' => 'success'
                ];
                return redirect()->route('vendor.home')->with($notificaton);
            }
        } else {
            return redirect()->route('vendor.login')->with('fail', 'Wrong Credientials!!!');
        }
    }

    public function logout()
    {
        Auth::guard('vendor')->logout();
        return redirect()->route('vendor.login');
    }
}
