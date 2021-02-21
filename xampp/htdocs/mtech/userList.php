 <?php
 header('Access-Control-Allow-Origin:*');

 header('Access-Control-Allow-Methods: GET,PUT,POST,DELETE,OPTIONS');
 
 header("Access-Control-Expose-Headers ");
 
include "connect.php";
$sql ="SELECT * FROM users" ;
$stm=$con->prepare($sql);
$stm->execute();

$mobiles=$stm->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($mobiles);
?>