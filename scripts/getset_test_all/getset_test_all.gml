/// @description getset_test_all()
{
var time_a = current_time;
getset_test_get();
getset_test_set();
var time_b = current_time;
show_debug_message("UniversalGetSet tests done in " + string(time_b-time_a) + "ms.");
}

