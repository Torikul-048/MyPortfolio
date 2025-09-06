<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testCRUD.aspx.cs" Inherits="MyPortfolio.testCRUD" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>CRUD Test - Projects</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Test CRUD Operations (Projects Table)</h2>

        <!-- Insert -->
        <asp:TextBox ID="txtTitle" runat="server" Placeholder="Project Title"></asp:TextBox><br />
        <asp:TextBox ID="txtDesc" runat="server" Placeholder="Project Description"></asp:TextBox><br />
        <asp:Button ID="btnInsert" runat="server" Text="Insert Project" OnClick="btnInsert_Click" /><br /><br />

        <!-- Display Projects -->
        <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectID" OnRowEditing="gvProjects_RowEditing" OnRowUpdating="gvProjects_RowUpdating" OnRowCancelingEdit="gvProjects_RowCancelingEdit" OnRowDeleting="gvProjects_RowDeleting">
            <Columns>
                <asp:BoundField DataField="ProjectID" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>