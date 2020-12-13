import '../item.dart';

List<Item> searchItems(List<Item> items, String searchFilter) {
  List<Item> searchList = [];

  items.forEach((item) {
    if (item.name.toLowerCase().contains(searchFilter.toLowerCase())) {
      searchList.add(item);
    }
  });
  return searchList;
}