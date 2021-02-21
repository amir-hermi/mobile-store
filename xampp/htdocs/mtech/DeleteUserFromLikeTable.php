<?php
include "connect.php";
if($_SERVER['REQUEST_METHOD'] == "DELETE"){
$idUser=$_SERVER['REQUEST_URI'];
$r= explode('/',$idUser,);
$idUser=$r["3"];
$idPost =$r["4"];
$sql ="DELETE FROM likes WHERE id_user =$idUser and id_post = $idPost";
$stm=$con->prepare($sql);
$stm->execute();
if($stm){
	echo json_encode( array('status'=>"success"));
}
}
?>