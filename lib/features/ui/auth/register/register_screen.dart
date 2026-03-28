import 'package:ecommerce_route/core/config/di.dart';
import 'package:ecommerce_route/core/utils/dialog_utils.dart';
import 'package:ecommerce_route/features/ui/auth/auth_states.dart';
import 'package:ecommerce_route/features/ui/auth/register/cubit/register_cubit.dart';
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

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController(
    text: "John Doe",
  );
  TextEditingController phoneController = TextEditingController(
    text: "0123456789",
  );
  TextEditingController mailController = TextEditingController(
    text: "vV2dM@example.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "12345678",
  );
  TextEditingController rePasswordController = TextEditingController(
    text: "12345678",
  );

  RegisterCubit registerCubit = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, AuthStates>(
      bloc: registerCubit,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading..');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            title: 'Error',
            context: context,
            message: state.errorMsg,
          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            title: 'Success',
            context: context,
            message: 'Register Successfully',
            posActionName: 'ok',
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 91.h,
                  bottom: 10.h,
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
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: registerCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Full Name", style: AppStyles.medium18White),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.name,
                              isObscureText: false,
                              hintText: "enter your full name",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: fullNameController,
                              validator: AppValidators.validateFullName,
                            ),
                            Text(
                              "Mobile Number",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.phone,
                              isObscureText: false,
                              hintText: "enter your mobile number",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: phoneController,
                              validator: AppValidators.validatePhoneNumber,
                            ),
                            Text(
                              "E-mail address",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.emailAddress,
                              isObscureText: false,
                              hintText: "enter your email address",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: mailController,
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
                            Text("RePassword", style: AppStyles.medium18White),
                            CustomTextFormField(
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              hintText: "enter your password",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: rePasswordController,
                              validator: (value){
                                if(value != passwordController.text){
                                  return "Password not match";
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility_off),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35.h),
                              child: CustomElevatedButton(
                                backgroundColor: AppColors.whiteColor,
                                textStyle: AppStyles.semi20Primary,
                                text: "Sign up",
                                onPressed: () {
                                  registerCubit.register(
                                    mailController.text,
                                    passwordController.text,
                                    fullNameController.text,
                                    phoneController.text,
                                    rePasswordController.text,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.loginRoute,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        'Already have an account? login',
                                        style: AppStyles.medium18White,
                                        maxLines: 1,
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
    );
  }
}
