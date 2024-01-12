import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:open_pit/app/modules/Pickup/controllers/pickup_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/search_place_controller.dart';

class SearchPlaceView extends GetView<SearchPlaceController> {
  SearchPlaceView({Key? key}) : super(key: key);

  PickupController pickC = Get.find<PickupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SearchPlaceView'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            placesAutoCompleteTextField()
          ],
        ));
  }

  placesAutoCompleteTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller.queryC,
        googleAPIKey: 'AIzaSyD70kaxV0TaMWeKNwxAdSQNO8fvdsZF6YU',
        inputDecoration: InputDecoration(
          hintText: "Search your location",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: ["id"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) {
          print("placeDetailsLat" + prediction.lat.toString());
          print("placeDetailsLong" + prediction.lng.toString());
        },

        itemClick: (Prediction prediction) {
          controller.queryC.text = prediction.description ?? "";
          controller.queryC.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
          print('Halooo' + prediction.placeId.toString());
          pickC.getPlace(prediction.placeId!);
          Get.toNamed(Routes.PICKUP);
        },
        seperatedBuilder: Divider(),
        containerHorizontalPadding: 10,

        // OPTIONAL// If you want to customize list view item builder
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 7,
                ),
                Expanded(child: Text("${prediction.description ?? ""}"))
              ],
            ),
          );
        },

        isCrossBtnShown: true,

        // default 600 ms ,
      ),
    );
  }
}
