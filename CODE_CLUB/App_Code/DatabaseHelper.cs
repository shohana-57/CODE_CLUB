using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public static class DatabaseHelper
{
    private static string ConnStr => ConfigurationManager.ConnectionStrings["CODECLUBDB"].ConnectionString;

    private static SqlConnection GetConnection()
    {
        var conn = new SqlConnection(ConnStr);
        conn.Open();
        return conn;
    }

   


    public static DataTable GetProjects(bool visibleOnly = true)
    {
        string sql = visibleOnly
            ? "SELECT * FROM Projects WHERE IsVisible=1 ORDER BY CreatedAt DESC"
            : "SELECT * FROM Projects ORDER BY CreatedAt DESC";
        using (var conn = GetConnection())
        using (var cmd = new SqlCommand(sql, conn))
        {
            var da = new SqlDataAdapter(cmd);
            var dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }


    public static bool AddProject(string title, string category,
                                  string description, string technologies,
                                  string url)
    {
        const string sql = @"INSERT INTO Projects (Title,Category,Description,Technologies,ProjectURL)
                             VALUES (@t,@c,@d,@tech,@url)";
        using (var conn = GetConnection())
        using (var cmd = new SqlCommand(sql, conn))
        {
            cmd.Parameters.AddWithValue("@t", title);
            cmd.Parameters.AddWithValue("@c", category ?? "");
            cmd.Parameters.AddWithValue("@d", description ?? "");
            cmd.Parameters.AddWithValue("@tech", technologies ?? "");
            cmd.Parameters.AddWithValue("@url", url ?? "");
            return cmd.ExecuteNonQuery() > 0;
        }
    }




    public static bool DeleteProject(int projectId)
    {
        const string sql = "DELETE FROM Projects WHERE ProjectID=@id";
        using (var conn = GetConnection())
        using (var cmd = new SqlCommand(sql, conn))
        {
            cmd.Parameters.AddWithValue("@id", projectId);
            return cmd.ExecuteNonQuery() > 0;
        }
    }



    public static DataTable GetEvents(bool visibleOnly = true)
    {
        string sql = visibleOnly
            ? "SELECT * FROM Events WHERE IsVisible=1 ORDER BY EventDate ASC"
            : "SELECT * FROM Events ORDER BY EventDate ASC";
        using (var conn = GetConnection())
        using (var cmd = new SqlCommand(sql, conn))
        {
            var da = new SqlDataAdapter(cmd);
            var dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }



    public static bool AddEvent(string title, string eventType,
                                string description, DateTime eventDate)
    {
        const string sql = @"INSERT INTO Events (Title,EventType,Description,EventDate)
                             VALUES (@t,@type,@d,@date)";
        using (var conn = GetConnection())
        using (var cmd = new SqlCommand(sql, conn))
        {
            cmd.Parameters.AddWithValue("@t", title);
            cmd.Parameters.AddWithValue("@type", eventType ?? "");
            cmd.Parameters.AddWithValue("@d", description ?? "");
            cmd.Parameters.AddWithValue("@date", eventDate);
            return cmd.ExecuteNonQuery() > 0;
        }
    }


    public static bool DeleteEvent(int eventId)
    {
        const string sql = "DELETE FROM Events WHERE EventID=@id";
        using (var conn = GetConnection())
        using (var cmd = new SqlCommand(sql, conn))
        {
            cmd.Parameters.AddWithValue("@id", eventId);
            return cmd.ExecuteNonQuery() > 0;
        }
    }


}