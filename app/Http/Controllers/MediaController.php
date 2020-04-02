<?php

namespace App\Http\Controllers;

use App\ErrorsLog;
use App\Media;
use App\UserSearch;
use App\UserMediaFav;
use Illuminate\Http\Request;


class MediaController extends Controller
{

    /**
     * getMedia API
     * This API will be used either for a guest to browse the media or search on some media, as well as
     * in case of logged user it will store information about search operations
     * User Target: logged or guest user
     * @param Request $request
     * @return bool|\Illuminate\Http\JsonResponse
     */
    public function getMedia(Request $request){

        try {
            //Trying to get the user
            $user = $request->user();

            //Getting Gif media
            if (isset($request->search_key) and !empty($request->search_key)) {
                $media = Media::where('type_id', 1)->where('name', 'like', '%' . $request->search_key . '%')->paginate(4);

                //Store Searching info
                if ($user) {
                    $userSearch = new UserSearch();
                    $userSearch->user_id = $user->id;
                    $userSearch->search_key = $request->search_key;

                    $userSearch->save();
                }

            } else
                $media = Media::where('type_id', 1)->paginate(4);

            return response()->json([
                'status' => 1,
                'code' => 0,
                'message' => 'No Errors',
                'objList' => $media,
                'server_time' => time()
            ]);
        }
        catch (\throwable $e)
        {
            $errorLog = new ErrorsLog();
            $errorLog->user_id = $user->id;
            $errorLog->username = $user->name;
            $errorLog->msg = $e->getMessage();

            $errorLog->save();

            return response()->isServerError();
        }
    }

    /**
     * getSearchOperations API
     * This API will be used to store all logged user's search operations as a search_key & date of search
     * User Target: logged user
     * @param Request $request
     * @return bool|\Illuminate\Http\JsonResponse
     */
    public function getSearchOperations(Request $request){
        $user = $request->user();
        try
        {
           if(!$user)
               return response()->json([
                   'status' => -1,
                   'code' => 3,
                   'message' => 'Unauthorized access',
                   'objList' => null,
                   'server_time' => time()
               ]);

           $userSearch = UserSearch::where('user_id', $user->id)->orderBy('created_at', 'asc')->paginate(8);
            return response()->json([
                'status' => 1,
                'code' => 0,
                'message' => 'No Errors',
                'objList' => $userSearch,
                'server_time' => time()
            ]);

        }
        catch (\throwable $e)
        {
            $errorLog = new ErrorsLog();
            $errorLog->user_id = !is_null($user) ? $user->id : '';
            $errorLog->username = !is_null($user) ? $user->name : '';
            $errorLog->msg = $e->getMessage();

            $errorLog->save();

            return response()->isServerError();
        }
    }


    /**
     * getFavs API
     * This API will be used for getting user's favourite media
     * User Target: logged user
     * @param Request $request
     * @return bool|\Illuminate\Http\JsonResponse
     */
    public function getFavs(Request $request){
        $user = $request->user();
        try
        {
            if(!$user)
                return response()->json([
                    'status' => -1,
                    'code' => 3,
                    'message' => 'Unauthorized access',
                    'objList' => null,
                    'server_time' => time()
                ]);

            $favs = UserMediaFav::where('user_id', $user->id)
                ->join('media', 'media.id', '=', 'user_media_favs.media_id')->paginate(3);

            //$favs = UserMediaFav::innerJon('')->orderBy('created_at', 'desc')->paginate(4);
            return response()->json([
                'status' => 1,
                'code' => 0,
                'message' => 'No Errors',
                'objList' => $favs,
                'server_time' => time()
            ]);

        }
        catch (\throwable $e)
        {
            $errorLog = new ErrorsLog();
            $errorLog->user_id = !is_null($user) ? $user->id : '';
            $errorLog->username = !is_null($user) ? $user->name : '';
            $errorLog->msg = $e->getMessage();

            $errorLog->save();

            return response()->isServerError();
        }
    }


    /**
     * setMediaFav API
     * This API will be used to set any media as a favourite
     * User Target: logged user
     * @param Request $request
     * @return bool|\Illuminate\Http\JsonResponse
     */
    public function setMediaFav(Request $request){
        $user = $request->user();
        try
        {
            if(!$user)
                return response()->json([
                    'status' => -1,
                    'code' => 3,
                    'message' => 'Unauthorized access',
                    'objList' => null,
                    'server_time' => time()
                ]);


            $media_fav = new UserMediaFav();
            $media_fav->user_id = $user->id;
            $media_fav->media_id = $request->media_id;

            if(!$media_fav->save())
                return response()->json([
                    'status' => -1,
                    'code' => -1,
                    'message' => 'Something went wrong, please try again',
                    'objList' => null,
                    'server_time' => time()
                ]);

            return response()->json([
                'status' => 1,
                'code' => 0,
                'message' => 'No Errors',
                'objList' => null,
                'server_time' => time()
            ]);
        }
        catch (\throwable $e)
        {
            $errorLog = new ErrorsLog();
            $errorLog->user_id = !is_null($user) ? $user->id : '';
            $errorLog->username = !is_null($user) ? $user->name : '';
            $errorLog->msg = $e->getMessage();

            $errorLog->save();

            return response()->isServerError();
        }
    }


}
