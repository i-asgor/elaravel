<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banners;
use App\bannerDetails;
use Illuminate\Support\Facades\Input;
use RealRashid\SweetAlert\Facades\Alert;
use Image;

class BannersController extends Controller
{
    public function banners(){
        $bannerDetails = Banners::get();
        return view('admin.banner.banners')->with(compact('bannerDetails'));
    }
    public function addBanner(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
            $banner = new Banners;
            $banner->name = $data['banner_name'];
            $banner->text_style = $data['text_style'];
            $banner->sort_order = $data['sort_order'];
            $banner->content = $data['banner_content'];
            $banner->link = $data['link'];
            //Upload image
            if($request->hasfile('image')){
                $image_tmp = $request->file('image');
                if($image_tmp->isValid()){
                //upload images after Resize
                $extension = $image_tmp->getClientOriginalExtension();
                $filename = rand(111,99999).'.'.$extension;
                $banner_path = 'uploads/banners/'.$filename;
                //image resize
                Image::make($image_tmp)->resize(500,500)->save($banner_path);
                $banner->image = $filename;
            }
        }
        $banner->save();
        return redirect('/admin/banners')->with('flash_message_success','Banners has been uploaded successfully!!');
        }
        return view('admin.banner.add_banner');
    }



    public function editBanner(Request $request, $id=null){
        if($request->isMethod('post')){
            $data = $request->all();
            //echo "<pre>";print_r($data);die;
            //upload imaage
            if($request->hasFile('image')){
                $image_tmp = $request->file('image');
                if($image_tmp->isValid()){
                    //upload Image after Resize
                    $extension = $image_tmp->getClientOriginalExtension();
                    $fileName = rand(111,99999).'.'.$extension;
                    $banner_path = 'uploads/banners/'.$fileName;

                    //image resize
                    Image::make($image_tmp)->resize(500,500)->save($banner_path);

                }
            }else{
                    $fileName = $data['current_image'];
                }
                // Banners::where(['id'=>$id])->update(['name'=>$data['banner_name'],'image'=>$filename]);
                Banners::where(['id'=>$id])->update(['name'=>$data['banner_name'],'text_style'=>$data['text_style'],'sort_order'=>$data['sort_order'],'content'=>$data['banner_content'],'link'=>$data['link'],'image'=>$fileName]);
                return redirect('/admin/banners')->with('flash_message_success','Banner has been edited successfully!!');

        }
        $bannerDetails = Banners::where(['id'=>$id])->first();
        return view('admin.banner.edit_banner')->with(compact('bannerDetails'));

    }

    public function deleteBanner($id=null){
        Banners::where(['id'=>$id])->delete();
        Alert::success('Deleted Successfully','Success Message');
        return redirect('/admin/banner')->with('flash_message_error','Product Deleted');
    }

    public function updateStatus(Request $request,$id=null){
        $data = $request->all();
        Banners::where('id',$data['id'])->update(['status'=>$data['status']]);
    }




}
