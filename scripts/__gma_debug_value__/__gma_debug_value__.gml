{
  //Undefined
  if (is_undefined(argument0)) {
    return "undefined";
  }
  
  //String
  else if (is_string(argument0)) {
    return "\"" + string_replace_all(argument0, "\"", "\"\"") + "\"";
  }
  
  //Real
  else if (is_real(argument0)) {
    //Return integers as-is
    if (frac(argument0) == 0) {
      return string(argument0);
    }
    //Get mantissa and exponent
    var mantissa, exponent;
    exponent = floor(log10(abs(argument0)));
    mantissa = string_replace_all(string_format(argument0/power(10,exponent), 15, 14), " ", "");
    //Trim trailing zeros off mantissa
    var i, ca;
    i = string_length(mantissa);
    do {
      ca = string_char_at(mantissa, i);
      i -= 1;
    } until (ca != "0")
    if (ca != ".") {
      mantissa = string_copy(mantissa, 1, i+1);
    }
    else {
      mantissa = string_copy(mantissa, 1, i);
    }
    //Add exponent except if it is zero
    if (exponent != 0) {
      return mantissa + "e" + string(exponent);
    }
    else {
      return mantissa;
    }
  }
  
  //Array
  else if (is_array(argument0)) {
    var size;
    var result = "",
        height = array_height_2d(argument0);
    //1D
    if (height == 1 || array_length_2d(argument0, 0) == 0) {
      size = array_length_1d(argument0)
      for (var i = 0; i < size; i++) {
        result += __gma_debug_value__(argument0[@ i]);
        if (i < size-1) {
          result += ", ";
        }
      }
    }
    //2D
    else {
      for (var i = 0; i < height; i++) {
        size = array_length_2d(argument0, i);
        for (var j = 0; j < size; j++) {
          result += __gma_debug_value__(argument0[@ i, j]);
          if (j < size-1) {
            result += ", ";
          }
        }
        if (i < height-1) {
          result += "; ";
        }
      }
    }
    return "(" + result + ")";
  }
  else {
    return "???";
  }
}
