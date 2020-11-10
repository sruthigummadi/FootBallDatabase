<?php
include 'db_connection.php';
$conn = OpenCon();
if(isset($_POST["submit"]))
{  

if(!empty($_POST['cname']) && !empty($_POST['card'])) 
{  
    $cname=$_POST["cname"];
    $card=$_POST["card"];
	$sql = "SELECT cards.GAMEID,p.PNAME,cards.COLOR from player as p join team on p.TEAMID=team.TeamID join cards on p.pno=cards.PNO and team.TeamID=cards.TEAMID where team.Team='".$cname."' and cards.COLOR='".$card."'";
	$result = mysqli_query($conn,$sql);
	if ($result->num_rows > 0) 
	{
		echo "<table border='.'0.01'.'><tr><th>GameID</th><th>PlayerName</th><th>PlayerNo</th></tr>";
    	while($row = mysqli_fetch_array($result)) 
    	{
        echo "<tr><td style='width:50px;border:1px solid black;'>".$row["GAMEID"]."</td><td style='width:200px;border:1px solid black;'>".$row["PNAME"]."</td><td style='width:50px;border:1px solid black;'>".$row["COLOR"]."</td></tr>";
    }
    	echo "</table>";
    } 
    else 
    {
    	echo "Invalid Country or Color!";
    }  
}  
} 
CloseCon($conn);
?>

<!DOCTYPE html>
<body>
<form name = "myForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method = "post"> 
<br>
<br>
<br>
</br>
</br>
</br>        
<input type="text" placeholder="Enter the Country Name" name="cname">
<input type="text" placeholder="Enter the Card Color" name="card">
<button type="submit" name="submit"/>Submit</button>
</form>
</body>
</html>