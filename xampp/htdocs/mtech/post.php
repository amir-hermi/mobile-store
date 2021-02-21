<?php
include "connect.php";
$sql ="SELECT post.id,content,users.fullname AS username,image,post_like FROM post JOIN users ON post.post_user = users.id" ;
$stm=$con->prepare($sql);
$stm->execute();
$res=$stm->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($res);
?>