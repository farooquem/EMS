using System;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var emp = new EmployeeManagementContext();
                ddlDepartment.DataSource = emp.GetActiveDepartment();
                ddlDepartment.DataTextField = "Name";
                ddlDepartment.DataValueField = "Id";
                ddlDepartment.DataBind();
                ddlGender.DataSource = EmployeeManagementContext.GetGenderList();
                ddlGender.DataTextField = "Name";
                ddlGender.DataValueField = "Id";
                ddlGender.DataBind();
                BindData();
                SetStage(Stage.Load);
            }
            
        }

        protected void gvEmployee_OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            SetStage(Stage.Edit);
        }

        protected void gvEmployee_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
          var id = Convert.ToInt32(gvEmployee.Rows[e.RowIndex].Cells[0]);

            BindData();
        }

        private void BindData()
        {
            var emp = new EmployeeManagementContext();
            gvEmployee.DataSource = emp.GetAllEmployee();
            gvEmployee.DataBind();
        }

        protected void btnNew_OnClick(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFirstName.Text))
            {

            }
            if (string.IsNullOrWhiteSpace(txtMiddleName.Text))
            {

            }
            if (string.IsNullOrWhiteSpace(txtLastName.Text))
            {

            }
            if (string.IsNullOrWhiteSpace(txtJobTitle.Text))
            {

            }
            if (string.IsNullOrWhiteSpace(txtContactNumber.Text))
            {

            }
            if (string.IsNullOrWhiteSpace(txtFirstName.Text))
            {

            }
            SetStage(Stage.New);
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            SetStage(Stage.Load);
        }

       
        protected void btnReset_OnClick(object sender, EventArgs e)
        {
            SetStage(Stage.Load);
        }

        private void SetStage(Stage stage)
        {
            btnSave.Visible = false;
            btnNew.Visible = false;
           // btnReset.Visible=true
            switch (stage)
            {
               case Stage.Load:
                   btnNew.Visible = true;
                   btnReset.Visible = true;
                   break;
                case Stage.New:
                    btnSave.Visible  = true;
                    btnReset.Visible = true;
                    btnSave.Text = "Save";
                    break;
                case Stage.Edit:
                    btnReset.Visible = true;
                    btnSave.Visible = true;
                    btnSave.Text = "Update";
                    break;

            }
        }

        protected void cusCustom_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = DateTime.TryParse(args.Value, out var t );
        }
    }

    public enum Stage
    {
        Load=0,
        New=1,
        Edit=2
    }
}