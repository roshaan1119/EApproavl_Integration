using EApproval.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
//using Oracle.ManagedDataAccess.Client;
//using System.Data.OracleClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using Oracle.ManagedDataAccess.Client;
using OracleConnection = Oracle.ManagedDataAccess.Client.OracleConnection;
using OracleDataAdapter = Oracle.ManagedDataAccess.Client.OracleDataAdapter;
using OracleCommand = Oracle.ManagedDataAccess.Client.OracleCommand;
using System.Web.Services;
using System.Net.Http;
using System.Reflection;
using System.Net;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using CrystalDecisions.CrystalReports.Engine;

namespace EApproval.Utility
{
    public class OracaleManager
    {
        [Obsolete]
        private OracleConnection oracleConnection;
        private OleDbConnection Connection;

        [Obsolete]
        public OracaleManager()
        {
            oracleConnection = new OracleConnection();
            oracleConnection.ConnectionString = ConfigurationManager.ConnectionStrings["E_APPROVAL"].ConnectionString;
        }

        [Obsolete]
        public async Task<Object> PostRole(UserRoleModel roleMode)
        {
            try
            {
                string @sql = "sp_Users_Role";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLENAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = roleMode.ROLENAME });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int64, Direction = ParameterDirection.Input, Value = 1 }); //To insert Roles
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                int Return = oracleCommand.ExecuteNonQuery();
                return await Task.FromResult(new { Success = true, Response = "Role Saved" });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> getRoleList()
        {
            try
            {
                string @sql = "sp_Users_Role";
                OracleCommand oracleCommand = new OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLENAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 2 }); // To Fetch Data
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                adapter.SelectCommand = oracleCommand;
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> getUsersList()
        {
            try
            {
                string @sql = "SP_USERS_MASTER";
                OracleCommand oracleCommand = new OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 2 }); // To Fetch Data
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_LOGIN_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_EMAIL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PASSOWRD", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                adapter.SelectCommand = oracleCommand;
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetApprovingAuthorities()
        {
            try
            {
                string @sql = "SP_USERS_MASTER";
                OracleCommand oracleCommand = new OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 4 }); // Get Authroties list
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_LOGIN_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_EMAIL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PASSOWRD", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                adapter.SelectCommand = oracleCommand;
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> LoadUserPermissions(int UserId, int ProjectId = 0)
        {
            try
            {
                string @sql = "SP_USERS_MASTER";
                OracleCommand oracleCommand = new OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 5 }); // Get User Permission
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_LOGIN_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_EMAIL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PASSOWRD", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = ProjectId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = UserId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                adapter.SelectCommand = oracleCommand;
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    HttpContext.Current.Session["dtObjects"] = dt;
                }
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> PostUserRecord(UserModel model)
        {
            try
            {
                string @sql = "SP_USERS_MASTER";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 1 }); // To Insert User Record
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.ROLEID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.NAME });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_LOGIN_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.LOGIN_NAME });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_EMAIL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.EMAIL });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PASSOWRD", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.PASSOWRD });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.PROJECTID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.USERTYPEID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.FLOWDETAILID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (String.IsNullOrEmpty(dt.Rows[0]["ExistingEmail"].ToString()))
                {
                    return await Task.FromResult(new { Success = true, Response = "User added successfully." });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "User already exists against this email id." });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [WebMethod(EnableSession = true)]
        [Obsolete]
        public async Task<Object> Login(UserModel model)
        {
            try
            {
                if (Convert.ToInt32(model.PROJECTID) == -1)
                {
                    model.PROJECTID = 0;
                }
                string @sql = "SP_USERS_MASTER";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 3 }); // To Get Data FROM Email and Password
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_LOGIN_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_EMAIL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.EMAIL });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PASSOWRD", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.PASSOWRD });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.PROJECTID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    var Session_Name = HttpContext.Current.Session["NAME"] = dt.Rows[0]["NAME"].ToString();
                    var Session_Email = HttpContext.Current.Session["EMAIL"] = dt.Rows[0]["EMAIL"].ToString();
                    var Session_LoginName = HttpContext.Current.Session["LOGIN_NAME"] = dt.Rows[0]["LOGIN_NAME"].ToString();
                    var Session_ROLENAME = HttpContext.Current.Session["ROLENAME"] = dt.Rows[0]["ROLENAME"].ToString();
                    var Session_USERROLEID = HttpContext.Current.Session["USERROLEID"] = Convert.ToInt32(dt.Rows[0]["USERROLEID"]);
                    var Session_USERID = HttpContext.Current.Session["USERID"] = Convert.ToInt32(dt.Rows[0]["USERID"]);
                    
                    if (Convert.ToInt32(Session_USERID) != 41) // Other than admins
                    {
                        var Session_USERTYPEID = HttpContext.Current.Session["USERTYPEID"] = Convert.ToInt32(dt.Rows[0]["USERTYPEID"]);
                        var Session_PROJECTID = HttpContext.Current.Session["PROJECTID"] = Convert.ToInt32(model.PROJECTID);
                    }
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = new { Session_Name, Session_Email, Session_LoginName, Session_ROLENAME, Session_USERROLEID, Session_USERID } });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "Invalid Credentials.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public async Task<Object> AddNewProject(ProjectModel model)
        {
            try
            {
                string @sql = "SP_PROJECT";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 1 }); // To Insert PROJECTS
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.NAME });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWNAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.FLOWNAME });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ProjectId", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTFLOWID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (String.IsNullOrEmpty(dt.Rows[0]["ExistingProject"].ToString()))
                {
                    return await Task.FromResult(new { Success = true, Response = "Project added successfully." });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "Failed to save project." });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public async Task<Object> GetProjectList()
        {
            try
            {
                string @sql = "SP_PROJECT";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 2 }); // LIST OF PROJECTS
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWNAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ProjectId", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTFLOWID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetProjectForDropDown()
        {
            try
            {
                string @sql = "SP_BIND_DROPDOWN";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 2 }); // LIST OF PROJECTS
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetProjectFlowSecreenByProjectId(int ProjectId)
        {
            try
            {
                string @sql = "SP_BIND_DROPDOWN";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 3 }); // Flow Secreen By ProjectId
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = ProjectId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetProjectDetail()
        {
            try
            {
                string @sql = "SP_PROJECT";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 4 }); // LIST FOR PROJECTS DETAILS PAGE
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWNAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ProjectId", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTFLOWID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetProjectDetailById(int ProjectId, int ProjectFlowId)
        {
            try
            {
                string @sql = "SP_PROJECT";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 3 }); // LIST OF PROJECTS BY PROJECT ID
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWNAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = ProjectId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTFLOWID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = ProjectFlowId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> AddProjectFlowDetail(ProjectFlowDetailModel model)
        {
            try
            {
                string @sql = "SP_PROJECT_FLOWDETAIL";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 1 }); //To Insert PROJECT FLOW DTL
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.NAME });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_P_FLOWID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.P_FLOWID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTLIMIT", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.PROJECTLIMIT });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.APPROVALID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (String.IsNullOrEmpty(dt.Rows[0]["ExistingProjectFlow"].ToString()))
                {
                    return await Task.FromResult(new { Success = true, Response = "Record added successfully." });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "Failed to save project detail." });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> UpdateProjectFlowDetail(ProjectFlowDetailModel model)
        {
            try
            {
                string @sql = "SP_PROJECT_FLOWDETAIL";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 2 }); //To UPDATE PROJECT FLOW DTL
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.NAME });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_P_FLOWID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.FLOWDETAILID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.APPROVALID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record added successfully." });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "Failed to save project detail." });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetRolesForProjectApprovalProcess()
        {
            try
            {
                string @sql = "SP_PROJECT_FLOWDETAIL";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 3 }); //FETCH LIST OF ROLES FOR PROJECT APPROVAL PROCESS REGISTRATION
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_P_FLOWID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> loadSubProjectByProjectName(string ProjectName)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/GetADMProject";
                    var result = client.DownloadString(URL);
                    JObject parsed = JObject.Parse(result);
                    var Items = parsed["CSubTypes"];
                    if (parsed.Root.HasValues)
                    {
                        dt.Columns.Add("PROJECT_CODE", typeof(int));
                        dt.Columns.Add("PROJECT_NAME", typeof(string));
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["PROJECT_CODE"], list["PROJECT_NAME"]);
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> LoadContentByProjectId(string from_Date, string to_Date, int project, int Mode, int status = 0)
        {
            try
            {
                DataTable dt = new DataTable();
                DataTable dtStatus = new DataTable();
                DataTable dtLimit = new DataTable();
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims";
                    if (Mode == 41) // WIMS-ADMIN => Requests
                    {
                        var ReqNos = string.Empty;
                        URL += "/adm/GetTakeInRequest?from_date=" + from_Date + "&to_date=" + to_Date + "&project=" + project;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("Req_No", typeof(string));
                            dt.Columns.Add("Req_Date", typeof(string));
                            dt.Columns.Add("LOIM", typeof(string));
                            dt.Columns.Add("TYPE", typeof(string));
                            dt.Columns.Add("INREQ_ORDER", typeof(string));
                            dt.Columns.Add("Status", typeof(string));
                            dt.Columns.Add("Item", typeof(decimal));
                            dt.Columns.Add("Req_Qty", typeof(decimal));
                            dt.Columns.Add("Rem_Qty", typeof(decimal));
                            dt.Columns.Add("ApprovalStatus", typeof(string));
                            dt.Columns.Add("StatusId", typeof(int));
                            dtStatus = GetStatus();
                            if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) // Initiator 1,2
                            {
                                foreach (var list in Items)
                                {
                                    dt.Rows.Add(list["INREQ_NO"], list["INREQ_DATE"], list["INREQ_LOIM"], list["INREQ_TYPE"], list["INREQ_ORDER"], list["INREQ_STATUS"], list["ITEM"], list["INREQ_REQ_QTY"], list["INREQ_REM_QTY"], "PENDING", "0");
                                }
                                if (dtStatus.Rows.Count > 0)
                                {
                                    foreach (DataRow rows in dt.Rows)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (rows["Req_No"].ToString() == dr["REQNO"].ToString())
                                            {
                                                rows["ApprovalStatus"] = dr["STATUS"].ToString();
                                                rows["StatusId"] = Convert.ToInt32(dr["STATUSID"]);
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1)
                                {
                                    status = 0;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["Req_No"], r["Req_Date"], r["LOIM"], r["TYPE"], r["INREQ_ORDER"], r["Status"], r["Item"], r["Req_Qty"], r["Rem_Qty"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 2 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 3) // Authorizer-1,2
                            {
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if ((ItemsArray[i]["INREQ_NO"].ToString() == dr["REQNO"].ToString()))
                                            {
                                                dt.Rows.Add(ItemsArray[i]["INREQ_NO"], ItemsArray[i]["INREQ_DATE"], ItemsArray[i]["INREQ_LOIM"], ItemsArray[i]["INREQ_TYPE"], ItemsArray[i]["INREQ_ORDER"], ItemsArray[i]["INREQ_STATUS"], ItemsArray[i]["ITEM"], ItemsArray[i]["INREQ_REQ_QTY"], ItemsArray[i]["INREQ_REM_QTY"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1 || status == 0)
                                {
                                    status = 1; //Default for HOD
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["Req_No"], r["Req_Date"], r["LOIM"], r["TYPE"], r["INREQ_ORDER"], r["Status"], r["Item"], r["Req_Qty"], r["Rem_Qty"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                        }
                    }
                    else if (Mode == 43) // WIMS-ADMIN => POs
                    {
                        URL += "/adm/GetPoRequest?from_date=" + from_Date + "&to_date=" + to_Date + "&project=" + project;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("PO_WS", typeof(string));
                            dt.Columns.Add("PO_NO", typeof(string));
                            dt.Columns.Add("Date", typeof(string));
                            dt.Columns.Add("Item", typeof(int));
                            dt.Columns.Add("Qty", typeof(int));
                            dt.Columns.Add("Amount", typeof(decimal));

                            dt.Columns.Add("PO_LOIM", typeof(string));
                            dt.Columns.Add("PO_TYPE", typeof(string));
                            dt.Columns.Add("PO_SUPPLIER", typeof(int));
                            dt.Columns.Add("SUPP_NAME", typeof(string));
                            dt.Columns.Add("PO_RUSER", typeof(string));
                            dt.Columns.Add("PO_RNAME", typeof(string));
                            dt.Columns.Add("ApprovalStatus", typeof(string));
                            dt.Columns.Add("StatusId", typeof(int));
                            dtStatus = GetStatus();
                            dtLimit = HttpContext.Current.Session["dtObjects"] as DataTable;
                            if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) //Initiator-1,2
                            {
                                foreach (var list in Items)
                                {
                                    dt.Rows.Add(list["PO_WS"], list["PO_NO"], list["PO_DATE"], list["PO_ITEM"], list["PO_IN_QTY"], list["PO_AMOUNT"], list["PO_LOIM"], list["PO_TYPE"], list["PO_SUPPLIER"], list["SUPP_NAME"], list["PO_RUSER"], list["PO_RNAME"], "PENDING", "0");
                                }
                                if (dtStatus.Rows.Count > 0)
                                {
                                    foreach (DataRow rows in dt.Rows)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (rows["PO_NO"].ToString() == dr["REQNO"].ToString())
                                            {
                                                rows["ApprovalStatus"] = dr["STATUS"].ToString();
                                                rows["StatusId"] = Convert.ToInt32(dr["STATUSID"]);
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1)
                                {
                                    status = 0;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PO_WS"], r["PO_NO"], r["Date"], r["Item"], r["Qty"], r["Amount"], r["PO_LOIM"], r["PO_TYPE"], r["PO_SUPPLIER"], r["SUPP_NAME"], r["PO_RUSER"], r["PO_RNAME"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 2 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 3) // Authorizer-1,2
                            {
                                decimal limit = 0.00m;
                                DataRow[] LimitRow = dtLimit.Select("FLOWDETAILID=" + Mode);
                                if (LimitRow.Length != 0)
                                {
                                    limit = Convert.ToDecimal(LimitRow[0].ItemArray[6]);
                                }
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if ((ItemsArray[i]["PO_NO"].ToString() == dr["REQNO"].ToString()) && (Convert.ToDecimal(ItemsArray[i]["PO_AMOUNT"]) < limit))
                                            {
                                                if (Convert.ToInt32(dr["STATUSID"]) == 1)
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PO_WS"], ItemsArray[i]["PO_NO"], ItemsArray[i]["PO_DATE"], ItemsArray[i]["PO_ITEM"], ItemsArray[i]["PO_IN_QTY"], ItemsArray[i]["PO_AMOUNT"], ItemsArray[i]["PO_LOIM"], ItemsArray[i]["PO_TYPE"], ItemsArray[i]["PO_SUPPLIER"], ItemsArray[i]["SUPP_NAME"], ItemsArray[i]["PO_RUSER"], ItemsArray[i]["PO_RNAME"], "PENDING", Convert.ToInt32(dr["STATUSID"]));
                                                }
                                                else
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PO_WS"], ItemsArray[i]["PO_NO"], ItemsArray[i]["PO_DATE"], ItemsArray[i]["PO_ITEM"], ItemsArray[i]["PO_IN_QTY"], ItemsArray[i]["PO_AMOUNT"], ItemsArray[i]["PO_LOIM"], ItemsArray[i]["PO_TYPE"], ItemsArray[i]["PO_SUPPLIER"], ItemsArray[i]["SUPP_NAME"], ItemsArray[i]["PO_RUSER"], ItemsArray[i]["PO_RNAME"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                                }
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1 || status == 0)
                                {
                                    status = 1; //Default for HOD
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PO_WS"], r["PO_NO"], r["Date"], r["Item"], r["Qty"], r["Amount"], r["PO_LOIM"], r["PO_TYPE"], r["PO_SUPPLIER"], r["SUPP_NAME"], r["PO_RUSER"], r["PO_RNAME"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 1 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 22) // Approver-1,2
                            {
                                decimal limit = 0.00m;
                                DataRow[] LimitRow = dtLimit.Select("FLOWDETAILID=" + Mode);
                                if (LimitRow.Length != 0)
                                {
                                    limit = Convert.ToDecimal(LimitRow[0].ItemArray[6]);
                                }
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if ((ItemsArray[i]["PO_NO"].ToString() == dr["REQNO"].ToString()))
                                            {
                                                if (Convert.ToInt32(dr["STATUSID"]) == 1)
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PO_WS"], ItemsArray[i]["PO_NO"], ItemsArray[i]["PO_DATE"], ItemsArray[i]["PO_ITEM"], ItemsArray[i]["PO_IN_QTY"], ItemsArray[i]["PO_AMOUNT"], ItemsArray[i]["PO_LOIM"], ItemsArray[i]["PO_TYPE"], ItemsArray[i]["PO_SUPPLIER"], ItemsArray[i]["SUPP_NAME"], ItemsArray[i]["PO_RUSER"], ItemsArray[i]["PO_RNAME"], "PENDING", Convert.ToInt32(dr["STATUSID"]));
                                                }
                                                else
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PO_WS"], ItemsArray[i]["PO_NO"], ItemsArray[i]["PO_DATE"], ItemsArray[i]["PO_ITEM"], ItemsArray[i]["PO_IN_QTY"], ItemsArray[i]["PO_AMOUNT"], ItemsArray[i]["PO_LOIM"], ItemsArray[i]["PO_TYPE"], ItemsArray[i]["PO_SUPPLIER"], ItemsArray[i]["SUPP_NAME"], ItemsArray[i]["PO_RUSER"], ItemsArray[i]["PO_RNAME"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                                }
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1 || status == 0)
                                {
                                    status = 1; //Default for Authorizers
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PO_WS"], r["PO_NO"], r["Date"], r["Item"], r["Qty"], r["Amount"], r["PO_LOIM"], r["PO_TYPE"], r["PO_SUPPLIER"], r["SUPP_NAME"], r["PO_RUSER"], r["PO_RNAME"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                        }
                    }
                    else if (Mode == 44) // WIMS-ADMIN => GRN
                    {
                        URL += "/adm/GetGRN?from_date=" + from_Date + "&to_date=" + to_Date + "&project=" + project;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("GRN_WS", typeof(string));
                            dt.Columns.Add("GRN_NO", typeof(string));
                            dt.Columns.Add("Date", typeof(string));
                            dt.Columns.Add("GRN_LOIM", typeof(string));
                            dt.Columns.Add("GRN_TYPE", typeof(string));
                            dt.Columns.Add("GRN_ORDER", typeof(string));
                            dt.Columns.Add("Item", typeof(int));
                            dt.Columns.Add("Qty", typeof(int));
                            dt.Columns.Add("ApprovalStatus", typeof(string));
                            dt.Columns.Add("StatusId", typeof(int));

                            dtStatus = GetStatus();
                            if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) //Initiator-1,2
                            {
                                foreach (var list in Items)
                                {
                                    dt.Rows.Add(list["GRN_WS"], list["GRN_NO"], list["GRN_DATE"], list["GRN_LOIM"], list["GRN_TYPE"], list["GRN_ORDER"], list["ITEM"], list["GRN_IN_QTY"], "PENDING", "0");
                                }
                                if (dtStatus.Rows.Count > 0)
                                {
                                    foreach (DataRow rows in dt.Rows)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (rows["GRN_NO"].ToString() == dr["REQNO"].ToString())
                                            {
                                                rows["ApprovalStatus"] = dr["STATUS"].ToString();
                                                rows["StatusId"] = Convert.ToInt32(dr["STATUSID"]);
                                            }
                                        }
                                    }
                                }
                                if (status == -1)
                                {
                                    status = 0;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["GRN_WS"], r["GRN_NO"], r["Date"], r["GRN_LOIM"], r["GRN_TYPE"], r["GRN_ORDER"], r["Item"], r["Qty"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 2 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 3) //Authorizer-1,2
                            {
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (ItemsArray[i]["GRN_NO"].ToString() == dr["REQNO"].ToString())
                                            {
                                                dt.Rows.Add(ItemsArray[i]["GRN_WS"], ItemsArray[i]["GRN_NO"], ItemsArray[i]["GRN_DATE"], ItemsArray[i]["GRN_LOIM"], ItemsArray[i]["GRN_TYPE"], ItemsArray[i]["GRN_ORDER"], ItemsArray[i]["ITEM"], ItemsArray[i]["GRN_IN_QTY"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                            }
                                        }
                                    }
                                }
                                if (status == -1 || status == 0)
                                {
                                    status = 1;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["GRN_WS"], r["GRN_NO"], r["Date"], r["GRN_LOIM"], r["GRN_TYPE"], r["GRN_ORDER"], r["Item"], r["Qty"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                        }
                    }
                    else if (Mode == 45) // WIMS-ADMIN => TakeIn
                    {
                        URL += "/adm/GetTakeIn?from_date=" + from_Date + "&to_date=" + to_Date + "&project=" + project;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("INPUT_WS", typeof(string));
                            dt.Columns.Add("Req_No", typeof(string));
                            dt.Columns.Add("Date", typeof(string));
                            dt.Columns.Add("Item", typeof(int));
                            dt.Columns.Add("Qty", typeof(int));

                            dt.Columns.Add("INPUT_LOIM", typeof(string));
                            dt.Columns.Add("INPUT_TYPE", typeof(string));
                            dt.Columns.Add("INPUT_SUPPLIER", typeof(int));
                            dt.Columns.Add("INPUT_PLACE", typeof(string));
                            dt.Columns.Add("INPUT_ORDER", typeof(string));
                            dt.Columns.Add("INPUT_USD", typeof(string));
                            dt.Columns.Add("INPUT_INVOICE", typeof(string));
                            dt.Columns.Add("INPUT_PK_AMOUNT", typeof(int));
                            dt.Columns.Add("INPUT_REM_QTY", typeof(int));
                            dt.Columns.Add("INPUT_REM_AMOUNT", typeof(int));
                            dt.Columns.Add("INPUT_SUPPLIER1", typeof(int));
                            dt.Columns.Add("ApprovalStatus", typeof(string));
                            dt.Columns.Add("StatusId", typeof(int));

                            dtStatus = GetStatus();
                            if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) //Initiator-1,2
                            {
                                foreach (var list in Items)
                                {
                                    dt.Rows.Add(list["INPUT_WS"], list["INPUT_NO"], list["INPUT_DATE"], list["INPUT_ITEM"], list["INPUT_IN_QTY"], list["INPUT_LOIM"], list["INPUT_TYPE"], list["INPUT_SUPPLIER"], list["INPUT_PLACE"],
                                                list["INPUT_ORDER"], list["INPUT_USD"], list["INPUT_INVOICE"], list["INPUT_PK_AMOUNT"], list["INPUT_REM_QTY"], list["INPUT_REM_AMOUNT"], list["INPUT_SUPPLIER1"], "PENDING", "0");
                                }
                                if (dtStatus.Rows.Count > 0)
                                {
                                    foreach (DataRow rows in dt.Rows)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (rows["Req_No"].ToString() == dr["REQNO"].ToString())
                                            {
                                                rows["ApprovalStatus"] = dr["STATUS"].ToString();
                                                rows["StatusId"] = Convert.ToInt32(dr["STATUSID"]);
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1)
                                {
                                    status = 0;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["INPUT_WS"], r["Req_No"], r["Date"], r["Item"], r["Qty"], r["INPUT_LOIM"], r["INPUT_TYPE"], r["INPUT_SUPPLIER"], r["INPUT_PLACE"], r["INPUT_ORDER"], r["INPUT_USD"], r["INPUT_INVOICE"],
                                                r["INPUT_PK_AMOUNT"], r["INPUT_REM_QTY"], r["INPUT_REM_AMOUNT"], r["INPUT_SUPPLIER1"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 2 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 3) //Authorizer-1,2
                            {
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (ItemsArray[i]["INPUT_NO"].ToString() == dr["REQNO"].ToString())
                                            {
                                                dt.Rows.Add(ItemsArray[i]["INPUT_WS"], ItemsArray[i]["INPUT_NO"], ItemsArray[i]["INPUT_DATE"], ItemsArray[i]["INPUT_ITEM"], ItemsArray[i]["INPUT_IN_QTY"], ItemsArray[i]["INPUT_LOIM"], ItemsArray[i]["INPUT_TYPE"], ItemsArray[i]["INPUT_SUPPLIER"], ItemsArray[i]["INPUT_PLACE"],
                                                            ItemsArray[i]["INPUT_ORDER"], ItemsArray[i]["INPUT_USD"], ItemsArray[i]["INPUT_INVOICE"], ItemsArray[i]["INPUT_PK_AMOUNT"], ItemsArray[i]["INPUT_REM_QTY"], ItemsArray[i]["INPUT_REM_AMOUNT"], ItemsArray[i]["INPUT_SUPPLIER1"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1 || status == 0)
                                {
                                    status = 1;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["INPUT_WS"], r["Req_No"], r["Date"], r["Item"], r["Qty"], r["INPUT_LOIM"], r["INPUT_TYPE"], r["INPUT_SUPPLIER"], r["INPUT_PLACE"], r["INPUT_ORDER"], r["INPUT_USD"], r["INPUT_INVOICE"],
                                                r["INPUT_PK_AMOUNT"], r["INPUT_REM_QTY"], r["INPUT_REM_AMOUNT"], r["INPUT_SUPPLIER1"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                        }
                    }
                    else if (Mode == 46) // WIMS-ADMIN => Payment Vouchers (PV)
                    {
                        URL += "/adm/GetPV?from_date=" + from_Date + "&to_date=" + to_Date + "&project=" + project;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("PV_WS", typeof(string));
                            dt.Columns.Add("Payment_Voucher", typeof(string));
                            dt.Columns.Add("Date", typeof(string));
                            dt.Columns.Add("Type", typeof(string));
                            dt.Columns.Add("Amount", typeof(decimal));
                            dt.Columns.Add("Status", typeof(string));

                            dt.Columns.Add("PV_SYSCODE", typeof(string));
                            dt.Columns.Add("PV_LOIM", typeof(string));
                            dt.Columns.Add("PV_SUPPLIER", typeof(string));
                            dt.Columns.Add("SUPP_NAME", typeof(string));

                            dt.Columns.Add("PV_ORDER", typeof(string));
                            dt.Columns.Add("PV_ITEM", typeof(string));
                            dt.Columns.Add("PV_RUSER", typeof(string));
                            dt.Columns.Add("PV_RNAME", typeof(string));
                            dt.Columns.Add("PV_DEP", typeof(string));

                            dt.Columns.Add("PV_CREATE_DESIG", typeof(string));
                            dt.Columns.Add("PV_CAN_STATUS", typeof(string));
                            dt.Columns.Add("PV_SUPPLIER1", typeof(string));
                            dt.Columns.Add("ApprovalStatus", typeof(string));
                            dt.Columns.Add("StatusId", typeof(int));
                            dtLimit = HttpContext.Current.Session["dtObjects"] as DataTable;
                            dtStatus = GetStatus();
                            if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) //Initiator-1,2
                            {
                                foreach (var list in Items)
                                {
                                    dt.Rows.Add(list["PV_WS"], list["PV_NO"], list["PV_DATE"], list["PV_TYPE"], list["PV_AMOUNT"], list["PV_PSTATUS"],
                                         list["PV_SYSCODE"], list["PV_LOIM"], list["PV_SUPPLIER"], list["SUPP_NAME"],
                                        list["PV_ORDER"], list["PV_ITEM"], list["PV_RUSER"], list["PV_RNAME"], list["PV_DEP"],
                                        list["PV_CREATE_DESIG"], list["PV_CAN_STATUS"], list["PV_SUPPLIER1"], "PENDING", "0"
                                        );
                                }
                                if (dtStatus.Rows.Count > 0)
                                {
                                    foreach (DataRow rows in dt.Rows)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (rows["Payment_Voucher"].ToString() == dr["REQNO"].ToString())
                                            {
                                                rows["ApprovalStatus"] = dr["STATUS"].ToString();
                                                rows["StatusId"] = Convert.ToInt32(dr["STATUSID"]);
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1 || status == 0)
                                {
                                    status = 0;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PV_WS"], r["Payment_Voucher"], r["Date"], r["Type"], r["Amount"], r["Status"],
                                                r["PV_SYSCODE"], r["PV_LOIM"], r["PV_SUPPLIER"], r["SUPP_NAME"],
                                                r["PV_ORDER"], r["PV_ITEM"], r["PV_RUSER"], r["PV_RNAME"], r["PV_DEP"],
                                                r["PV_CREATE_DESIG"], r["PV_CAN_STATUS"], r["PV_SUPPLIER1"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 2 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 3) // Authorizer-1,2
                            {
                                decimal limit = 0.00m;
                                DataRow[] LimitRow = dtLimit.Select("FLOWDETAILID=" + Mode);
                                if (LimitRow.Length != 0)
                                {
                                    limit = Convert.ToDecimal(LimitRow[0].ItemArray[6]);
                                }
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if ((ItemsArray[i]["PV_NO"].ToString() == dr["REQNO"].ToString()) && (Convert.ToDecimal(ItemsArray[i]["PV_AMOUNT"]) < limit))
                                            {
                                                if (Convert.ToInt32(dr["STATUSID"]) == 1)
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PV_WS"], ItemsArray[i]["PV_NO"], ItemsArray[i]["PV_DATE"], ItemsArray[i]["PV_TYPE"], ItemsArray[i]["PV_AMOUNT"], ItemsArray[i]["PV_PSTATUS"], ItemsArray[i]["PV_SYSCODE"], ItemsArray[i]["PV_LOIM"], ItemsArray[i]["PV_SUPPLIER"], ItemsArray[i]["SUPP_NAME"],
                                                            ItemsArray[i]["PV_ORDER"], ItemsArray[i]["PV_ITEM"], ItemsArray[i]["PV_RUSER"], ItemsArray[i]["PV_RNAME"], ItemsArray[i]["PV_DEP"],
                                                            ItemsArray[i]["PV_CREATE_DESIG"], ItemsArray[i]["PV_CAN_STATUS"], ItemsArray[i]["PV_SUPPLIER1"], "PENDING", Convert.ToInt32(dr["STATUSID"]));
                                                }
                                                else
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PV_WS"], ItemsArray[i]["PV_NO"], ItemsArray[i]["PV_DATE"], ItemsArray[i]["PV_TYPE"], ItemsArray[i]["PV_AMOUNT"], ItemsArray[i]["PV_PSTATUS"], ItemsArray[i]["PV_SYSCODE"], ItemsArray[i]["PV_LOIM"], ItemsArray[i]["PV_SUPPLIER"], ItemsArray[i]["SUPP_NAME"],
                                                            ItemsArray[i]["PV_ORDER"], ItemsArray[i]["PV_ITEM"], ItemsArray[i]["PV_RUSER"], ItemsArray[i]["PV_RNAME"], ItemsArray[i]["PV_DEP"],
                                                            ItemsArray[i]["PV_CREATE_DESIG"], ItemsArray[i]["PV_CAN_STATUS"], ItemsArray[i]["PV_SUPPLIER1"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                                }
                                            }
                                        }
                                    }
                                }
                                if (status == -1 || status == 0)
                                {
                                    status = 1;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PV_WS"], r["Payment_Voucher"], r["Date"], r["Type"], r["Amount"], r["Status"],
                                                r["PV_SYSCODE"], r["PV_LOIM"], r["PV_SUPPLIER"], r["SUPP_NAME"],
                                                r["PV_ORDER"], r["PV_ITEM"], r["PV_RUSER"], r["PV_RNAME"], r["PV_DEP"],
                                                r["PV_CREATE_DESIG"], r["PV_CAN_STATUS"], r["PV_SUPPLIER1"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 1 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 22) // Approver-1,2
                            {
                                decimal limit = 0.00m;
                                DataRow[] LimitRow = dtLimit.Select("FLOWDETAILID=" + Mode);
                                if (LimitRow.Length != 0)
                                {
                                    limit = Convert.ToDecimal(LimitRow[0].ItemArray[6]);
                                }
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if ((ItemsArray[i]["PV_NO"].ToString() == dr["REQNO"].ToString()))
                                            {
                                                if (Convert.ToInt32(dr["STATUSID"]) == 1)
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PV_WS"], ItemsArray[i]["PV_NO"], ItemsArray[i]["PV_DATE"], ItemsArray[i]["PV_TYPE"], ItemsArray[i]["PV_AMOUNT"], ItemsArray[i]["PV_PSTATUS"], ItemsArray[i]["PV_SYSCODE"], ItemsArray[i]["PV_LOIM"], ItemsArray[i]["PV_SUPPLIER"], ItemsArray[i]["SUPP_NAME"],
                                                            ItemsArray[i]["PV_ORDER"], ItemsArray[i]["PV_ITEM"], ItemsArray[i]["PV_RUSER"], ItemsArray[i]["PV_RNAME"], ItemsArray[i]["PV_DEP"],
                                                            ItemsArray[i]["PV_CREATE_DESIG"], ItemsArray[i]["PV_CAN_STATUS"], ItemsArray[i]["PV_SUPPLIER1"], "PENDING", Convert.ToInt32(dr["STATUSID"]));
                                                }
                                                else
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PV_WS"], ItemsArray[i]["PV_NO"], ItemsArray[i]["PV_DATE"], ItemsArray[i]["PV_TYPE"], ItemsArray[i]["PV_AMOUNT"], ItemsArray[i]["PV_PSTATUS"], ItemsArray[i]["PV_SYSCODE"], ItemsArray[i]["PV_LOIM"], ItemsArray[i]["PV_SUPPLIER"], ItemsArray[i]["SUPP_NAME"],
                                                            ItemsArray[i]["PV_ORDER"], ItemsArray[i]["PV_ITEM"], ItemsArray[i]["PV_RUSER"], ItemsArray[i]["PV_RNAME"], ItemsArray[i]["PV_DEP"],
                                                            ItemsArray[i]["PV_CREATE_DESIG"], ItemsArray[i]["PV_CAN_STATUS"], ItemsArray[i]["PV_SUPPLIER1"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                                }
                                            }
                                        }
                                    }
                                }
                                if (status == -1 || status == 0)
                                {
                                    status = 1;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PV_WS"], r["Payment_Voucher"], r["Date"], r["Type"], r["Amount"], r["Status"],
                                                r["PV_SYSCODE"], r["PV_LOIM"], r["PV_SUPPLIER"], r["SUPP_NAME"],
                                                r["PV_ORDER"], r["PV_ITEM"], r["PV_RUSER"], r["PV_RNAME"], r["PV_DEP"],
                                                r["PV_CREATE_DESIG"], r["PV_CAN_STATUS"], r["PV_SUPPLIER1"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                        }
                    }
                    else if (Mode == 121) // ECS => Payment Approval
                    {
                        URL = string.Empty;      
                        URL = "https://ecsapi.daewoo.net.pk/api/ecs/v1/getPAFList";
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("PaymentApprovalId", typeof(long));
                            dt.Columns.Add("RefNo", typeof(string));
                            dt.Columns.Add("GLCode", typeof(string));
                            dt.Columns.Add("CompanyName", typeof(string));
                            dt.Columns.Add("Department", typeof(string));
                            dt.Columns.Add("TypeName", typeof(string));
                            dt.Columns.Add("Amount", typeof(decimal));

                            dt.Columns.Add("Description", typeof(string));
                            dt.Columns.Add("AddedBy", typeof(string));
                            dt.Columns.Add("CreatedDate", typeof(string));

                            dt.Columns.Add("ApprovalStatus", typeof(string));
                            dt.Columns.Add("StatusId", typeof(int));

                            dtLimit = HttpContext.Current.Session["dtObjects"] as DataTable;
                            dtStatus = GetStatus();
                            if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) //Initiator-1,2
                            {
                                foreach (var list in Items)
                                {
                                    dt.Rows.Add(list["PaymentApprovalId"], list["RefNo"], list["GLCode"], list["CompanyName"], list["DEPARTMENT"], list["TypeName"], list["Amount"], list["Description"], list["AddedBy"],
                                                list["CreatedDate"], "PENDING", "0"
                                        );
                                }
                                if (dtStatus.Rows.Count > 0)
                                {
                                    foreach (DataRow rows in dt.Rows)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (rows["RefNo"].ToString() == dr["REQNO"].ToString())
                                            {
                                                rows["ApprovalStatus"] = dr["STATUS"].ToString();
                                                rows["StatusId"] = Convert.ToInt32(dr["STATUSID"]);
                                            }
                                        }
                                    }
                                }
                                //Fetch DT for selected Status
                                if (status == -1 || status == 0)
                                {
                                    status = 0;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PaymentApprovalId"], r["RefNo"], r["GLCode"], r["CompanyName"], r["DEPARTMENT"], r["TypeName"], r["Amount"], r["Description"], r["AddedBy"],
                                                r["CreatedDate"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 2 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 3) // Authorizer-1,2
                            {
                                //decimal limit = 0.00m;
                                //DataRow[] LimitRow = dtLimit.Select("FLOWDETAILID=" + Mode);
                                //if (LimitRow.Length != 0)
                                //{
                                //    limit = Convert.ToDecimal(LimitRow[0].ItemArray[6]);
                                //}
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (ItemsArray[i]["RefNo"].ToString() == dr["REQNO"].ToString())
                                            {
                                                if (Convert.ToInt32(dr["STATUSID"]) == 1)
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PaymentApprovalId"], ItemsArray[i]["RefNo"], ItemsArray[i]["GLCode"], ItemsArray[i]["CompanyName"], ItemsArray[i]["DEPARTMENT"], ItemsArray[i]["TypeName"], ItemsArray[i]["Amount"], ItemsArray[i]["Description"], ItemsArray[i]["AddedBy"],
                                                                ItemsArray[i]["CreatedDate"], "PENDING", Convert.ToInt32(dr["STATUSID"]));
                                                }
                                                else
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PaymentApprovalId"], ItemsArray[i]["RefNo"], ItemsArray[i]["GLCode"], ItemsArray[i]["CompanyName"], ItemsArray[i]["DEPARTMENT"], ItemsArray[i]["TypeName"], ItemsArray[i]["Amount"], ItemsArray[i]["Description"], ItemsArray[i]["AddedBy"],
                                                                ItemsArray[i]["CreatedDate"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                                }
                                            }
                                        }
                                    }
                                }
                                if (status == -1 || status == 0)
                                {
                                    status = 1;
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PaymentApprovalId"], r["RefNo"], r["GLCode"], r["CompanyName"], r["DEPARTMENT"], r["TypeName"], r["Amount"], r["Description"], r["AddedBy"],
                                                r["CreatedDate"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 1) // Approver-1
                            {
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (ItemsArray[i]["RefNo"].ToString() == dr["REQNO"].ToString())
                                            {
                                                if (Convert.ToInt32(dr["STATUSID"]) == 2)
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PaymentApprovalId"], ItemsArray[i]["RefNo"], ItemsArray[i]["GLCode"], ItemsArray[i]["CompanyName"], ItemsArray[i]["DEPARTMENT"], ItemsArray[i]["TypeName"], ItemsArray[i]["Amount"], ItemsArray[i]["Description"], ItemsArray[i]["AddedBy"],
                                                                ItemsArray[i]["CreatedDate"], "PENDING", Convert.ToInt32(dr["STATUSID"]));
                                                }
                                                else
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PaymentApprovalId"], ItemsArray[i]["RefNo"], ItemsArray[i]["GLCode"], ItemsArray[i]["CompanyName"], ItemsArray[i]["DEPARTMENT"], ItemsArray[i]["TypeName"], ItemsArray[i]["Amount"], ItemsArray[i]["Description"], ItemsArray[i]["AddedBy"],
                                                                ItemsArray[i]["CreatedDate"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                                }
                                            }
                                        }
                                    }
                                }
                                if (status == -1 || status == 0)
                                {
                                    status = 2; // Approved by Authorizer
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PaymentApprovalId"], r["RefNo"], r["GLCode"], r["CompanyName"], r["DEPARTMENT"], r["TypeName"], r["Amount"], r["Description"], r["AddedBy"],
                                                r["CreatedDate"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                            else if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 22) // Approver-2
                            {
                                var ItemsArray = Items.ToArray();
                                if (dtStatus.Rows.Count > 0)
                                {
                                    dt = dt.Clone();
                                    for (int i = 0; i < ItemsArray.Length; i++)
                                    {
                                        foreach (DataRow dr in dtStatus.Rows)
                                        {
                                            if (ItemsArray[i]["RefNo"].ToString() == dr["REQNO"].ToString())
                                            {
                                                if (Convert.ToInt32(dr["STATUSID"]) == 4)
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PaymentApprovalId"], ItemsArray[i]["RefNo"], ItemsArray[i]["GLCode"], ItemsArray[i]["CompanyName"], ItemsArray[i]["DEPARTMENT"], ItemsArray[i]["TypeName"], ItemsArray[i]["Amount"], ItemsArray[i]["Description"], ItemsArray[i]["AddedBy"],
                                                                ItemsArray[i]["CreatedDate"], "PENDING", Convert.ToInt32(dr["STATUSID"]));
                                                }
                                                else
                                                {
                                                    dt.Rows.Add(ItemsArray[i]["PaymentApprovalId"], ItemsArray[i]["RefNo"], ItemsArray[i]["GLCode"], ItemsArray[i]["CompanyName"], ItemsArray[i]["DEPARTMENT"], ItemsArray[i]["TypeName"], ItemsArray[i]["Amount"], ItemsArray[i]["Description"], ItemsArray[i]["AddedBy"],
                                                                ItemsArray[i]["CreatedDate"], dr["STATUS"].ToString(), Convert.ToInt32(dr["STATUSID"]));
                                                }
                                            }
                                        }
                                    }
                                }
                                if (status == -1 || status == 0)
                                {
                                    status = 4; // Approved by Approver 1
                                }
                                DataRow[] rslt = dt.Select("StatusId=" + status);
                                dt = dt.Clone();
                                foreach (DataRow r in rslt)
                                {
                                    dt.Rows.Add(r["PaymentApprovalId"], r["RefNo"], r["GLCode"], r["CompanyName"], r["DEPARTMENT"], r["TypeName"], r["Amount"], r["Description"], r["AddedBy"],
                                                r["CreatedDate"], r["ApprovalStatus"], r["StatusId"]);
                                }
                            }
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetDetailByRequestNo(int Mode, string Req_No)
        {
            try
            {
                DataTable dt = new DataTable();
                DataTable dtApprovalAuth = FetchStatus(Mode, Req_No);
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims";
                    if (Mode == 41) // WIMS-ADMIN => Requests
                    {
                        URL += "/adm/GetTakeInRequestWise?req_no=" + Req_No;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("WS_NAME", typeof(string));
                            dt.Columns.Add("REQ_NO", typeof(string));
                            dt.Columns.Add("INREQ_SEQ", typeof(string));
                            dt.Columns.Add("Date", typeof(string));
                            dt.Columns.Add("INREQ_SYSCODE", typeof(string));
                            dt.Columns.Add("INREQ_LOIM", typeof(string));
                            dt.Columns.Add("INREQ_TYPE", typeof(string));
                            dt.Columns.Add("INREQ_PART_SEQ", typeof(string));
                            dt.Columns.Add("PART_NO", typeof(string));
                            dt.Columns.Add("PART_NAME", typeof(string));
                            dt.Columns.Add("PART_UOM", typeof(string));
                            dt.Columns.Add("PART_MAKER", typeof(string));
                            dt.Columns.Add("PART_MODEL", typeof(string));

                            dt.Columns.Add("PART_LOCATION", typeof(string));
                            dt.Columns.Add("INREQ_ORDER", typeof(string));
                            dt.Columns.Add("INREQ_STOCK", typeof(decimal));
                            dt.Columns.Add("Qty", typeof(int));
                            dt.Columns.Add("INREQ_REM_QTY", typeof(decimal));
                            dt.Columns.Add("INREQ_REM_RT", typeof(string));
                            dt.Columns.Add("INREQ_REM_PO", typeof(string));
                            dt.Columns.Add("INREQ_RATE", typeof(string));
                            dt.Columns.Add("INREQ_AMOUNT", typeof(decimal));
                            dt.Columns.Add("UFOR", typeof(string));
                            dt.Columns.Add("INREQ_REMARK", typeof(string));

                            dt.Columns.Add("INREQ_STATUS", typeof(string));
                            dt.Columns.Add("INREQ_RDATE", typeof(string));
                            dt.Columns.Add("INREQ_RUSER", typeof(string));
                            dt.Columns.Add("INREQ_SYNC", typeof(string));
                            dt.Columns.Add("INREQ_PROJECT", typeof(string));

                            dt.Columns.Add("ApprovalStatus", typeof(string));
                            dt.Columns.Add("StatusId", typeof(string));

                            foreach (var list in Items)
                            {
                                dt.Rows.Add(list["INREQ_WS"], list["INREQ_NO"], list["INREQ_SEQ"], list["INREQ_DATE"], list["INREQ_SYSCODE"], list["INREQ_LOIM"], list["INREQ_TYPE"], list["INREQ_PART_SEQ"], list["PART_NO"], list["PART_NAME"], list["PART_UOM"], list["PART_MAKER"], list["PART_MODEL"],
                                            list["PART_LOCATION"], list["INREQ_ORDER"], list["INREQ_STOCK"], list["INREQ_REQ_QTY"], list["INREQ_REM_QTY"], list["INREQ_REM_RT"], list["INREQ_REM_PO"], list["INREQ_RATE"], list["INREQ_AMOUNT"], list["INREQ_UFOR"], list["INREQ_REMARK"],
                                            list["INREQ_STATUS"], list["INREQ_RDATE"], list["INREQ_RUSER"], list["INREQ_SYNC"], list["INREQ_PROJECT"], "", "");
                            }
                        }
                    }
                    else if (Mode == 43) // WIMS_AMD_PO
                    {
                        URL += "/adm/GetPoRequestPrint?req_no=" + Req_No;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("SUPP_NAME", typeof(string));
                            dt.Columns.Add("SUPP_ADDRESS", typeof(string));
                            dt.Columns.Add("SUPP_CITY", typeof(string));
                            dt.Columns.Add("SUPP_PHONE", typeof(string));
                            dt.Columns.Add("SUPP_MOBILE_NO", typeof(string));
                            dt.Columns.Add("SUPP_FAX", typeof(string));
                            dt.Columns.Add("SUPP_EMAIL", typeof(string));
                            dt.Columns.Add("PO_NO", typeof(string));
                            dt.Columns.Add("PO_DATE", typeof(string));
                            dt.Columns.Add("PO_VENDOR_STATUS", typeof(string));

                            dt.Columns.Add("PO_DEL_TERM", typeof(string));
                            dt.Columns.Add("PO_PAY_TERM", typeof(string));
                            dt.Columns.Add("PO_EXP_ARRIVAL", typeof(string));
                            dt.Columns.Add("PO_REQ_NO", typeof(string));
                            dt.Columns.Add("PART_NO", typeof(string));
                            dt.Columns.Add("PART_NAME", typeof(string));
                            dt.Columns.Add("PO_DESC", typeof(string));
                            dt.Columns.Add("PO_IN_QTY", typeof(string));
                            dt.Columns.Add("PART_UOM", typeof(string));
                            dt.Columns.Add("PO_RATE", typeof(string));

                            dt.Columns.Add("TOTAL_AMOUNT", typeof(decimal));
                            dt.Columns.Add("DISCOUNT_AMOUNT", typeof(decimal));
                            dt.Columns.Add("AFTER_DISCOUNT_AMOUNT", typeof(string));
                            dt.Columns.Add("GST_AMOUNT", typeof(string));
                            dt.Columns.Add("TAX_AMOUNT", typeof(string));
                            dt.Columns.Add("PO_G_TOTAL_AMOUNT", typeof(string));

                            dt.Columns.Add("PO_GST_RATE", typeof(string));
                            dt.Columns.Add("PO_TAX_RATE", typeof(string));

                        }
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["SUPP_NAME"], list["SUPP_ADDRESS"], list["SUPP_CITY"], list["SUPP_PHONE"], list["SUPP_MOBILE_NO"], list["SUPP_FAX"], list["SUPP_EMAIL"], list["PO_NO"], list["PO_DATE"], list["PO_VENDOR_STATUS"],
                                        list["PO_DEL_TERM"], list["PO_PAY_TERM"], list["PO_EXP_ARRIVAL"], list["PO_REQ_NO"], list["PART_NO"], list["PART_NAME"], list["PO_DESC"], list["PO_IN_QTY"], list["PART_UOM"], list["PO_RATE"],
                                        list["TOTAL_AMOUNT"], list["DISCOUNT_AMOUNT"], list["AFTER_DISCOUNT_AMOUNT"], list["GST_AMOUNT"], list["TAX_AMOUNT"], list["PO_G_TOTAL_AMOUNT"], list["PO_GST_RATE"], list["PO_TAX_RATE"]);
                        }
                    }
                    else if (Mode == 44) // WIMS_ADM_GRN
                    {
                        URL += "/adm/GetGRNWise?req_no=" + Req_No;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("GRN_WSNAME", typeof(string));
                            dt.Columns.Add("GRN_NO", typeof(string));
                            dt.Columns.Add("GRN_DATE", typeof(string));
                            dt.Columns.Add("GRN_REQ_NO", typeof(string));
                            dt.Columns.Add("GRN_REQ_DATE", typeof(string));
                            dt.Columns.Add("GRN_PO_NO", typeof(string));
                            dt.Columns.Add("GRN_PO_DATE", typeof(string));
                            dt.Columns.Add("PART_NO", typeof(string));
                            dt.Columns.Add("PART_NAME", typeof(string));
                            dt.Columns.Add("PART_UOM", typeof(string));
                            dt.Columns.Add("PART_MAKER", typeof(string));
                            dt.Columns.Add("GRN_REQ_QTY", typeof(decimal));
                            dt.Columns.Add("GRN_IN_QTY", typeof(decimal));
                            dt.Columns.Add("GRN_BAL_QTY", typeof(decimal));
                            dt.Columns.Add("GRN_REMARK", typeof(string));
                        }
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["GRN_WSNAME"], list["GRN_NO"], list["GRN_DATE"], list["GRN_REQ_NO"], list["GRN_REQ_DATE"], list["GRN_PO_NO"], list["GRN_PO_DATE"], list["PART_NO"], list["PART_NAME"],
                                        list["PART_UOM"], list["PART_MAKER"], list["GRN_REQ_QTY"], list["GRN_IN_QTY"], list["GRN_BAL_QTY"], list["GRN_REMARK"]);
                        }
                    }
                    else if (Mode == 45) // WIMS_ADM_TAKEIN
                    {
                        URL += "/adm/GetTakeInWise?req_no=" + Req_No;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("INPUT_NO", typeof(string));
                            dt.Columns.Add("INPUT_WS", typeof(string));
                            dt.Columns.Add("INPUT_DATE", typeof(string));
                            dt.Columns.Add("INPUT_SUPPLIER", typeof(string));
                            dt.Columns.Add("PART_NO", typeof(string));
                            dt.Columns.Add("PART_NAME", typeof(string));
                            dt.Columns.Add("PART_UOM", typeof(string));
                            dt.Columns.Add("PART_MAKER", typeof(string));

                            dt.Columns.Add("INPUT_REQ_NO", typeof(string));
                            dt.Columns.Add("INPUT_REQ_DATE", typeof(string));
                            dt.Columns.Add("INPUT_GRN_NO", typeof(string));
                            dt.Columns.Add("INPUT_GRN_DATE", typeof(string));
                            dt.Columns.Add("INPUT_IN_QTY", typeof(decimal));
                            dt.Columns.Add("INPUT_PK_RATE", typeof(decimal));
                            dt.Columns.Add("INPUT_PK_AMOUNT", typeof(decimal));
                            dt.Columns.Add("INPUT_REMARK", typeof(string));
                        }
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["INPUT_NO"], list["INPUT_WS"], list["INPUT_DATE"], list["INPUT_SUPPLIER"], list["PART_NO"], list["PART_NAME"], list["PART_UOM"], list["PART_MAKER"],
                                        list["INPUT_REQ_NO"], list["INPUT_REQ_DATE"], list["INPUT_GRN_NO"], list["INPUT_GRN_DATE"], list["INPUT_IN_QTY"], list["INPUT_PK_RATE"], list["INPUT_PK_AMOUNT"], list["INPUT_REMARK"]);
                        }

                    }
                    else if (Mode == 46) // WIMS_ADM_PV
                    {
                        var ws_name = string.Empty;
                        int ProjectId = 0;
                        URL += "/adm/GetPVWise?req_no=" + Req_No; // Get Workshop and Project against Req_No
                        var APIRes = client.DownloadString(URL);
                        JObject APIparsed = JObject.Parse(APIRes);
                        var APIItems = APIparsed["CSubTypes"];
                        if (APIparsed.Root.HasValues)
                        {
                            foreach (var data in APIItems)
                            {
                                ws_name = data["PV_WS"].ToString();
                                ProjectId = Convert.ToInt32(data["PV_PROJECT"]);
                            }

                            URL = string.Empty;
                            URL = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/GetPVPrint?req_no=" + Req_No + "&ws=" + ws_name + "&project=" + ProjectId;
                            var result = client.DownloadString(URL);
                            JObject parsed = JObject.Parse(result);
                            var Items = parsed["CSubTypes"];
                            if (parsed.Root.HasValues)
                            {
                                dt.Columns.Add("PV_LOIM", typeof(string));
                                dt.Columns.Add("PV_PROJECT", typeof(string));
                                dt.Columns.Add("PV_DATE", typeof(string));
                                dt.Columns.Add("PV_DEP", typeof(string));
                                dt.Columns.Add("PV_CREATE_DESIG", typeof(string));
                                dt.Columns.Add("PV_CREATE_USER", typeof(string));
                                dt.Columns.Add("PV_NO", typeof(string));
                                dt.Columns.Add("PV_DESC1", typeof(string));

                                dt.Columns.Add("PV_AMT1", typeof(string));
                                dt.Columns.Add("PV_DESC2", typeof(string));
                                dt.Columns.Add("PV_RATE1", typeof(string));
                                dt.Columns.Add("PV_AMT2", typeof(string));
                                dt.Columns.Add("PV_DESC3", typeof(string));
                                dt.Columns.Add("PV_RATE2", typeof(string));
                                dt.Columns.Add("PV_AMT3", typeof(string));
                                dt.Columns.Add("TOTAL_AMOUNT", typeof(string));

                                dt.Columns.Add("PV_DESC4", typeof(string));
                                dt.Columns.Add("PV_RATE3", typeof(string));
                                dt.Columns.Add("PV_AMT4", typeof(string));
                                dt.Columns.Add("PV_DESC5", typeof(string));
                                dt.Columns.Add("PV_RATE4", typeof(string));
                                dt.Columns.Add("PV_AMT5", typeof(string));
                                dt.Columns.Add("PV_DESC6", typeof(string));
                                dt.Columns.Add("PV_RATE5", typeof(string));
                                dt.Columns.Add("PV_AMT6", typeof(string));

                                dt.Columns.Add("PV_DESC7", typeof(string));
                                dt.Columns.Add("PV_RATE6", typeof(string));
                                dt.Columns.Add("PV_AMT7", typeof(string));
                                dt.Columns.Add("PV_SUPPLIER", typeof(string));
                                dt.Columns.Add("PV_INVOICE_NO", typeof(string));
                                dt.Columns.Add("TOTAL_AFTER_TAX_AMOUNT", typeof(string));
                            }
                            foreach (var list in Items)
                            {
                                dt.Rows.Add(list["PV_LOIM"], list["PV_PROJECT"], list["PV_DATE"], list["PV_DEP"], list["PV_CREATE_DESIG"], list["PV_CREATE_USER"], list["PV_NO"], list["PV_DESC1"],
                                            list["PV_AMT1"], list["PV_DESC2"], list["PV_RATE1"], list["PV_AMT2"], list["PV_DESC3"], list["PV_RATE2"], list["PV_AMT3"], list["TOTAL_AMOUNT"],
                                            list["PV_DESC4"], list["PV_RATE3"], list["PV_AMT4"], list["PV_DESC5"], list["PV_RATE4"], list["PV_AMT5"], list["PV_DESC6"], list["PV_RATE5"], list["PV_AMT6"],
                                            list["PV_DESC7"], list["PV_RATE6"], list["PV_AMT7"], list["PV_SUPPLIER"], list["PV_INVOICE_NO"], list["TOTAL_AFTER_TAX_AMOUNT"]);
                            }
                        }
                    }
                    else if (Mode == 121) // ECS => PAF
                    {
                        URL = "https://ecsapi.daewoo.net.pk/api/ecs/v1/getPAFListById?PaymentApprovalId=" + Req_No;
                        var RefNo = string.Empty;
                        var result = client.DownloadString(URL);
                        JObject parsed = JObject.Parse(result);
                        var Items = parsed["CSubTypes"];
                        if (parsed.Root.HasValues)
                        {
                            dt.Columns.Add("PaymentApprovalId", typeof(long));
                            dt.Columns.Add("RefNo", typeof(string));
                            dt.Columns.Add("GLCode", typeof(string));
                            dt.Columns.Add("CompanyName", typeof(string));
                            dt.Columns.Add("Division", typeof(string));
                            dt.Columns.Add("Department", typeof(string));
                            dt.Columns.Add("TypeName", typeof(string));
                            dt.Columns.Add("Amount", typeof(decimal));

                            dt.Columns.Add("Description", typeof(string));
                            dt.Columns.Add("AddedBy", typeof(string));
                            dt.Columns.Add("CreatedDate", typeof(string));

                            foreach (var list in Items)
                            {
                                dt.Rows.Add(list["PaymentApprovalId"], list["RefNo"], list["GLCode"], list["CompanyName"], list["Division"], list["DEPARTMENT"], list["TypeName"], list["Amount"], list["Description"], list["AddedBy"],
                                            list["CreatedDate"]);
                                RefNo = list["RefNo"].ToString();
                            }
                            dtApprovalAuth = FetchStatus(Mode, RefNo);
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = new { dt, dtApprovalAuth } });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public DataTable FetchStatus(int FlowDetailId, string Req_No)
        {
            try
            {
                string @sql = "SP_APPROVAL_IU";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 3 }); //Fetch Approval Auths
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_WIMS_PROJECT_ID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = FlowDetailId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUSDATE", OracleDbType = OracleDbType.Date, Direction = ParameterDirection.Input, Value = DateTime.Now });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REQNO", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = Req_No });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_UPDATEDBY", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REASON", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> FetchStatusForDropDown()
        {
            try
            {
                string @sql = "SP_APPROVAL_IU";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 4 }); //Fetch Status for Dropdown
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_WIMS_PROJECT_ID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUSDATE", OracleDbType = OracleDbType.Date, Direction = ParameterDirection.Input, Value = DateTime.Now });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REQNO", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_UPDATEDBY", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REASON", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record added successfully.", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No Record updated." });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public DataTable updateEApproval(ApprovalModel model, string status, int project_id)
        {
            Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            if (project_id == 26) //WIMS-ADMIN
            {
                string @sql = "SP_APPROVAL_IU";
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 1 }); //To INSERT DATA
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_WIMS_PROJECT_ID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.WIMS_PROJECT_ID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.FLOWDETAILID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUSDATE", OracleDbType = OracleDbType.Date, Direction = ParameterDirection.Input, Value = DateTime.Now });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REQNO", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.REQNO });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_UPDATEDBY", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERID"]) });
                if (status == "Approve")
                {
                    DataTable dtStatus = GetStatusByUserTypeId(Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]), "P");
                    oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(dtStatus.Rows[0]["STATUSID"]) });
                }
                else
                {
                    DataTable dtStatus = GetStatusByUserTypeId(Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]), "R");
                    oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(dtStatus.Rows[0]["STATUSID"]) });
                }
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REASON", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.REASON });
                if (model.FLOWDETAILID == 43 || model.FLOWDETAILID == 46) //WIMS_ADM_PO AND PVs
                {
                    if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) // WIMS_ADM => INITIATORS 
                    {
                        oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = "N" });
                    }
                    else
                    {
                        oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = "Y" });
                    }
                }
                else
                {
                    if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21) // WIMS_ADM => INITIATORS 
                    {
                        oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = "N" });
                    }
                    else
                    {
                        oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = "Y" });
                    }
                }
            }
            else if (project_id == 81) //ECS
            {
                string @sql = "SP_APPROVAL_IU";
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 1 }); //To INSERT DATA
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_WIMS_PROJECT_ID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = model.FLOWDETAILID });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUSDATE", OracleDbType = OracleDbType.Date, Direction = ParameterDirection.Input, Value = DateTime.Now });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REQNO", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.REQNO });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_UPDATEDBY", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERID"]) });
                if (status == "Approve")
                {
                    DataTable dtStatus = GetStatusByUserTypeId(Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]), "P");
                    oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(dtStatus.Rows[0]["STATUSID"]) });
                }
                else
                {
                    DataTable dtStatus = GetStatusByUserTypeId(Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]), "R");
                    oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(dtStatus.Rows[0]["STATUSID"]) });
                }
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REASON", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = model.REASON });
                if (model.FLOWDETAILID == 121) //ECS => PAF
                {
                    if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 22) // ECS => PAF => Approver 2 
                    {
                        oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = "Y" });
                    }
                    else
                    {
                        oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = "N" });
                    }
                }
            }
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }

        [Obsolete]
        public async Task<Object> UpdateStatus(ApprovalModel model, string status)
        {
            try
            {
                HttpResponseMessage response = new HttpResponseMessage();
                int projectId = Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]);
                if (Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]) == 26) //WIMS-ADMIN
                {
                    if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) != 4 && Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) != 21) // WIMS_ADM => INITIATORS
                    {
                        string apiUrl = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/UpdateWimsAdminStatus";
                        string fullUrl = $"{apiUrl}?req_no={model.REQNO}&status={status}&viewType={Convert.ToInt32(model.FLOWDETAILID)}";
                        using (HttpClient client = new HttpClient())
                        {
                            response = await client.PostAsync(fullUrl, null);
                            if (response.IsSuccessStatusCode)
                            {
                                string responseContent = await response.Content.ReadAsStringAsync();
                                responseContent = responseContent.Replace("\"", string.Empty).Replace("\\", string.Empty);
                                if (responseContent == "Record updated successfully")
                                {
                                    updateEApproval(model, status, Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]));

                                }
                                else
                                {
                                    return await Task.FromResult(new { Success = false, Response = "Failed to save record." });
                                }
                            }
                        }
                    }
                    else
                    {
                        updateEApproval(model, status, Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]));
                    }
                }

                else if (Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]) == 81) //ECS
                {
                    if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 22) // ECS => PAF => Approver 2
                    {
                        var name = HttpContext.Current.Session["NAME"].ToString();
                        string apiUrl = "https://ecsapi.daewoo.net.pk/api/ecs/v1/PostRecord"; //Live URL
                        //string apiUrl = "https://localhost:44354/api/ecs/v1/PostRecord";
                        string fullUrl = $"{apiUrl}?req_no={model.REQNO}&status={status}&viewType={Convert.ToInt32(model.FLOWDETAILID)}&approvedBy={HttpContext.Current.Session["NAME"]}";
                        using (HttpClient client = new HttpClient())
                        {
                            response = await client.PostAsync(fullUrl, null);
                            if (response.IsSuccessStatusCode)
                            {
                                updateEApproval(model, status, Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]));
                            }
                        }
                    }
                    else
                    {
                        updateEApproval(model, status, Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]));
                    }
                }

                return await Task.FromResult(new { Success = true, Response = "Record added successfully.", Message = response });
            }
            catch (Exception ex)
            {
                return new { Success = false, Response = "An error occurred: " + ex.Message };
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public DataTable GetStatusByUserTypeId(int UserTypeId, string Status)
        {
            try
            {
                DataTable dt = new DataTable();
                string @sql = "SP_STATUS";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 1 }); //To FETCH DATA
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = UserTypeId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = Status });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                adapter.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        [Obsolete]
        public DataTable GetStatus()
        {
            DataTable dtStatus = new DataTable();
            string @sql = "SP_APPROVAL_IU";
            Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
            oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
            oracleCommand.Connection = this.oracleConnection;
            if (this.oracleConnection.State == ConnectionState.Closed)
            {
                oracleConnection.Open();
            }
            oracleCommand.CommandText = sql;
            OracleDataAdapter adapter = new OracleDataAdapter();
            adapter.SelectCommand = oracleCommand;
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 2 }); //To DISPLAY DATA
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_WIMS_PROJECT_ID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUSDATE", OracleDbType = OracleDbType.Date, Direction = ParameterDirection.Input, Value = DateTime.Now });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REQNO", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_UPDATEDBY", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERID"]) });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REASON", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
            oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
            adapter.Fill(dtStatus);
            oracleConnection.Close();
            return dtStatus;
        }
        private Object DT2JSON(DataTable dt)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            if (dt.Rows.Count > 0)
            {
                rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row;
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
                serializer.MaxJsonLength = Int32.MaxValue;
                object x = serializer.Serialize(rows);
                return x;
            }
            else
            {
                rows = null;
                return serializer.Serialize(rows);
            }
        }

        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_Status()
        {
            try
            {
                DataTable dt = new DataTable();
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/GetAdmDbStatus";
                    //string URL = "https://localhost:44360/api/wims/adm/GetAdmDbStatus";
                    var result = client.DownloadString(URL);
                    JObject parsed = JObject.Parse(result);
                    var Items = parsed["CSubTypes"];
                    if (parsed.Root.HasValues)
                    {
                        dt.Columns.Add("REQ_NO", typeof(string));
                        dt.Columns.Add("REQ_DESC", typeof(string));
                        dt.Columns.Add("APPROVED", typeof(int));
                        dt.Columns.Add("REJECTED", typeof(int));
                        dt.Columns.Add("PENDING", typeof(int));
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["REQ_NO"], list["REQ_DESC"], list["APPROVED"], list["REJECTED"], list["PENDING"]);
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public async Task<Object> GetAssignedProjectByUserId(int UserId)
        {
            try
            {
                string @sql = "SP_USERS_MASTER";
                OracleCommand oracleCommand = new OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 6 }); // Get User Permission
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ROLEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_LOGIN_NAME", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_EMAIL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PASSOWRD", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_PROJECTID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = UserId });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                adapter.SelectCommand = oracleCommand;
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PO_AMT(string tenor)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/GetAdmDbPoAmt?tenor=" + tenor + "";
                    //string URL = "https://localhost:44360/api/wims/adm/GetAdmDbPoAmt?tenor=" + tenor + "";
                    var result = client.DownloadString(URL);
                    JObject parsed = JObject.Parse(result);
                    var Items = parsed["CSubTypes"];
                    if (parsed.Root.HasValues)
                    {
                        dt.Columns.Add("PO_AMOUNT", typeof(int));
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["PO_AMOUNT"]);
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PV_STATUS_DT(string tenor)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/GetAdmDbPVStatusDT?tenor=" + tenor + "";
                    //string URL = "https://localhost:44360/api/wims/adm/GetAdmDbPVStatusDT?tenor=" + tenor + "";
                    var result = client.DownloadString(URL);
                    JObject parsed = JObject.Parse(result);
                    var Items = parsed["CSubTypes"];
                    if (parsed.Root.HasValues)
                    {
                        dt.Columns.Add("APPROVED", typeof(int));
                        dt.Columns.Add("REJECTED", typeof(int));
                        dt.Columns.Add("PENDING", typeof(int));
                        dt.Columns.Add("TOTAL_PV_NUM", typeof(int));
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["APPROVED"], list["REJECTED"], list["PENDING"], list["TOTAL_PV_NUM"]);
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PV_GRAPH(string tenor)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/GetAdmDbPVGraph?tenor=" + tenor + "";
                    //string URL = "https://localhost:44360/api/wims/adm/GetAdmDbPVGraph?tenor=" + tenor + "";
                    var result = client.DownloadString(URL);
                    JObject parsed = JObject.Parse(result);
                    var Items = parsed["CSubTypes"];
                    if (parsed.Root.HasValues)
                    {
                        dt.Columns.Add("APPROVED", typeof(string));
                        dt.Columns.Add("REJECTED", typeof(string));
                        dt.Columns.Add("PENDING", typeof(string));
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["APPROVED"], list["REJECTED"], list["PENDING"]);
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }

        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PO_PENDING()
        {
            try
            {
                DataTable dt = new DataTable();
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string URL = "https://eapproval.daewoo.net.pk:7867/api/wims/adm/GetAdmDbPoPending";
                    //string URL = "https://localhost:44360/api/wims/adm/GetAdmDbPoPending";
                    var result = client.DownloadString(URL);
                    JObject parsed = JObject.Parse(result);
                    var Items = parsed["CSubTypes"];
                    if (parsed.Root.HasValues)
                    {
                        dt.Columns.Add("PO_NO", typeof(string));
                        dt.Columns.Add("PO_DATE", typeof(string));
                        foreach (var list in Items)
                        {
                            dt.Rows.Add(list["PO_NO"], list["PO_DATE"]);
                        }
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = false, Response = "No record found.", Data = new { } });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetRasonsByRequstId(string ReqNo)
        {
            try
            {
                string @sql = "SP_APPROVAL_IU";
                Oracle.ManagedDataAccess.Client.OracleCommand oracleCommand = new Oracle.ManagedDataAccess.Client.OracleCommand();
                oracleCommand.CommandType = System.Data.CommandType.StoredProcedure;
                oracleCommand.Connection = this.oracleConnection;
                if (this.oracleConnection.State == ConnectionState.Closed)
                {
                    oracleConnection.Open();
                }
                oracleCommand.CommandText = sql;
                OracleDataAdapter adapter = new OracleDataAdapter();
                adapter.SelectCommand = oracleCommand;
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_MODE", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 5 }); //Fetch Reason By Requet No
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_APPROVALID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_WIMS_PROJECT_ID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_FLOWDETAILID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUSDATE", OracleDbType = OracleDbType.Date, Direction = ParameterDirection.Input, Value = DateTime.Now });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_USERTYPEID", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REQNO", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = ReqNo });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_UPDATEDBY", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = Convert.ToInt32(HttpContext.Current.Session["USERID"]) });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_STATUS", OracleDbType = OracleDbType.Int32, Direction = ParameterDirection.Input, Value = 0 });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_REASON", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "P_ISFINALAPPROVAL", OracleDbType = OracleDbType.Varchar2, Direction = ParameterDirection.Input, Value = null });
                oracleCommand.Parameters.Add(new Oracle.ManagedDataAccess.Client.OracleParameter() { ParameterName = "dtl_Out", OracleDbType = OracleDbType.RefCursor, Direction = ParameterDirection.Output, Value = null });
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return await Task.FromResult(new { Success = true, Response = "Record Found.", Data = dt });
                }
                else
                {
                    return await Task.FromResult(new { Success = true, Response = "No Record Found." });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oracleConnection.Close();
            }
        }
        [Obsolete]
        public async Task<Object> GetImagesByRequestId(int PaymentApprovalId)
        {
            try
            {
                var name = HttpContext.Current.Session["NAME"].ToString();
                //string apiUrl = "https://ecsapi.daewoo.net.pk/api/ecs/v1/PostRecord"; //Live URL
                using (var client = new WebClient())
                {
                    client.Headers.Add("Content-Type:application/json");
                    client.Headers.Add("Accept:application/json");
                    string apiUrl = "https://ecs.daewoo.net.pk/HO/GetImages";//"http://localhost:61217/HO/GetImages";
                    string fullUrl = $"{apiUrl}?PaymentApprovalId={PaymentApprovalId}";
                    var result = client.DownloadString(fullUrl);
                    JObject parsed = JObject.Parse(result);
                    var Items = parsed["Data"];
                    var list = Items.ToList();
                    return await Task.FromResult(new { Success = true, Response = "Record Found", Data = list });
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
    }
}