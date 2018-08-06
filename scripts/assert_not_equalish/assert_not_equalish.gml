/// @description assert_not_equalish(got, expected, [msg])
/// @param got
/// @param  expected
/// @param  [msg]
//Assert that the gotten expression is not approximately equal to the expected expression.
{
  if (!GMASSERT_MODE) exit;
  
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Not equalish assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (__gma_equalish__(argument[0], argument[1])) {
    __gma_assert_error__(msg, argument[1], argument[0]);
  }
}
