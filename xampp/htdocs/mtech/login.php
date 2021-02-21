 <?php

if($_SERVER['REQUEST_METHOD'] == "POST"){
	$email = $_POST['email'];
	$password = $_POST['password'];//sha1 lock text
	$connection = mysqli_connect("localhost", "root", "","mtech");
	$query = mysqli_query ($connection, " SELECT * FROM users WHERE email ='$email' AND password = '$password'") or die(mysqli_error($connection));
    $user=( $query) ? mysqli_fetch_assoc( $query) : false;
	
	$rows= mysqli_num_rows($query);

	if ($rows > 0) {
		$id = $user['id'];
		$fullname = $user['fullname'];
		$email = $user['email'];
		$password =$user['password'];
		echo json_encode(array('id'=>$id ,'fullname'=>$fullname , 'email'=>$email , 'password'=>$password , 'status'=>"success" ));

	}else{
		echo json_encode(array('status'=>"fail" , 'password'=>"dsdf"));
	}


}

?>
