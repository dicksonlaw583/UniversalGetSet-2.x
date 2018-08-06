{
  var type = __gma_debug_type__(argument0);
  if (type == __gma_debug_type__(argument1)) {
    switch (type) {
      case GMASSERT_TYPE_ARRAY:
        var a1d = array_length_2d(argument0, 0) == 0,
            b1d = array_length_2d(argument1, 0) == 0;
        if (a1d != b1d) return false;
        if (a1d) {
          var size = array_length_1d(argument0);
          if (size != array_length_1d(argument1)) return false;
          for (var i = 0; i < size; i++) {
            if (!__gma_equal__(argument0[@ i], argument1[@ i])) return false;
          }
        }
        else {
          var size_i = array_height_2d(argument0);
          if (size_i != array_height_2d(argument1)) return false;
          var size_j;
          for (var i = 0; i < size_i; i++) {
            size_j = array_length_2d(argument0, i);
            if (size_j != array_length_2d(argument1, i)) return false;
            for (var j = 0; j < size_j; j++) {
              if (!__gma_equal__(argument0[@ i, j], argument1[@ i, j])) return false;
            }
          }
        }
        return true;
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
