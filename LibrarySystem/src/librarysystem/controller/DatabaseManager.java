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
    String username = "general";
    String password = "root";
    String usernameAdmin = "admin";
    String passwordAdmin = "admin";
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
                i++;
            }
            rs.close();
            conn.close();
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
                rowData[i][7] = rs.getObject(8);
                i++;
            }
            rs.close();
            conn.close();
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
                i++;
            }
            rs.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get customer method" + ex);
        }
        return rowData;
    }

    public Object[][] getStaff() {
        Object[][] rowData = null;
        try (Connection conn = DriverManager.getConnection(url, usernameAdmin, passwordAdmin); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call getStaff";
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
                i++;
            }
            rs.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get staff method" + ex);
        }
        return rowData;
    }

    public Object[][] getUser() {
        Object[][] rowData = null;
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call getUser";
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
                i++;
            }
            rs.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get customer method" + ex);
        }
        return rowData;
    }

    public String convertMemberToID(String fname, String lname) {
        String ID = "";
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call convertMemberToID('" + fname + "','" + lname + "');";
            ResultSet rs = s.executeQuery(query);
            int i = 0;
            while (rs.next()) {
                ID = rs.getString(1);
                i++;
            }
            rs.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get customer method" + ex);
        }
        return ID;
    }

    public String convertStaffToID(String fname, String lname) {
        String ID = "";
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call convertStaffToID('" + fname + "','" + lname + "');";
            ResultSet rs = s.executeQuery(query);
            int i = 0;
            while (rs.next()) {
                ID = rs.getString(1);
                i++;
            }
            rs.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get customer method" + ex);
        }
        return ID;
    }

    public String convertBookToID(String book) {
        String ID = "";
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            Class.forName(driver).newInstance();
            String query = "call convertBookToID('" + book + "');";
            ResultSet rs = s.executeQuery(query);
            int i = 0;
            while (rs.next()) {
                ID = rs.getString(1);
                i++;
            }
            rs.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            System.out.println("get book method" + ex);
        }
        return ID;
    }

    public int adminLogin(String adminUsername, String adminPassword) {
        try (Connection conn = DriverManager.getConnection(url, adminUsername, adminPassword)) {
            return 1;
        } catch (SQLException exp) {
            System.out.println(exp);
            return 0;
        }
    }

    public void signIn(String userUsername, String userPassword) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call signIn('" + userUsername + "','" + userPassword + "');";
            s.executeQuery(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }

    }

    public void signOut(String userUsername) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call signOut('" + userUsername + "');";
            s.executeQuery(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }

    }

    public void insertUser(String userUsername, String firstName, String lastName, String userPassword, int type) {
        try (Connection conn = DriverManager.getConnection(url, usernameAdmin, passwordAdmin); Statement s = conn.createStatement()) {
            String insertQuery = "call insertUser('" + userUsername + "', '" + firstName + "','" + lastName + "','" + userPassword + "','" + type + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void insertMember(String firstName, String lastName, String phone, String Address) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call insertCustomer('" + firstName + "','" + lastName + "','" + phone + "','" + Address + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            JOptionPane.showMessageDialog(null, exp + " Error");
        }
    }

    public void insertBook(String ISBN, String title, String author, String year, String edition, String category, String publisher, String copies) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call insertBook('" + ISBN + "', '" + title + "','" + author + "','" + year + "','" + edition + "','" + category + "','" + publisher + "','" + copies + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            JOptionPane.showMessageDialog(null, exp + " Error");
        }
    }

    public void insertBookReserve(String ref, String isbn, String customerId, String StaffId, String bookingDate) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call insertBookReserve('" + ref + "', '" + isbn + "','" + customerId + "','" + StaffId + "','" + bookingDate + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void updateMember(String id, String firstName, String lastName, String phone, String Address) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call updateCustomer('" + id + "', '" + firstName + "','" + lastName + "','" + phone + "','" + Address + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void updateBook(String ISBN, String title, String author, String year, String edition, String category, String publisher, String copies) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call updateBook('" + ISBN + "', '" + title + "','" + author + "','" + year + "','" + edition + "','" + category + "','" + publisher + "','" + copies + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void deleteBookReserve(String isbn) {
        try (Connection conn = DriverManager.getConnection(url, usernameAdmin, passwordAdmin); Statement s = conn.createStatement()) {
            String insertQuery = "call deleteBooking('" + isbn + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void deleteMember(String id) {
        try (Connection conn = DriverManager.getConnection(url, usernameAdmin, passwordAdmin); Statement s = conn.createStatement()) {
            String insertQuery = "call deleteMember('" + id + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void deleteBook(String isbn) {
        try (Connection conn = DriverManager.getConnection(url, usernameAdmin, passwordAdmin); Statement s = conn.createStatement()) {
            String insertQuery = "call deleteBook('" + isbn + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void returnBook(String ref, String returnDate) {
        try (Connection conn = DriverManager.getConnection(url, username, password); Statement s = conn.createStatement()) {
            String insertQuery = "call returnBook('" + ref + "', '" + returnDate + "');";
            s.execute(insertQuery);
            conn.close();
        } catch (SQLException exp) {
            System.out.println(exp);
        }
    }

    public void backup() {
        try {
            String executeCmd = ".\\src\\database\\mysqldump.exe"
                    + " -u admin -padmin librarydb  -r " + location;
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
                "--user=root", "--password=''", "librarydb",
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
