<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Str;
use RealRashid\SweetAlert\Facades\Alert;
use Image;
use App\Category;
use App\Products;
use App\ProductsAttributes;
use App\ProductImages;
use App\Coupons;
use Session;
use DB;
use Auth;
use App\User;
use App\Country;
use App\Orders;
use App\DeliveryAdress;
use App\OrdersProduct;
use Stripe\Stripe;

class ProductsController extends Controller
{
    public function addProduct(Request $request){
        if($request->ismethod('post')){
            $data = $request->all();
            // echo "<pre>"; print_r($data);die;
            $product = new Products;
            $product->category_id = $data['category_id'];
            $product->name = $data['product_name'];
            $product->code = $data['product_code'];
            $product->color = $data['product_color'];
            if(!empty($data['product_description'])){
                $product->description = $data['product_description'];
            }
            else{
                $product->name = '';
            }
            $product->price = $data['product_price'];

            //Upload image
            if($request->hasfile('image')){
                $img_tmp = $request->file('image');
                if($img_tmp->isValid()){


                //image path code
                $extension = $img_tmp->getClientOriginalExtension();
                $filename = rand(111,99999).'.'.$extension;
                $img_path = 'uploads/products/'.$filename;

                //image resize
                Image::make($img_tmp)->resize(500,500)->save($img_path);

                $product->image = $filename;

            }
            }
            $product->save();
            return redirect('/admin/add-product')->with('flash_message_success','Product has been added successfully!!');

        }
        $categories = Category::where(['parent_id'=>0])->get();
        $categories_dropdown = "<option value='' selected disabled> Select</option>";
        foreach($categories as $cat){
            $categories_dropdown .= "<option value='".$cat->id."'>".$cat->name."</option>";
            $sub_categories = Category::where(['parent_id'=>$cat->id])->get();
            foreach($sub_categories as $sub_cat){
                $categories_dropdown .="<option value='".$sub_cat->id."'>&nbsp;--&nbsp".$sub_cat->name."</option>";
            }
        }
        return view('admin.products.add_product')->with(compact('categories_dropdown'));
    }

    public function viewProducts(){
        $products = Products::get();
        return view('admin.products.view_products')->with(compact('products'));
    }
    public function editProduct(Request $request, $id=null){
        if($request->isMethod('post')){
            $data = $request->all();
            //Upload image
            if($request->hasfile('image')){
                $img_tmp = $request->file('image');
                if($img_tmp->isValid()){


                //image path code
                $extension = $img_tmp->getClientOriginalExtension();
                $filename = rand(111,99999).'.'.$extension;
                $img_path = 'uploads/products/'.$filename;

                //image resize
                Image::make($img_tmp)->resize(500,500)->save($img_path);

            }
            }else{
                $filename = $data['current_image'];
            }
            if(empty($data['product_description'])){
                $data['product_description'] = '';
            }
            Products::where(['id'=>$id])->update(['name'=>$data['product_name'],'category_id'=>$data['category_id'],'code'=>$data['product_code'],'color'=>$data['product_color'],'description'=>$data['product_description'],'price'=>$data['product_price'],'image'=>$filename]);
            return redirect('/admin/view-products')->with('flash_message_success','Product has been updated!!');

        }
        $productDetails = Products::where(['id'=>$id])->first();

        // Category Dropdown code
        $categories = Category::where(['parent_id'=>0])->get();
        $categories_dropdown = "<option value='' selected disabled> Select</option>";
        foreach($categories as $cat){
            if($cat->id==$productDetails->category_id){
                $selected = "selected";
            }else{
                $selected = "";
            }
            $categories_dropdown .="<option value='".$cat->id."' ".$selected.">".$cat->name."</option>";
        }
        //Code for su categories

        $sub_categories = Category::where(['parent_id'=>$cat->id])->get();
        foreach($sub_categories as $sub_cat){
            if($cat->id==$productDetails->category_id){
                $selected = "selected";
            }else{
                $selected = "";
            }
            $categories_dropdown .="<option value='".$sub_cat->id."' ".$selected.">&nbsp;--&nbsp;".$sub_cat->name."</option>";
        }
        return view('admin.products.edit_product')->with(compact('productDetails','categories_dropdown'));
    }
    public function deleteProduct($id=null){
        Products::where(['id'=>$id])->delete();
        Alert::success('Deleted Successfully','Success Message');
        return redirect('/admin/view-products')->with('flash_message_error','Product Deleted');
    }
    public function updateStatus(Request $request,$id=null){
        $data = $request->all();
        Products::where('id',$data['id'])->update(['status'=>$data['status']]);
    }
    public function products($id=null){
        $productDetails = Products::with('attributes')->where('id',$id)->first();
        $ProductsAltImages = ProductImages::where('product_id',$id)->get();
        $featuredProducts = Products::where(['featured_products'=>1])->get();
        // echo $productDetails;die;
        return view('wayshop.product_detail')->with(compact('productDetails','ProductsAltImages','featuredProducts'));
    }

