/// @description getset_test_get()
{
var data;

// Get simple 1D array
data = Array(3, 5, "waahoo");
assert_equal(Get(data, 0), 3);
assert_equal(Get(data, 1), 5);
assert_equal(Get(data, 2), "waahoo");
assert_equal(Get(data, -1), "waahoo");
assert_equal(Get(data, -2), 5);
assert_equal(Get(data, -3), 3);
data = undefined;

// Get simple 2D array
data = Array2(2, 2,
  3, 1,
  2, 4
);
assert_equal(Get(data, Pos(0, 0)), 3);
assert_equal(Get(data, Pos(0, 1)), 1);
assert_equal(Get(data, Pos(1, 0)), 2);
assert_equal(Get(data, Pos(1, 1)), 4);
assert_equal(Get(data, Pos(-2, -2)), 3);
assert_equal(Get(data, Pos(-2, -1)), 1);
assert_equal(Get(data, Pos(-1, -2)), 2);
assert_equal(Get(data, Pos(-1, -1)), 4);
assert_equal(Get(data, Pos(0, -2)), 3);
assert_equal(Get(data, Pos(0, -1)), 1);
assert_equal(Get(data, Pos(1, -2)), 2);
assert_equal(Get(data, Pos(1, -1)), 4);
assert_equal(Get(data, Pos(-2, 0)), 3);
assert_equal(Get(data, Pos(-2, 1)), 1);
assert_equal(Get(data, Pos(-1, 0)), 2);
assert_equal(Get(data, Pos(-1, 1)), 4);
data = undefined;

// Get simple stack
data = Stack(1, 2, 3, 4);
assert_equal(Get(data, stack_top), 1);
ds_stack_destroy(data);

// Get simple queue
data = Queue(4, 3, 2, 1);
assert_equal(Get(data, queue_head), 4);
ds_queue_destroy(data);

// Get simple list
data = List(5, 6, 7, 8);
assert_equal(Get(data, 0), 5);
assert_equal(Get(data, 1), 6);
assert_equal(Get(data, 2), 7);
assert_equal(Get(data, 3), 8);
assert_equal(Get(data, -1), 8);
assert_equal(Get(data, -2), 7);
assert_equal(Get(data, -3), 6);
assert_equal(Get(data, -4), 5);
ds_list_destroy(data);

// Get simple grid
data = Grid(2, 2,
  10, 11,
  12, 13
);
assert_equal(Get(data, Pos(0, 0)), 10);
assert_equal(Get(data, Pos(1, 0)), 11);
assert_equal(Get(data, Pos(0, 1)), 12);
assert_equal(Get(data, Pos(1, 1)), 13);
assert_equal(Get(data, Pos(-2, -2)), 10);
assert_equal(Get(data, Pos(-1, -2)), 11);
assert_equal(Get(data, Pos(-2, -1)), 12);
assert_equal(Get(data, Pos(-1, -1)), 13);
assert_equal(Get(data, Pos(0, -2)), 10);
assert_equal(Get(data, Pos(1, -2)), 11);
assert_equal(Get(data, Pos(0, -1)), 12);
assert_equal(Get(data, Pos(1, -1)), 13);
assert_equal(Get(data, Pos(-2, 0)), 10);
assert_equal(Get(data, Pos(-1, 0)), 11);
assert_equal(Get(data, Pos(-2, 1)), 12);
assert_equal(Get(data, Pos(-1, 1)), 13);
ds_grid_destroy(data);

// Get simple map
data = Map(
  "abc", 3,
  "def", "boo"
);
assert_equal(Get(data, "abc"), 3);
assert_equal(Get(data, "def"), "boo");
ds_map_destroy(data);

// Get nested JSON
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
assert_equal(Get(data, "abc", "prop"), "waahoo");
assert_equal(Get(data, "abc", "children", 0), 1);
assert_equal(Get(data, "abc", "children", 1), 2);
assert_equal(Get(data, "abc", "children", 2), 3);
assert_equal(Get(data, "abc", "children", -1), 3);
assert_equal(Get(data, "abc", "children", -2), 2);
assert_equal(Get(data, "abc", "children", -3), 1);
assert_equal(Get(data, "def", "prop"), "no");
assert_equal(Get(data, "def", "children"), undefined);
ds_map_destroy(data);

// Get nested array
data = Array(
  Array(0, 1),
  Array(2, 3)
);
assert_equal(Get(data, 0, 0), 0);
assert_equal(Get(data, 0, 1), 1);
assert_equal(Get(data, 1, 0), 2);
assert_equal(Get(data, 1, 1), 3);
assert_equal(Get(data, -1, -1), 3);
assert_equal(Get(data, -1, -2), 2);
assert_equal(Get(data, -2, -1), 1);
assert_equal(Get(data, -2, -2), 0);
data = undefined;
}

