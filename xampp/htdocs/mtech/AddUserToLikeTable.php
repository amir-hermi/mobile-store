<?php
if($_SERVER['REQUEST_METHOD'] == "POST"){
include "connect.php";
$id_post = $_POST["idPost"];
$id_user = $_POST["idUser"];
$sql ="INSERT INTO likes(id_user , id_post) VALUES ($id_user , $id_post)" ;
$stm=$con->prepare($sql);
$stm->execute();
echo json_encode( array('status'=>"success"));
}
?>