import '/components/favorite_button/favorite_button_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_message_details_widget.dart' show BookMessageDetailsWidget;
import 'package:flutter/material.dart';

class BookMessageDetailsModel
    extends FlutterFlowModel<BookMessageDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for favoriteButton component.
  late FavoriteButtonModel favoriteButtonModel;

  @override
  void initState(BuildContext context) {
    favoriteButtonModel = createModel(context, () => FavoriteButtonModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    favoriteButtonModel.dispose();
  }
}
