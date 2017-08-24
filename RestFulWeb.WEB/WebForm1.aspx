<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RestFulWeb.WEB.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            getXMDetial();
        });


        function getXMDetial() {
            var jsondata = {
                ValidateData: "",
                paras: {
                    XMNUMBER: "XM20170001"
                }
            }
            $.ajax({
                type: 'post',
                data: JSON.stringify(jsondata),
                cache: false,
                url: "http://localhost:88/XiangMu_XQ/GetXMDetail",
                async: false,
                datatype: 'json',
                success: function (rtn) {
                    if (rtn) {
                        $("#Rowguid").text(rtn.UserArea.RowGuid);
                        $("#xmnumber").text(rtn.UserArea.XMNumber);
                        $("#xmtype").text(rtn.UserArea.Sbdw);
                    }
                    else {

                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }

    </script>
  
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <%-- <asp:TextBox ID="XMNumber" runat="server"></asp:TextBox>
            <asp:Button ID="btnsubmit" runat="server" Text="Button" />--%>
            <label id="Rowguid"></label>
            <label id="xmnumber"></label>
            <label id="xmtype"></label>
        </div>

    </form>
</body>
</html>
