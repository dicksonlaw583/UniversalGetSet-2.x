/// @description assert_in_range(got, lower, upper, [msg])
/// @param got
/// @param  lower
/// @param  upper
/// @param  [msg]
//Assert that the gotten expression is within the inclusive range between lower and upper.
{
  if (!GMASSERT_MODE) exit;
  
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 3:
      msg = "In-range assertion failed!";
    break;
    case 4:
      msg = argument[3];
    break;
    default:
      show_error("Expected 3 or 4 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check types
  switch (__gma_debug_type__(argument[1])) {
    case GMASSERT_TYPE_REAL:
    case GMASSERT_TYPE_STRING:
    case GMASSERT_TYPE_ARRAY:
    break;
    default:
      msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
    exit;
  }
  if (__gma_debug_type__(argument[1]) != __gma_debug_type__(argument[2])) {
    switch (__gma_debug_type__(argument[1])) {
      case GMASSERT_TYPE_REAL:
        __gma_assert_error__(msg + " (mismatched range types)", "A real value for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case GMASSERT_TYPE_STRING:
        __gma_assert_error__(msg + " (mismatched range types)", "A string for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case GMASSERT_TYPE_ARRAY:
        __gma_assert_error__(msg + " (mismatched range types)", "An array for the upper bound", __gma_debug_value__(argument[2]));
      break;
      default:
        msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
      break;
    }
    exit;
  }
  
  //Check assertion
  if (!(__gma_less_than_or_equal__(argument[0], argument[2]) && __gma_less_than_or_equal__(argument[1], argument[0]))) {
    switch (__gma_debug_type__(argument[1])) {
      case GMASSERT_TYPE_REAL:
        __gma_assert_error_raw__(msg, "A real value between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case GMASSERT_TYPE_STRING:
        __gma_assert_error_raw__(msg, "A string that lies between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case GMASSERT_TYPE_ARRAY:
        __gma_assert_error_raw__(msg, "An array with pairwise values all between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error_raw__(msg + " (unsupported type)", "A value comparable to " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
    }
  }
}
