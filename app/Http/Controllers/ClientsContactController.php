<?php

namespace App\Http\Controllers;

use App\Models\ClientsContact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
class ClientsContactController extends Controller
{


    public $messages = [
        'required' => 'El Campo :attribute es requirdo.',
        'email'    => 'El Campo :attribute no es una direccion de correo correcta.',
    ];


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $response = ClientsContact::get();
        return response()->json($response)->setStatusCode(200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name'       => 'required',
                'email'      => 'required|email',
                'client_id'  => 'required'
            ], $this->messages);
    
    
            if ($validator->fails()) {
                return response()->json($validator->errors())->setStatusCode(400);
            }else{
            
                ClientsContact::create($request->all());

                $response["success"] = true;
                $response["message"] = "Register Success";
                return response()->json($response)->setStatusCode(200);    
            }
        } catch (\Illuminate\Database\QueryException $ex) {
           $response["success"] = false;
           $response["message"] = $ex->getMessage();
           return response()->json($response)->setStatusCode(400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ClientsContact  $clientsContact
     * @return \Illuminate\Http\Response
     */
    public function show($clientsContact)
    {
        $response = ClientsContact::find($clientsContact);

        if(empty($response)){
            $response["success"] = false;
            $response["message"] = "No se han encontrado resultados";
            return response()->json($response)->setStatusCode(400);
        }else{
            return response()->json($response)->setStatusCode(200);
        }
    }

    public function GetContactByClient($client)
    {
        $response = ClientsContact::where("client_id", $client)->get();

        if(sizeof($response) == 0){
            $response["success"] = false;
            $response["message"] = "No se han encontrado resultados";
            return response()->json($response)->setStatusCode(400);
        }else{
            return response()->json($response)->setStatusCode(200);
        }
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ClientsContact  $clientsContact
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $clientsContact)
    {
        try {

            $validator = Validator::make($request->all(), [
                'name'       => 'required',
                'email'      => 'required|email'
            ], $this->messages);
    
            if ($validator->fails()) {
                return response()->json($validator->errors())->setStatusCode(400);
            }else{
                ClientsContact::where("id", $clientsContact)->update($request->all());
                $response["success"] = true;
                $response["message"] = "Update Success";
                return response()->json($response)->setStatusCode(200);
            }

        } catch (\Illuminate\Database\QueryException $ex) {
           $response["success"] = false;
           $response["message"] = $ex->getMessage();
           return response()->json($response)->setStatusCode(400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ClientsContact  $clientsContact
     * @return \Illuminate\Http\Response
     */
    public function destroy($clientsContact)
    {
        ClientsContact::where("id", $clientsContact)->delete();
        $response["success"] = true;
        $response["message"] = "Delete Success";
        return response()->json($response)->setStatusCode(200);
    }
}
