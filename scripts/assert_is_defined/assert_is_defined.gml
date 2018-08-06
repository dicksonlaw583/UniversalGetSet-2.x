/// @description assert_is_defined(got, [msg])
/// @param got
/// @param  [msg]
//Assert that the gotten expression is not undefined.
{
  if (!GMASSERT_MODE) exit;

  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Defined type assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (is_undefined(argument[0])) {
    __gma_assert_error_raw__(msg, "Anything but undefined", __gma_debug_value__(argument[0]));
  }
}
