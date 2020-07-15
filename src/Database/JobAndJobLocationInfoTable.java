package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JobAndJobLocationInfoTable extends TableConnection {

    public JobAndJobLocationInfoTable(){
        tableName = "JobInfoTable";
        createTableIfNotExist();
    }

    @Override
    protected boolean createTableIfNotExist(){
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+ tableName + "(id int NOT NULL AUTO_INCREMENT ,raste TEXT,reshteshoghli TEXT," +
                    "tabageshoghl INT , rotbe TEXT,shahrestankhedmat TEXT,ostankhedmat TEXT,noeestekhdam TEXT,leveljob INT,PRIMARY KEY (id))");
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

    public boolean insertOne(String reste,String reshteshoghli,int tabageshoghl,
                             String rotbe,String shahrestankhedmat,String ostankhedmat,
                             String noeestekhdam,int leveljob){
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+ tableName + "(raste,reshteshoghli,tabageshoghl,rotbe," +
                    "shahrestankhedmat,ostankhedmat,noeestekhdam,leveljob) VALUES ('"+ reste + "' , '" + reshteshoghli + "' , " +
                    + tabageshoghl + " , '" + rotbe + "' , '"+ shahrestankhedmat + "' , '"+ostankhedmat+"' , '" +noeestekhdam +"',"+leveljob +")");
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
            resultSet = statement.executeQuery("SELECT * FROM "+ tableName + " WHERE id = "+ id);
            while (resultSet.next()){
                info.add(resultSet.getString("raste"));
                info.add(resultSet.getString("reshteshoghli"));
                info.add(String.valueOf(resultSet.getInt("tabageshoghl")));
                info.add(resultSet.getString("rotbe"));
                info.add(resultSet.getString("shahrestankhedmat"));
                info.add(resultSet.getString("ostankhedmat"));
                info.add(resultSet.getString("noeestekhdam"));
                info.add(String.valueOf(resultSet.getInt("leveljob")));
            }
            return info;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }finally {
            try {
                statement.close();
                resultSet.close();
                closeConnection();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
