part of 'show_snackbar_bloc.dart';

@immutable
abstract class ShowSnackbarState {}

class ShowSnackbarInitial extends ShowSnackbarState {}

class ShowSnackbarLoading extends ShowSnackbarState {}

class ShowSnackbarSuccess extends ShowSnackbarState {}
