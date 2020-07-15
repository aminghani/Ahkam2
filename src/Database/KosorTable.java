package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class KosorTable extends TableConnection {

    public KosorTable(){
        tableName = "Kosor";
        createTableIfNotExist();
    }
    @Override
    protected boolean createTableIfNotExist() {
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("CREATE TABLE IF NOT EXISTS "+ tableName + "(id int NOT NULL AUTO_INCREMENT" +
                    " ,maliat DOUBLE ,bimetaminejtemai DOUBLE , ozviatsandogtavon DOUBLE ,bimetakmili DOUBLE, PRIMARY KEY (id))");
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

    public boolean updatemaliat(double newAmount){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("UPDATE "+ tableName + " SET maliat = "+newAmount);
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

    public boolean updatebimetaminejtemai(double newAmount){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("UPDATE "+ tableName + " SET bimetaminejtemai = "+newAmount);
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

    public boolean updateozviatsandogtavon(double newAmount){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("UPDATE "+ tableName + " SET ozviatsandogtavon = "+newAmount);
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

    public boolean updatebimetakmili(double newAmount){
        openConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("UPDATE "+ tableName + " SET bimetakmili = "+newAmount);
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

    public List<Double> read(){
        openConnection();
        List<Double> info = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM "+ tableName + " WHERE id = 1");
            while (resultSet.next()){
                info.add(resultSet.getDouble("maliat"));
                info.add(resultSet.getDouble("bimetaminejtemai"));
                info.add(resultSet.getDouble("ozviatsandogtavon"));
                info.add(resultSet.getDouble("bimetakmili"));
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
