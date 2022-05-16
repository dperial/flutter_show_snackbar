import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_snackbar_event.dart';
part 'show_snackbar_state.dart';

class ShowSnackbarBloc extends Bloc<ShowSnackbarEvent, ShowSnackbarState> {
  ShowSnackbarBloc() : super(ShowSnackbarInitial()) {
    on<FetchData>((event, emit) async {
      emit(ShowSnackbarLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(ShowSnackbarSuccess());
    });
  }
}
