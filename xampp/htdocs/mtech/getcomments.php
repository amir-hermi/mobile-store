<?php
if($_SERVER["REQUEST_METHOD"] == "POST"){
include "connect.php";
$postId = $_POST["postId"];
$sql ="SELECT comment,users.fullname , post.id As postId FROM comments JOIN users ON comments.comment_user = users.id JOIN post On comments.comment_post = post.id WHERE comment_post = $postId" ;
$stm=$con->prepare($sql);
$stm->execute();
$mobiles=$stm->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($mobiles);
}
?>