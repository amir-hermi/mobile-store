<?php
if($_SERVER['REQUEST_METHOD'] == "PUT"){
include "connect.php";
$_PUT = array();
$decoded_input = json_decode(file_get_contents("php://input"), true);
$idPost=(int)$decoded_input["idPost"];
$sql ="UPDATE post SET post_like=post_like+1 WHERE id=$idPost" ;
$stm=$con->prepare($sql);
$stm->execute();
echo json_encode( array('status'=>"success"));
}
?>