import 'package:foodordering/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiUrl('user/login');
  static String register =
      NetworkConfig.getFullApiUrl('JoinApplication/Create');
}
