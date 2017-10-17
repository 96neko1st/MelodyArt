import processing.net.*;

Field f;
Block b;
ServerClient sb;

Server server;
int port = 4444;
final int ADJUST_X = 230;
final int ADJUST_Y = 300;
int select_mode = 0;


void setup() {
  size(1600, 1600);
  frameRate(60);
  rectMode(CENTER);
  server = new Server(this, port);
  f = new Field();
  b = new Block();
  sb = new ServerClient();
}

void draw() {
  background(255);
  f.display();
  b.get_musicBlock();
  b.set_musicBlock();
  b.switch_musicBlock();
  sb.receive_command();
}

void keyPressed() {
  if (key == 'a') {
    JSONArray json = new JSONArray();

    for (int y = 0; y < f.SIZE; y++) {
      for (int x = 0; x < f.SIZE; x++) {
        JSONObject block = new JSONObject();
        block.setInt("block", f.field[y][x]);
        block.setString("name", f.strField[y][x]);
        json.append(block);
      }
    }
    saveJSONArray(json, "data/block.json");
  }

  if (key == 'b') {
    JSONArray json = loadJSONArray("block.json");
    
    int count_x = 0, count_y = 0;
    for (int i = 0; i < json.size(); i++) {
      JSONObject block = json.getJSONObject(i);
      f.field[count_y][count_x] = block.getInt("block");
      f.strField[count_y][count_x] = block.getString("name");
      count_x++;
      if (count_x == 16) {count_x = 0;}
      if ((i+1) % 16 == 0) {count_y++;}
    }
  }
  
  if(key == 's') {
  }
  if(key == 'm') {
  }
}