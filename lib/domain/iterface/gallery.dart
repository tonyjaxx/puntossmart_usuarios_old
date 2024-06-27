import 'package:puntossmart/infrastructure/models/models.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import '../../domain/handlers/handlers.dart';

abstract class GalleryRepositoryFacade {
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
    String file,
    UploadType uploadType,
  );
}
