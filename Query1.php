<?php
include 'db_connection.php';
$conn = OpenCon();
if(isset($_POST["submit"]))
{  

if(!empty($_POST['cname'])) 
{  
    $cname=$_POST["cname"];
    $sql = "SELECT starting_lineup.GAMEID,p.PNAME,p.pno from player as p join team on p.TEAMID=team.TeamID join starting_lineup on p.pno=starting_lineup.PNo and team.TeamID=starting_lineup.TEAMId where team.Team='".$cname."' order by starting_lineup.GAMEID,p.pno";
    $result = mysqli_query($conn,$sql);
    if ($result->num_rows > 0) 
    {
        echo "<table border='.'0.01'.'><tr><th>GameID</th><th>Player Name</th><th>Player No</th></tr>";
        while($row = mysqli_fetch_array($result)) 
        {
        echo "<tr><td>".$row["GAMEID"]."</td><td>".$row["PNAME"]."</td><td>".$row["pno"]."</td></tr>";
    }
        echo "</table>";
    } 
    else 
    {
        echo "Invalid Country!";
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
<button type="submit" name="submit"/>Submit</button>
</form>
</body>
</html>