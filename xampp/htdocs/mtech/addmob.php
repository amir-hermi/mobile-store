 <?php



	$connection = mysqli_connect("localhost", "root", "","mtech");

    $query = mysqli_query ($connection, "SELECT * FROM users ") or die(mysqli_error($connection));
    
    if ($query->num_rows > 0) {
    	while($row = $query->fetch_assoc()):
    	 echo json_encode($row);
        endwhile;
}
	
	




?>