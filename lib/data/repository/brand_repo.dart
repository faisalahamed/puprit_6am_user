import 'package:get/get.dart';
import 'package:medibott/controller/localization_controller.dart';
import 'package:medibott/data/api/api_client.dart';
import 'package:medibott/util/app_constants.dart';
import 'package:flutter/material.dart';

class BrandRepo {
  final ApiClient apiClient;
  BrandRepo({@required this.apiClient});

  Future<Response> getBrandListrepo({bool allCategory = false}) async {
    try {
      print('===============================aR');
      return await apiClient.getData(AppConstants.BRAND_ITEM_URI,
          headers: allCategory
              ? {
                  'Content-Type': 'application/json; charset=UTF-8',
                  AppConstants.LOCALIZATION_KEY:
                      Get.find<LocalizationController>().locale.languageCode ??
                          AppConstants.languages[0].languageCode
                }
              : null);
    } catch (e) {
      print('=======error $e');
    }
  }

  Future<Response> getSubCategoryList(String parentID) async {
    return await apiClient
        .getData('${AppConstants.SUB_BRAND_URI}$parentID?limit=10&offset=0');
  }

  Future<Response> getCategoryItemList(
      String categoryID, int offset, String type) async {
    return await apiClient.getData(
        '${AppConstants.SUB_BRAND_URI}$categoryID?limit=10&offset=$offset&type=$type');
  }

  Future<Response> getCategoryStoreList(
      String categoryID, int offset, String type) async {
    return await apiClient.getData(
        '${AppConstants.CATEGORY_STORE_URI}$categoryID?limit=10&offset=$offset&type=$type');
  }

  Future<Response> getSearchData(
      String query, String categoryID, bool isStore, String type) async {
    return await apiClient.getData(
      '${AppConstants.SEARCH_URI}${isStore ? 'stores' : 'items'}/search?name=$query&category_id=$categoryID&type=$type&offset=1&limit=50',
    );
  }

  Future<Response> saveUserInterests(List<int> interests) async {
    return await apiClient
        .postData(AppConstants.INTEREST_URI, {"interest": interests});
  }
}
