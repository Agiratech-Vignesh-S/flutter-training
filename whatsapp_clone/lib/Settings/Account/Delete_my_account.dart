import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Settings/Account/Change_number.dart';

class Delete_my_account extends StatefulWidget {
  const Delete_my_account({Key? key}) : super(key: key);

  @override
  State<Delete_my_account> createState() => _Delete_my_accountState();
}

class _Delete_my_accountState extends State<Delete_my_account> {
  TextEditingController text_controller = TextEditingController();
  TextEditingController text_controller1 = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState

    text_controller1.text="India";
    text_controller.text="91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Delete my account"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 550,
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.warning,color: Colors.red,size: 20,),
                    title: Text("Deleting your account will:",style: TextStyle(color: Colors.red),),
                  ),
                  Container(
                    child:Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:const [
                  Text(".  Delete your account from WhatsApp",style: TextStyle(fontSize: 15),),
                  Text(".  Erase your message history",style: TextStyle(fontSize: 15),),
                  Text(".  Delete your form all of your WhatsApp groups",style: TextStyle(fontSize: 15),),
                  Text(".  Delete your google Drive backup ",style: TextStyle(fontSize: 15),),
                  Text(".  Delete your payments history and cancel any  pending payments",style: TextStyle(fontSize: 15),),
                  ]
                      ),
                    )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 3,
                    color: Colors.black54,
                  ),
                  ListTile(
                    leading: const Icon(Icons.send_to_mobile_rounded),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 13,
                        ),
                        const Text("Change number instead?"),
                     const SizedBox(
                       height: 15,
                     ),
                     SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Change_number()));
                        }, child: const Text("CHANGE NUMBER "),),
                    ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  ),
                  const Divider(
                    height: 3,
                  ),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Column(
                     children:  [
                       const Padding(
                         padding: EdgeInsets.only(left: 60),
                         child: Text("To delete your account,confirm your country code and enter your phone number.",style: TextStyle(fontWeight: FontWeight.w400),),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                        Padding(
                         padding: EdgeInsets.only(left: 60),
                         child: TextField(
                           controller: text_controller1,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              labelText: "Country",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black
                              )
                            ),
                         ),
                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:  [
                           Padding(
                             padding: EdgeInsets.only(left: 60),
                             child: SizedBox(
                               width: 100,
                               child: TextField(
                                 keyboardType: TextInputType.number,
                                 controller: text_controller,
                                   decoration: InputDecoration(
                                     prefixIcon: Icon(Icons.add,size: 15,),
                                     //hintText: "india",
                                     labelText: "phone",
                                       labelStyle: TextStyle(
                                           fontSize: 15,
                                           color: Colors.black,
                                       ),

                               ),
                             ),
                           ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                           SizedBox(
                             width: 190,
                             child: TextField(
                               keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "phone number",
                                ),
                             ),
                           )
                         ],
                       ),
                       SizedBox(height: 20,),
                       // SizedBox(
                       //   child: ElevatedButton(
                       //     style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                       //     onPressed: (){}, child: Text("DELETE MY ACCOUNT"),),
                       // )

                     ],
                   ),
                 ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
