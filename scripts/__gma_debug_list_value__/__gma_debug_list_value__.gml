{
  //Return list(<INVALID>) if it does not exist
  if (!ds_exists(argument0, ds_type_list)) {
    return "list(<INVALID>)";
  }
  
  //Return list(entry1, entry2, ..., entry n) if it exists
  var content = "",
      siz = ds_list_size(argument0);
  for (var i = 0; i < siz; i++) {
    content += __gma_debug_value__(argument0[| i]);
    if (i < siz-1) {
      content += ", ";
    }
  }
  return "list(" + content + ")";
}
