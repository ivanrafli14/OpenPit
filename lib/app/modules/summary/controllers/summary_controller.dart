import 'dart:convert';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:open_pit/app/modules/detail/controllers/detail_controller.dart';
import 'package:open_pit/app/modules/path_concert/controllers/path_concert_controller.dart';

class SummaryController extends GetxController {
  //TODO: Implement SummaryController

  MidtransSDK? midtrans;

  DetailController detailC = Get.find<DetailController>();
  PathConcertController pathC = Get.find<PathConcertController>();
  int happyMealPrice = 0;
  int totalOrders = 0;

  void initSDK() async {
    midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: dotenv.env['MIDTRANS_CLIENT_KEY']!,
        merchantBaseUrl: 'https://api.sandbox.midtrans.com',
        // colorTheme: ColorTheme(
        //   colorPrimary: Theme.of(context).colorScheme.secondary,
        //   colorPrimaryDark: Theme.of(context).colorScheme.secondary,
        //   colorSecondary: Theme.of(context).colorScheme.secondary,
        // ),
      ),
    );
    midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    midtrans!.setTransactionFinishedCallback((result) {
      print(result.toJson());
    });
  }

  Future<String> getSnapToken(int price) async {
    const baseUrl = 'https://app.sandbox.midtrans.com/snap/v1/transactions';
    final authToken = dotenv.env['MIDTRANS_AUTH_TOKEN']!;
    int ran = Random().nextInt(10000);

    Map<String, dynamic> content = {
      "transaction_details": {"order_id": ran, "gross_amount": price},
      "credit_card": {"secure": true}
    };

    var contentJson = jsonEncode(content);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': authToken,
    };

    var response = await http.post(Uri.parse(baseUrl),
        body: contentJson, headers: requestHeaders);

    final data = json.decode(response.body);
    return data['token'];
    //debugPrint(data['token']);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initSDK();
    happyMealPrice = detailC.happy_meal.value * 50000;
    totalOrders = happyMealPrice + pathC.total.value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    midtrans?.removeTransactionFinishedCallback();
    super.onClose();
  }

  void increment() => count.value++;
}
