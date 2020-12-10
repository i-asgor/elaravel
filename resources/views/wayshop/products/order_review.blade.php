@extends('wayshop.layouts.master')

@section('content')

<div class="contact-box-main">

    <div class="container">

    @if (Session::has('flash_message_error'))
    <div class="alert alert-sm alert-danger alert-block" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>{!! session('flash_message_error') !!}</strong>
    </div>
    @endif

    @if (Session::has('flash_message_success'))
    <div class="alert alert-sm alert-success alert-block" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>{!! session('flash_message_success') !!}</strong>
    </div>
    @endif

        <div class="row">
            <div class="col-lg-6 col-sm-12">
                <div class="contact-form-right">
                    <h2>Billing Address</h2>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    {{$userDetails->name}}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    {{$userDetails->address}}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    {{$userDetails->city}}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    {{$userDetails->state}}
                                </div>
                            </div>


                            <div class="col-md-12">
                                <div class="form-group">
                                    {{$userDetails->country}}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    {{$userDetails->pincode}}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    {{$userDetails->mobile}}
                                </div>
                            </div>


                        </div>

                </div>
            </div>

            <div class="col-lg-6  col-sm-12">
                <div class="contact-form-right">
                    <h2>Shipping Address</h2>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                {{$shippingDetails->name}}
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                {{$shippingDetails->address}}
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                               {{$shippingDetails->city}}
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                {{$shippingDetails->state}}
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                {{$shippingDetails->country}}
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                               {{$shippingDetails->pincode}}
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                {{$shippingDetails->mobile}}
                            </div>
                        </div>

                        {{-- <div class="col-md-12">
                            <div class="submit-button text-center">
                                <button class="btn hvr-hover" id="submit" type="submit">Checkout</button>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div> --}}
                    </div>

                </div>

            </div>

        </div>
    </div>
</div>

<!-- Start Cart  -->
<div class="cart-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-main table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Images</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $total_amount = 0; ?>
                            @foreach ($userCart as $cart)
                            <tr>
                                <td class="thumbnail-img">
                                    <a href="#">
                                    <img class="img-fluid" src="{{asset('uploads/products/'.$cart->image)}}" alt="" />
                            </a>
                                </td>
                                <td class="name-pr">
                                 {{$cart->product_name}}
                                 <p> {{$cart->product_code}} | {{$cart->size}}</p>
                                </td>

                                <td class="price-pr">
                                    <p>&#2547;{{$cart->price}}</p>
                                </td>
                                <td class="quantity-box">
                                    <a href="{{url('/cart/update-quantity/'.$cart->id.'/1')}}" style="font-size: 25px;">+</a>
                                    <input type="number" size="4" value="{{$cart->quantity}}" min="1" step="1" class="c-input-text qty text">
                                    @if($cart->quantity>1)
                                    <a href="{{url('/cart/update-quantity/'.$cart->id.'/-1')}}" style="font-size: 25px;">-</a>
                                    @endif
                                </td>
                                <td class="total-pr">
                                    <p>&#2547; {{$cart->price*$cart->quantity}}</p>
                                </td>

                            </tr>
                            <?php $total_amount = $total_amount + ($cart->price * $cart->quantity); ?>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="order-box">
                    <h3>Your Total</h3>
                    <div class="d-flex">
                        <h4>Cart Sub Total</h4>
                        <div class="ml-auto font-weight-bold"> {{$total_amount}} TK</div>
                    </div>
                    <div class="d-flex">
                        <h4>Shipping Cost (+)</h4>
                        <div class="ml-auto font-weight-bold"> 0 TK</div>
                    </div>
                    <hr class="my-1">
                    <div class="d-flex">
                        <h4>Coupon Discount (-)</h4>
                        <div class="ml-auto font-weight-bold">
                        @if(!empty(Session::get('CouponAmount')))
                        {{Session::get('CouponAmount')}} TK
                        @else
                        0 TK
                        @endif
                        </div>
                    </div>


                    <hr>
                    <div class="d-flex gr-total">
                        <h5>Grand Total</h5>
                        <div class="ml-auto h5">
                            {{$grand_total = $total_amount - Session::get('CouponAmount') }}
                        </div>
                    </div>
                    <hr>
                </div>
            </div>

        </div>

        <form action="{{url('/place-order')}}" name="paymentForm" id="paymentForm" method="post"> {{ csrf_field() }}
            <input type="hidden" value="{{$grand_total}}" name="grand_total">
            <hr class="mb-4">
            <div class="title-left">
                <h3>Payments</h3>
            </div>
            <div class="d-block my-3">
                <div class="custom-control custom-radio">
                    <input id="credit" name="payment_method" value="cod" type="radio" class="custom-control-input cod">
                    <label for="credit" class="custom-control-label">Cash On Delivery</label>
                </div>
                <div class="custom-control custom-radio">
                    <input id="debit" name="payment_method" value="dbt" type="radio" class="custom-control-input dbt">
                    <label for="debit" class="custom-control-label">Direct Bank Transfer</label>
                </div>
                <div class="col-12 d-flex shopping-box">
                        <button class="ml-auto btn hvr-hover" type="submit" onclick="return selectPaymentMethod();" style="color: white;">Place Order</button>
                </div>

            </div>
        </form>
    </div>
</div>
<!-- End Cart -->

@endsection
