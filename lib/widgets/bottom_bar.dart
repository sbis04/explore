import 'package:explore/widgets/bottom_bar_column.dart';
import 'package:explore/widgets/info_text.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'Información',
                      s1: 'Contacto',
                      s2: 'Acerca de nosotros',
                      s3: 'Empleos',
                    ),
                    BottomBarColumn(
                      heading: 'Ayuda',
                      s1: 'Pago',
                      s2: 'Devoluciones',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'Social',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'Email',
                  text: 'ejemplo@gmail.com',
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Dirección',
                  text: 'Dirección de Ejemplo',
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2020 | Ejemplo',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'Información',
                      s1: 'Contacto',
                      s2: 'Acerca de nosotros',
                      s3: 'Empleos',
                    ),
                    BottomBarColumn(
                      heading: 'Ayuda',
                      s1: 'Pago',
                      s2: 'Devoluciones',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'Social',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'ejemplo@gmail.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Dirección',
                          text: 'Dirección de Ejemplo',
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2020 | Ejemplo',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