    public function addAttributes(Request $request,$id=null){
        $productDetails = Products::with('attributes')->where(['id'=>$id])->first();
        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>";print_r($data);die;
            foreach($data['sku'] as $key =>$val){
                if(!empty($val)){
                    //Prevent duplicate SKU Record
                    $attrCountSKU = ProductsAttributes::where('sku',$val)->count();
                    if($attrCountSKU>0){
                        return redirect('/admin/add-attributes/'.$id)->with('flash_message_error','SKU is already exist please select another sku');
                    }
                    //Prevent duplicate Size Record
                    $attrCountSizes = ProductsAttributes::where(['product_id'=>$id,'size'=>$data['size'][$key]])->count();
                    if($attrCountSizes>0){
                        return redirect('/admin/add-attributes/'.$id)->with('flash_message_error',''.$data['size'][$key].'Size is already exist please select another Size');
                    }
                    $attribute = new ProductsAttributes;
                    $attribute->product_id = $id;
                    $attribute->sku = $val;
                    $attribute->size = $data['size'][$key];
                    $attribute->price = $data['price'][$key];
                    $attribute->stock = $data['stock'][$key];
                    $attribute->save();

                }

            }
            return redirect('/admin/add-attributes/'.$id)->with('flash_message_success','Products attributes added successfully!!');
        }
        return view('admin.products.add_attributes')->with(compact('productDetails'));
    }

    public function deleteAttributes($id=null){
        ProductsAttributes::where(['id'=>$id])->delete();
        return redirect()->back()->with('flash_message_error','Product Attribute is deleted');
    }

    public function editAttributes(Request $request,$id=null){
        if($request->isMethod('post')){
            $data = $request->all();
            foreach($data['attr'] as $key=>$attr){
                ProductsAttributes::where(['id'=>$data['attr'][$key]])->update(['sku'=>$data['sku'][$key],'size'=>$data['size'][$key],'price'=>$data['price'][$key],'stock'=>$data['stock'][$key]]);
            }
            return redirect()->back()->with('flash_message_success','Products Attributes updated!!');
        }
    }

    public function addImages(Request $request, $id=null){
        $productDetails = Products::where(['id'=>$id])->first();
        if($request->isMethod('post')){
            $data = $request->all();
            if($request->hasfile('image')){
                $files = $request->file('image');
                foreach($files as $file){
                    $image = new ProductImages;
                    $extension = $file->getClientOriginalExtension();
                    $filename = rand(111,99999).'.'.$extension;
                    $image_path = 'uploads/products/'.$filename;
                    Image::make($file)->save($image_path);
                    $image->image = $filename;
                    $image->product_id = $data['product_id'];
                    $image->save();
                }
            }
            return redirect('/admin/add-images/'.$id)->with('flash_message_success','Image has been uploaded successfully!!!');
        }
        $productImages = ProductImages::where(['product_id'=>$id])->get();
        return view('admin.products.add_imagaes')->with(compact('productDetails','productImages'));
    }

    public function deleteAltImage($id=null){
        $productImage = ProductImages::where(['id'=>$id])->first();

        $image_path = 'uploads\products';
        if(file_exists(public_path($image_path.$productImage->images))){
            unlink(public_path($image_path.$productImage->images));
        }
        ProductImages::where(['id'=>$id])->delete();
        Alert::success('Deleted','Success Message');
        return redirect()->back();
    }

    public function updateFeatured(Request $request,$id=null){
        $data = $request->all();
        Products::where('id',$data['id'])->update(['featured_products'=>$data['status']]);
    }

    public function getprice(Request $request){
        $data = $request->all();
        // echo "<pre>"; print_r($data);die;
        $proArr = explode("-",$data['idSize']);
        $proAttr = ProductsAttributes::where(['product_id'=>$proArr[0],'size'=>$proArr[1]])->first();
        echo $proAttr->price;
    }

    public function addtoCart(Request $request){
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        $data = $request->all();
        // echo "<pre>";print_r($data);die;
        if(empty(Auth::user()->email)){
            $data['user_email'] = '';
        }else{
            $data['user_email'] = Auth::user()->email;
        }
        // echo $session_id = Str::random(40); die;
        $session_id = Session::get('session_id');

        if(empty($session_id)){
            $session_id = Str::random(40);
            Session::put('session_id',$session_id);
        }

        $sizeArr = explode('-',$data['size']);
        $countProducts = DB::table('carts')->where(['product_id'=>$data['product_id'], 'product_color'=>$data['color'],'price'=>$data['price'],'size'=>$sizeArr[1],'session_id'=>$session_id])->count();
        if($countProducts>0){
            return redirect()->back()->with('flash_message_error','Product already exists in cart');
        }else{
            DB::table('carts')->insert(['product_id'=>$data['product_id'], 'product_name'=>$data['product_name'],'product_code'=>$data['product_code'],'product_color'=>$data['color'],'price'=>$data['price'],'size'=>$sizeArr[1],'quantity'=>$data['quantity'],'user_email'=>$data['user_email'],'session_id'=>$session_id]);
        }
        return redirect('/cart')->with('flash_message_success','Product has been added in cart!!');
    }

    public function cart(Request $request){
        if(Auth::check()){
            $user_email = Auth::user()->email;
            $session_id = Session::get('session_id');
            $userCart = DB::table('carts')->where(['user_email'=>$user_email])
                                          ->orWhere(['session_id'=>$session_id])->get();
        }else{
            $session_id = Session::get('session_id');
            $userCart = DB::table('carts')->where(['session_id'=>$session_id])->get();
        }
        // $session_id = Session::get('session_id');
        // $userCart = DB::table('carts')->where(['session_id'=>$session_id])->get();
        foreach($userCart as $key=>$products){
            $productDetails = Products::where(['id'=>$products->product_id])->first();
            $userCart[$key]->image = $productDetails->image;
        }
        // echo "<pre>"; print_r($userCart);die;
        return view('wayshop.products.cart')->with(compact('userCart'));
    }

    public function deleteCartProduct($id=null){
        // echo $id;die;
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        DB::table('carts')->where('id',$id)->delete();
        return redirect('/cart')->with('flash_message_error','Product has been deleted');
    }

    public function updateCartQuantity($id=null,$quantity=null){
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        DB::table('carts')->where('id',$id)->increment('quantity',$quantity);
        return redirect('/cart')->with('flash_message_success','Product Quantity has been updated Successfully');
    }

    public function applyCoupon(Request $request){
        Session::forget('CouponAmount');
        Session::forget('CouponCode');
        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>";print_r($data);die;
            $couponCount = Coupons::where('coupon_code',$data['coupon_code'])->count();
            if($couponCount == 0){
                return redirect()->back()->with('flash_message_error','Coupon code does not exists');
            }else{
                // echo "Success";die;
                $couponDetails = Coupons::where('coupon_code',$data['coupon_code'])->first();
                //Coupon code status
                if($couponDetails->status==0){
                    return redirect()->back()->with('flash_message_error','Coupon code is not active');
                }
                // Check coupon expiry date
                $expiry_date = $couponDetails->expiry_date;
                $current_date = date('Y-m-d');
                if($expiry_date< $current_date){
                    return redirect()->back()->with('flash_message_error','Coupon Code is Expired');
                }
                // Coupon is ready for discount
                $session_id = Session::get('session_id');
                // $userCart = DB::table('carts')->where(['session_id'=>$session_id])->get();
                if(Auth::check()){
                    $user_email = Auth::user()->email;
                    $userCart = DB::table('carts')->where(['user_email'=>$user_email])->get();
                }else{
                    $session_id = Session::get('session_id');
                    $userCart = DB::table('carts')->where(['session_id'=>$session_id])->get();
                }
                $total_amount = 0;
                foreach($userCart as $item){
                    $total_amount = $total_amount + ($item->price*$item->quantity);
                }
                // Check if coupon amount is fixed or percentage
                if($couponDetails->amount_type=="Fixed"){
                    $couponAmount = $couponDetails->amount;
                }else{
                    $couponAmount = $total_amount * ($couponDetails->amount/100);
                }
                // Add Coupon code in session
                Session::put('CouponAmount',$couponAmount);
                Session::put('CouponCode',$data['coupon_code']);
                return redirect()->back()->with('flash_message_success','Coupon Code is Successfully Applied');
            }
        }
    }

    public function checkout(Request $request){
        $user_id = Auth::user()->id;
        $user_email = Auth::user()->email;
        $shippingDetails = DeliveryAdress::where('user_id',$user_id)->first();
        $userDetails = User::find($user_id);
        $countries = Country::get();
        //check if shipping address exists
        $shippingCount = DeliveryAdress::where('user_id',$user_id)->count();
        $shippingDetails = array();
        if($shippingCount > 0){
            $shippingDetails = DeliveryAdress::where('user_id',$user_id)->first();
        }
        //Update Cart Table With Email
        // $session_id = Session::get('session_id');
        // DB::table('carts')->where(['session_id'=>$session_id])->update(['user_email'=>$user_email]);
        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>"; print_r($data);die;
            User::where('id',$user_id)->update(['name'=>$data['billing_name'],'address'=>$data['billing_address'],'city'=>$data['billing_city'],'state'=>$data['billing_state'],'country'=>$data['billing_country'],'pincode'=>$data['billing_pincode'],'mobile'=>$data['billing_mobile']]);
            if($shippingCount > 0){
                DeliveryAdress::where('user_id',$user_id)->update(['name'=>$data['shipping_name'],'address'=>$data['shipping_address'],'city'=>$data['shipping_city'],'state'=>$data['shipping_state'],'country'=>$data['shipping_country'],'pincode'=>$data['shipping_pincode'],'mobile'=>$data['shipping_mobile']]);
            }else{
                //New Shipping Address
                $shipping = new DeliveryAdress();
                $shipping->user_id = $user_id;
                $shipping->user_email = $user_email;
                $shipping->name = $data['shipping_name'];
                $shipping->address = $data['shipping_address'];
                $shipping->state = $data['shipping_state'];
                $shipping->city = $data['shipping_city'];
                $shipping->country = $data['shipping_country'];
                $shipping->pincode = $data['shipping_pincode'];
                $shipping->mobile = $data['shipping_mobile'];
                $shipping->save();

            }
            // echo "Redirect To Order Review Page";die;
            return redirect()->action('ProductsController@orderReview');
        }

        return view('wayshop.products.checkout')->with(compact('userDetails','countries','shippingDetails'));
    }

    public function orderReview(){
        $user_id = Auth::user()->id;
        $user_email = Auth::user()->email;
        $session_id = Session::get('session_id');
        $shippingDetails = DeliveryAdress::where('user_id',$user_id)->first();
        $userDetails = User::find($user_id);
        $userCart = DB::table('carts')->where(['user_email'=>$user_email])
                                      ->orWhere(['session_id'=>$session_id])->get();
        foreach($userCart as $key=>$product){
            $productDetails = Products::where('id',$product->product_id)->first();
            $userCart[$key]->image = $productDetails->image;
        }
        return view('wayshop.products.order_review')->with(compact('userDetails','shippingDetails','userCart'));
    }

    public function placeOrder(Request $request){
        if($request->isMethod('post')){
            $user_id = Auth::user()->id;
            $user_email = Auth::user()->email;
            $session_id = Session::get('session_id');
            $data = $request->all();

            //Get Shipping Details of Users
            $shippingDetails = DeliveryAdress::where(['user_email'=>$user_email])->first();
            if(empty(Session::get('CouponCode'))){
                $coupon_code = 'Not Used';
            }else{
                $coupon_code = Session::get('CouponCode');
            }
            if(empty(Session::get('CouponAmount'))){
                $coupon_amount = '0';
            }else{
                $coupon_amount = Session::get('CouponAmount');
            }
            // echo "<pre>"; print_r($shippingDetails);die;
            // echo "<pre>"; print_r($data);die;
            $order = new Orders;
            $order->user_id = $user_id;
            $order->user_email = $user_email;
            $order->name = $shippingDetails->name;
            $order->address = $shippingDetails->address;
            $order->city = $shippingDetails->city;
            $order->state = $shippingDetails->state;
            $order->pincode = $shippingDetails->pincode;
            $order->country = $shippingDetails->country;
            $order->mobile = $shippingDetails->mobile;
            $order->coupon_code = $coupon_code;
            $order->coupon_amount = $coupon_amount;
            $order->order_status =  "New";
            $order->payment_method = $data['payment_method'];
            $order->grand_total = $data['grand_total'];
            $order->Save();

            $order_id = DB::getPdo()->lastinsertID();

            $cartProducts = DB::table('carts')->where(['user_email'=>$user_email])
                                              ->orWhere(['session_id'=>$session_id])->get();

            foreach($cartProducts as $pro){
                $cartPro = new OrdersProduct;
                $cartPro->order_id = $order_id;
                $cartPro->user_id = $user_id;
                $cartPro->product_id = $pro->product_id;
                $cartPro->product_code = $pro->product_code;
                $cartPro->product_name = $pro->product_name;
                $cartPro->product_color = $pro->product_color;
                $cartPro->product_size = $pro->size;
                $cartPro->product_price = $pro->price;
                $cartPro->product_qty = $pro->quantity;
                $cartPro->save();
            }
            Session::put('order_id',$order_id);
            Session::put('grand_total',$data['grand_total']);
            if($data['payment_method']=="cod"){
                return redirect('/thanks');
            }else{
                return redirect('/stripe');
            }

        }
    }

    public function thanks(){
        $user_email = Auth::user()->email;
        $session_id = Session::get('session_id');
        DB::table('carts')->where('user_email',$user_email)
                          ->orWhere(['session_id'=>$session_id]) ->delete();
        return view('wayshop.orders.thanks');
    }

    public function stripe(Request $request){
        $user_email = Auth::user()->email;
        $session_id = Session::get('session_id');
        DB::table('carts')->where('user_email',$user_email)
                         ->orWhere(['session_id'=>$session_id])->delete();
        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>";print_r($data);die;
            // Set your secret key. Remember to switch to your live secret key in production!
            // See your keys here: https://dashboard.stripe.com/test/apikeys
            \Stripe\Stripe::setApiKey('sk_test_51Ht610Hg6ZxPv4yuFMKzpB6g2SlZfel0FZU8CD5it2ROD0MHd2noKITNEO3q1URlOVeNatEDkqBOHJicALRZDfJ600qrjFWwkL');

            $token = $_POST['stripeToken'];
            $charge = \Stripe\charge::Create([

                'amount' => $request->input('total_amount'),
                'currency' => 'usd',
                'description' => $request->input('name'),
                'source' => $token,
            ]);
            dd($charge);
            return redirect('/')->back()->with('flash_message_success','Your Payment Successfully Done!');
        }
        return view('wayshop.orders.stripe');
    }

    public function userOrders(){
        $user_id = Auth::user()->id;
        $orders = Orders::with('orders')->where('user_id',$user_id)->orderBy('id','DESC')->get();
        // echo "<pre>";print_r($orders);die;
        return view('wayshop.orders.user_orders')->with(compact('orders'));
    }

    public function userOrderDetails($order_id){
        $orderDetails = Orders::with('orders')->where('id',$order_id)->first();
        $user_id = $orderDetails->user_id;
        $userDetails = User::where('id',$user_id)->first();
        return view('wayshop.orders.user_order_details')->with(compact('orderDetails','userDetails'));
    }

    public function viewOrders(){
        $orders = Orders::with('orders')->orderBy('id','DESC')->get();
        return view('admin.orders.view_orders')->with(compact('orders'));
    }

    public function viewOrdersDetails($order_id){
        $orderDetails = Orders::with('orders')->where('id',$order_id)->first();
        $user_id = $orderDetails->user_id;
        $userDetails = User::where('id',$user_id)->first();
        return view('admin.orders.order_details')->with(compact('orderDetails','userDetails'));
    }

    public function updateOrderStatus(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
        }
        Orders::where('id',$data['order_id'])->update(['order_status'=>$data['order_status']]);
        return redirect()->back()->with('flash_message_success','Order Status has been updated successfully!');
    }
}
