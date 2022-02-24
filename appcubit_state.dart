part of 'appcubit_cubit.dart';

abstract class AppcubitState extends Equatable {}

class AppcubitInitial extends AppcubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppcubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppcubitState {
  LoadedState({required this.places});

  List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailsState extends AppcubitState {
  DetailsState({required this.placess});
  final DataModel placess;

  @override
  List<Object> get props => [placess];
}

class WelcomeState extends AppcubitState {
  @override
  List<Object> get props => [];
}
