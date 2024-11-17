import 'package:networks_app/features/authentication/models/refresh_model.dart';

abstract class RefreshRepository{
  Future<RefreshModel> refresh();
}