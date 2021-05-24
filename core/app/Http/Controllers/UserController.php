<?php

namespace App\Http\Controllers;


use App\Bank;
use App\Branch;
use App\FixDeposit;
use App\FixDepositPak;
use App\GatewayManual;
use App\Loan;
use App\Card;
use App\LoanPackage;
use App\CardPackage;
use App\Setting;
use App\Transaction;
use App\Withdraw;
use App\Wmethod;
use Auth;

use Illuminate\Support\Str;
use Session;
use App\Deposit;
use App\Gateway;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{


    public function branch()
    {
        $branches = Branch::all();
        return view('user.branch', compact('branches'));
    }

    public function loginPage()
    {
        if (Auth::user()) {
            return redirect()->route('user.dashboard');
        }
        return redirect()->route('login');
    }

    public function dashboard()

    {


        $totalDps = FixDeposit::where('user_id', Auth::id())->where('status', 0)->sum('amount');

        $totalDep = Deposit::where('user_id', Auth::id())->where('status', 1)->sum('amount');
        $totalwd = Withdraw::where('user_id', Auth::id())->where('status', 1)->sum('amount');
        $userToUser = Transaction::where('user_id', Auth::id())->where('type', 6)->count('user_id');
        $userToBank = Transaction::where('user_id', Auth::id())->where('type', 7)->where('status', 1)->count('user_id');
        $totaltf = $userToUser + $userToBank;
        $pendingwd = Withdraw::where('user_id', Auth::id())->where('status', 0)->sum('amount');
        $totalOtBankTrn = Transaction::where('user_id', Auth::id())->where('type', 7)->where('status', 0)->sum('amount');

        return view('user.dashboard', compact('totalDep', 'totalwd', 'pendingwd', 'totaltf', 'totalOtBankTrn', 'totalDps'));

    }

    public function verify()
    {
        if (Auth::user()->email_verified == 1 && Auth::user()->sms_verified == 1) {
            return redirect()->route('user.dashboard')->with('success', ' Successfully logged in.');
        } else {
            return view('user.verify');
        }

    }

    public function verifyEmailCode(Request $request)
    {
        $this->validate($request, [
            'email_code' => 'required'
        ]);

        $user = Auth::user();
        if ($user->email_code == $request->email_code) {
            $user->email_verified = 1;
            $user->email_code = null;
            $user->save();
            return redirect()->back()->with('success', 'Please check your phone, we send verification Code in your phone.');
        }
        return back()->withErrors('Invalid code, Please try again');

    }

    public function resendVerifyEmail()
    {

        $user = Auth::user();

        if (Carbon::parse($user->email_time)->gt(Carbon::now())) {
            $time = Carbon::parse($user->email_time)->diffForHumans();
            return back()->withErrors("Please try again $time");
        }
        $userOwner = Auth::user();
        $email_code = substr(uniqid(), 0, 6);
        $userOwner->email_code = $email_code;
        $userOwner->email_time = Carbon::parse()->addMinute(3);
        $userOwner->save();

        $code = $email_code;
        $to = $user['email'];
        $name = $user['username'];
        $subject = "Verification Code";
        $message = "Your verification code is: " . $code;
        send_email($to, $name, $subject, $message);

        return back()->with('success', 'Please Check your mail, New email verification code send to your email address.');


    }

    public function verifySms(Request $request)
    {

        $this->validate($request, [
            'sms_code' => 'required',
        ]);
        $user = Auth::user();

        if ($user->sms_code == $request->sms_code) {
            $user->sms_verified = 1;
            $user->sms_code = null;
            $user->save();

            return redirect()->route('user.dashboard')->with('success', ' Successfully logged in.');
        }
        return back()->withErrors('Invalid code, please try again');

    }


    public function resendVerifySms()
    {
        $user = Auth::user();

        if (Carbon::parse($user->sms_time)->gt(Carbon::now())) {
            $time = Carbon::parse($user->sms_time)->diffForHumans();
            return back()->withErrors("Please try again $time");
        }
        $sms_code = substr(uniqid(), 0, 6);
        $user->sms_code = $sms_code;
        $user->sms_time = Carbon::parse()->addMinute(3);
        $user->save();

        $code = $sms_code;
        $to = $user['phone'];
        $message = "Your verification code is: " . $code;
        send_sms($to, $message);
        return back()->with('success', 'Please Check your phone, New sms verification code send to your phone number');

    }


    public function profileIndex()
    {


        return view('user.profile');
    }

    public function profileUpdate(Request $request)
    {
        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone' => 'required|numeric',


        ]);
        $user = Auth::user();
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->phone = $request->phone;
        $user->city = $request->city;
        $user->country = $request->country;
        $user->address = $request->address;
        $user->dob = $request->dob;
        $user->idt = $request->idt;
        $user->idn = $request->idn;
        $user->ubt = $request->ubt;

        if ($request->hasFile('idimgf')) {

            $idimgf = $request->file('idimgf');
            $filename = $idimgf->hashName();
            $location = 'assets/image/avatar/' . $filename;
            Image::make($idimgf)->save($location);
            $user->idimgf = $filename;
        }


        if ($request->hasFile('idimgb')) {

            $image = $request->file('idimgb');
            $filename = $image->hashName();
            $location = 'assets/image/avatar/' . $filename;
            Image::make($image)->save($location);
            $user->idimgb = $filename;
        }


        if ($request->hasFile('ubimg')) {

            $image = $request->file('ubimg');
            $filename = $image->hashName();
            $location = 'assets/image/avatar/' . $filename;
            Image::make($image)->save($location);
            $user->ubimg = $filename;
        }



        $user->save();
        return redirect()->back()->with('success', 'Successfully Updated');
    }


    public function changePass()
    {
        return view('user.changePass');
    }

    public function passwordChange(Request $request)
    {
        $request->validate([
            'old_password' => 'required|string',
            'password' => 'required|string|min:6|confirmed',
        ]);
        $oldpassword = $request->old_password;
        $newpassword = $request->password;
        if (Hash::check($oldpassword, Auth::user()->password)) {
            $request->user()->fill(['password' => Hash::make($newpassword)])->save();
            return redirect()->back()->with('success', 'Your password has been changed Successfully');
        }
        return back()->withErrors('invalid password');
    }


    public function deposit()
    {

        $gates = Gateway::where('status', 1)->get();
        $mgates = GatewayManual::where('status', 1)->get();
        $deposit = Deposit::where('user_id', Auth::id())->orderBy('id', 'DESC')->where('status', '!=', 0)->paginate(15);
        return view('user.deposit', compact('gates', 'deposit', 'mgates'));

    }


    public function depositDataInsert(Request $request)
    {


        $this->validate($request, ['amount' => 'required|numeric', 'gateway' => 'required']);

        if ($request->amount <= 0) {
            return back()->withErrors('Invalid Amount');
        } else {
            $gate = Gateway::findOrFail($request->gateway);

            if (isset($gate)) {
                if ($request->amount >= $gate->minamo && $request->amount <= $gate->maxamo) {


                    $charge = $gate->fixed_charge + ($request->amount * $gate->percent_charge / 100);
                    $usdamo = ($request->amount + $charge) / $gate->rate;

                    $depo['user_id'] = Auth::id();
                    $depo['gateway_id'] = $gate->id;
                    $depo['amount'] = $request->amount;
                    $depo['charge'] = $charge;
                    $depo['usd_amo'] = round($usdamo, 2);
                    $depo['btc_amo'] = 0;
                    $depo['btc_wallet'] = "";
                    $depo['trx'] = Str::random(16);
                    $depo['try'] = 0;
                    $depo['status'] = 0;
                    Deposit::create($depo);

                    Session::put('Track', $depo['trx']);

                    return redirect()->route('user.deposit.preview');

                } else {
                    return back()->withErrors('Please Follow Deposit Limit');
                }
            } else {
                return back()->withErrors('Please Select Deposit gateway');
            }
        }

    }


    public function mdepositConfirm(Request $request)
    {
        $gnl = Setting::first();

        $request->validate([
            'message' => 'required|string',
            'image' => 'required|mimes:jpg,jpeg,png',
        ]);

        $track = Session::get('Track');

        $data = Deposit::where('trx', $track)->orderBy('id', 'DESC')->first();

        $gateway_name = GatewayManual::find($data->gateway_id)->first();

        if (is_null($data)) {
            return redirect()->route('user.dashboard')->withErrors('Invalid Deposit Request');
        }
        if ($data->status != 0) {
            return redirect()->route('user.dashboard')->withErrors('Invalid Deposit Request');
        }

        if ($request->hasFile('image')) {

            $image = $request->file('image');
            $filename = $image->hashName();
            $location = 'assets/image/m_deposit/' . $filename;
            Image::make($image)->save($location);
            $data->verify_image = $filename;
        }


        $data->status = 3;
        $data->account = $request->message;
        $data->save();

        $gnl = Setting::first();

        $msg = 'Your Deposit of ' . $data->amount . $gnl->cur . ' via ' . $gateway_name->name . ' is pending. Please wait for admin approve';
        send_email($data->userName->email, $data->userName->username, 'Deposit Successful', $msg);
        send_sms($data->userName->mobile, $msg);

        return redirect()->route('user.dashboard')->withSuccess('Your Request in pending, Please wait for admin approve.');


    }


    public function depositDataManual(Request $request)
    {


        $this->validate($request, [
            'amount' => 'required|min:0',
            'gateway' => 'required',
        ]);

        if ($request->amount < 0) {
            return back()->withErrors('Invalid Amount');
        } else {
            $gate = GatewayManual::findOrFail($request->gateway);

            if (isset($gate)) {
                if ($request->amount >= $gate->minamo && $request->amount <= $gate->maxamo) {


                    $charge = $gate->fixed_charge + ($request->amount * $gate->percent_charge / 100);
                    $usdamo = ($request->amount + $charge) * $gate->rate;

                    $depo['user_id'] = Auth::id();
                    $depo['gateway_id'] = $gate->id;
                    $depo['amount'] = $request->amount;
                    $depo['charge'] = $charge;
                    $depo['usd_amo'] = $usdamo;
                    $depo['btc_amo'] = 0;
                    $depo['btc_wallet'] = "";
                    $depo['trx'] = Str::random(16);
                    $depo['try'] = 0;
                    $depo['status'] = 0;
                    $depo['type'] = 0;
                    Deposit::create($depo);

                    Session::put('Track', $depo['trx']);

                    return redirect()->route('user.deposit.preview');

                } else {
                    return back()->withErrors('Please Follow Deposit Limit');
                }
            } else {
                return back()->withErrors('Please Select Deposit gateway');
            }
        }

    }

    public function depositPreview()
    {

        $track = Session::get('Track');


        $data = Deposit::where('status', 0)->where('trx', $track)->first();
        if ($data->type == 1) {
            return view('user.payment.preview', compact('data'));
        } else {
            return view('user.mdepositpreview', compact('data'));
        }


    }


    public function withdraw()
    {
        $gates = Wmethod::where('status', 1)->get();

        $withdraw = Withdraw::where('user_id', Auth::id())->latest()->paginate(15);

        return view('user.withdraw', compact('gates', 'withdraw'));
    }

    public function withdrawPost(Request $request)
    {


        $this->validate($request,
            [
                'amount' => 'required|numeric',
                'account' => 'required',
                'gateway' => 'required',
            ]);

        $method = Wmethod::findOrFail($request->gateway);

        $charge = $method->fixed_charge + ($request->amount * $method->percent_charge / 100);
        $amount = $request->amount + $charge;

        if ($amount > Auth::user()->balance || $request->amount <= 0 || $amount < $method->minamo || $amount > $method->maxamo) {
            return back()->withErrors('Invalid Amount');
        } else {
            $user = User::find(Auth::user()->id);
            $user['balance'] = $user->balance - $amount;
            $user->update();

            $with['user_id'] = $user->id;
            $with['wmethod_id'] = $method->id;
            $with['amount'] = $request->amount;
            $with['fee'] = $charge;
            $with['account'] = $request->account;
            $with['status'] = 0;
            Withdraw::create($with);

            return back()->with('success', 'Withdraw Request Sent Successfully!');
        }


    }

    public function trx()
    {
        $logs = Transaction::where('user_id', Auth::user()->id)->latest()->paginate(15);
        return view('user.trx', compact('logs'));
    }

    public function accStatement()
    {
        $ownBankStatements = Transaction::where('user_id', Auth::user()->id)->where('type', 6)->latest()->paginate(15);
        $otherBankStatements = Transaction::where('user_id', Auth::user()->id)->where('type', 7)->latest()->paginate(15);


        return view('user.accStatement', compact('otherBankStatements', 'ownBankStatements'));
    }

    public function transferToOwnBank()
    {
        return view('user.transferOwnBank');
    }

    public function transferOwnBank(Request $request)
    {


        $this->validate($request, [

            'account_number' => 'required|numeric',
            'amount' => 'required|numeric',
        ]);

        $gnl = Setting::first();

        $charge = $gnl->bal_trans_fixed_charge + ($request->amount * $gnl->bal_trans_per_charge / 100);
        $amount = $request->amount + $charge;
        if ($amount > Auth::user()->balance || $request->amount <= 0) {
            return back()->withErrors('Invalid Amount');

        } else {
            $user = User::where('account_number', $request->account_number)->first();
            if ($user == NULL) {
                return back()->withErrors('Invalid account');
            } else {

                $data['amount'] = $request->amount;
                $data['account_number'] = $request->account_number;
                $data['charge'] = $charge;
                $data['total'] = $amount;
                $data['type'] = 0;
                $data['token'] = Str::random(12);

                $gnl = Setting::first();

                $to = Auth::user()->email;
                $name = Auth::user()->name;
                $subject = 'Balance Transfer Token';

                $message = 'You are Transferring: ' . $data['amount'] . ' ' . $gnl->cur . ' to the account number ' . $data['account_number'] . ' and your Transfer token is: ' . $data['token'];

                send_email($to, $name, $subject, $message);


                Session::put('data', $data);


                return redirect()->route('user.transfer.preview');
            }

        }


    }

    public function transferPreview(Request $request)
    {

        $tnfp = Session::get('data');
        return view('user.tfPreview', compact('tnfp'));

    }

    public function transferOwnBankConfirm(Request $request)
    {


        $this->validate($request, [
            'account_number' => 'required|numeric',
            'amount' => 'required|numeric',
        ]);



        $gnl = Setting::first();

        $charge = $gnl->bal_trans_fixed_charge + ($request->amount * $gnl->bal_trans_per_charge / 100);
        $amount = $request->amount + $charge;
        if ($amount > Auth::user()->balance || $request->amount <= 0) {
            return back()->withErrors('Invalid Amount');

        } else {
            $user = User::where('account_number', $request->account_number)->first();
            if ($user == NULL) {
                return back()->withErrors('Invalid account');
            } else {


                $sender = User::find(Auth::user()->id);
                $sender->balance = $sender->balance - $amount;
                $sender->update();

                $senderTlog = new Transaction();
                $senderTlog['user_id'] = $sender->id;
                $senderTlog['amount'] = $request->amount;
                $senderTlog['balance'] = $sender->balance;
                $senderTlog['fee'] = $charge;
                $senderTlog['type'] = 6;
                $senderTlog['status'] = 1;
                $senderTlog['details'] = 'Balance Transfer To ' . $user->name;
                $senderTlog['trxid'] = 'tns:' . Str::random(16);;
                $senderTlog->save();

                $msg = 'Successful transfer balance to ' . $user->name . '. Account Number: ' . $request->account_number . '. Amount ' . $request->amount . $gnl->cur . '. Transaction fee ' . $charge . $gnl->cur . '.Your current balance is ' . $sender->balance . $gnl->cur . '. Transaction id : ' . $senderTlog->trxid;
                send_email($sender->email, $sender->username, 'Transaction Successful', $msg);
                $sms = 'Successful transfer to ' . $user->name . '. Amount' . $request->amount . $gnl->cur . '. Truncation fee' . $charge . '.Your current balance is ' . $sender->balance . $gnl->cur . '. Transaction id : ' . $senderTlog->trxid;
                send_sms($sender->mobile, $sms);

                $receiver = User::where('account_number', $request->account_number)->first();
                $receiver->balance = $receiver->balance + $request->amount;
                $receiver->update();

                $receiverTlog = new Transaction();
                $receiverTlog['user_id'] = $receiver->id;
                $receiverTlog['amount'] = $request->amount;
                $receiverTlog['balance'] = $receiver->balance;
                $receiverTlog['type'] = 6;
                $receiverTlog['status'] = 1;
                $receiverTlog['details'] = 'Receive balance from' . $sender->name;
                $receiverTlog['trxid'] = $senderTlog->trxid;
                $receiverTlog->save();

                $msg = 'Receive balance from ' . $sender->name . '. Amount ' . $request->amount . $gnl->cur . '. Your current balance is ' . $receiver->balance . $gnl->cur . '. Transaction id : ' . $receiverTlog->trxid;
                send_email($receiver->email, $receiver->username, 'Transaction Successful', $msg);
                $sms = 'Successful Get balance from ' . $sender->name . '. Amount' . $request->amount . $gnl->cur . '. Your current balance is ' . $receiver->balance . $gnl->cur . '. Transaction id : ' . $receiverTlog->trxid;
                send_sms($receiver->mobile, $sms);

                return redirect()->route('user.dashboard')->with('success', 'Successful transfer balance to ' . $receiver->name . '. Amount ' . $request->amount . " " . $gnl->cur . '. fee ' . " " . $charge . " " . $gnl->cur . ' Your cur balance is ' . $sender->balance);

            }

        }


    }

    public function transferToOtherBank()
    {
        $banks = Bank::where('status', 1)->get();
        return view('user.transferOtherBank', compact('banks'));
    }


    public function transferOtherBank(Request $request)
    {


        $this->validate($request, [
            'bank_name' => 'required',
            'details' => 'required',
            'branch_name' => 'required',
            'account_number' => 'required',
            'amount' => 'required|numeric',
        ]);


        $bank = Bank::find($request->bank_name);
        if ($bank != NULL) {
            $charge = $bank->fixed_charge + ($request->amount * $bank->percent_charge / 100);
            $amount = $request->amount + $charge;
            if ($amount > Auth::user()->balance || $request->amount <= 0) {
                return back()->withErrors('Invalid Amount');


            } else {

                if ($bank->min_amount <= $request->amount || $request->amount >= $bank->max_amount) {
                    $data['bank'] = $bank->name;
                    $data['bank_id'] = $bank->id;
                    $data['amount'] = $request->amount;
                    $data['charge'] = $charge;
                    $data['total'] = $amount;
                    $data['branch_name'] = $request->branch_name;
                    $data['account_number'] = $request->account_number;
                    $data['p_time'] = $bank->p_time;
                    $data['details'] = $request->details;
                    $data['token'] = Str::random(12);

                    Session::put('data', $data);


                    $gnl = Setting::first();

                    $to = Auth::user()->email;
                    $name = Auth::user()->name;
                    $subject = 'Balance Transfer Token';

                    $message = 'You are Transferring: ' . $data['amount'] . ' ' . $gnl->cur . ' to the ' . $data['bank'] . ' and your Transfer token is: ' . $data['token'];

                    send_email($to, $name, $subject, $message);


                    return redirect()->route('user.ot.transfer.preview');
                } else {
                    return back()->withErrors('Please check transaction limit ');
                }


            }

        } else {
            return redirect()->back()->withErrors('Invalid Bank name');
        }


    }

    public function transferOtBankPreview(Request $request)
    {

        $tnfp = Session::get('data');
        return view('user.otTfPreview', compact('tnfp'));

    }

    public function transferOtherBankConfirm(Request $request)
    {

        $this->validate($request, [
            'bank_name' => 'required',
            'details' => 'required',
            'branch_name' => 'required',
            'account_number' => 'required',
            'amount' => 'required|numeric',
        ]);


        $bank = Bank::find($request->bank_name);
        if ($bank != NULL) {
            $charge = $bank->fixed_charge + ($request->amount * $bank->percent_charge / 100);
            $amount = $request->amount + $charge;
            if ($amount > Auth::user()->balance || $request->amount <= 0) {
                return back()->withErrors('Invalid Amount');

            } else {

                $gnl = Setting::first();
                $sender = User::find(Auth::user()->id);
                $sender['balance'] = $sender->balance - $amount;
                $sender->update();

                $senderTlog = new Transaction();
                $senderTlog['user_id'] = $sender->id;
                $senderTlog['amount'] = $request->amount;
                $senderTlog['balance'] = $sender->balance;
                $senderTlog['fee'] = $charge;
                $senderTlog['type'] = 7;
                $senderTlog['p_time'] = $bank->p_time;
                $senderTlog['details'] = 'Bank Name: ' . $bank->name . ' . Branch name ' . $request->branch_name . '. Account Number : ' . $request->account_number . '. Account details : ' . $request->details;
                $senderTlog['trxid'] = 'tns:' . Str::random(16);;
                $senderTlog->save();

                $msg = 'Transfer balance to other Bank Name: ' . $bank->name . ' . Branch name ' . $request->branch_name . ' . Account Number : ' . $request->account_number . '. Account details : ' . $request->details . '. Amount ' . $request->amount . $gnl->cur . '. fee ' . $charge . $gnl->cur . '. Your current balance is ' . $sender->balance . $gnl->cur . '. Processing time ' . $bank->p_time;
                send_email($sender->email, $sender->username, 'Transfer balance', $msg);
                $sms = 'Transfer balance to other Bank Name: ' . $bank->name . ' . Branch name ' . $request->branch_name . ' Account Number : ' . $request->account_number . '. Account details : ' . $request->details . '. Amount ' . $request->amount . $gnl->cur . '. fee ' . $charge . $gnl->cur . '. Your current balance is ' . $sender->balance . $gnl->cur . '. Processing time ' . $bank->p_time;
                send_sms($sender->mobile, $sms);
                return redirect()->route('user.dashboard')->with('success', 'Successful balance Transfer Request To ' . $bank->name . '. Amount ' . $request->amount . $gnl->cur . '. fee ' . $charge . $gnl->cur . '. Processing time ' . $bank->p_time . '. Your cur balance is ' . $sender->balance . $gnl->cur);


            }

        } else {
            return redirect()->back()->withErrors('Invalid Bank name');
        }


    }

    public function bankData(Request $request)
    {
        $dada = Bank::where('id', $request->id)->first();
        return response()->json([
            'fixed_charge' => $dada->fixed_charge,
            'percent_charge' => $dada->percent_charge,
            'p_time' => $dada->p_time,
            'min_amount' => $dada->min_amount,
            'max_amount' => $dada->max_amount,
        ]);


    }


    public function fixDepPackage()
    {
        $fixDepPackages = FixDepositPak::where('status', 1)->get();
        return view('user.fixDepPackage', compact('fixDepPackages'));
    }


    public function fixDepHistory()
    {
        $fixDeps = FixDeposit::where('user_id', Auth::user()->id)->latest()->paginate(15);
        return view('user.fixDepHistory', compact('fixDeps'));
    }

    public function fixDepStore(Request $request)
    {

        $this->validate($request, [

            'amount' => 'required|numeric',
        ]);

        $amount = round($request->amount, 2);


        $FixDepPak = FixDepositPak::where('id', $request->id)->where('status', 1)->first();
        if ($FixDepPak == NULL) {
            return redirect('404');
        }

        if (Auth::user()->balance < $amount || $amount <= 0) {
            return redirect()->back()->withErrors('Invalid input');
        }

        if ($FixDepPak->max_amount <= $amount || $amount >= $FixDepPak->min_amount) {

            $user = Auth::user();
            $user->balance = $user->balance - $amount;
            $user->save();

            $fixDep = new FixDeposit();
            $fixDep->user_id = $user->id;
            $fixDep->fix_deposit_paks_id = $FixDepPak->id;
            $fixDep->amount = $amount;
            $fixDep->percent_return = $FixDepPak->percent_return;
            $fixDep->return_date = Carbon::now()->addDays($FixDepPak->days);
            $fixDep->return_total = $amount + $amount * $FixDepPak->percent_return / 100;
            $fixDep->save();


            return redirect()->back()->withSuccess('Successfully fixed deposit money');

        } else {
            return redirect()->back()->withErrors('Please check fixed deposit limit');
        }


    }


    public function loanPackage()
    {
        $loanPackages = LoanPackage::where('status', 1)->get();
        return view('user.loanPackage', compact('loanPackages'));
    }

    public function loanHistory()
    {
        $loanPackages = Loan::where('user_id', Auth::id())->latest()->paginate(15);
        return view('user.loanHistory', compact('loanPackages'));
    }


    public function loanStore(Request $request)
    {

        $this->validate($request, [

            'amount' => 'required|numeric|min:0',
        ]);

        $amount = round($request->amount, 2);


        $loanPak = LoanPackage::where('id', $request->id)->where('status', 1)->first();
        if ($loanPak == NULL){
            return redirect('404');
        }

        if ($loanPak->min_amount  <= $amount  && $amount <= $loanPak->max_amount )
        {
            $loan = new Loan();
            $loan->loan_packages_id = $loanPak->id;
            $loan->user_id = Auth::user()->id;
            $loan->amount = $amount;
            $loan->charge = $amount * $loanPak->percent_charge / 100 +$loanPak->fixed_charge;
            $loan->days = $loanPak->days;
            $loan->save();
            return redirect()->back()->withSuccess('Successfully request for loan');

        }
        else{
            return redirect()->back()->withErrors('Please check loan limit');
        }




    }



    public function cardPackage()
    {
        $cardPackages = CardPackage::where('status', 1)->get();
        return view('user.cardPackage', compact('cardPackages'));
    }

    public function cardHistory()
    {
        $cardPackages = Card::where('user_id', Auth::id())->latest()->paginate(15);
        return view('user.cardHistory', compact('cardPackages'));
    }


    public function cardStore(Request $request)
    {

        $this->validate($request, [

            'amount' => 'required|min:0',
        ]);

        $amountx = round($request->amount, 2);
        $amount = $request->amount;


        $cardPak = CardPackage::where('id', $request->id)->where('status', 1)->first();
        if ($cardPak == NULL){
            return redirect('404');
        }


            $card = new Card();
            $card->card_packages_id = $cardPak->id;
            $card->user_id = Auth::user()->id;
            $card->amount = $amount;
            $card->charge = $amountx * $cardPak->percent_charge / 100 +$cardPak->fixed_charge;
            $card->days = $cardPak->days;
            $card->save();
            return redirect()->back()->withSuccess('Successfully request for card');






    }





    public function profileImage(Request $request)
    {
        $request->validate([
            'avatar' => 'required|mimes:jpg,jpeg,png',
        ]);
        $user = Auth::user();
        if ($request->hasFile('avatar')) {
            @unlink('assets/image/avatar/' . $user->avatar);
            $image = $request->file('avatar');
            $filename = $image->hashName();
            $location = 'assets/image/avatar/' . $filename;
            Image::make($image)->fit(512, 512)->save($location);
            $user->avatar = $filename;
        }
        $user->save();
        return redirect()->back()->with('success', 'Successfully Updated');
    }


    public function loanRepay(Request $request)
    {

        $this->validate($request, [

            'amount' => 'required|numeric',
        ]);

        $amount = round($request->amount, 2);

        if ($amount <= 0) {
            return redirect()->back()->withErrors('Invalid input');
        }

        if (Auth::user()->balance < $amount) {
            return redirect()->back()->withErrors('Insufficient balance, please deposit first');
        }


        $repay = Loan::where('id', $request->id)->where('user_id', Auth::user()->id)->where('status', 1)->first();

        $totalPay = $repay->charge + $repay->amount;


        if ($amount == $totalPay) {

            $repay->status = 2;

            $repay->save();

            $user = Auth::user();
            $user->balance = $user->balance - $amount;
            $user->save();


            $tlog = new Transaction();
            $tlog['user_id'] = $user->id;
            $tlog['amount'] = $amount;
            $tlog['balance'] = $user->balance;
            $tlog['type'] = 1;
            $tlog['details'] = 'Loan return';
            $tlog['trxid'] = Str::random(16);;
            $tlog->save();

            $msg = 'Loan return Successful';
            send_email($user->email, $user->username, 'Loan return Successful', $msg);
            $sms = 'Loan return Successful';
            send_sms($user->mobile, $sms);

            return redirect()->back()->withSuccess('Successfully return Loan');

        } else {

            return redirect()->back()->withErrors('Please check payable amount');
        }


    }


}
