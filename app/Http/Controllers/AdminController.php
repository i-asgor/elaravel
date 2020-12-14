<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Auth;
use App\User;
use App\Admin;
use App\Orders;

class AdminController extends Controller
{
    public function login(Request $request){
      if($request->isMethod('post')){
        $data = $request->input();
        $adminCount = Admin::where(['username'=>$data['username'],'password'=>md5($data['password']),'status'=>1])->count();
        // echo "<pre>";print_r($adminCount);die;
        // if(Auth::attempt(['email'=>$data['username'],'password'=>$data['password'],'admin'=>'1'])){
        if($adminCount > 0){
            Session::put('adminSession',$data['username']);
            return redirect('admin/dashboard');
        }else {
          return redirect('/admin')->with('flash_message_error','Invalid Username or Password');
        }
      }
      return view('admin.admin_login');
    }
    public function dashboard(){
        $userCount = User::count();
        $adminCount = Admin::count();
        $orderTotal = Orders::get();
        return view('admin.dashboard')->with(compact('userCount','adminCount','orderTotal'));
    }
    public function logout(){
        Session::flush();
        return redirect('/admin')->with('flash_message_success','Loged out Successfully!');
    }
    public function changePassword(Request $request){
        $userDetail = Admin::where(['status'=>1])->first();
        if($request->isMethod('post')){
            $data = $request->all();
            $adminCount = Admin::where(['username'=>Session::get('adminSession'),'password'=>md5($data['current_pwd']),'status'=>1])->count();
            if($adminCount == 1){
                $new_pwd = md5($data['new_pwd']);
                Admin::where('username',Session::get('adminSession'))->update(['password'=>$new_pwd,'username'=>$data['username']]);
                return redirect()->back()->with('flash_message_success','Password is Updated Successfully!!');
            }else{
                return redirect()->back()->with('flash_message_error','Password is incorrect');
            }
        }
        return view('admin.user_profile')->with(compact('userDetail'));
    }
}
