using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default :System.Web.UI.Page {
    public const string DefaultTheme = "default";
    public const string CurrentThemeCookieKey = "BSCurrentTheme";

    public string CurrentTheme {
        get {
            if (HttpContext.Current.Request.Cookies[CurrentThemeCookieKey] != null)
                return HttpContext.Current.Request.Cookies[CurrentThemeCookieKey].Value;
            return DefaultTheme;
        }
    }

    protected void Page_Init(object sender, EventArgs e) {
        themeLink.Attributes["href"] = string.Format("~/SwitcherResources/Themes/{0}/bootstrap.min.css", CurrentTheme);
        themesRepeater.DataSource = GetThemes();
        themesRepeater.DataBind();
    }

    private List<string> GetThemes() {
        string path = Server.MapPath("~/SwitcherResources/Themes/");
        return GetPatchedThemeNames(Directory.GetDirectories(path));
    }

    private List<string> GetPatchedThemeNames(string[ ] directories) {
        List<string> list = new List<string>();
        foreach (string dir in directories) {
            string theme = dir.Remove(0, dir.LastIndexOf('\\') + 1);
            string Theme = theme.First().ToString().ToUpper() + theme.Substring(1);
            list.Add(Theme);
        }
        return list;
    }
}