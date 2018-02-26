/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarysystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Andrew
 */
public class DatabaseManager {

    String url = "jdbc:mysql://localhost:3306/LibraryDB";
    String username = "root";
    String password = "root";
    String driver = "com.mysql.jdbc.Driver";

    public void dbConnection() {
        try {
            Class.forName(driver).newInstance();
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement s = conn.createStatement();
            String query = "SELECT * FROM bookreserve ";
            ResultSet rs = s.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            DefaultTableModel tableModelReserve = new DefaultTableModel();
            //     tbl.setModel(tableModelReserve);

            for (int i = 1; i <= columnCount; i++) {
                tableModelReserve.addColumn(metaData.getColumnLabel(i));
            }
            Object[] row = new Object[columnCount];

            while (rs.next()) {
                for (int i = 0; i < columnCount; i++) {
                    row[i] = rs.getObject(i + 1);
                }
                tableModelReserve.addRow(row);
            }

            rs.close();
            s.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException exc) {
        }
        
        try {
            Class.forName(driver).newInstance();
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement s = conn.createStatement();
            String query = "SELECT * FROM Book";
            ResultSet rs = s.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            DefaultTableModel tableModel = new DefaultTableModel();
            //     tblbooks.setModel(tableModel);

            int columnCount = metaData.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {

                tableModel.addColumn(metaData.getColumnLabel(i));
            }

            Object[] row = new Object[columnCount];

            while (rs.next()) {
                for (int i = 0; i < columnCount; i++) {
                    row[i] = rs.getObject(i + 1);
                }
                tableModel.addRow(row);
            }
            rs.close();
            s.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException exc) {
        }

        try {
            Class.forName(driver).newInstance();
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement s = conn.createStatement();
            String query = "SELECT * FROM student";
            ResultSet rs = s.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            DefaultTableModel tableModelStudents = new DefaultTableModel();
            //    tblStudent.setModel(tableModelStudents);

            for (int i = 1; i <= columnCount; i++) {

                tableModelStudents.addColumn(metaData.getColumnLabel(i));
            }
            Object[] row = new Object[columnCount];

            while (rs.next()) {
                for (int i = 0; i < columnCount; i++) {
                    row[i] = rs.getObject(i + 1);
                }
                tableModelStudents.addRow(row);
            }
            rs.close();
            s.close();
            conn.close();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException exc) {
        }
    }

//    public static void searchBook() {
//        try {
//            Class.forName(driver).newInstance();
//            Connection conn = DriverManager.getConnection(url, username, password);
//            Statement s = conn.createStatement();
//            String query = "SELECT * FROM book WHERE (Author  ='" + searchBox.getText() + "' OR Title ='" + searchBox.getText() + "');";
//            ResultSet rs = s.executeQuery(query);
//            ResultSetMetaData metaData = rs.getMetaData();
//            DefaultTableModel tableModelSearch = new DefaultTableModel();
//       //     tblSearch.setModel(tableModelSearch);
//            int columnCount = metaData.getColumnCount();
//            for (int i = 1; i <= columnCount; i++) {
//
//                tableModelSearch.addColumn(metaData.getColumnLabel(i));
//            }
//
//            Object[] row = new Object[columnCount];
//
//            while (rs.next()) {
//                for (int i = 0; i < columnCount; i++) {
//                    row[i] = rs.getObject(i + 1);
//                }
//                tableModelSearch.addRow(row);
//            }
//            rs.close();
//            s.close();
//            conn.close();
//        } catch (Exception exc) {
//            exc.printStackTrace();
//            System.out.println("Not found");
//        }
//    }
//
//    public static void searchStudent() {
//        try {
//            Class.forName(driver).newInstance();
//            Connection conn = DriverManager.getConnection(url, username, password);
//            Statement s = conn.createStatement();
//        //    String query = "SELECT * FROM student WHERE (FirstName='" + searchBox.getText()
//     //               + "'OR LastName='" + searchBox.getText()
//     //               + "' OR StudentNumber ='" + searchBox.getText() + "');";
//     //       ResultSet rs = s.executeQuery(query);
//            ResultSetMetaData metaData = rs.getMetaData();
//            DefaultTableModel tableModelSearch = new DefaultTableModel();
//         //   tblSearch.setModel(tableModelSearch);
//
//            int columnCount = metaData.getColumnCount();
//            for (int i = 1; i <= columnCount; i++) {
//
//                tableModelSearch.addColumn(metaData.getColumnLabel(i));
//            }
//
//            Object[] row = new Object[columnCount];
//
//            while (rs.next()) {
//                for (int i = 0; i < columnCount; i++) {
//                    row[i] = rs.getObject(i + 1);
//                }
//                tableModelSearch.addRow(row);
//            }
//            rs.close();
//            s.close();
//            conn.close();
//        } catch (Exception exc) {
//            exc.printStackTrace();
//        }
//    }
//
//    public static void searchBooking() {
//        try {
//            Class.forName(driver).newInstance();
//            Connection conn = DriverManager.getConnection(url, username, password);
//            Statement s = conn.createStatement();
//            String query = "SELECT * FROM bookreserve WHERE (Ref='" + searchBox.getText()
//                    + "'OR StudentFirstName='" + 
//                    + "' OR StudnetLastName ='" + searchBox.getText() + "');";
//            ResultSet rs = s.executeQuery(query);
//            ResultSetMetaData metaData = rs.getMetaData();
//            DefaultTableModel tableModelSearch = new DefaultTableModel();
//   //         tblSearch.setModel(tableModelSearch);
//
//            int columnCount = metaData.getColumnCount();
//            for (int i = 1; i <= columnCount; i++) {
//
//                tableModelSearch.addColumn(metaData.getColumnLabel(i));
//            }
//
//            Object[] row = new Object[columnCount];
//
//            while (rs.next()) {
//                for (int i = 0; i < columnCount; i++) {
//                    row[i] = rs.getObject(i + 1);
//                }
//                tableModelSearch.addRow(row);
//            }
//       //     rs.close();
//            s.close();
//            conn.close();
//        } catch (Exception exc) {
//            exc.printStackTrace();
//        }
//    }
//    
//     public static void insertStudnet() {
//        try {
//            Connection conn = DriverManager.getConnection(url, username, password);
//            Statement s = conn.createStatement();
////            String insertQuery = "INSERT INTO student (StudentNumber, Title, FirstName, LastName, Phone, Address) "
////                    + "VALUES ('" + noBox.getText() + "', '"
////                    + titleBox.getText() + "', '"
////                    + fnameBox.getText() + "', '"
////                    + lnameBox.getText() + "', '"
////                    + phoneBox.getText() + "', '"
////                    + addressBox.getText() + "')";
//
//           // String checkQuery = "SELECT * FROM student WHERE (StudentNumber='" + noBox.getText() + "');";
//        //    s.execute(checkQuery);
//            ResultSet rs = s.getResultSet();
//            boolean recordExists = rs.next();
//
//            if (recordExists) {
//                JOptionPane.showMessageDialog(null, "Student already exists");
//            } else {
//
//            }
//            dbConnection();
//            s.close();
//            conn.close();
//        } catch (SQLException exp) {
//            System.out.println("Error");
//            exp.printStackTrace();
//        }
    // }
}
