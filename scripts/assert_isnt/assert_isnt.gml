/// @description assert_isnt(got, expected, [msg])
/// @param got
/// @param  expected
/// @param  [msg]
//Assert that the gotten expression is not exactly equal to the expected expression (as compared using ==).
{
  if (!GMASSERT_MODE) exit;
  
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Not equal assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (__gma_debug_type__(argument[0]) == __gma_debug_type__(argument[1]) && argument[0] == argument[1]) {
    __gma_assert_error__(msg, argument[1], argument[0]);
  }
}
