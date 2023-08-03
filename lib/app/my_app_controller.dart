import 'package:foodordering/core/enums/connectivity_status.dart';
import 'package:foodordering/core/services/base_controller.dart';
import 'package:foodordering/core/services/connectivity_service.dart';
import 'package:foodordering/ui/shared/utils.dart';

class MyAppController extends BaseController {
  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;

  @override
  void onInit() {
    listenToConnectionStatus();
    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}
