<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="site.js"></script>

    <link href="SwitcherResources/themes.css" type="text/css" rel="stylesheet" />
    <link href="SwitcherResources/themeSwitcher.css?id=1" type="text/css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>

    <link rel="stylesheet" id="themeLink" runat="server" />
    <link rel="stylesheet" href="site.css" />

</head>
<body>
    <form id="form1" runat="server">
        

        <div class="jumbotron">
            <h1 class="display-4">Hello, My Friend!</h1>
            <p class="lead">This sample shows how Bootstrap Theme Switcher works.</p>
            <hr class="my-4">
            <p>It uses Bootswatch themes, though you are free to create your custom Bootstrap themes.</p>
            <p class="lead">
                <button type="button" id="themeSwitcherBtn" class="btn btn-info">Change Theme</button>
            </p>
        </div>

        <div id="settingsbar" class="float-right">
            <nav id="themesMenu">
                <ul class="nav navbar-nav">
                    <asp:Repeater ID="themesRepeater" runat="server">
                        <ItemTemplate>
                            <li class="nav-item" id="themesMenu_li">
                                <a class="nav-link" href="javascript:onItemClick('<%# Container.DataItem.ToString().ToLower() %>')" id="themesMenu_link">
                                    <span class="image <%# Container.DataItem.ToString().ToLower() %>"></span><span><%# Container.DataItem.ToString() %></span>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </nav>
        </div>
    </form>
</body>
</html>
