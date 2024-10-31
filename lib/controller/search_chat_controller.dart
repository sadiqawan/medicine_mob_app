import 'package:get/get.dart';

class SearchChatController extends GetxController {
  var isSearching = false.obs;
  var searchQuery = ''.obs;

  void toggleSearch() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchQuery.value = ''; 
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
