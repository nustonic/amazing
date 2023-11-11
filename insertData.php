<?php
	header("Access-Control-Allow-Origin: *");
    error_reporting(0);
    error_reporting(E_ERROR | E_PARSE);
    header("content-type:text/javascript;charset=utf-8");
    $link = mysqli_connect('localhost', 'root', '', "AmazingFood");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$Name = $_GET['Name'];
		$User = $_GET['User'];
		$Password = $_GET['Password'];
		$ChooseType = $_GET['ChooseType'];
		
							
		$sql = "INSERT INTO `usertb`(`id`, `Name`, `User`, `Password`, `ChooseType`) VALUES (Null,'$Name','$User','$Password','$ChooseType')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master Must";
   
}
	mysqli_close($link);
?>