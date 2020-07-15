package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostSazmaniAndShenasnameTable extends TableConnection {

    public PostSazmaniAndShenasnameTable(){
        tableName = "PostSazmaniAndShenasname";
        createTableIfNotExist();
    }

    @Override
    protected boolean createTableIfNotExist(){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+ tableName + "(id int NOT NULL AUTO_INCREMENT,onvanpost TEXT,shomare INT," +
                    "shomareshenasname TEXT,shahrestansodor TEXT,ostansodor TEXT,PRIMARY KEY (id))");
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

    public boolean insertOne(String onvanpost,int shomare,String shomareshenasname,String shahrestansodor,String ostansodor){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+ tableName + "(onvanpost,shomare,shomareshenasname,shahrestansodor,ostansodor" +
                    ") VALUES ('" + onvanpost + "' , " + shomare + " , '" + shomareshenasname + "' , '" + shahrestansodor+"' , '"+ostansodor+"')");
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
            resultSet = statement.executeQuery("SELECT * FROM "+ tableName + " WHERE id = "+id);
            while (resultSet.next()){
                info.add(resultSet.getString("onvanpost"));
                info.add(String.valueOf(resultSet.getInt("shomare")));
                info.add(resultSet.getString("shomareshenasname"));
                info.add(resultSet.getString("shahrestansodor"));
                info.add(resultSet.getString("ostansodor"));
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
