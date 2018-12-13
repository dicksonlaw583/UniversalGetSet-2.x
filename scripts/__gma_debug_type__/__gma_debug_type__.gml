{
	switch typeof(argument0){
		case "number":
			return GMASSERT_TYPE_REAL;
			break;
		case "string":
			return GMASSERT_TYPE_STRING;
			break;
		case "array":
			return GMASSERT_TYPE_ARRAY;
			break;
		case "undefined":
			return GMASSERT_TYPE_UNDEFINED;
			break;
		case "unknown":
			__gma_assert_error_simple__("Error data type. Please file bug report to YoYo");
			break;
		default:
			return GMASSERT_TYPE_UNKNOWN;
			break;
	}
}
