<?php
include "connect.php";
$verif=$_POST["add_last_update"];
$sql ="SELECT * FROM mobilist WHERE add_last_update = '$verif'" ;
$stm=$con->prepare($sql);
$stm->execute();
$mobiles=$stm->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($mobiles);
?>