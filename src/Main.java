import com.opencsv.CSVReader;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;

public class Main {
    public static void main(String[] args) {

        insertAttractions();

    }


    private static void insertAttractions() {

        String url = "jdbc:mysql://localhost:3306/travel_db?serverTimezone=UTC";
        String username = "root";
        String password = "mysql1234";
        try (
                Connection conn = DriverManager.getConnection(url, username, password);
                InputStream is = Main.class.getResourceAsStream("/travel.csv");
                CSVReader reader = new CSVReader(new InputStreamReader(is));
        ) {
            String insertSql = "INSERT INTO attractions(no,district,title,description,address,phone) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertSql);

            String[] row;
            reader.readNext(); // 헤더 스킵
            while ((row = reader.readNext()) != null) {
                pstmt.setInt(1, Integer.parseInt(row[0]));
                pstmt.setString(2, row[1]);
                pstmt.setString(3, row[2]);
                pstmt.setString(4, row[3]);
                pstmt.setString(5, row[4]);
                pstmt.setString(6, row[5]);

                pstmt.executeUpdate();

            }

            System.out.println("CSV 데이터를 DB에 성공적으로 삽입했습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
