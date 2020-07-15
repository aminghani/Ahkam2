package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BirthAndDegreeInfoTable extends TableConnection {

    public BirthAndDegreeInfoTable(){
        tableName = "birthanddegree";
        createTableIfNotExist();
    }
    @Override
    protected boolean createTableIfNotExist(){
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS " + tableName + " (id int NOT NULL AUTO_INCREMENT ,mahaletavalod  TEXT ,tarikhtavalod TEXT ," +
                    " madrak TEXT , reshte TEXT , PRIMARY KEY (id))");
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

    public boolean insertOne(String mahaleTavalod, String tarikhTavalod, String madrak,
            String reshte){
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+ tableName + "(mahaletavalod , tarikhtavalod ,madrak , reshte ) VALUES " +
                    " ('" + mahaleTavalod + "' , '" + tarikhTavalod + "' , '"+madrak + "' , '" + reshte +"')");
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }finally {
            try{
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
                info.add(resultSet.getString("tarikhtavalod"));
                info.add(resultSet.getString("mahaletavalod"));
                info.add(resultSet.getString("madrak"));
                info.add(resultSet.getString("reshte"));
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
