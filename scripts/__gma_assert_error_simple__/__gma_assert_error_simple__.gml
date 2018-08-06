/// @description __gma_assert_error__(message)
/// @param message
{
  switch (GMASSERT_MODE) {
    case GMASSERT_MODE_SELFTEST:
      global.__gma_assert_triggered__ = true;
    break;
    case GMASSERT_MODE_ENABLED:
      __GMA_BREAKPOINT__();
      var msg = argument0 + chr(13) + chr(13);
      if (os_browser == browser_not_a_browser) {
        show_error(msg, true);
      }
      else {
        show_message(msg);
      }
    break;
  }
}
