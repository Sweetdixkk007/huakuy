import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});
  
  get textController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text(
                'ฝากร้าน',
              ),
              actions:
              [
                TextButton(
                  onPressed: (){
                    
                  },
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://cdn.searchenginejournal.com/wp-content/uploads/2022/04/reverse-image-search-627b7e49986b0-sej-760x400.png'),
                        radius: 25.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Mostafa ahmed Ashour',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'what is in your mind ...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: (){
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    Icons.photo
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                    'add photo',
                                ),
                              ],
                            ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: (){},
                          child: const Text(
                            '# tags',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
