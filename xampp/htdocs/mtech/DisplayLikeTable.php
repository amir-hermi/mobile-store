<?php
if($_SERVER['REQUEST_METHOD'] == "GET"){
$idUser=$_SERVER['REQUEST_URI'];
$r= explode('/',$idUser,);
$idUser=$r["3"];
$idPost=$r["4"];
$connection = mysqli_connect("localhost", "root", "","mtech");
	$query = mysqli_query ($connection, "SELECT DISTINCT * FROM likes WHERE id_user = $idUser and id_post = $idPost") or die(mysqli_error($connection));
    $user=( $query) ? mysqli_fetch_assoc( $query) : false;
	
	$rows= mysqli_num_rows($query);

	if ($rows > 0) {
		echo json_encode(array('status'=>"success" ));

	}else{
		echo json_encode(array('status'=>"fail"));
	}
}
?>
