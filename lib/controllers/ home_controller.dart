import 'package:get/get.dart';
import '../models/food_item.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  var foodItems = <FoodItem>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchFoodItems();
    super.onInit();
  }

  void fetchFoodItems() async {
    try {
      isLoading(true);
      var fetchedFoodItems = await ApiService.fetchFoodItems();
      foodItems.assignAll(fetchedFoodItems);
    } finally {
      isLoading(false);
    }
  }
}
