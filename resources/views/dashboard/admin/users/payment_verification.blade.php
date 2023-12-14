@extends('dashboard.admin.layouts.app')

@section('title', 'Verify Payment | Admin')

@section('content')

<div>
    <div class="container" id="mainDiv">
        <div class="row justify-content-center">
            <div class="col-md-10 my-5 card p-4">
                <h4>Verify New Payments</h4>
                {{-- <div>
                    <a href="{{route('admin.vendors')}}" class="btn btn-primary">Back</a>
                </div> --}}
                <hr>
                <div class="table-responsive text-center">
                    <table id="example" class="table table-striped tbl" id="tbl" style="width:100%">
                        <thead>
                            <tr>
                                <th><small>#</small></th>
                                <th><small>Amount</small></th>
                                <th><small>Invoice</small></th>
                                <th><small>Payment Method</small></th>
                                <th><small>Payment Status</small></th>
                                <th><small>Bkash Trans Id</small></th>
                                <th><small>Action</small></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($pending_payments as $item)
                            <tr>
                                <td><small>{{ $loop->index+1 }}</small></td>
                                <td><small>{{ $item->total }} /-BDT</small></td>
                                <td><small>{{$item->invoice}}</small></td>
                                <td><small>{{$item->payment_method}}</small></td>
                                <td><small>{{$item->payment_status}}</small></td>
                                <td><b>#{{$item->trans_id}}</b></td>
                                <td><a href="{{route('admin.payment_verify', ['order_id' => $item->id])}}" class='btn btn-danger'><small>Make Payment Verified</small></a></td>
                            </tr>
                            @endforeach

                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- <div class="container" id="loadingDiv">
    <div class="row justify-content-center" style="min-height: 460px">
        <div class="col-md-4 my-5 p-4 mx-auto d-flex align-items-center" style="width: 200px;">
            <button class="customCard p-3 text-danger" type="button" disabled>
                <span class="spinner-grow spinner-grow-sm text-danger" role="status" aria-hidden="true"></span>
                Loading...
            </button>
        </div>
    </div>
</div>

<div class="container d-none" id="wrongDiv">
    <div class="row justify-content-center" style="min-height: 460px">
        <div class="col-md-4 my-5 p-4 mx-auto d-flex align-items-center" style="width: 300px;">
            <button class="customCard p-3 text-danger" type="button" disabled>
                <span class="spinner-grow spinner-grow-sm text-danger" role="status" aria-hidden="true"></span>
                Somthing went wrong...
            </button>
        </div>
    </div>
</div> --}}

@endsection

@section('javascript')

<script>
    // getServices();

</script>

@endsection
