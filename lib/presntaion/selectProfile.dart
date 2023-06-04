// ignore_for_file: camel_case_types, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveasy/Helper/Colors.dart';
import 'package:liveasy/Helper/MyApplication.dart';
import 'package:liveasy/Helper/widgets/submitButton.dart';
import 'package:liveasy/businesLogic/phoneFill/phone_fill_cubit.dart';
import 'package:liveasy/businesLogic/selectProfile/selsect_profile_cubit.dart';
import 'package:liveasy/presntaion/otpVerify.dart';

class selectProfile extends StatelessWidget {
  const selectProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myApplication.keyboardFocus(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: myApplication.hightClc(88, context),
              ),
              const Text(
                "Please select your profile",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              SizedBox(
                height: myApplication.hightClc(26, context),
              ),
              BlocBuilder<SelectProfileCubit, SelectProfileState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: myColors.darkblue)),
                        height: myApplication.hightClc(89, context),
                        width: myApplication.widthClc(328, context),
                        child: Padding(
                          padding: EdgeInsets.all(
                              myApplication.widthClc(16, context)),
                          child: Row(
                            children: [
                              SizedBox(
                                height: myApplication.hightClc(24, context),
                                width: myApplication.widthClc(24, context),
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: Radio(
                                    activeColor: myColors.darkblue,
                                      value: "Shipper",
                                      groupValue:
                                          SelectProfileCubit.profileType,
                                      onChanged: (val) {
                                        SelectProfileCubit.profileType = val!;
                                        BlocProvider.of<SelectProfileCubit>(
                                                context)
                                            .emit(SelectProfileInitial());
                                      }),
                                ),
                              ),
                              SizedBox(
                                width: myApplication.widthClc(16, context),
                              ),
                              Image.asset("assets/images/Shipper.png"),
                              SizedBox(
                                width: myApplication.widthClc(16, context),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Shipper",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                  SizedBox(
                                    height: myApplication.hightClc(8, context),
                                  ),
                                  const Text("Lorem ipsum dolor sit amet,",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400) ),
                                  const Text("consectetur adipiscing,",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400) ),


                                ],

                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: myApplication.hightClc(24, context),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: myColors.darkblue)),
                        height: myApplication.hightClc(89, context),
                        width: myApplication.widthClc(328, context),
                        child: Padding(
                          padding: EdgeInsets.all(
                              myApplication.widthClc(16, context)),
                          child: Row(
                            children: [
                              SizedBox(
                                height: myApplication.hightClc(24, context),
                                width: myApplication.widthClc(24, context),
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: Radio(
                                      activeColor: myColors.darkblue,
                                      value: "Transporter",
                                      groupValue:
                                      SelectProfileCubit.profileType,
                                      onChanged: (val) {
                                        SelectProfileCubit.profileType = val!;
                                        BlocProvider.of<SelectProfileCubit>(
                                            context)
                                            .emit(SelectProfileInitial());
                                      }),
                                ),
                              ),
                              SizedBox(
                                width: myApplication.widthClc(16, context),
                              ),
                              Image.asset("assets/images/Transporter.png"),
                              SizedBox(
                                width: myApplication.widthClc(16, context),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Transporter",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                  SizedBox(
                                    height: myApplication.hightClc(8, context),
                                  ),
                                  const Text("Lorem ipsum dolor sit amet,",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400) ),
                                  const Text("consectetur adipiscing,",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400) ),


                                ],

                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  );
                },
              ),
              SizedBox(
                height: myApplication.hightClc(24, context),
              ),
              BlocConsumer<PhoneFillCubit, PhoneFillState>(
                listener: (context, state) {
                  if (state is PhoneFillSuccess) {
                    myApplication.showToast(
                        text: "sent Successfully", color: myColors.darkblue);
                    myApplication.navigateToReplace(context, const otpVerify());
                    BlocProvider.of<PhoneFillCubit>(context)
                        .emit(PhoneFillInitial());
                  } else if (state is PhoneFillFailuer) {
                    myApplication.showToast(text: "error", color: Colors.red);
                  }
                },
                builder: (context, state) {
                  if (state is PhoneFillLoading) {
                    return Container(
                      width: myApplication.widthClc(328, context),
                      height: myApplication.hightClc(56, context),
                      color: myColors.darkblue,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return submitButton(
                        mywidth: myApplication.widthClc(328, context),
                        myhight: myApplication.hightClc(56, context),
                        text: "CONTINUE",
                        ontap: () async {
                          if (kDebugMode) {
                            print("Done");
                          }
                          myApplication.showToast(text: "Done", color: myColors.darkblue);

                        });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
