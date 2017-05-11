<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <h1 class="title">My Current Favourite Cars (2017)</h1>

    <div class="data">
    
        <asp:GridView ID="GridView1" 
                        runat="server" 
                        AutoGenerateColumns="False"
                        onrowcommand="GridView1_RowCommand"
                        DataKeyNames="Id" 
                        DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" ItemStyle-Width="20%" ItemStyle-CssClass="colID"/>
                <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" ItemStyle-Width="20%" ItemStyle-CssClass="colMake"/>
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" ItemStyle-Width="20%" ItemStyle-CssClass="colMode"/>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" ItemStyle-Width="20%" ItemStyle-CssClass="colYear"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" text="Delete" CommandName="DeleteRow" CssClass="button" CommandArgument='<%#Eval("Id") %>' ItemStyle-Width="10%" ItemStyle-CssClass="colDelete"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" text="Update" CommandName="UpdateRow" CssClass="button" CommandArgument='<%#Eval("Id") %>' ItemStyle-Width="10%" ItemStyle-CssClass="colUpdate"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1"
                        runat="server"
                        ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True"
                        SelectCommand="SELECT * FROM [Cars]">
    </asp:SqlDataSource>

    <br />
    <div class="insert">
        <div class="header">Insert New Record</div>
        <label>Make</label>
        <asp:TextBox ID="txtMake" runat="server"></asp:TextBox>
        <br />
        <label>Model</label>
        <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
        <br />
        <label>Year</label>
        <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
        <br />

        <span>Please press Insert when adding new record, <br /> or Confirm when updating one.</span><br />
        <asp:Button class="button" ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
        <asp:Button class="button" ID="btnUpdateConfirm" runat="server" Text="Confirm" OnClick="updateConfirm" />
    </div>

    <br />
    <br />
    <br />
    <asp:TextBox ID="debug" runat="server"></asp:TextBox>
    </form>
</body>
</html>
