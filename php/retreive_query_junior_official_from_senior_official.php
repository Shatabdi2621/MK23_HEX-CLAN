<?php
class Info
{
    public function connect()
    {
        $DB_SERVER = "";
        $DB_NAME = "senior_official";
        $USERNAME = "";
        $PASSWORD = "";
        $con=new mysqli($DB_SERVER,$USERNAME,$PASSWORD,$DB_NAME);
        if($con->connect_error)
        {
            return null;
        }else
        {
            return $con;
        }
    }
    public function select()
    {
        $con=$this->connect();
        if($con != null)
        {
            $json = file_get_contents('php://input');
    $obj = json_decode($json,true);
    $userid = $obj['userid'];
           
            $SQL_SELECT_ALL = "SELECT * FROM queries WHERE junior_official_user_id = '$userid'";
            $result=$con->query($SQL_SELECT_ALL);
            if(isset($result->num_rows) && $result->num_rows >0)
            {
                $info=array();
                while($row=$result->fetch_array())
                {
                    array_push($info, array("id"=>$row['id'],"heading"=>$row['heading'],"short"=>$row['short'],"question"=>$row['question'],
                    "body"=>$row['body'],"sector"=>$row['sector'],"answer"=>$row['answer'],"timestamp"=>$row['timestamp']
                    ));
                }
                print(json_encode(array_reverse($info)));
            }else
            {
                print(json_encode(array("PHP EXCEPTION : CAN'T RETRIEVE FROM MYSQL. ")));
            }
            $con->close();

        }else{
            print(json_encode(array("PHP EXCEPTION : CAN'T CONNECT TO MYSQL. NULL CONNECTION.")));
        }
    }
}
$info=new Info();
$info->select();
?>