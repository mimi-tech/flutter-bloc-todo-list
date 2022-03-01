import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/login_event.dart';
import 'package:todo_list/cubit/login_state.dart';
import 'package:todo_list/data/auth/auth_repository.dart';
import 'package:todo_list/data/auth/form_submission_status.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Username updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        throw Exception(e.toString());
        //yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
  }
}
