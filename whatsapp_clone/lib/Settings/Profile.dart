import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Profile"),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                  padding: EdgeInsets.only(top: 20,left: 10),
                    height: 200,
                    width: 200,
                    child: Center(
                      child: ClipRRect(
                        child: Image.asset('assets/images/img.jpg'),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                          BorderRadius.circular(30)),
                      child: Icon(Icons.camera_alt,color: Colors.white,),
                    )
                ],
                ),
              ),
            ]
            ),
          ),
          ListTile(
            onTap: () {
            },
            leading: const Icon(
              Icons.person,
              size: 30,
            ),
            title:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text("person")
              ],
            ),
            subtitle: Text("This is not your username or pin.this name will be visible to your whatsApp contacts.",style: TextStyle(fontSize: 10),),
            trailing: Icon(Icons.edit,color: Colors.green,),

          ),
          ListTile(
            onTap: () {
            },
            leading: const Icon(
              Icons.info_outline,
              size: 30,
            ),
            title: const Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Available"),
            trailing: Icon(Icons.edit,color: Colors.green,),
          ),
          ListTile(
            onTap: () {
            },
            leading: const Icon(
              Icons.phone,
              size: 30,
            ),
            title: const Text(
              "phone",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("+91 98554 43644"),
          )
        ],
      ),




    );
  }
}
