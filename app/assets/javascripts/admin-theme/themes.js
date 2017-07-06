$(function () {
  // setTimeout() function will be fired after page is loaded
  // it will wait for 5 sec. and then will fire
  // $("#successMessage").hide() function
  setTimeout(function () {
    $('#alert-message').fadeOut('slow');
  }, 6000);
});
