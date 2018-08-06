/// @description assert_doesnt_contain_exact(got, content, [msg]);
/// @param got
/// @param  content
/// @param  [msg]
//Assert that the gotten string, list or array does not contain a value exactly equal to content (as compared using ==).
{
  if (!GMASSERT_MODE) exit;
  
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 2:
      msg = "Exact exclusion assertion failed!";
    break;
    case 3:
      msg = argument[2];
    break;
    default:
      show_error("Expected 2 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check types and assertion
  var found = false;
  switch (__gma_debug_type__(argument[0])) {
    case GMASSERT_TYPE_STRING:
      if (__gma_debug_type__(argument[1]) == GMASSERT_TYPE_STRING) {
        if (string_pos(argument[1], argument[0]) > 0) {
          __gma_assert_error_raw__(msg, "A string that does not contain exactly " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
        }
      }
      else {
        msg += " (invalid content type)";
        __gma_assert_error_raw__(msg, "A string", __gma_debug_value__(argument[1]));
      }
    break;
    case GMASSERT_TYPE_ARRAY:
      var arr = argument[0];
      if (array_height_2d(arr) == 1 || array_length_2d(arr, 1) == 0) {
        var size = array_length_1d(arr);
        for (var i = 0; i < size; i++) {
          if (__gma_debug_type__(argument[1]) == __gma_debug_type__(arr[i]) && argument[1] == arr[i]) {
            found = true;
            break;
          }
        }
      }
      else {
        var size_i = array_height_2d(arr);
        for (var i = 0; i < size_i && !found; i++) {
          var size_j = array_length_2d(arr, i);
          for (var j = 0; j < size_j; j++) {
            if (__gma_debug_type__(argument[1]) == __gma_debug_type__(arr[i, j]) && argument[1] == arr[i, j]) {
              found = true;
              break;
            }
          }
        }
      }
      if (found) {
        __gma_assert_error_raw__(msg, "An array that eoes not contain exactly " + __gma_debug_value__(argument[1]), __gma_debug_value__(argument[0]));
      }
    break;
    case GMASSERT_TYPE_REAL:
      if (ds_exists(argument[0], ds_type_list)) {
        var list = argument[0],
            size = ds_list_size(list);
        for (var i = 0; i < size; i++) {
          if (__gma_debug_type__(argument[1]) == __gma_debug_type__(list[| i]) && argument[1] == list[| i]) {
            found = true;
            break;
          }
        }
        if (found) {
          __gma_assert_error_raw__(msg, "A list that does not contain exactly " + __gma_debug_value__(argument[1]), __gma_debug_list_value__(argument[0]));
        }
      }
      else {
        msg += " (list ID does not exist)";
        __gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(argument[0]));
      }
    break;
    default:
      msg += " (invalid container type)";
        __gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(argument[0]));
    break;
  }
}
