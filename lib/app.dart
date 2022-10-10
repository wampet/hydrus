import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrus/config/authentication/authentication.dart';
import 'package:hydrus/config/authentication/controllers/auth_controller.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/sign_up/sign_up.dart';

import 'presentation/login_screen/bloc/login_bloc.dart';

class hydrus extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  hydrus({Key? key, required this.authenticationRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // register controllers, blocs, providers, etc
    return serviceRegistrations();
  }

  //
  Widget serviceRegistrations() {
    // Auth Controller
    Get.put(AuthController(authenticationRepository: authenticationRepository));

    // add Blocs
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          // BlocProvider(create: (context) {
          //   return ForgotPasswordCubit();
          // }),
          BlocProvider(create: (context) {
            return LoginBloc(
              authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
            );
          }),
          BlocProvider(create: (context) {
            return SignUpBloc(
              authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
            );
          }),
          // BlocProvider(create: (context) {
          //   return OnboardingBloc(
          //     authenticationRepository:
          //         RepositoryProvider.of<AuthenticationRepository>(context),
          //   );
          // }),
          // BlocProvider(create: (context) {
          //   return ValidateOtpCubit();
          // }),
          // BlocProvider(create: (context) {
          //   return ConfirmForgotPasswordCubit();
          // })
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();
  AuthController authController = Get.find();
  List<AppLifecycleState> stateArr = [];
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    stateArr.add(state);
    switch (state) {
      case AppLifecycleState.inactive:
        _inactive(stateArr);
        break;
      case AppLifecycleState.resumed:
        _resumed(stateArr);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.unknown:
                  Get.offAllNamed(AppRoutes.getStartedScreen);
                  break;
                case AuthenticationStatus.signup:
                  Get.offAllNamed(AppRoutes.loginScreen);
                  break;
                case AuthenticationStatus.authenticated:
                  Get.offAllNamed(AppRoutes.homeScreen);
                  break;
                case AuthenticationStatus.unauthenticated:
                  Get.offAllNamed(AppRoutes.loginScreen);
                  break;
                // case AuthenticationStatus.forgotPassword:
                //   Get.offAllNamed(Routes.forgotPassword);
                //   break;
                case AuthenticationStatus.validateOtp:
                  Get.offAllNamed(AppRoutes.verifyAccountScreen);
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        },
        // theme: AppTheme.basic,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: 'hydrus',
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
        transitionDuration: Duration(milliseconds: 700));
  }

  void _inactive(List<AppLifecycleState> stateArr) {
    authController.appInactive(stateArr);
  }

  void _resumed(List<AppLifecycleState> stateArr) {
    authController.appResumed(stateArr);
  }
}
