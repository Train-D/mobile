import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/components.dart';

class TermsOfServiceScreen extends StatelessWidget {
  TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SharedComponents.linearGradientBg(
        colors: profileBg,
        child: Scaffold(
          backgroundColor: transparent,
          appBar: SharedComponents.defaultAppBar(context: context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 25.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Term of Service',
                    style: Theme.of(context).textTheme.displayLarge,
                    
                  ),
                  SizedBox(
                          height: 3.h,
                        ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: 5.h,),
                        
                        
                        Text(
                            'These Terms of Service ("Agreement") govern your use of the TrainD mobile application ("App") developed by the TrainD team. By accessing or using the App, you agree to be bound by this Agreement. If you do not agree with any part of this Agreement, you should not use the App.',
                            style: Theme.of(context).textTheme.displayMedium
                            ),
                        SizedBox(height: 3.h,),
                        Text(
                            'Acceptance of Terms By using the App, you acknowledge that you have read, understood, and accepted these Terms of Service. If you are using the App on behalf of an organization or entity, you represent and warrant that you have the authority to bind that organization or entity to these terms.',
                            style: Theme.of(context).textTheme.displayMedium
                            ),
                        SizedBox(height: 3.h,),
                        Text(
                            'Applicability This Agreement applies to all users of the App, including registered users and visitors. It governs your use of the App and any services, features, or content provided through the App.',
                            style: Theme.of(context).textTheme.displayMedium
                          ),
                        SizedBox(height: 3.h,),
                        Text(
                            'Purpose and Services The TrainD App aims to provide train tracking and ticket reservation services for train commuters in Egypt. It enables users to track train locations, estimate remaining time for train arrival, reserve tickets, manage personal profiles, view station information, and access other related features.',
                            style: Theme.of(context).textTheme.displayMedium
                          ),
                        SizedBox(height: 3.h,),
                        Text(
                            'User Responsibilities (a) Account Creation: Some features of the App may require creating a user account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.',
                            style: Theme.of(context).textTheme.displayMedium
                          ), 
                        SizedBox(height: 3.h,),
                        Text(
                            '(b) Compliance with Laws: You agree to use the App in compliance with all applicable laws, regulations, and third-party rights. You shall not engage in any activity that may harm or interfere with the proper functioning of the App or its services.',
                            style: Theme.of(context).textTheme.displayMedium
                          ),
                        SizedBox(height: 3.h,),
                        Text(
                            'Intellectual Property Rights The TrainD App and its contents, including but not limited to text, graphics, images, logos, and software, are the intellectual property of the TrainD team and are protected by applicable copyright, trademark, and other intellectual property laws. You may not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products, or services obtained from the App without prior written permission from the TrainD team.',
                            style: Theme.of(context).textTheme.displayMedium
                          ),
                        SizedBox(height: 3.h,),
                        Text(
                            'Data Privacy and Security Your use of the App is subject to our Privacy Policy, which outlines how we collect, use, store, and protect your personal information. By using the App, you consent to the collection and processing of your data as described in the Privacy Policy.',
                            style: Theme.of(context).textTheme.displayMedium
                          ),
                        SizedBox(height: 3.h,),
                        Text(
                            'Limitation of Liability To the maximum extent permitted by law, the TrainD team and its members shall not be liable for any direct, indirect, incidental, consequential, or special damages arising out of or in connection with your use of the App, even if advised of the possibility of such damages.',
                            style: Theme.of(context).textTheme.displayMedium
                          ),
                        SizedBox(height: 3.h,),
                        Text(
                            'Modification of the Agreement The TrainD team reserves the right to modify or update this Agreement at any time, without prior notice. Your continued use of the App after any changes to this Agreement constitutes your acceptance of the revised Agreement.',
                            style: Theme.of(context).textTheme.displayMedium
                          ),              
                     ],
                    ),
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
