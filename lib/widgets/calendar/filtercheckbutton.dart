import 'package:flutter/material.dart';

class FilterCheckButton extends StatefulWidget {
const FilterCheckButton({ Key? key }) : super(key: key);

  @override
  State<FilterCheckButton> createState() => _FilterCheckButtonState();

}

class _FilterCheckButtonState extends State<FilterCheckButton> {
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;

  @override
  Widget build(BuildContext context){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
             activeColor: Colors.blue,
              title: Text('Bitmiş Dersler'),
              value: option1,
              onChanged: (value) {
                setState(() {
                  option1 = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            CheckboxListTile(
              title: Text('Devam Eden Dersler'),
              value: option2,
              onChanged: (value) {
                setState(() {
                  option2 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Satın Alınmış Dersler'),
              value: option3,
              onChanged: (value) {
                setState(() {
                  option3 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Başlamamış Dersler'),
              value: option4,
              onChanged: (value) {
                setState(() {
                  option4 = value!;
                });
              },
            ),
          ],
        );
   
  }
}
  