<?php 
require __DIR__ . '/vendor/autoload.php';
require 'libs/NotORM.php'; 

use \Slim\App;

$app = new App();

$dbhost = '127.0.0.1';
$dbuser = 'root';
$dbpass = '';
$dbname = 'db_mahasiswa';
$dbmethod = 'mysql:dbname=';

$dsn = $dbmethod.$dbname;
$pdo = new PDO($dsn, $dbuser, $dbpass);
$db  = new NotORM($pdo);

$app-> get('/', function(){
    echo "API Mahasiswa";
});

$app ->get('/semuapemilik', function() use($app, $db){
	$pemilik["error"] = false;
	$pemilik["message"] = "Berhasil mendapatkan data pemilik";
    foreach($db->tbl_pemilik() as $data){
        $pemilik['semuapemilik'][] = array(
            'id' => $data['id'],
            'nama' => $data['nama'],
            'buku' => $data['buku']
            );
    }
    echo json_encode($pemilik);
});

$app ->get('/pemilik/{nama}', function($request, $response, $args) use($app, $db){
    $pemilik = $db->tbl_pemilik()->where('nama',$args['nama']);
    $pemilikdetail = $pemilik->fetch();

    if ($pemilik->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Nama pemilik belum tersedia di database";
        $responseJson["nama"] = null;
        $responseJson["buku"] = null;
        $responseJson["no_hp"] = null;
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mengambil data";
        $responseJson["nama"] = $pemilikdetail['nama'];
        $responseJson["buku"] = $pemilikdetail['buku'];
        $responseJson["no_hp"] = $pemilikdetail['no_hp'];
    }

    echo json_encode($responseJson); 
});

$app ->get('/buku', function() use($app, $db){
    if ($db->tbl_buku()->count() == 0) {
        $responseJson["error"] = true;
        $responseJson["message"] = "Belum mengambil mata kuliah";
    } else {
        $responseJson["error"] = false;
        $responseJson["message"] = "Berhasil mendapatkan data mata kuliah";
        foreach($db->tbl_buku() as $data){
        $responseJson['semuabuku'][] = array(
            'id' => $data['id'],
            'nama_pemilik' => $data['nama_pemilik'],
            'buku' => $data['buku']
            );
        }
    }
    echo json_encode($responseJson);
});

$app->post('/buku', function($request, $response, $args) use($app, $db){
    $buku = $request->getParams();
    $result = $db->tbl_buku->insert($buku);

    $responseJson["error"] = false;
    $responseJson["message"] = "Berhasil menambahkan ke database";
    echo json_encode($responseJson);
});

$app->delete('/buku/{id}', function($request, $response, $args) use($app, $db){
    $buku = $db->tbl_buku()->where('id', $args);
    if($buku->fetch()){
        $result = $buku->delete();
        echo json_encode(array(
            "error" => false,
            "message" => "Buku berhasil dihapus"));
    }
    else{
        echo json_encode(array(
            "error" => true,
            "message" => "Buku ID tersebut tidak ada"));
    }
});

//run App
$app->run();