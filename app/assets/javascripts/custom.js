$(function() {
  var flashCallback,
    _this = this;
  flashCallback = function() {
    return $(".alert").fadeOut();
  };
  $(".alert").bind('click', function(ev) {
    return $(".alert").fadeOut();
  });
  return setTimeout(flashCallback, 3000);
});

