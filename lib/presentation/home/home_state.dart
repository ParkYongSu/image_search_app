import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/photo.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState  {
	factory HomeState ({
    required List<Photo> photos,
    required bool isLoading,
  }) = _HomeState ;
}