package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class HogogVaFogoladeHaTable extends TableConnection{

    public HogogVaFogoladeHaTable(){
        tableName = "hogogvafogolade";
        createTableIfNotExist();
    }

    protected boolean createTableIfNotExist(){
        openConnection();
        Statement statement =null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+ tableName + "(id int NOT NULL AUTO_INCREMENT ," +
                    "emtiazhageshoghl INT , emtiazfogolademodoriat INT , emtiazhageshaghel INT , emtiaztafavottatbig INT ," +
                    "emtiazmanategkamtartoseeyafte INT ,emtiazbadiabohava INT ,emtiazisargari INT ,emtiazneshanhayedolati INT ," +
                    "emtiazkhedmatdarmanategjangzade INT , emtiazsakhtisharayetkar INT , emtiazayelemandi INT ," +
                    "emtiazhazineolad INT , emtiazfogoladeshoghl INT,zarib INT, PRIMARY KEY (id))");
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

    public boolean insertOne(int emtiazhageshoghl,int emtiazfogolademodoriat ,int emtiazhageshaghel ,int emtiaztafavottatbig,
                             int emtiazmanategkamtartoseeyafte,int emtiazbadiabohava,int emtiazisargari , int emtiazneshanhayedolati
                            , int emtiazkhedmatdarmanategjangzade,int emtiazsakhtisharayetkar , int emtiazayelemandi,
                             int emtiazhazineolad , int emtiazfogoladeshoghl ){
        openConnection();
        Statement statement = null;
        try{
            statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO "+ tableName +"(emtiazhageshoghl,emtiazfogolademodoriat,emtiazhageshaghel," +
                    "emtiaztafavottatbig,emtiazmanategkamtartoseeyafte,emtiazbadiabohava,emtiazisargari,emtiazneshanhayedolati," +
                    "emtiazkhedmatdarmanategjangzade,emtiazsakhtisharayetkar,emtiazayelemandi,emtiazhazineolad,emtiazfogoladeshoghl) " +
                    "VALUES (" + emtiazhageshoghl + " , "+ emtiazfogolademodoriat + " , "+ emtiazhageshaghel + " , "+
                    emtiaztafavottatbig + " , "+ emtiazmanategkamtartoseeyafte + " , "+emtiazbadiabohava + " , "+emtiazisargari+" , "+
                    emtiazneshanhayedolati+ " , "+emtiazkhedmatdarmanategjangzade + " , "+emtiazsakhtisharayetkar + " , "+
                    emtiazayelemandi + " , "+ emtiazhazineolad + " , "+ emtiazfogoladeshoghl+")");
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

    public List<Integer> read(int id){
        openConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<Integer> info = new ArrayList<>();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM "+tableName + " WHERE id = "+id);
            while (resultSet.next()){
                info.add(resultSet.getInt("emtiazhageshoghl"));
                info.add(resultSet.getInt("emtiazfogolademodoriat"));
                info.add(resultSet.getInt("emtiazhageshaghel"));
                info.add(resultSet.getInt("emtiaztafavottatbig"));
                info.add(resultSet.getInt("emtiazmanategkamtartoseeyafte"));
                info.add(resultSet.getInt("emtiazbadiabohava"));
                info.add(resultSet.getInt("emtiazisargari"));
                info.add(resultSet.getInt("emtiazneshanhayedolati"));
                info.add(resultSet.getInt("emtiazkhedmatdarmanategjangzade"));
                info.add(resultSet.getInt("emtiazsakhtisharayetkar"));
                info.add(resultSet.getInt("emtiazayelemandi"));
                info.add(resultSet.getInt("emtiazhazineolad"));
                info.add(resultSet.getInt("emtiazfogoladeshoghl"));
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
