import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_route/core/config/di.dart';
import 'package:ecommerce_route/core/utils/dialog_utils.dart';
import 'package:ecommerce_route/features/ui/auth/auth_states.dart';
import 'package:ecommerce_route/features/ui/auth/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(
    text: "ahmedmuttii4012@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "Ahmed@123",
  );
  LoginCubit loginCubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, AuthStates>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading..');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            title: 'Error',
            context: context, message: state.errorMsg);
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            title: 'Success',
            context: context,
            message: 'Login Successfully',
            posActionName: 'ok',
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 91.h,
                    bottom: 87.h,
                    left: 97.w,
                    right: 97.w,
                  ),
                  child: Image.asset(AppAssets.appBarLeading),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'Welcome Back To Route',
                        style: AppStyles.semi24White,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Please sign in with your mail',
                        style: AppStyles.light16White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: loginCubit.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("User Name", style: AppStyles.medium18White),
                              CustomTextFormField(
                                isPassword: false,
                                keyboardType: TextInputType.text,
                                isObscureText: false,
                                hintText: "enter your name",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: emailController,
                                validator: AppValidators.validateEmail,
                              ),
                              Text("Password", style: AppStyles.medium18White),
                              CustomTextFormField(
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                isObscureText: true,
                                hintText: "enter your password",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: passwordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: AppStyles.regular18White,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                  backgroundColor: AppColors.whiteColor,
                                  textStyle: AppStyles.semi20Primary,
                                  text: "Login",
                                  onPressed: () {
                                    loginCubit.login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.registerRoute,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Don’t have an account? Create Account',
                                          style: AppStyles.medium18White,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
