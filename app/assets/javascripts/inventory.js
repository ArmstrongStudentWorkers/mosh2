$(function () {
  $(".btn-group button").click(function () {
    $("#search-type").val($(this).text());
  });
});
