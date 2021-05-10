<?php

namespace App\Http\Middleware;

use App\Setting;
use Carbon\Carbon;
use Closure;
use Illuminate\Support\Facades\Auth;

class CheckUserForCard
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */

    public function handle($request, Closure $next)
    {

            $pDate = Carbon::today();
            $user =Auth::user();

        if ($user->cards()->whereStatus(1)->whereDate('return_date', '<',  $pDate)->count())
                return redirect()->route('user.card.history')->withErrors( 'Please repay card first.');
        return $next($request);

    }

}
