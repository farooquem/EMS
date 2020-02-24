<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="EmployeeManagementSystem.Employee" MasterPageFile="~/Site.Master" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="filt" style="margin-top: 20px" class="container-fluid">
        <div class="row">
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblFirstName" CssClass="control-label">First Name</asp:Label>
                <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="firstName" ForeColor="Red" ControlToValidate="txtFirstName" ErrorMessage="Enter first name" />
            </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblMiddleName" CssClass="control-label">Middle Name</asp:Label>
                <asp:TextBox runat="server" ID="txtMiddleName" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="middlename" ForeColor="Red" ControlToValidate="txtFirstName" ErrorMessage="Enter middle name" />
            </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblLastName" CssClass="control-label font-weight-bold">Last Name</asp:Label>
                <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="lastname" ForeColor="Red" ControlToValidate="txtFirstName" ErrorMessage="Enter last name" />
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblDepartment" CssClass="control-label">Department</asp:Label>
                <asp:DropDownList runat="server" ID="ddlDepartment" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblJobTitle" CssClass="control-label">Job Title</asp:Label>
                <asp:TextBox runat="server" ID="txtJobTitle" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="jobtitle" ForeColor="Red" ControlToValidate="txtJobTitle" ErrorMessage="Enter job title" />
            </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblContactNumber" CssClass="control-label">Contact Number</asp:Label>
                <asp:TextBox runat="server" ID="txtContactNumber" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="contactNumber" ForeColor="Red" ControlToValidate="txtContactNumber" ErrorMessage="Enter contact number" />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblEmail" CssClass="control-label">Email</asp:Label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="email" ForeColor="Red" ControlToValidate="txtEmail" ErrorMessage="Enter Email" />
            </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblAdress" CssClass="control-label">Address</asp:Label>
                <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="address" ForeColor="Red" ControlToValidate="txtAddress" ErrorMessage="Enter Address" />
            </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblDob" CssClass="control-label">Date Of Birth</asp:Label>
                <asp:TextBox runat="server" ID="txtdob" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="dob" ForeColor="Red" ControlToValidate="txtdob" ErrorMessage="Enter Date of Birth" />
                <asp:CustomValidator runat="server" ID="cusCustom" ControlToValidate="txtdob" ForeColor="Red" OnServerValidate="cusCustom_ServerValidate" ErrorMessage="Valid Date of birth" />
                </div>
        </div>
        <div class="row">
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblDoj" CssClass="control-label">Date Of Joining</asp:Label>
                <asp:TextBox runat="server" ID="txtdoj" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="doj" ForeColor="Red" ControlToValidate="txtdoj" ErrorMessage="Enter Date of Joining" />
                <asp:CustomValidator runat="server" ID="CustomValidator2" ControlToValidate="txtdoj" ForeColor="Red" OnServerValidate="cusCustom_ServerValidate" ErrorMessage="Valid Date of birth" />
                </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lbldol" CssClass="control-label">Date of Leaving</asp:Label>
                <asp:TextBox runat="server" ID="txtdol" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="col-sm-4 form-group">
                <asp:Label runat="server" ID="lblGender" CssClass="control-label">Gender</asp:Label>
                <asp:DropDownList runat="server" ID="ddlGender" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="row pull-right">
            <div class="col-sm-12 form-group">
                <asp:Button runat="server" Text="New" CssClass="btn btn-primary" ID="btnNew" OnClick="btnNew_OnClick" CausesValidation="False" />
                <asp:Button runat="server" Text="Save" ID="btnSave" CssClass="btn btn-success" OnClick="btnSave_OnClick" />
                <asp:Button runat="server" Text="Reset" ID="btnReset" CssClass="btn btn-primary" OnClick="btnReset_OnClick" OnClientClick="return cleanForm();" CausesValidation="False" />
            </div>
        </div>
    </div>

    <div id="grid">
        <asp:GridView CssClass="table table-striped table-bordered table-hover"
            runat="server" ID="gvEmployee" AutoGenerateColumns="False" OnRowEditing="gvEmployee_OnRowEditing" OnRowDeleting="gvEmployee_OnRowDeleting"
            AllowPaging="True" ShowHeaderWhenEmpty="True" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True"
                    Visible="False" />
                <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Department" HeaderText="Department" />
                <asp:BoundField DataField="Job_Title" HeaderText="Job Title" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="DateOfJoining" HeaderText="DOJ" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="DateOfLeaving" HeaderText="DOL" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Edit" />
                <asp:CommandField ShowDeleteButton="true" ButtonType="Button" DeleteText="Delete" />
            </Columns>
        </asp:GridView>
    </div>
    <script type="text/javascript">
        function cleanForm() {

            document.forms[0].reset();
            for (var i = 0; i < Page_Validators.length; i++) {
                Page_Validators[i].style.visibility = 'hidden';
            }
            return true;
        }
    </script>
</asp:Content>


