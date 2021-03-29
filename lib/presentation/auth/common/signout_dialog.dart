import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingApp/application/auth/auth_bloc.dart';
import 'package:shoppingApp/main.dart';
import 'package:shoppingApp/presentation/core/app_router.gr.dart';
import 'package:shoppingApp/presentation/core/shopping_app.dart';

class BlurryDialog extends StatelessWidget {
  final String title;
  final String content;
  // VoidCallback continueCallBack;

  BlurryDialog({
    this.title,
    this.content,
  });
  final TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          unauthenticated: (s) {
            ExtendedNavigator.of(context).replace(Routes.signinPage);
            print(s);
          },
          authenticated: (s) {},
          orElse: () {
            print('=======> Error djdjdj');
          },
        );
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: new Text(
            title,
            style: textStyle,
          ),
          content: new Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Continue"),
              onPressed: () {
                context.read<AuthBloc>().add(AuthEvent.logoutRequested());
                print(initScreen);
                initScreen = null;
                print(initScreen);
                runApp(ShoppingApp());
                print("Logout Requested");
              },
            ),
            new FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
