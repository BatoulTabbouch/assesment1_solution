//Batoul tabbouch 
//32130545

import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'csci410 midterm',
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _name;
  String? _email;
  String? _gender;
  String? selectedMethod="Email";
  bool _subscribe = false;
  String msg="";

   final List<String> contactMethod = [
  'Email',
  'Phone',
  'SMS',
];


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
     super.dispose();

  }

  void _clear() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _gender = null;
      selectedMethod = contactMethod[0];
      _subscribe = false;
      msg="";
    });}
 
 
    void submit(){
       _name = _nameController.text;
       _email = _emailController.text;
      if (_name== null||_email== null|| _gender== null || selectedMethod==null){
        setState(() {
          msg= "please fill out this field";
        });
      }
      else if  (!(_emailController.text).contains("@")){
        setState(() {
         msg= "Please enter a valid email address !";

        });
      }
      else{
        if(_subscribe==true){
         setState(() {
            msg=
            "Submitted Information: \n"
            "Name: $_name\n"
            "Email: $_email\n"
            "Gender: $_gender\n"
            "Preferred Contact: $selectedMethod\n"
            "Subscribed: Yes";   
         }); }
            else{
              setState(() {
                  msg=
           "Submitted Information: \n"
            "Name: $_name\n"
            "Email: $_email\n"
            "Gender: $_gender\n"
            "Preferred Contact: $selectedMethod\n"
            "Subscribed: No";   
              });
          
               }
      }
      
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Contact Form'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white
      ),
      body: Center(child: 
      Column
      ( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(height: 18),
       const Text('Name', style:TextStyle(fontSize: 20)),
       TextField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your name'),
         ),
   
         const SizedBox(height: 18),
         const Text('Email', style:TextStyle(fontSize: 20), ),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration( border: OutlineInputBorder(), hintText: 'Enter your email'),
        ),
          const SizedBox(height: 18),

         const Text('Gender:  ', style: TextStyle(fontSize: 18.0),),

     Row
      (mainAxisAlignment: MainAxisAlignment.start, children: [
      Radio(
        value: 'Male',
        groupValue: _gender, 
        onChanged: (value) {
          setState(() {
            _gender = value;
          });
        },
      ),
      const Text('Male ', style: TextStyle(fontSize: 18.0)),
      Radio(
        value: 'Female',
        groupValue: _gender, 
        onChanged: (value) {
          setState(() {
            _gender = value;
          });
        },
      ),
      const Text('Female ', style: TextStyle(fontSize: 18.0)),

         Radio(
        value: 'Other',
        groupValue: _gender, 
        onChanged: (value) {
          setState(() {
            _gender = value;
          });
        },
      ),
      const Text('Other ', style: TextStyle(fontSize: 18.0)),
]),

         const SizedBox(height: 18),
         
         const Text('Preferred Contact Method ', style: TextStyle(fontSize: 18.0)),

         DropdownMenu(
           width:900,
           initialSelection: selectedMethod, 
           onSelected: (String? newValue) {
            setState(() {
              selectedMethod = newValue;
             });
             },
            dropdownMenuEntries: contactMethod.map((String method){
              return DropdownMenuEntry<String>(value: method , label: method,);
             }).toList()),
              

         const SizedBox(height: 18),


         Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: _subscribe, onChanged: (bool? value) {
                    setState(() {
                     _subscribe= value as bool;
                    
                  });
              }),
              const Text('Subscribe to newsletter', style: TextStyle(fontSize: 13.0)),
                 ]
              ),

                const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: submit,
                    child: const Text("√ Submit"),
                    
                  ),

                  ElevatedButton(
                    onPressed: _clear,
                    child: const Text("X Clear"),
                  ),
                ],
              ),
              Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(msg, textAlign: TextAlign.justify, style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 199, 51, 51)),)])
],), ),
   
    ); 
    
  }

}