package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonalInfoTable extends TableConnection{

    public PersonalInfoTable(){
        tableName = "personalinfo";
        createTableIfNotExist();
    }

    @Override
    protected boolean createTableIfNotExist(){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+tableName+ "(id int NOT NULL AUTO_INCREMENT," +
                    "firstname TEXT,lastname TEXT,fathername TEXT,shomaremeli TEXT,shomareMostakhdem TEXT,password TEXT,PRIMARY KEY (id))");
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }finally {
            try {
                statement.close();
                closeConnection();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
    public boolean insertOne(String firstName,String lastName,String fatherName,String shomareMeli
            ,String shomareMostakhdem , String password){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+ tableName + "(firstname,lastname,fathername,shomaremeli,shomareMostakhdem,password) " +
                    "VALUES ('"+firstName + "' , '" + lastName + "' , '" + fatherName + "' , '"+ shomareMeli + "' , '"+shomareMostakhdem+"' , '" + password + "')");
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }finally {
            try {
                statement.close();
                closeConnection();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public int loginVerify(String id ,String password){
        openConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<Integer> ids = new ArrayList<>();
        try{
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM "+tableName + " WHERE shomaremeli = '"+ id + "' AND password = '"+ password+"'");
            while(resultSet.next()){
                ids.add(resultSet.getInt("id"));
            }
            if(ids.size() == 0){
                return -1;
            }else{
                return ids.get(0);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }finally {
            try {
                resultSet.close();
                statement.close();
                closeConnection();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public String readPersonalInfo(int id){
        openConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        String firstName = null;String lastName = null;String fatherName = null;
        String shomareMeli = null;String shomareMostakhdem = null;
        try{
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM "+ tableName + " WHERE id = "+ id);
            while (resultSet.next()){
                firstName = resultSet.getString("firstname");
                lastName = resultSet.getString("lastname");
                fatherName = resultSet.getString("fathername");
                shomareMeli = resultSet.getString("shomaremeli");
                shomareMostakhdem = resultSet.getString("shomareMostakhdem");
            }
            if(firstName == null){
                return "not found";
            }
            return "اسم : "+ firstName + "نام خانوادگی : "+lastName + " اسم پدر : "+ fatherName + " شماره ملی : "+shomareMeli+ " شماره مستخدم : "+shomareMostakhdem;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return "not found";
        }finally {
            try {
                resultSet.close();
                statement.close();
                closeConnection();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public int getRecordCounts(){
        openConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT firstname FROM "+ tableName);
            int count = 0;
            while (resultSet.next()){
                count++;
            }
            return count;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }finally {
            try {
                resultSet.close();
                statement.close();
                closeConnection();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public List<String> read(int id){
        openConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<String> info = new ArrayList<>();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM "+tableName + " WHERE id = "+ id);
            while (resultSet.next()){
                info.add(resultSet.getString("firstname"));
                info.add(resultSet.getString("lastname"));
                info.add(resultSet.getString("fathername"));
                info.add(resultSet.getString("shomaremeli"));
                info.add(resultSet.getString("shomareMostakhdem"));
                info.add(resultSet.getString("password"));
            }
            return info;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }finally {
            try {
                resultSet.close();
                statement.close();
                closeConnection();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public boolean changePassword(int id,String newPassword){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("UPDATE " + tableName + " SET password = "+newPassword + " WHERE id = "+ id);
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }finally {
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
