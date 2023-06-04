import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selsect_profile_state.dart';

class SelectProfileCubit extends Cubit<SelectProfileState> {
  SelectProfileCubit() : super(SelectProfileInitial());
  static String profileType = "";
}
