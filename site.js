var THEME_COOKIE_KEY = "BSCurrentTheme";

$(document).ready(function () {
    $("#settingsbar").hide();
    var theme = $.cookie(THEME_COOKIE_KEY);
    if (!theme) {
        theme = "default";
    }
    var path = "SwitcherResources/Themes/" + theme + "/";
    $("#themeLink").attr("href", path + "bootstrap.min.css");
    selectItem(theme);
    $("#themeSwitcherBtn").click(function () {
        $("#settingsbar").toggle("slide", { direction: "right" }, 1000);
    });
});

function selectItem(theme) {
    var selectedItem = $('.nav-item').find('span.' + theme);
    if (selectedItem.length !== 0) {
        selectedItem.parent().addClass("selectedItem");
    }
}

function onItemClick(theme) {
    theme = theme.toLowerCase();
    if (theme == $.cookie(THEME_COOKIE_KEY)) return;

    $('.selectedItem').removeClass("selectedItem");
    selectItem(theme);

    $(window.top.document.body).fadeOut(200, function () {
        var path = "SwitcherResources/Themes/" + theme + "/";
        $("#themeLink").attr("href", path + "bootstrap.min.css");
        $.cookie(THEME_COOKIE_KEY, theme);
        $(window.top.document.body).fadeIn(300);
        return false;
    });
}