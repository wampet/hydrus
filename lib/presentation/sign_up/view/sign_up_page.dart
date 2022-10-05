import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:user_repository/user_repository.dart';
import 'package:hydrus/config/authentication/authentication.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/core/widgets/responsive_builder.dart';
import 'package:hydrus/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:hydrus/presentation/sign_up/bloc/sign_up_state.dart';
import 'package:hydrus/presentation/sign_up/view/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveBuilder(
          mobileBuilder: _signUpMobileScreenWidget,
          tabletBuilder: _signUpDesktopScreenWidget,
          desktopBuilder: _signUpDesktopScreenWidget,
        ),
      ),
      // }
    );
  }

  Widget _signUpDesktopScreenWidget(context, constraints) {
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
                  SizedBox(
                      width: size.width / 1.5,
                      child: _signUpMobileScreenWidget(context, constraints))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ProjectCardData getSelectedProject() {
  //   return ProjectCardData(
  //     percent: .3,
  //     projectImage: AssetImage(ImageConstant.imgXenteLogo),
  //     projectName: "Paylinc",
  //     releaseTime: DateTime.now(),
  //   );

  Widget _signUpMobileScreenWidget(context, constraints) {
    return MobileSignUp();
  }
}

class MobileSignUp extends StatefulWidget {
  MobileSignUp({Key? key}) : super(key: key);

  @override
  _MobileSignUpState createState() => _MobileSignUpState();
}

class _MobileSignUpState extends State<MobileSignUp> {
  final int _numPages = 5;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final kTitleStyle = TextStyle(
    fontSize: 26.0,
    height: 1.5,
  );

  kSubtitleStyle(themeContext) => TextStyle(
        color: themeContext?.textTheme?.caption?.color,
        fontSize: 13.0,
        height: 1.2,
      );
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Builder(builder: (context) {
      var themeContext = Theme.of(context);
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: isActive
              ? themeContext.colorScheme.onBackground
              : themeContext.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeContext = Theme.of(context);
    return SafeArea(
      child: Container(
        height: size.height - 40,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kSpacing * 0.5, vertical: kSpacing),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      _aboutYouPage(themeContext),
                      _passwordPage(themeContext),
                      // _paytagPage(themeContext),
                      _emailPage(themeContext),
                      _companyDetailsPage(themeContext),
                    ],
                  ),
                ),
              ),
              SizedBox(height: kSpacing * 5),
              Padding(
                padding: const EdgeInsets.only(bottom: kSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage == 0
                      ? Container(
                          child: Builder(builder: (context) {
                            return Align(
                              alignment: FractionalOffset.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(AuthenticationStatusChanged(
                                          AuthenticationStatus
                                              .unauthenticated));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Log in ?',
                                      style: TextStyle(
                                        color: themeContext
                                            .colorScheme.onBackground,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        )
                      : Container(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back,
                                    color:
                                        themeContext.colorScheme.onBackground,
                                    size: 30.0,
                                  ),
                                  SizedBox(width: 10.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                  _currentPage == _numPages - 1
                      ? (Expanded(child: _MobileSignUpGetStartedButton()))
                      : Container(),
                  _currentPage == _numPages - 1
                      ? Container()
                      : Container(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(width: 10.0),
                                  Icon(
                                    Icons.arrow_forward,
                                    color:
                                        themeContext.colorScheme.onBackground,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailPage(themeContext) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 120.0,
          child: Padding(
            padding: EdgeInsets.all(kSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Email",
                  style: kTitleStyle,
                ),
                SizedBox(height: 15.0),
                Text(
                  'enter your email',
                  style: kSubtitleStyle(themeContext),
                ),
              ],
            ),
          ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Column(
            children: [EmailInput(), CountryCodeInput(), CurrencyCodeInput()],
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _companyDetailsPage(themeContext) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 220.0,
          child: Padding(
            padding: EdgeInsets.all(kSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Finally, your company details",
                  style: kTitleStyle,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Tell us more about your company',
                  style: kSubtitleStyle(themeContext),
                ),
              ],
            ),
          ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Column(
            children: [
              BusinessNameInput(),
              Website(),
              IpnUri(),
            ],
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _aboutYouPage(themeContext) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 120.0,
          child: Padding(
            padding: EdgeInsets.only(top: kSpacing * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "About you",
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: kSpacing / 2,
                ),
                Text(
                  "Share with us more about you",
                  style: AppStyle.textstyleregorange16,
                ),
              ],
            ),
          ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Column(
            children: [
              FirstNameInput(),
              SizedBox(
                height: kSpacing / 6,
              ),
              LastNameInput(),
              SizedBox(
                height: kSpacing / 2,
              ),
              PhoneNumberInput()
            ],
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  // Widget _paytagPage(themeContext) {
  //   return Column(
  //     children: [
  //       Container(
  //         alignment: Alignment.topLeft,
  //         height: 150.0,
  //         child: Padding(
  //           padding: EdgeInsets.all(kSpacing),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text(
  //                 "Paytag",
  //                 style: kTitleStyle,
  //               ),
  //               SizedBox(height: 15.0),
  //               Text(
  //                 'Choose a one-time paytag for yourself. You\'ll use your paytag to make direct payments.',
  //                 style: kSubtitleStyle(themeContext),
  //               ),
  //             ],
  //           ),
  //         ),
  //         // ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(kSpacing),
  //         child: PaytagInput(),
  //       ),
  //     ],
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   );
  // }

  Widget _passwordPage(themeContext) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 120.0,
          child: Padding(
            padding: EdgeInsets.all(kSpacing * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Your security",
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: kSpacing / 2,
                ),
                Text(
                  "Let us keep your account safe",
                  style: AppStyle.textstyleregorange16,
                ),
              ],
            ),
          ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: PasswordInput(),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: ConfirmPasswordInput(),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}

class _MobileSignUpGetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      // buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: state.status.isSubmissionInProgress
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const CircularProgressIndicator(),
                  )
                : Text(
                    'Get Started',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 22.0,
                    ),
                  ),
            onPressed: () {
              context.read<SignUpBloc>().add(SignUpSubmitted());
            },
          ),
        );
      },
    );
  }
}
