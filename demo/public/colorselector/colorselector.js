function clicked(color_id) {
  row = $("#c" + color_id);
  name = row.children("td.name").html();
  color = row.css("background");
  parent.$("#extra_variant").val(name);
  parent.$("#colorselector_value").html(name);
  parent.$("#colorselector_sample").css("background", color);
  parent.$.fn.colorbox.close();
}

$(document).ready(function()
{
    $(".defaultText").focus(function(srcc)
    {
        if ($(this).val() == $(this)[0].title)
        {
            $(this).removeClass("defaultTextActive");
            $(this).val("");
        }
    });

    $(".defaultText").blur(function()
    {
        if ($(this).val() == "")
        {
            $(this).addClass("defaultTextActive");
            $(this).val($(this)[0].title);
        }
    });

    $(".defaultText").blur();


});
