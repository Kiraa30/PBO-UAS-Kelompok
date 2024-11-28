/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uaspbokelompok;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author iilha
 */
public class KoneksiDB {    
    private static Connection konek;

    // Metode untuk membuka koneksi ke database
    public static Connection konek() throws SQLException, ClassNotFoundException {
        if (konek == null || konek.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                konek = DriverManager.getConnection("jdbc:mysql://localhost:3306/tdlaundry", "root", ""); 
                System.out.println("Koneksi berhasil!");
            } catch (SQLException e) {
                System.err.println("ERROR: KONEKSI TIDAK BERHASIL " + e.getMessage());
                throw e;
            }
        }
        return konek;
    }
    
    // Metode untuk menutup koneksi jika sudah selesai
    public static void closeConnection() {
        if (konek != null) {
            try {
                konek.close();
                System.out.println("Koneksi ditutup.");
            } catch (SQLException e) {
                System.err.println("ERROR: Gagal menutup koneksi " + e.getMessage());
            }
        }
    }
}