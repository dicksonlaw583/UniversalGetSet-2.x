/// @description assert_equal(got, expected, [msg])
/// @param got
/// @param  expected
/// @param  [msg]
//Assert that the gotten expression is equal to the expected expression.
{
  if (!GMASSERT_MODE) exit;
  
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Equal assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (!__gma_equal__(argument[0], argument[1])) {
    __gma_assert_error__(msg, argument[1], argument[0]);
  }
}
