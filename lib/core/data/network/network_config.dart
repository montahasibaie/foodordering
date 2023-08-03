import 'package:foodordering/core/data/repositories/shared_prefreance_repository.dart';
import 'package:foodordering/core/enums/request_type.dart';
import 'package:foodordering/ui/shared/utils.dart';

class NetworkConfig {
  static String BASE_API = 'api/web/';

  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders}) {
    return {
      'Accept-Language': storage.getAppLanguage(),
      if (needAuth!)
        'Authorization': 'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type != RequestType.GET) 'Content-Type': 'application/json',
      ...extraHeaders ?? {}
    };
  }
}
