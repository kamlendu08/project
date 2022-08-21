import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

   // String name;
   // String email;
   // String password;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  // Widget _buildNameField(){
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: 'Enter name here',
  //     ),
  //     validator: (value){
  //       if(value == null || value.isEmpty){
  //         return 'Please enter some text';
  //       }
  //       return null;
  //     },
  //     onSaved: (value){
  //       name = value!;
  //     }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(24.0),
        // child: Form(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       _buildNameField(),
        //       SizedBox(height: 100,),
        //       ElevatedButton(
        //         child: Text('Submit', style: TextStyle(color: Colors.blue,
        //         fontSize: 16,),),
        //         onPressed: (){
        //           if(_formKey.currentState!.validate()){
        //             return;
        //           }
        //         },
        //       )
        //     ],
        //   ),
        // ),
        child: const MyCustomForm(),

      ),

    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value){
              if(value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing')),
                  );
                }
              }, child: const Text('Submit'),
            ),
          )

        ],
      ),
    );
  }
}


