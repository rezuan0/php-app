<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Vendor;
use Illuminate\Http\Request;

class ManageVendorsController extends Controller
{
    public function index()
    {
        $users = Vendor::get();
        $newVendorRequest = json_decode(Vendor::where('acc_status', 'new')->count());
        return view('dashboard.admin.vendors.vendors', compact('users', 'newVendorRequest'));
    }

    public function request()
    {
        $req = Vendor::where('acc_status', '=', 'new')->get();
        return view('dashboard.admin.vendors.new_vendor_request')->with('data', $req);
    }

    public function active_user($id)
    {
        $active = Vendor::find($id);
        $active->acc_status = 'active';
        $active->save();
        $notificaton = [
            'message' => 'Account Activated',
            'alert-type' => 'success'
        ];
        return redirect()->back()->with($notificaton);
    }

    public function action($id, $acc_status)
    {
        // $status = '';
        // if ($acc_status == 'deactivated') {
        //     $status == 'active';
        // } else {
        //     $status == 'deactivated';
        // }
        $active = Vendor::find($id);
        $active->acc_status = $acc_status;
        $active->save();
        $notificaton = [
            'message' => 'Account ' . $acc_status,
            'alert-type' => 'success'
        ];
        return redirect()->back()->with($notificaton);
    }

    public function delete_vendor($vendor_id){
        $notificaton = [
            'message' => 'Vendor deleted successfully',
            'alert-type' => 'success'
        ];
        Vendor::find($vendor_id)->delete();
        return redirect()->back()->with($notificaton);
    }
}
