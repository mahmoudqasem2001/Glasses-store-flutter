import 'package:bloc/bloc.dart';
import '../../../providers/auth.dart';

class AuthCubit extends Cubit<Auth> {
  AuthCubit() : super(Auth());

  void setCustomerData(Auth authData) {
    emit(authData);
  }
}
