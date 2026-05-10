using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public static class DatabaseHelper
{
    private static string ConnStr => ConfigurationManager.ConnectionStrings["CODE_CLUBDB"].ConnectionString;

    private static SqlConnection GetConnection()
    {
        var conn = new SqlConnection(ConnStr);
        conn.Open();
        return conn;
    }


}