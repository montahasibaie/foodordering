import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodordering/app/my_app_controller.dart';
import 'package:foodordering/core/data/repositories/shared_prefreance_repository.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/services/cart_service.dart';
import 'package:foodordering/core/services/connectivity_service.dart';
import 'package:foodordering/core/services/location_service.dart';
import 'package:foodordering/ui/shared/colors.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_toast.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../enums/connectivity_status.dart';

SharedPrefranceRepository get storage => Get.find<SharedPrefranceRepository>();

CartService get cartService => Get.find<CartService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
LocationService get locationService => Get.find<LocationService>();

bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

void fadeInTransition(Widget view) {
  Get.to(view, transition: Transition.fadeIn);
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.mainBlackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainOrangeColor),
      );
    });

double get taxAmount => 0.18;
double get deliveryAmount => 0.1;

void checkConnection(Function function) {
  if (isOnline)
    function;
  else
    CustomToast.showMeassge(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}
