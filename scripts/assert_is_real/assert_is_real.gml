/// @description assert_is_real(got, [msg])
/// @param got
/// @param  [msg]
//Assert that the gotten expression is a real number.
{
  if (!GMASSERT_MODE) exit;

  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Real type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (!is_real(argument[0])) {
    __gma_assert_error_raw__(msg, "Any real value", __gma_debug_value__(argument[0]));
  }
}
