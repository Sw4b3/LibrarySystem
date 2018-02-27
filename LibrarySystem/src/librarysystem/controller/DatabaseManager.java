/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarysystem.controller;

import java.awt.HeadlessException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Andrew
 */
public class DatabaseManager {

    String url = "jdbc:mysql://localhost:3306/LibraryDB";
    String username = "root";
    String password = "root";
    String driver = "com.mysql.jdbc.Driver";
    String location = ".\\src\\database\\libSys_bk.sql";

    public Object[][] getBooking() {
        Object[][] rowData = null;
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call getBooking";
            ResultSet rs = s.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
            }
            rs = s.executeQuery(query);
            rowData = new Object[rowCount][columnCount];
            int i = 0;
            while (rs.next()) {
                rowData[i][0] = rs.getObject(1);
                rowData[i][1] = rs.getObject(2);
                rowData[i][2] = rs.getObject(3);
                rowData[i][3] = rs.getObject(4);
                rowData[i][4] = rs.getObject(5);
                rowData[i][5] = rs.getObject(6);
                rowData[i][6] = rs.getObject(7);

                i++;
            }
            rs.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get booking method" + ex);
        }

        return rowData;
    }

    public Object[][] getBooks() {
        Object[][] rowData = null;
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call getBook";
            ResultSet rs = s.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
            }
            rs = s.executeQuery(query);
            rowData = new Object[rowCount][columnCount];
            int i = 0;
            while (rs.next()) {
                rowData[i][0] = rs.getObject(1);
                rowData[i][1] = rs.getObject(2);
                rowData[i][2] = rs.getObject(3);
                rowData[i][3] = rs.getObject(4);
                rowData[i][4] = rs.getObject(5);
                rowData[i][5] = rs.getObject(6);
                rowData[i][6] = rs.getObject(7);
                i++;
            }
            rs.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get book method" + ex);
        }
        return rowData;
    }

    public Object[][] getCustomer() {
        Object[][] rowData = null;
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call getCustomer";
            ResultSet rs = s.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
            }
            rs = s.executeQuery(query);
            rowData = new Object[rowCount][columnCount];
            int i = 0;
            while (rs.next()) {
                rowData[i][0] = rs.getObject(1);
                rowData[i][1] = rs.getObject(2);
                rowData[i][2] = rs.getObject(3);
                rowData[i][3] = rs.getObject(4);
                rowData[i][4] = rs.getObject(5);
                rowData[i][5] = rs.getObject(6);
                i++;
            }
            rs.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get customer method" + ex);
        }
        return rowData;
    }

    public void insertCustomer(String title, String firstName, String lastName, String phone, String Address) {
       try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call insertCustomer('" + title + "', '"+ firstName + "','"+ lastName + "','"+ phone + "','"+ Address + "');";
            s.execute(insertQuery);
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }
    
        public void insertBook(String ISBN, String title, String author, String year, String edition,String category,String publisher,String copies) {
       try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call insertBook('" + ISBN + "', '"+ title + "','"+ author + "','"+ year + "','"+ edition + "','"+ category + "','"+ publisher + "','"+ copies + "');";
            s.execute(insertQuery);
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }


    public void backup() {
        try {
            String executeCmd = ".\\src\\database\\mysqldump.exe"
                    + " -u " + username + " -p" + password + " resturantdb  -r " + location;
            Process runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();
            if (processComplete == 0) {
                JOptionPane.showMessageDialog(null, "Backup Complete");
            } else {
                JOptionPane.showMessageDialog(null, "Backup Failed");
            }

        } catch (IOException | InterruptedException ex) {
            JOptionPane.showMessageDialog(null, "Error at Backuprestore" + ex.getMessage());
        }
    }

    public void restore() {
        try {
            String[] executeCmd = new String[]{".\\src\\database\\mysql.exe",
                "--user=" + username, "--password=" + password, "resturantdb",
                "-e", "source " + location};

            Process runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();

            if (processComplete == 0) {
                JOptionPane.showMessageDialog(null, "Database Successfully Restored");
            } else {
                JOptionPane.showMessageDialog(null, "Restore Failed");
            }

        } catch (IOException | InterruptedException | HeadlessException ex) {
            JOptionPane.showMessageDialog(null, "Error at Restoredbfromsql" + ex.getMessage());
        }
    }
}
