/// @description __gma_assert_error__(message, expected, got)
/// @param message
/// @param  expected
/// @param  got
{
  switch (GMASSERT_MODE) {
    case GMASSERT_MODE_SELFTEST:
      global.__gma_assert_triggered__ = true;
    break;
    case GMASSERT_MODE_ENABLED:
      __GMA_BREAKPOINT__();
      var msg = argument0 + chr(13)+chr(10) + chr(13)+chr(10) + "Expected: " + __gma_debug_value__(argument1) + chr(13)+chr(10) + chr(13)+chr(10) + "Got: " + __gma_debug_value__(argument2) + chr(13)+chr(10) + chr(13)+chr(10);
      if (os_browser == browser_not_a_browser) {
        show_error(msg, true);
      }
      else {
        show_message(msg);
      }
    break;
  }
}
