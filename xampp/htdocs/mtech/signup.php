 <?php
 if($_SERVER['REQUEST_METHOD'] == "POST"){


	
	$email = $_POST['email'];
	$password = $_POST['password'];//sha1 lock text
	$fullname = $_POST['fullname'];
	$connection = mysqli_connect("localhost", "root", "","mtech");

    $test = mysqli_query ($connection, "SELECT * FROM users WHERE email ='$email' ") or die(mysqli_error($connection));
    $usertest=( $test) ? mysqli_fetch_assoc( $test) : false;
	
	$rows= mysqli_num_rows($test);

	if ($rows > 0) {
		echo json_encode(array('status'=>"email found" , 'password'=>"dsdf"));
	}
	else{

	$query = mysqli_query ($connection, "INSERT INTO users(fullname,email,password) VALUES ('$fullname','$email','$password')") or die(mysqli_error($connection));
    
	
	

	if ($query) {
		
		echo json_encode(array('fullname'=>$fullname , 'email'=>$email , 'password'=>$password , 'status'=>"success" ));

	}
}
}



?>