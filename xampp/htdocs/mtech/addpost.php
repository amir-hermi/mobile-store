
<?php
 
	if($_SERVER['REQUEST_METHOD'] == "POST"){	
    $imagename =$_POST["imagename"];
    $image64 =base64_decode($_POST["base64"]);
	$id_user = $_POST["id"];
	$imagepath='postImage//'.$imagename;
	$content = $_POST["content"];//sha1 lock text
	$connection = mysqli_connect("localhost", "root", "","mtech");
	$query = mysqli_query ($connection, "INSERT INTO post (content,post_user,image) VALUES ('$content',$id_user,'$imagepath')") or die(mysqli_error($connection));
	if ($query) {
		file_put_contents('postImage/'.$imagename,$image64);
		echo json_encode(array('post_user'=>$id_user , 'content'=>$content , 'status'=>"success" ));

	}
}

?>