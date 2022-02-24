import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_project/dataService.dart';
import 'package:new_project/datamodel/datamodel.dart';

part 'appcubit_state.dart';

class AppcubitCubit extends Cubit<AppcubitState> {
  AppcubitCubit({required this.data}) : super(AppcubitInitial()) {
    emit(WelcomeState());
  }
  late final placess;
  final DataServices data;
  void getDataa() async {
    try {
      emit(LoadingState());
      placess = await data.getdata();
      emit(LoadedState(places: placess));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailsState(placess: data));
  }

  goHome() {
    emit(LoadedState(places: placess));
  }
}
