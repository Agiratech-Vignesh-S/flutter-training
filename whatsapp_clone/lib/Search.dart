import 'package:flutter/material.dart';
import 'Chat/Chatpage.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<Chatlist>display_list = List.from(chatdata);

  void updatelist(String value) {
setState(() {
  print("fwfs");
  display_list=chatdata.where((element)=>element.title.toLowerCase().contains(value.toLowerCase())).toList();
  print(display_list.toString());
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.black54,),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Colors.white,
        title:  TextField(
          onChanged: (value)=>updatelist(value),
          decoration: const InputDecoration(
           enabledBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.white)
           ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            filled: false,
            hintText: "Search",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Expanded(child:
        ListView.builder(
            itemCount: display_list.length,
            itemBuilder: (context, i) =>
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Message_page()));
              },
              leading: Container(
                height: 100,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage(chatdata[i].pic),
                ),
              ),
              title: Text(display_list[i].title),
              subtitle: Text(display_list[i].subtitle),
              trailing: Text(display_list[i].date),


            )
        )
        )
            ],
        ),
      ),
    );
  }
}
