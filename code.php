<?php
session_start();
include('classes/DBConnection.php');

if(isset($_POST['register_btn']))
{
    $firstname = $_POST['firstname'];
    $middlename = $_POST['middlename'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Creating an instance of the DBConnection class
    $db = new DBConnection();
    $conn = $db->conn;


    //Email Exists or Not
    $check_email_query = "SELECT email FROM traveler_list WHERE email='$email' LIMIT 1";
    $check_email_query_run = mysqli_query($conn);

   if(mysqli_num_rows($check_email_query_run) > 0)
   {
        $_SESSION['status'] = "Email ID already exists";
        header("Location: register.php");
   }
   else
   {
    
   }
}





?>
