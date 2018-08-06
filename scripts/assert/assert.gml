/// @description assert(got, [msg])
/// @param got
/// @param  [msg]
//Assert that the gotten expression is true.
{
  if (!GMASSERT_MODE) exit;

  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Assertion failed!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (!argument[0]) {
    __gma_assert_error_simple__(msg);
  }
}
