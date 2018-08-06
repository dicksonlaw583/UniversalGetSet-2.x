/// @description assert_isnt_string(got, [msg])
/// @param got
/// @param  [msg]
//Assert that the gotten expression is not a string.
{
  if (!GMASSERT_MODE) exit;

  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Non-string type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (is_string(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but a string", __gma_debug_value__(argument[0]));
  }
}
