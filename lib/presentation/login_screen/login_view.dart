import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hydrus/config/authentication/authentication.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/core/widgets/responsive_builder.dart';
import 'package:hydrus/presentation/login_screen/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveBuilder(
          mobileBuilder: _loginPageMobileScreenWidget,
          tabletBuilder: _loginPageDesktopScreenWidget,
          desktopBuilder: _loginPageDesktopScreenWidget,
        ),
      ),
      // }
    );
  }

  Widget _loginPageDesktopScreenWidget(context, constraints) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Flexible(
          child: Container(
            height: size.height,
            child: Center(
              child: Container(
                width: 200,
                height: 100,
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: kSpacing * 2),
                  SizedBox(
                      width: size.width / 1.5,
                      child: _loginPageMobileScreenWidget(context, constraints))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginPageMobileScreenWidget(context, constraints) {
    // return Container(height: 500, child: Expanded(child: Container()));
    return Builder(builder: (context) {
      return Container(
        height: context.height,
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: kSpacing * 5),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: kSpacing * 2),
                        Text(
                          'Access your account',
                          style: AppStyle.textstyleregorange16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kSpacing * 2),
                  Column(
                    children: [
                      _EmailInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      _PasswordInput(),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(12)),
                  Padding(
                    padding: const EdgeInsets.only(top: kSpacing),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      // spacing: ,
                      children: <Widget>[
                        const SizedBox(width: kSpacing),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kSpacing / 5),
                          child: GestureDetector(
                            child: const Text('Did you forget your password?'),
                            onTap: () {
                              // Get.offNamed(Routes.forgotPassword);
                            },
                          ),
                        ),
                        const SizedBox(height: kSpacing * 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(child: _LoginButton()),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kSpacing * 3),
                          child: _NewAcctButton(),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      );
    });
  }
}

///Do not forget to turn this into an email and change everything on it
class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email)),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.76)),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            hintText: 'Email',
            errorText: state.email.invalid ? 'Invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.76)),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            hintText: 'Password',
            errorText: state.password.invalid ? 'Invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Container(
                height: 50,
                width: 250,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: ColorConstant.xenteblue,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: InkWell(
                    key: const Key('loginForm_continue_raisedButton'),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        'Login',
                        style: AppStyle.buttontextstyleregular18,
                      ),
                    ),
                    onTap: state.status.isValidated
                        ? () {
                            context
                                .read<LoginBloc>()
                                .add(const LoginSubmitted());
                          }
                        : null,
                  ),
                ),
              );
      },
    );
  }
}

class _NewAcctButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text('Don’t have an account'),
      onTap: () {
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationStatusChanged(AuthenticationStatus.signup));
      },
    );
  }
}



// // ignore_for_file: unused_field, prefer_const_constructors

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:hydrus/core/app_export.dart';

// // Create a Form widget.
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   LoginScreenState createState() {
//     return LoginScreenState();
//   }
// }

// class LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           elevation: 0.0,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             color: kOrange,
//             iconSize: 30,
//           ),
//           backgroundColor: Colors.white),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.symmetric(
//               horizontal: getHorizontalSize(20),
//               vertical: getVerticalSize(100)),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(25))),
//           padding: EdgeInsets.symmetric(
//               horizontal: getHorizontalSize(20), vertical: getVerticalSize(20)),
//           child: Align(
//             alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Center(
//                     child: Text(
//                   'Login',
//                   style: AppStyle.textstyleregular25,
//                 )),
//                 SizedBox(
//                   height: getVerticalSize(20),
//                 ),
//                 Center(
//                     child: Text(
//                   'Access your account',
//                   textAlign: TextAlign.center,
//                   style: AppStyle.textstyleregorange16,
//                 )),
//                 SizedBox(
//                   height: getVerticalSize(40),
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       CustomFormField(
//                         title: 'Email',
//                         validateFunction: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                           return null;
//                         },
//                       ),
//                       CustomFormField(
//                         title: 'Password',
//                         validateFunction: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please fill out this field';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: getVerticalSize(30),
//                       ),
//                       RichText(
//                           text: TextSpan(
//                               text: 'Did you forgot your Password?',
//                               style: AppStyle.textstyleregular16,
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.pushNamed(
//                                       context, '/recoverPassword');
//                                 })),
//                       SizedBox(
//                         height: getVerticalSize(20),
//                       ),
//                       SendButton(
//                           buttonTitle: 'Login',
//                           buttonColor: ColorConstant.xenteblue,
//                           function: () {
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               Get.toNamed(AppRoutes.selectAccountScreen);
//                             }
//                           }),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       HyperLink(
//                         text1: 'Don’t have an account',
//                         kolor: kBlack,
//                         fontSize: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
