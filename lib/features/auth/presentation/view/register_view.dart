// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../domain/entity/auth_entity.dart';
// import '../viewmodel/auth_view_model.dart';

// class RegisterView extends ConsumerStatefulWidget {
//   const RegisterView({super.key});

//   @override
//   ConsumerState<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends ConsumerState<RegisterView> {
//   //colors
//   Color backgroundColor1 = const Color(0xffE9EAF7);
//   Color backgroundColor2 = const Color(0xffF4EEF2);
//   Color backgroundColor3 = const Color(0xffEBEBF2);
//   Color backgroundColor4 = const Color(0xffE3EDF5);
//   Color primaryColor = const Color(0xffD897FD);
//   Color textColor1 = const Color(0xff353047);
//   Color textColor2 = const Color(0xff6F6B7A);
//   Color buttonColor = const Color(0xffFD6B68);

//   get alignment => null;
//   final _key = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _phoneController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             colors: [
//               backgroundColor2,
//               backgroundColor2,
//               backgroundColor4,
//             ],
//           ),
//         ),
//         child: SafeArea(
//             child: ListView(
//           children: [
//             //adding logo
//             SizedBox(height: size.height * 0.03),
//             // Adding logo
//             Image.asset(
//               'assets/images/logo.png', // Replace with your logo's asset path
//               height: 150, // Adjust the height as needed
//               width: 150, // Adjust the width as needed
//             ),
//             SizedBox(height: size.height * 0.03),
//             Text(
//               "Hello! Create Account",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 27,
//                 color: textColor1,
//               ),
//             ),
//             const SizedBox(height: 0),
//             Text.rich(
//               textAlign: TextAlign.center,
//               TextSpan(
//                   text: "Already a member? ",
//                   style: TextStyle(
//                     color: textColor2,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     fontFamily: "DMSans",
//                   ),
//                   children: const [
//                     TextSpan(
//                       text: "Log in",
//                       style: TextStyle(
//                         color: Colors.orangeAccent,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   ]),
//             ),

//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             // for username and password
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 25,
//                 vertical: 10,
//               ),
//               child: TextField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 22,
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     hintText: 'Name',
//                     hintStyle: const TextStyle(
//                       color: Colors.black45,
//                       fontSize: 19,
//                     ),
//                     suffixIcon: const Icon(
//                       Icons.visibility_off_outlined,
//                       color: Colors.white,
//                     )),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 25,
//                 vertical: 10,
//               ),
//               child: TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 22,
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     hintText: "Email",
//                     hintStyle: const TextStyle(
//                       color: Colors.black45,
//                       fontSize: 19,
//                     ),
//                     suffixIcon: const Icon(
//                       Icons.visibility_off_outlined,
//                       color: Colors.white,
//                     )),
//               ),
//             ),

//             //new container paste
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 25,
//                 vertical: 10,
//               ),
//               child: TextField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 22,
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     hintText: "Phone",
//                     hintStyle: const TextStyle(
//                       color: Colors.black45,
//                       fontSize: 19,
//                     ),
//                     suffixIcon: const Icon(
//                       Icons.visibility_off_outlined,
//                       color: Colors.white,
//                     )),
//               ),
//             ),

//             Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 25,
//                 vertical: 10,
//               ),
//               child: TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 22,
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     hintText: "Password",
//                     hintStyle: const TextStyle(
//                       color: Colors.black45,
//                       fontSize: 19,
//                     ),
//                     suffixIcon: const Icon(
//                       Icons.visibility_off_outlined,
//                       color: Colors.black,
//                     )),
//               ),
//             ),

