class Field {

  final int SIZE = 16;
  final int BLOCKSIZE = 70;
  public int[][] field = new int[SIZE][SIZE];
  public int[][] baseLED = new int[SIZE][SIZE];
  public int[][] blockLED = new int[SIZE][SIZE];
  public String[][] strField = new String[SIZE][SIZE];

  Field() {
    PFont font = createFont("MS Gothic", 30);
    textFont(font);
    strokeWeight(5);
    initialize();
  }

  void display() {
    for (int y = 0; y < SIZE; y++) {
      for (int x = 0; x < SIZE; x++) {
        if (field[y][x] > 450) {
          b.get_blockColor(field[y][x] - 450);
        } else {
          b.get_blockColor(field[y][x]);
        }
        if (0 <= x && x < 8 && y < 8) {
          stroke(200, 30, 30);
        } else if (8 <= x && x < 16 && y < 8) { 
          stroke(30, 200, 30);
        } else if (0 <= x && x < 8 && y >= 8) {
          stroke(30, 30, 200);
        } else if (8 <= x && x < 16 && y >= 8) {
          stroke(220, 220, 0);
        }
        rect(x * BLOCKSIZE + (width / 6), y * BLOCKSIZE + (height / 20), BLOCKSIZE, BLOCKSIZE);

        stroke(0, 0, 0);
        fill(0, 0, 0);
        text(strField[y][x], x * BLOCKSIZE + (width / 6) - 30, y * BLOCKSIZE + (height / 20));
        fill(255, 255, 255);
        switch(select_mode) {
        case 0:
          defaultMode(field[y][x]);
          break;
        case 1:
          blockMode(blockLED[y][x]);
          break;
        case 2:
          baseMode(baseLED[y][x]);
          break;
        }

        ellipse(x * BLOCKSIZE + (width / 6), y*BLOCKSIZE + (height / 20)+15, 20, 20);
        fill(255, 255, 255);
      }
    }

    for (int i = 0; i < SIZE; i++) {
      fill(0, 0, 0);
      text(i, i * BLOCKSIZE + (width / 6) - 10, 25);
      text(i, (width / 6) - 85, i * BLOCKSIZE + 90);
    }

    for (int i = 0; i < b.one_music_block.length; i++) {
      b.get_blockColor(b.one_music_block[i]);
      rect((i * BLOCKSIZE) + (60 * i) + ADJUST_X, height - ADJUST_Y, BLOCKSIZE, BLOCKSIZE);
      fill(0, 0, 0);
      text(b.one_str[i], (i * BLOCKSIZE) + (60 * i) + (ADJUST_X - 30), height - ADJUST_Y);
      fill(255, 255, 255);
    }
    
    fill(0,0,0);
    text("S:音楽再生モード", (width / 6) - 60, (height -200));
    text("M:音感トレーニング",(width / 6) - 60, (height - 160));
    text("A:状態保存",(width / 6) - 60, (height - 120));
    text("B:状態復元",(width / 6) - 60, (height - 80));
    fill(255,255,255);
    
    rect(600, height - 150, BLOCKSIZE, BLOCKSIZE);
    rect(800, height - 150, BLOCKSIZE, BLOCKSIZE * 2);
    rect(1000, height - 150, BLOCKSIZE * 2, BLOCKSIZE);
  }

  void defaultMode(int _value) {
    if (_value == 0) {
      fill(255, 255, 255);
    } else {
      fill(0, 0, 0);
    }
  }

  void blockMode(int _value) {
    if (_value == 0) {
      fill(255, 255, 255);
    } else {
      fill(255, 60, 0);
    }
  }

  void baseMode(int _value) {
    if (_value == 0) {
      fill(255, 255, 255);
    } else {
      fill(60, 255, 0);
    }
  }

  void initialize() {
    for (int y = 0; y < SIZE; y++) {
      for (int x =0; x < SIZE; x++) {
        strField[y][x] = "無";
      }
    }
  }
}