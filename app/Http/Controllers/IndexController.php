<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Banners;
use App\Products;
use App\Category;
use Image;
use App\ProductImages;
use App\OrdersProduct;
use Auth;
use DB;
use App\User;


class IndexController extends Controller
{
    public function index(){
        $banners = Banners::where('status','1')->orderby('sort_order','asc')->get();
        $categories = Category::with('categories')->where(['parent_id'=>0])->get();
        // $products = Products::get();
        $products = Products::where('status','1')->paginate(3);
        // if(Auth::check()){
        //     $user_email = Auth::user()->email;
        //     $userCart = DB::table('carts')->where(['user_email'=>$user_email])->get();
        // }else{
        //     $session_id = Session::get('session_id');
        //     $userCart = DB::table('carts')->where(['session_id'=>$session_id])->get();
        // }
        // // $session_id = Session::get('session_id');
        // // $userCart = DB::table('carts')->where(['session_id'=>$session_id])->get();
        // foreach($userCart as $key=>$products){
        //     $productDetails = Products::where(['id'=>$products->product_id])->first();
        //     $userCart[$key]->image = $productDetails->image;
        // }
        return view('wayshop.index')->with(compact('banners','categories','products','userCart'));
    }

    public function categories($category_id){
        $categories = Category::with('categories')->where(['parent_id'=>0])->get();
        $products = Products::where(['category_id'=>$category_id])->get();
        $product_name = Products::where(['category_id'=>$category_id])->first();
        return view('wayshop.category')->with(compact('categories','products','product_name'));
    }
}
