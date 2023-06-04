import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'langs_state.dart';

class LangsCubit extends Cubit<LangsState> {
  LangsCubit() : super(LangsInitial());

  static String selectedlang = "English";

}
