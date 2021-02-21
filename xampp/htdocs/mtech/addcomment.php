
<?php
 
	if($_SERVER['REQUEST_METHOD'] == "POST"){
	$comment_user = $_POST["comment_user"];
	$comment = $_POST["comment"];
	$comment_post = $_POST["postId"];//sha1 lock text
	$connection = mysqli_connect("localhost", "root", "","mtech");
	$query = mysqli_query ($connection, "INSERT INTO comments (comment,comment_user,comment_post) VALUES ('$comment',$comment_user,$comment_post)") or die(mysqli_error($connection));
	if ($query) {
		
		echo json_encode(array('status'=>"success" ));

	}
}

?>