import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool darkMode = false,
  }) : super(const ThemeState(isDarkMode: false));

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void setDarkMode() {
    emit(const ThemeState(isDarkMode: true));
  }

  void setLightMode() {
    emit(const ThemeState(isDarkMode: false));
  }

  void setTheme(bool darkMode) {
    emit(ThemeState(isDarkMode: darkMode));
  }
}
