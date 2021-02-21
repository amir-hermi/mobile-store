<?php
include "connect.php";
$id=$_POST["id"];
$sql ="SELECT * FROM mobilist WHERE mob_cat = $id" ;
$stm=$con->prepare($sql);
$stm->execute();
$mobiles=$stm->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($mobiles);
?>