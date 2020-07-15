package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class IsargariAndMarriageInfoTable extends TableConnection {

    public IsargariAndMarriageInfoTable(){
        tableName = "isargariAndMarriage";
        createTableIfNotExist();
    }

    @Override
    protected boolean createTableIfNotExist(){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+ tableName + "(id int NOT NULL AUTO_INCREMENT,vaziatisargari TEXT," +
                    "vaziattaahol BIT, tedadfarzand INT,PRIMARY KEY (id))");
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

    public boolean insertOne(String vaziatisargari, boolean vaziattaahol, int tedadfarzand){
        if(vaziattaahol == false && tedadfarzand > 0){
            return false;
        }
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+tableName + "(vaziatisargari,vaziattaahol,tedadfarzand) VALUES " +
                    "('" + vaziatisargari + "' , "+ vaziattaahol + " , "+ tedadfarzand+")");
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
            resultSet = statement.executeQuery("SELECT * FROM " + tableName + " WHERE id = "+ id);
            while (resultSet.next()){
                info.add(resultSet.getString("vaziatisargari"));
                info.add(String.valueOf(resultSet.getBoolean("vaziattaahol")));
                info.add(String.valueOf(resultSet.getInt("tedadfarzand")));
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
