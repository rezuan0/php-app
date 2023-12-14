<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AnalyticsController extends Controller
{
    //
    public function vendor_analytics(){
        return view('dashboard.vendor.analysis.profit_analytics');
    }
}
