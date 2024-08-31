part of 'details_view.dart';

class DetailsBloc extends Bloc<DetailsEvent,DetailsState>{

  DetailsBloc(super.initialState){
    on<SetProductDetails>(setProductDetails);
  }

  setProductDetails (SetProductDetails event,Emitter<DetailsState> emit){

  }
}