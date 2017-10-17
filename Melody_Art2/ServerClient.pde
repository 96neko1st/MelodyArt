class ServerClient {
  Client client;
  boolean LED1_flag = false;
  boolean LED2_flag = false;

  ServerClient() {
  }

  void receive_command() {
    client = server.available(); // 接続してきたClient
    if (client != null) { // Clientがいるなら  
      String str = "";
      if (LED1_flag == false && LED2_flag == false) {
        str=client.readString();
      } 
      if (LED1_flag == true) {
        str =client.readString();
        f.baseLED = convert_string(str);
        select_mode = 2;
        LED1_flag = false;
      }
      if (LED2_flag == true) {
        str =client.readString();
        f.blockLED = convert_string(str);
        select_mode = 1;
        LED2_flag = false;
      }

      switch(str) {
      case "BLOCK\n":
        client.write(getByteArray()); // Clientに送り返す
        break;
      case "LED1\n":
        LED1_flag = true;
        client.write("LED1 start:\n");
        break;
      case "LED2\n":
        LED2_flag = true;
        client.write("LED2 start:\n");
        break;
      default:
        client.write("complete:\n");
        break;
      }
    }
  }

  String getByteArray() {
    String a = "";

    for (int y = 0; y < f.SIZE; y++) {
      for (int x = 0; x < f.SIZE; x++) {
        a += str(f.field[y][x]);
        a = a + " ";
      }
    }
    a = a + "\n";
    return a;
  }

  int[][] convert_string(String _str) {
    int[][] a = new int[f.SIZE][f.SIZE];
    int count = 0;

    for (int y = 0; y < f.SIZE; y++) {
      for (int x = 0; x < f.SIZE; x++) {
        String[] split = split(_str, " ");
        a[y][x] = int(split[count++]);
      }
    }
    return a;
  }

  /* Clientが接続した時 */
  void serverEvent(Server s, Client c) {
    println("Client connect - IP:"+c.ip()); // IPアドレス表示
  }
}