#define Get
/// @description Get(array_or_ds, ...)
/// @param array_or_ds
/// @param  ...
{
var result = argument[0];
for (var i = 1; i < argument_count; i++) {
  var k = argument[i];
  if (is_int32(k) || is_int64(k)) {
    k = real(k);
  }
  switch (typeof(result)+typeof(k)) {
    case "numbernumber":
      if (k < 0) {
        k += ds_list_size(result);
      }
      result = result[| k];
    break;
    case "numberstring":
      result = result[? k];
    break;
    case "numberarray":
      if (array_length_1d(k) == 1) {
        k = k[0];
        switch (k) {
          case 0:
            result = ds_priority_find_min(result);
          break;
          case 1:
            result = ds_priority_find_max(result);
          break;
          case 2:
            result = ds_stack_top(result);
          break;
          case 3:
            result = ds_queue_head(result);
          break;
          default:
            show_error("Invalid index " + string(k) + " (" + string(i) + ")", true);
          break;
        }
      } else {
        var k0 = k[0],
            k1 = k[1];
        if (k0 < 0) {
          k0 += ds_grid_width(result);
        }
        if (k1 < 0) {
          k1 += ds_grid_height(result);
        }
        result = result[# k0, k1];
      }
    break;
    case "arraynumber":
      if (k < 0) {
        k += array_length_1d(result);
      }
      result = result[k];
    break;
    case "arrayarray":
      var k0 = k[0],
          k1 = k[1];
      if (k0 < 0) {
        k0 += array_height_2d(result);
      }
      if (k1 < 0) {
        k1 += array_length_2d(result, k0);
      }
      result = result[k0, k1];
    break;
    default:
      show_error("Invalid index " + string(k) + " (" + string(i) + ")", true);
    break;
  }
}
return result;
}

#define Set
/// @description Set(array_or_ds, ..., value)
/// @param array_or_ds
/// @param  ...
/// @param  value
{
var target = argument[0];
for (var i = 1; i < argument_count-2; i++) {
  var k = argument[i];
  if (is_int32(k) || is_int64(k)) {
    k = real(k);
  }
  switch (typeof(target)+typeof(k)) {
    case "numbernumber":
      if (k < 0) {
        k += ds_list_size(target);
      }
      target = target[| k];
    break;
    case "numberstring":
      target = target[? k];
    break;
    case "numberarray":
      if (array_length_1d(k) == 1) {
        k = k[0];
        switch (k) {
          case 0:
            target = ds_priority_find_min(target);
          break;
          case 1:
            target = ds_priority_find_max(target);
          break;
          case 2:
            target = ds_stack_top(target);
          break;
          case 3:
            target = ds_queue_head(target);
          break;
          default:
            show_error("Invalid index " + string(k) + " (" + string(i) + ")", true);
          break;
        }
      } else {
        var k0 = k[0],
            k1 = k[1];
        if (k0 < 0) {
          k0 += ds_grid_width(target);
        }
        if (k1 < 0) {
          k1 += ds_grid_height(target);
        }
        target = target[# k0, k1];
      }
    break;
    case "arraynumber":
      if (k < 0) {
        k += array_length_1d(target);
      }
      target = target[k];
    break;
    case "arrayarray":
      var k0 = k[0],
          k1 = k[1];
      if (k0 < 0) {
        k0 += array_height_2d(target);
      }
      if (k1 < 0) {
        k1 += array_length_2d(target, k0);
      }
      target = target[k0, k1];
    break;
    default:
      show_error("Invalid index " + string(k) + " (" + string(i) + ")", true);
    break;
  }
}
var new_value = argument[argument_count-1];
k = argument[argument_count-2];
if (is_int32(k) || is_int64(k)) {
  k = real(k);
}
switch (typeof(target)+typeof(k)) {
  case "numbernumber":
    if (k < 0) {
      k += ds_list_size(target);
    }
    target[| k] = new_value;
  break;
  case "numberstring":
    target[? k] = new_value;
  break;
  case "numberarray":
    if (array_length_1d(k) == 1) {
      k = k[0];
      switch (k) {
        case 0:
          show_error("Cannot set minimum of priority queue.", true);
        break;
        case 1:
          show_error("Cannot set maximum of priority queue.", true);
        break;
        case 2:
          ds_stack_pop(target);
          ds_stack_push(target, new_value);
        break;
        case 3:
          show_error("Cannot set head of queue.", true);
        break;
        default:
          show_error("Invalid index " + string(k) + " (" + string(i) + ")", true);
        break;
      }
    } else {
      var k0 = k[0],
          k1 = k[1];
      if (k0 < 0) {
        k0 += ds_grid_width(target);
      }
      if (k1 < 0) {
        k1 += ds_grid_height(target);
      }
      target[# k0, k1] = new_value;
    }
  break;
  case "arraynumber":
    if (k < 0) {
      k += array_length_1d(target);
    }
    target[@ k] = new_value;
  break;
  case "arrayarray":
    var k0 = k[0],
        k1 = k[1];
    if (k0 < 0) {
      k0 += array_height_2d(target);
    }
    if (k1 < 0) {
      k1 += array_length_2d(target, k0);
    }
    target[@ k0, k1] = new_value;
  break;
  default:
    show_error("Invalid index " + string(k) + " (" + string(i) + ")", true);
  break;
}
}

#define Pos
/// @description Pos(x, y)
/// @param x
/// @param  y
{
var pos = array_create(2);
pos[0] = argument0;
pos[1] = argument1;
return pos;
}

