<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MIdterm.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EntertainmentAgencyExampleConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="CustFirstName" HeaderText="CustFirstName" SortExpression="CustFirstName" />
                <asp:BoundField DataField="CustLastName" HeaderText="CustLastName" SortExpression="CustLastName" />
                <asp:BoundField DataField="CustStreetAddress" HeaderText="CustStreetAddress" SortExpression="CustStreetAddress" />
                <asp:BoundField DataField="CustCity" HeaderText="CustCity" SortExpression="CustCity" />
                <asp:BoundField DataField="CustState" HeaderText="CustState" SortExpression="CustState" />
                <asp:BoundField DataField="CustZipCode" HeaderText="CustZipCode" SortExpression="CustZipCode" />
                <asp:BoundField DataField="CustPhoneNumber" HeaderText="CustPhoneNumber" SortExpression="CustPhoneNumber" />
            </Columns>
            <SelectedRowStyle BackColor="#3399FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EntertainmentAgencyExampleConnectionString %>" SelectCommand="SELECT distinct Entertainers.EntStageName, Entertainers.EntCity 
FROM Entertainers INNER JOIN Entertainer_Styles ON Entertainer_Styles.EntertainerID = Entertainers.EntertainerID INNER JOIN Musical_Styles ON Musical_Styles.StyleID = Entertainer_Styles.StyleID INNER JOIN Musical_Preferences ON Musical_Preferences.StyleID = Musical_Styles.StyleID INNER JOIN Customers ON Customers.CustomerID = Musical_Preferences.CustomerID
where Customers.CustomerID = @Customer">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Customer" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource2" DataKeyNames="EntStageName">
            <Columns>
                <asp:BoundField DataField="EntStageName" HeaderText="EntStageName" SortExpression="EntStageName" />
                <asp:BoundField DataField="EntCity" HeaderText="EntCity" SortExpression="EntCity" />
            </Columns>
            <SelectedRowStyle BackColor="Lime" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EntertainmentAgencyExampleConnectionString %>" SelectCommand="select distinct StyleName from Musical_Styles 
inner join Entertainer_Styles on Entertainer_Styles.StyleID = Musical_Styles.StyleID
inner join Musical_Preferences on Musical_Preferences.StyleID = Musical_Styles.StyleID
inner join Entertainers on Entertainers.EntertainerID = Entertainer_Styles.EntertainerID
inner join Customers on Customers.CustomerID = Musical_Preferences.CustomerID
where Entertainers.EntStageName = @ents and Customers.CustomerID = @cust">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="ents" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" Name="cust" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource3" >
            <ItemTemplate>
                StyleName:
                <asp:Label ID="StyleNameLabel" runat="server" Text='<%# Eval("StyleName") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
