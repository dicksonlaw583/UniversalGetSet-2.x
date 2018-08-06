/// @description assert_isnt_real(got, [msg])
/// @param got
/// @param  [msg]
//Assert that the gotten expression is not a real number.
{
  if (!GMASSERT_MODE) exit;

  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Non-real type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (is_real(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but a real value", __gma_debug_value__(argument[0]));
  }
}
