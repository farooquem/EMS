using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using EmployeeManagementSystem.Model;

namespace EmployeeManagementSystem
{
    public class EmployeeManagementContext
    {
        private readonly string _connectionString;
        public EmployeeManagementContext()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["EmployeeManagement"].ConnectionString;
        }

        public User Login(string username, string password)
        {
            var ds = new DataSet();
           var query = "select Username,EmployeeId, Password from [User] where username='" + username + "' and password='" + password + "'";
           var con = new SqlConnection(_connectionString);
         var adp = new SqlDataAdapter(query, con);
           con.Open();
           adp.Fill(ds);
           var user= new User();
           con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                user.Username = Convert.ToString(ds.Tables[0].Rows[0]["Username"]);
                user.EmployeeId = Convert.ToInt32(ds.Tables[0].Rows[0]["EmployeeId"]);
            }
            return user;
        }

        public DataTable GetAllEmployee()
        {
            var ds = new DataSet();
            const string query = "select e.Id,EmployeeId, CONCAT(FirstName,' ',MiddleName,' ',LastName) as Name,d.Name as Department," +
                                 "Job_Title,ContactNumber,Email,Address,DateOfBirth,DateOfJoining,DateOfLeaving,Gender from" +
                                 " Employee e left join Department d on e.DepartmentId = d.Id";
            var con = new SqlConnection(_connectionString);
            var adp = new SqlDataAdapter(query, con);
            con.Open();
            adp.Fill(ds);
            con.Close();
            return ds.Tables[0];
        }

        public DataTable GetActiveDepartment()
        {
            var ds = new DataSet();
            const string query = "SELECT ID,Name FROM Department where IsActive=1";
            var con = new SqlConnection(_connectionString);
            var adp = new SqlDataAdapter(query, con);
            con.Open();
            adp.Fill(ds);
            con.Close();
            return ds.Tables[0];

        }

        public DataTable GetAllDepartment()
        {
            var ds = new DataSet();
            const string query = "SELECT ID,Name,IsActive FROM Department";
            var con = new SqlConnection(_connectionString);
            var adp = new SqlDataAdapter(query, con);
            con.Open();
            adp.Fill(ds);
            con.Close();
            return ds.Tables[0];

        }

        public static DataTable GetGenderList()
        {
            var dt = new DataTable();
            dt.Columns.Add("Id", typeof(string));
            dt.Columns.Add("Name", typeof(string));
            dt.Rows.Add("M", "Male");
            dt.Rows.Add("F", "Female");
            dt.Rows.Add("U", "Universal");
            return dt;
        }

        public void AddEmployee(DataTable dt)
        {
            var con = new SqlConnection(_connectionString);
            var adp = new SqlDataAdapter("select * from Employee", con);
            var ds = new DataSet();
            adp.Fill(ds, "Student");

            ds.Tables[0].Rows.Add(dt.Rows[0]);
            ds.Tables[0].AcceptChanges();
        }

        public void UpdateEmployee(DataTable dt)
        {
            var con = new SqlConnection(_connectionString);
            var adp = new SqlDataAdapter("select * from Employee", con);
            var ds = new DataSet();
            adp.Fill(ds, "Student");

            ds.Tables[0].Rows.Add(dt.Rows[0]);
            ds.Tables[0].AcceptChanges();
        }
    }
}