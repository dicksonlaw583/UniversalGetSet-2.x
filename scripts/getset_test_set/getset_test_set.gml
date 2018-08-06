/// @description getset_test_set()
{
var data;

// Set simple 1D array
data = Array(3, 5, "waahoo");
Set(data, -2, 7);
Set(data, 2, "boohoo");
Set(data, 3, 9);
assert_equal(Get(data, 0), 3);
assert_equal(Get(data, 1), 7);
assert_equal(Get(data, 2), "boohoo");
assert_equal(Get(data, 3), 9);
data = undefined;

// Set simple 2D array
data = Array2(2, 2,
  3, 1,
  2, 4
);
Set(data, Pos(-2, -2), 0);
Set(data, Pos(-1, 0), 7);
Set(data, Pos(0, -1), 8);
Set(data, Pos(1, 1), 6);
assert_equal(Get(data, Pos(0, 0)), 0);
assert_equal(Get(data, Pos(0, 1)), 8);
assert_equal(Get(data, Pos(1, 0)), 7);
assert_equal(Get(data, Pos(1, 1)), 6);
data = undefined;

// Set simple stack
data = Stack(1, 2, 3, 4);
Set(data, stack_top, 7);
assert_equal(Get(data, stack_top), 7);
ds_stack_destroy(data);

// Set simple list
data = List(5, 6, 7, 8);
Set(data, 1, 9);
Set(data, 4, 10);
assert_equal(Get(data, 0), 5);
assert_equal(Get(data, 1), 9);
assert_equal(Get(data, 2), 7);
assert_equal(Get(data, 3), 8);
assert_equal(Get(data, 4), 10);
ds_list_destroy(data);

// Set simple grid
data = Grid(2, 2,
  10, 11,
  12, 13
);
Set(data, Pos(0, 0), 15);
Set(data, Pos(-1, -2), 16);
Set(data, Pos(-2, 1), 17);
Set(data, Pos(1, -1), 18);
assert_equal(Get(data, Pos(0, 0)), 15);
assert_equal(Get(data, Pos(1, 0)), 16);
assert_equal(Get(data, Pos(0, 1)), 17);
assert_equal(Get(data, Pos(1, 1)), 18);
ds_grid_destroy(data);

// Set simple map
data = Map(
  "abc", 3,
  "def", "boo"
);
Set(data, "abc", 5);
Set(data, "ghi", "hoo");
assert_equal(Get(data, "abc"), 5);
assert_equal(Get(data, "def"), "boo");
assert_equal(Get(data, "ghi"), "hoo");
ds_map_destroy(data);

// Set nested JSON
data = JsonData(
  JsonMap(
    "abc", JsonMap(
      "prop", "waahoo",
      "children", JsonList(1, 2, 3)
    ),
    "def", JsonMap(
      "prop", "no",
      "children", undefined
    ),
  )
);
Set(data, "abc", "prop", "boohoo");
Set(data, "abc", "children", -2, 5);
Set(data, "abc", "children", 3, 4);
Set(data, "def", "more", 9);
assert_equal(Get(data, "abc", "prop"), "boohoo");
assert_equal(Get(data, "abc", "children", 0), 1);
assert_equal(Get(data, "abc", "children", 1), 5);
assert_equal(Get(data, "abc", "children", 2), 3);
assert_equal(Get(data, "abc", "children", 3), 4);
assert_equal(Get(data, "def", "prop"), "no");
assert_equal(Get(data, "def", "children"), undefined);
assert_equal(Get(data, "def", "more"), 9);
ds_map_destroy(data);

// Set nested array
data = Array(
  Array(0, 1),
  Array(2, 3)
);
Set(data, 0, 0, 5);
Set(data, -2, 1, 6);
Set(data, 1, -2, 7);
Set(data, -1, -1, 8);
assert_equal(Get(data, 0, 0), 5);
assert_equal(Get(data, 0, 1), 6);
assert_equal(Get(data, 1, 0), 7);
assert_equal(Get(data, 1, 1), 8);
data = undefined;
}

