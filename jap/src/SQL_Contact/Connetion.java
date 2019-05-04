package SQL_Contact;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connetion {

	public Connection conn;
	
	public Connetion(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String jdbcDriver = "jdbc:sqlserver://ms1201.gabiadb.com:1433;DatabaseName=jghdb";
			String dbUser = "jgh9514";
			String dbPass = "jgh15963@@";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	 	} catch(Exception e){
	 		e.printStackTrace();
	 	}
	}
}
