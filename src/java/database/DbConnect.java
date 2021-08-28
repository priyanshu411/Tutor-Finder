package database;

import java.sql.*;

public class DbConnect
{

    private Connection con;
    private Statement st;
    private ResultSet rs;
    private String connectionUrl = "jdbc:sqlserver://LAPTOP-HCD08HR8;databaseName=Tutor-finder;IntegratedSecurity=true";

    //get connection
    public Connection openConnection()
    {

        try
        {
            con = DriverManager.getConnection(connectionUrl);
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        return (con);
    }

    // execute insert,update,delete Query
    public boolean executeMyQuery(String query)
    {
        try
        {
            con = openConnection();
            if (con != null)
            {
                st = con.createStatement();
                int no = st.executeUpdate(query);
                if (no > 0)
                {
                    st.close();
                    con.close();
                    return (true);

                }
                else
                {
                    st.close();
                    con.close();
                    return (false);
                }
            }
            return false;

        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
            return false;
        }
    }

    //search data (select Query)
    public boolean searchData(String query)
    {
        try
        {
            con = openConnection();
            if (con != null)
            {
                st = con.createStatement();
                rs = st.executeQuery(query);
                if (rs.next())
                {
                    st.close();
                    con.close();
                    return (true);

                }
                else
                {
                    st.close();
                    con.close();
                    return (false);
                }
            }
            return false;

        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
            return false;
        }
    }

    //for get data(select query)
    public ResultSet getData(Connection con, String query)
    {
        try
        {
            if (con != null)
            {
                st = con.createStatement();
                rs = st.executeQuery(query);
            }
            return (rs);

        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
            return (rs);
        }
    }

}
