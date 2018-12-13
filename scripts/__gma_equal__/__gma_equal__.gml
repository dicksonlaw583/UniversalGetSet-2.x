{
  var type = __gma_debug_type__(argument0);
  if (type == __gma_debug_type__(argument1)) {
    switch (type) {
      case GMASSERT_TYPE_ARRAY:
		return array_equals(argument0,argument1);
      break;
      default:
        return argument0 == argument1;
      break;
    }
  }
  else {
    return false;
  }
}