//             const SizedBox(height: 10),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "Recovery Password ",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: textColor2,
//                 ),
//               ),
//             ),
//             SizedBox(height: size.height * 0.04),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 children: [
//                   // for sign in button
//                   Container(
//                     height: 60,
//                     width: size.width,
//                     // padding: const EdgeInsets.symmetric(vertical: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.orangeAccent,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Center(
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           var user = AuthEntity(
//                             email: _emailController.text,
//                             username: _usernameController.text,
//                             password: _passwordController.text,
//                             phone: _phoneController.text,
//                           );

//                           ref
//                               .read(authViewModelProvider.notifier)
//                               .registerUser(user);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orangeAccent,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 100,
//                             vertical: 15,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                         child: const Text(
//                           "Sign Up",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.06),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 2,
//                         width: size.width * 0.2,
//                         color: Colors.black12,
//                       ),
//                       Text(
//                         "  Or continue with   ",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: textColor2,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Container(
//                         height: 2,
//                         width: size.width * 0.2,
//                         color: Colors.black12,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.06),
//                   Container(
//                     height: 60, // connect with google size increased
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/images/google.png',
//                             height: 30,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           const Text(
//                             "Connect with Google",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   //adding space between connect with google and facebook button
//                   SizedBox(height: size.height * 0.02),

//                   //this container for login with facebook
//                   Container(
//                     height: 60, // connect with google size increased
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/images/facebook.png',
//                             height: 30,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           const Text(
//                             "Connect with Facebook",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   //SizedBox(height: size.height * 0.07),
//                 ],
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }

//   Container socialIcon(image) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 32,
//         vertical: 15,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: Colors.white,
//           width: 2,
//         ),
//       ),
//       child: Image.asset(
//         image,
//         height: 35,
//       ),
//     );
//   }

//   Container myTextField(String hint, Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 25,
//         vertical: 10,
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 22,
//             ),
//             fillColor: Colors.white,
//             filled: true,
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             hintText: hint,
//             hintStyle: const TextStyle(
//               color: Colors.black45,
//               fontSize: 19,
//             ),
//             suffixIcon: Icon(
//               Icons.visibility_off_outlined,
//               color: color,
//             )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entity/auth_entity.dart';
import '../viewmodel/auth_view_model.dart';
import '../navigator/register_navigator.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  // Colors
  Color backgroundColor1 = const Color(0xffE9EAF7);
  Color backgroundColor2 = const Color(0xffF4EEF2);
  Color backgroundColor3 = const Color(0xffEBEBF2);
  Color backgroundColor4 = const Color(0xffE3EDF5);
  Color primaryColor = const Color(0xffD897FD);
  Color textColor1 = const Color(0xff353047);
  Color textColor2 = const Color(0xff6F6B7A);
  Color buttonColor = const Color(0xffFD6B68);

  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              backgroundColor2,
              backgroundColor2,
              backgroundColor4,
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.03),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                "Hello! Create Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  color: textColor1,
                ),
              ),
              const SizedBox(height: 0),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "Already a member? ",
                  style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: "DMSans",
                  ),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(registerViewNavigatorProvider)
                              .openLoginView();
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 22),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Name',
                    hintStyle:
                        const TextStyle(color: Colors.black45, fontSize: 19),
                    suffixIcon: const Icon(Icons.visibility_off_outlined,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 22),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Email",
                    hintStyle:
                        const TextStyle(color: Colors.black45, fontSize: 19),
                    suffixIcon: const Icon(Icons.visibility_off_outlined,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 22),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Phone",
                    hintStyle:
                        const TextStyle(color: Colors.black45, fontSize: 19),
                    suffixIcon: const Icon(Icons.visibility_off_outlined,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 22),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Password",
                    hintStyle:
                        const TextStyle(color: Colors.black45, fontSize: 19),
                    suffixIcon: const Icon(Icons.visibility_off_outlined,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Recovery Password ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textColor2,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            var user = AuthEntity(
                              email: _emailController.text,
                              username: _usernameController.text,
                              password: _passwordController.text,
                              phone: _phoneController.text,
                            );
                            ref
                                .read(authViewModelProvider.notifier)
                                .registerUser(user);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 2,
                            width: size.width * 0.2,
                            color: Colors.black12),
                        Text(
                          "  Or continue with   ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor2,
                              fontSize: 16),
                        ),
                        Container(
                            height: 2,
                            width: size.width * 0.2,
                            color: Colors.black12),
                      ],
                    ),
                    SizedBox(height: size.height * 0.06),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png', height: 30),
                            const SizedBox(width: 10),
                            const Text(
                              "Connect with Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/facebook.png',
                                height: 30),
                            const SizedBox(width: 10),
                            const Text(
                              "Connect with Facebook",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
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
