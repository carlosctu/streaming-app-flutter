import 'package:components/image_component/config/streaming_app_assets.dart';
import 'package:components/row/text_icon_row/text_icon_row.dart';

mixin ImageComponentMixin {
  String getAsset(StreamingAppAssets asset) {
    const map = {
      StreamingAppAssets.facebook: "assets/images/facebook.png",
      StreamingAppAssets.github: "assets/images/github.png",
      StreamingAppAssets.google: "assets/images/google.png",
      StreamingAppAssets.twitter: "assets/images/twitter.png",
      StreamingAppAssets.logogif: "assets/images/logogif.gif",
      StreamingAppAssets.appLogo: "assets/json/appLogo.json",
      StreamingAppAssets.welcome: "assets/images/welcome.json",
    };
    return map[asset] ?? "";
  }

  String getIcon(IconAsset icon) {
    const map = {
      IconAsset.mail: "assets/icons/email.png",
    };
    return map[icon] ?? "";
  }
}
