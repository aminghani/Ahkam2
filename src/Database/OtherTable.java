package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OtherTable extends TableConnection {

    public OtherTable(){
        tableName = "other";
        createTableIfNotExist();
    }

    @Override
    protected boolean createTableIfNotExist(){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+tableName + "(id int NOT NULL AUTO_INCREMENT," +
                    "savabegkhedmat TEXT,vahedsazmani TEXT,noehokm TEXT,PRIMARY KEY (id))");
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

    public boolean insertOne(String savabegkhedmat,String vahedsazmani,String noehokm){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+ tableName + "(savabegkhedmat,vahedsazmani,noehokm) " +
                    "VALUES ('"+savabegkhedmat + "' , '" + vahedsazmani + "' , '" + noehokm + "')");
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

    public List<String> read(int id){
        openConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<String> info = new ArrayList<>();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM "+tableName+" WHERE id = "+id);
            while (resultSet.next()){
                info.add(resultSet.getString("savabegkhedmat"));
                info.add(resultSet.getString("vahedsazmani"));
                info.add(resultSet.getString("noehokm"));
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
}
