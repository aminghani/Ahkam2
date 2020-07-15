package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FeedbackTable extends TableConnection {

    public FeedbackTable(){
        tableName = "feedback";
        createTableIfNotExist();
    }
    @Override
    protected boolean createTableIfNotExist() {
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+tableName + " (id int NOT NULL AUTO_INCREMENT," +
                    "from_id INT , feedback TEXT,PRIMARY KEY (id))");
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

    public boolean insertFeedBack(int id,String body){
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+tableName+"(from_id,feedback) VALUES ("+id+",'"+ body+"')");
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

    public List<String> readBody(){
        openConnection();
        List<String> info = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT feedback from "+tableName);
            while (resultSet.next()){
                info.add(resultSet.getString("feedback"));
            }
            return info;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }finally {
            try {
                resultSet.close();
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public List<Integer> readids(){
        openConnection();
        List<Integer> info = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT from_id from "+tableName);
            while (resultSet.next()){
                info.add(resultSet.getInt("from_id"));
            }
            return info;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }finally {
            try {
                resultSet.close();
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
