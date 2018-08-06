{
  if (is_undefined(argument0)) {
    return GMASSERT_TYPE_UNDEFINED;
  }
  else if (is_real(argument0)) {
    return GMASSERT_TYPE_REAL;
  }
  else if (is_string(argument0)) {
    return GMASSERT_TYPE_STRING;
  }
  else if (is_array(argument0)) {
    return GMASSERT_TYPE_ARRAY;
  }
  else {
    return GMASSERT_TYPE_UNKNOWN;
  }
}
