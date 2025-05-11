import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppin/screen/checkout.dart';
import 'package:shoppin/screen/congrats_screen.dart';
import 'package:shoppin/screen/empty_cart_screen.dart';
import 'package:shoppin/screen/finallly_page.dart';
import 'package:shoppin/screen/home_screen.dart';
import 'package:shoppin/screen/instructions_screen.dart';
import 'package:shoppin/screen/new_password_screen.dart';
import 'package:shoppin/screen/password_reset_screen.dart';
import 'package:shoppin/screen/payment_method.dart';
import 'package:shoppin/screen/products_screen.dart';
import 'package:shoppin/screen/rate_screen.dart';
import 'package:shoppin/screen/reviews_screen.dart';
import 'package:shoppin/screen/shipping_address.dart';
import 'package:shoppin/screen/sign_in_screen.dart';
import 'package:shoppin/screen/sign_up_screen.dart';
import 'package:shoppin/screen/successful.dart';
import 'package:shoppin/screen/to_email_acc.dart';
import 'package:shoppin/screen/your_cart_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/', name: 'home', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/sign-in',
      name: 'singIn',
      builder: (context, state) => const SignInScreen()),
  GoRoute(
      path: '/sign-up',
      name: 'signUp',
      builder: (context, state) => const SignUpScreen()),
  GoRoute(
      path: '/reset-password',
      name: 'resetPassword',
      builder: (context, state) => const PasswordResetScreen(),
    routes: [
      GoRoute(
          path: 'instructions',
          name: 'instructions',
          builder: (context, state){
            final extra = state.extra;
            if (extra is! Map<String, dynamic>) {
              return Scaffold(
                body: Center(
                  child: Text("Invalid data"),
                ),
              );
            }
            return InstructionsScreen(
              email: extra['email'],
            );
          },
        routes: [
          GoRoute(
              path: 'to-email',
              name: 'toEmail',
               builder: (context, state){
                 final extra = state.extra;
                 if (extra is! Map<String, dynamic>) {
                   return Scaffold(
                     body: Center(
                       child: Text("Invalid data"),
                     ),
                   );
                 }
                 return ToEmailAcc(
                   email: extra['email'],
                 );
               },
            routes: [
              GoRoute(
                  path: 'new-pass-screen',
                  name: 'newPassword',
                builder: (context, state){
                  final extra = state.extra;
                  if (extra is! Map<String, dynamic>) {
                    return Scaffold(
                      body: Center(
                        child: Text("Invalid data"),
                      ),
                    );
                  }
                  return NewPasswordScreen(
                      email: extra['email']
                  );
                },
                routes: [
                  GoRoute(
                      path: 'successful',
                    name: 'successful',
                    builder: (context, state){
                        return Successful();
                    }
                  )
                ]
              )
            ]
          ),
        ]
      ),

    ]
  ),
  GoRoute(
      path: '/congrats',
      name: 'congrats',
      builder: (context, state) => const Congrats()),
  GoRoute(
      path: '/products',
      name: 'products',
      builder: (context, state) => const ProductsScreen(),
      routes: [
        GoRoute(
            path: 'rate',
            name: 'rate',
            builder: (context, state) {
              final extra = state.extra;
              if (extra is! Map<String, dynamic>) {
                return Scaffold(
                  body: Center(
                    child: Text("Invalid data"),
                  ),
                );
              }
              return RateScreen(
                name: extra['name'],
                image: extra['image'],
                price: extra['price'],
                category: extra['category'],
                color: extra['color'],
              );
            },
            routes: [
              GoRoute(
                path: 'reviews',
                name: 'reviews',
                builder: (context, state) {
                  return ReviewsScreen();
                },
              ),
              GoRoute(
                  path: 'your-cart',
                  name: 'yourCart',
                  builder: (context, state) {
                    return YourCart();
                  },
                  routes: [
                    GoRoute(
                      path: 'empty',
                      name: 'empty',
                      builder: (context, state) {
                        return EmptyCart();
                      },
                    ),
                    GoRoute(
                        path: 'shipping',
                        name: 'shipping',
                        builder: (context, state) {
                          return ShippingAddress();
                        },
                        routes: [
                          GoRoute(
                              path: 'payment',
                              name: 'payment',
                              builder: (context, state) {
                                final extra = state.extra;
                                if (extra is! Map<String, dynamic>) {
                                  return Scaffold(
                                    body: Center(
                                      child: Text("Invalid data"),
                                    ),
                                  );
                                }
                                return PaymentMethod(
                                  country: extra['country'],
                                  city: extra['city'],
                                  postcode: extra['postcode'],
                                  street: extra['street'],
                                );
                              },
                               routes: [
                                 GoRoute(
                                     path: 'checkout',
                                     name: 'checkOut',
                                     builder: (context, state){
                                       final extra = state.extra;
                                       if (extra is! Map<String, dynamic>) {
                                         return Scaffold(
                                           body: Center(
                                             child: Text("Invalid data"),
                                           ),
                                         );
                                       }
                                       return Checkout(
                                         country: extra['country'],
                                         city: extra['city'],
                                         postcode: extra['postcode'],
                                         street: extra['street'],
                                         name: extra['name'],
                                         cardNum: extra['cardNum'],
                                         cvc: extra['cvc'],
                                         date: extra['date'],
                                         image: extra['image'],
                                       );
                                     },
                                   routes: [
                                     GoRoute(
                                         path: 'finally',
                                         name: 'finally',
                                       builder: (context, state){
                                           return const FinallyPage();
                                       }
                                     )
                                   ]
                                 )
                               ]
                              )
                        ])
                  ]),
            ])
      ]),
]);
