import 'package:bot_toast/bot_toast.dart';
import 'package:foodordering/core/data/repositories/user_repository.dart';
import 'package:foodordering/core/enums/message_type.dart';
import 'package:foodordering/core/enums/operation_type.dart';
import 'package:foodordering/core/enums/request_status.dart';
import 'package:foodordering/core/services/cart_service.dart';
import 'package:foodordering/ui/shared/custom_widgets/custom_toast.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  // UserRepository userRepository = Get.put(UserRepository());

  Rx<RequestStatus> requestStatus = RequestStatus.DEFUALT.obs;
  RxList<OperationType> operationType = <OperationType>[].obs;

  Future runFutureFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    if (isOnline) {
      requestStatus.value = RequestStatus.LOADING;
      operationType.add(type!);
      await function;
      requestStatus.value = RequestStatus.DEFUALT;
      operationType.remove(type);
    } else {
      CustomToast.showMeassge(
          message: 'Please check internet connection',
          messageType: MessageType.WARNING);
    }
  }

  Future runFullLoadingFunction({
    required Future function,
  }) async {
    // checkConnection(() async {
    //   customLoader();
    //   await function;
    //   BotToast.closeAllLoading();
    // });
    if (isOnline) {
      customLoader();
      await function;
      BotToast.closeAllLoading();
    } else {
      CustomToast.showMeassge(
          message: 'Please check internet connection',
          messageType: MessageType.WARNING);
    }
  }
}
