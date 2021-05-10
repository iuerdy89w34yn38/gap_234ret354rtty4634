<?php

namespace App\Http\Controllers;

use App\Card;
use App\CardPackage;
use App\Setting;
use App\Transaction;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CardController extends Controller
{
    public function card()
    {

    }

    public function cardPackage()
    {

        $paks = CardPackage::latest()->paginate(15);
        return view('admin.cardManagement.cardPak', compact('paks'));
    }

    public function cardRequest()
    {
        $cardRequests =  Card::latest()->paginate(15);
        return view('admin.cardManagement.cardRequest', compact('cardRequests'));
    }

    public function cardPackageAdd(Request $request)
    {

        $this->validate($request,[
            'name'=>  'required|max:191',
            'days'=>  'required|integer',
            'status'=>  'required',
            'min_amount'=>  'required|numeric',
            'max_amount'=>  'required|numeric',
            'fixed_charge'=>  'required|numeric',
            'percent_charge'=>  'required|numeric',

        ]);

        $paks = new CardPackage();

        $paks->name = $request->name;
        $paks->days = $request->days;
        $paks->status = $request->status;
        $paks->min_amount = $request->min_amount;
        $paks->max_amount = $request->max_amount;
        $paks->fixed_charge = $request->fixed_charge;
        $paks->percent_charge = $request->percent_charge;
        $paks->save();
        return redirect()->back()->withSuccess('Successfully Added');
    }

    public function cardPackageUpdate(Request $request)
    {

        $this->validate($request,[
            'name'=>  'required|max:191',
            'days'=>  'required|integer',
            'status'=>  'required',
            'min_amount'=>  'required|numeric',
            'max_amount'=>  'required|numeric',
            'fixed_charge'=>  'required|numeric',
            'percent_charge'=>  'required|numeric',

        ]);

        $paks = CardPackage::findOrfail($request->id);

        $paks->name = $request->name;
        $paks->days = $request->days;
        $paks->status = $request->status;
        $paks->min_amount = $request->min_amount;
        $paks->max_amount = $request->max_amount;
        $paks->fixed_charge = $request->fixed_charge;
        $paks->percent_charge = $request->percent_charge;
        $paks->save();
        return redirect()->back()->withSuccess('Successfully updated');

    }

    public function cardRequestUpdate(Request $request)
    {

        $data = Card::findOrFail($request->id);


        /*if ($data->status != 0)
        {
            return redirect(404);
        } */

        $user = User::find($data->user_id);

        if ($request->status == 1)
        {
            $data->status = $request->status;
            $data->card = $request->card;
            $data->exp = $request->exp;
            $data->cvv = $request->cvv;
            $data->remlimit = $request->remlimit;
            $data->return_date = Carbon::now()->addDays($request->days);
            $data->save();

            $tlog = new Transaction();
            $tlog['user_id'] = $user->id;
            $tlog['amount'] = $data->amount;
            $tlog['balance'] = $user->balance;
            $tlog['type'] = 1;
            $tlog['details'] = 'Receive balance from card request';
            $tlog['trxid'] = Str::random(16);
            $tlog->save();

            $gnl = Setting::first();

            $to = $user->email;
            $name = $user->username;
            $subject = "Card Request Approved";

            $message = "You Card Request has been Approved. Your Card No: " . $data->card. " EXP and CVV will be in you Dashboard. Thank You for Choosing Us";
            send_email($to, $name, $subject, $message);


        }
        if ($request->status != 1)
        {
            $data->status = $request->status;
            $data->save();


            $gnl = Setting::first();

            $to = $user->email;
            $name = $user->username;
            $subject = "Card Request Update";

            $message = "You Card Request has been Rejected. Please Contact Us for More Information. Thank You.";
            send_email($to, $name, $subject, $message);


        }


        if ($request->status == 3)
        {
            $data->status = $request->status;
            $data->card = $request->card;
            $data->exp = $request->exp;
            $data->cvv = $request->cvv;
            $data->remlimit = $request->remlimit;
            $data->return_date = Carbon::now()->addDays($request->days);
            $data->save();

            $to = $user->email;
            $name = $user->username;
            $subject = "Card request rejected";
            $message = "You Card Request has been Rejected. Please Contact Us for More Information. Thank You.";
            send_email($to, $name, $subject, $message);
        }

        return redirect()->back()->withSuccess('Successfully updated');

    }









}
