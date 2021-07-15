import 'package:flutter/material.dart';
class RoundedInputField extends StatelessWidget {
        
        final String hintText;
        final IconData icon;
        final ValueChanged<String> onChanged;
        const RoundedInputField({
          Key key,
          this.hintText,
          this.icon=Icons.email_rounded,
          this.onChanged,
        }): super(key:key);
        @override
        Widget build(BuildContext context) {
          return TextFieldContainer(
           child:TextFormField(
             autofocus: true,
             keyboardType: TextInputType.emailAddress,
             onChanged: onChanged,
             decoration: InputDecoration(
               icon: Icon(
                Icons.email_rounded,
                 color: Color.fromRGBO(63,71,206,1.0),
               ),
               hintText:"E-mail",
               border:InputBorder.none,
             ),
             
           ),
         );
        }
      }
      class TextFieldContainer extends StatelessWidget {
        final Widget child;
        const TextFieldContainer({
          Key key,
          this.child,
        }): super(key:key);
        @override
        Widget build(BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return Container(            
            margin: EdgeInsets.symmetric(vertical: 10),
           padding: EdgeInsets.symmetric(horizontal:20, vertical:5),
           width: size.width*0.8,
           decoration: BoxDecoration(
             color: Color.fromRGBO(172,176,234,1.0),
             borderRadius: BorderRadius.circular(30)
             ),
             child:child,
          );
        }
      }
      class RoundedPasswordField extends StatelessWidget {
        final String hintText;
        final IconData icon;
        final ValueChanged<String> onChanged;
        const RoundedPasswordField({
          Key key,
          this.hintText,
          this.icon=Icons.lock_outlined,
          this.onChanged,
        }): super(key:key);
        @override
        Widget build(BuildContext context) {
          return TextFieldContainer(
           child:TextFormField(
             autofocus: true,
             onChanged: onChanged,
             obscureText: true,
             keyboardType: TextInputType.text,
             decoration: InputDecoration(
               icon: Icon(
                icon,
                 color: Color.fromRGBO(63,71,206,1.0),
               ),
               hintText:" Password",
               border:InputBorder.none,
             ),
           ),
         );
        }
      }
      class RoundedCPFField extends StatelessWidget {
        final String hintText;
        final IconData icon;
        final ValueChanged<String> onChanged;
        const RoundedCPFField({
          Key key,
          this.hintText,
          this.icon=Icons.streetview_sharp,
          this.onChanged,
        }): super(key:key);
        @override
        Widget build(BuildContext context) {
          return TextFieldContainer(
           child:TextFormField(
             autofocus: true,
             keyboardType: TextInputType.number,
             onChanged: onChanged,
             decoration: InputDecoration(
               icon: Icon(
                icon,
                 color: Color.fromRGBO(63,71,206,1.0),
               ),
               hintText:" RG",
               border:InputBorder.none,
             ),
           ),
         );
        }
      }
       class RoundedNameField extends StatelessWidget {
        final String hintText;
        final IconData icon;
        final ValueChanged<String> onChanged;
        const RoundedNameField({
          Key key,
          this.hintText,
          this.icon=Icons.person_outline,
          this.onChanged,
        }): super(key:key);
        @override
        Widget build(BuildContext context) {
          return TextFieldContainer(
           child:TextFormField(
             autofocus: true,
             onChanged: onChanged,
             decoration: InputDecoration(
               icon: Icon(
                icon,
                 color: Color.fromRGBO(63,71,206,1.0),
               ),
               hintText:"Full Name ",
               border:InputBorder.none,
             ),
           ),
         );
        }
      }