import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

import 'new_post_controller.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  bool _checkbox = false;
  final controller = NewPostController();
  bool isLoading = false;

  void postar() async {
    if (controller.valueChoose == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(
          content: const Text('Escolha uma categoria'),
        ),
      );
    } else if (controller.content.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(
          content: const Text('Qual seu relato?'),
        ),
      );
    } else {
      setState(() {
        isLoading = true;
      });

      final result = await controller.postar(context);

      setState(() {
        isLoading = false;
      });

      if (result) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.roxo,
      ),
      body: Stack(
        children: [
          Container(color: AppColors.roxo),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.branco,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(70),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 140,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          "Categoria",
                          style: GoogleFonts.breeSerif(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(62, 71, 208, 1.0),
                          ),
                        ),
                        dropdownColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromRGBO(62, 71, 208, 1.0),
                        ),
                        iconSize: 30,
                        style: GoogleFonts.breeSerif(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(62, 71, 208, 1.0),
                        ),
                        value: controller.valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            controller.valueChoose = newValue;
                          });
                        },
                        items: controller.categorias.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextField(
                            controller: controller.content,
                            maxLength: 1000,
                            maxLines: 15,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite seu relato',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 54,
                            width: 150,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.2, 1],
                                  colors: [
                                    Colors.cyan[700]!,
                                    Color.fromRGBO(62, 71, 208, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: TextButton(
                              onPressed: postar,
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                "Postar",
                                style: GoogleFonts.breeSerif(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text('Anônimo'),
                          value: _checkbox,
                          onChanged: (value) {
                            setState(() {
                              _checkbox = !_checkbox;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
